---
title: Auto Watcher
excerpt: Automatically add workers as a watcher when they reply to a ticket
layout: integration
topic: Workflows
permalink: /workflows/cerb.email.auto_watcher/
jumbotron:
  title: Auto Watcher
  tagline: ""
  breadcrumbs:
  -
    label: Resources &raquo;
    url: /resources/
  -
    label: Workflows &raquo;
    url: /resources/workflows/
---

* TOC
{:toc}

# Introduction

This workflow automatically adds a worker as a watcher when they reply to a ticket.

# Installation

This workflow is built into Cerb [11.0+](/releases/11.0/). It will automatically update.

You can enable it from **Search >> Workflows >> (+) >> Auto Watcher**.

# Usage

In Cerb, navigate to any ticket profile and click the **Reply** button.

The **Watchers:** button will automatically include you as a watcher.

<div class="cerb-screenshot">
<img src="/assets/images/workflows/auto-watcher/reply-watcher.png" class="screenshot">
</div>

# Reference

You can build your own auto-watcher workflow using this template as a reference.

Change occurrences of **cerb.email.auto_watcher** to your own workflow identifier. Use a prefix based on a domain you own (e.g. `com.example.workflow`).

<pre style="max-height: 29.25em;">
<code class="language-cerb">
{% raw %}
workflow:
  name: cerb.email.auto_watcher
  version: 2024-11-11T23:17:32Z
  description: Automatically add workers as a watcher when they reply to a ticket.
  website: https://cerb.ai/workflows/cerb.email.auto_watcher/
  requirements:
    cerb_version: >=11.0 <11.1
    cerb_plugins: cerberusweb.core,
records:
  automation_event_listener/listenerMailDraft:
    fields:
      name: Auto Watcher
      event_name: mail.draft
      priority@int: 100
      is_disabled: 0
      event_kata@raw:
        automation/addWatcher:
          uri: cerb:automation:cerb.email.auto_watcher.mailDraft
          disabled@bool: {{is_resumed or not draft_ticket_id or not draft_worker_id}}
  automation/automationMailDraft:
    fields:
      name: cerb.email.auto_watcher.mailDraft
      extension_id: cerb.trigger.mail.draft
      description@text:
      script@raw:
        start:
          outcome/hasTicket:
            if@bool: {{not draft_ticket_id or not draft_worker_id}}
            then:
              return:
          
          record.update:
            inputs:
              record_type: ticket
              record_id: {{draft_ticket_id}}
              fields:
                links@list:
                  worker:{{draft_worker_id}}
      policy_kata@raw:
        commands:
          record.update:
            deny/type@bool: {{inputs.record_type is not record type ('ticket')}}
            allow@bool: yes
{% endraw %}
</code>
</pre>