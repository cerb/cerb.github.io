---
title: Group Watchers
excerpt: Automatically add all group members as watchers for incoming tickets.
summary: This page provides detailed information about the "Group Watchers" workflow
  in Cerb, which automatically adds all group members as watchers when a new ticket
  is created from incoming email. It includes sections on introduction, installation,
  usage, and reference. The workflow is integrated into Cerb version 11.0 and above,
  and can be enabled through the Cerb interface. The usage section explains how all
  group members are automatically added as watchers when a new ticket is created.
  The reference section offers guidance on creating a custom group watchers workflow
  using the provided template, with instructions on modifying the workflow identifier
  to suit individual needs. The page also includes a sample workflow script and details
  on the requirements and configuration for implementing the group watchers feature.
layout: integration
topic: Workflows
social_image_url: /assets/images/workflows/group-watchers/watchers-list.png
permalink: /workflows/wgm.email.group_watchers/
jumbotron:
  title: Group Watchers
  tagline: ""
  breadcrumbs:
  - label: Resources &raquo;
    url: /resources/
  - label: Workflows &raquo;
    url: /resources/workflows/
---

* TOC
{:toc}

# Introduction

This workflow automatically adds all group members as watchers when a new ticket is created from incoming email.

# Installation

Navigate to **Search >> Workflows >> (+) >> Empty**.

Paste the following KATA into the large text box:

{% highlight cerb %}
{% raw %}
workflow:
  name: wgm.email.group_watchers
  version: 2026-05-25T20:00:00Z
  description: Automatically add all group members as watchers for incoming tickets.
  website: https://cerb.ai/workflows/wgm.email.group_watchers/
  requirements:
    cerb_version: >=11.0 <12.1
    cerb_plugins: cerberusweb.core,
records:
  automation_event_listener/listenerMailReceived:
    fields:
      name: Group Watchers
      event_name: mail.received
      priority@int: 100
      is_disabled: 0
      event_kata@raw:
        automation/addGroupWatchers:
          uri: cerb:automation:wgm.email.group_watchers.mailReceived
          disabled@bool: {{not is_new_ticket or not message_ticket_id or not message_ticket_group_id}}
  automation/automationMailReceived:
    fields:
      name: wgm.email.group_watchers.mailReceived
      extension_id: cerb.trigger.mail.received
      description: Add all group members as watchers for new tickets.
      script@raw:
        start:
          outcome/hasTicket:
            if@bool: {{not is_new_ticket or not message_ticket_id or not message_ticket_group_id}}
            then:
              return:
          
          # Add all group members as watchers
          set:
            watcher_links@list:
              {{
                message_ticket_group_members
                |keys
                |map((worker_id) => 'worker:' ~ worker_id)
                |join('\n')
              }}
          
          # Only update if we have group members
          outcome/hasMembers:
            if@bool: {{watcher_links is not empty}}
            then:
              record.update:
                inputs:
                  record_type: ticket
                  record_id: {{message_ticket_id}}
                  fields:
                    links@key: watcher_links
      policy_kata@raw:
        commands:
          record.update:
            deny/type@bool: {{inputs.record_type is not record type ('ticket')}}
            allow@bool: yes
{% endraw %}
{% endhighlight %}

Click the **Continue** button three times.

You should see output like the following:

<div class="cerb-screenshot">
<img src="/assets/images/workflows/group-watchers/imported.png" class="screenshot">
</div>

# Usage

When a new ticket is created from incoming email, all members of the ticket's assigned group will automatically be added as watchers.

This ensures that all team members are notified of new tickets in their group, improving response times and team awareness.

## Testing with imported message

You can test this workflow by importing a sample email message. Navigate to **Setup >> Mail >> Incoming >> Import Message** and paste the following test message:

{% highlight text %}
{% raw %}
From: customer@cerb.example
To: support@cerb.example
Subject: Test ticket for group watchers
Message-ID: <test-group-watchers-a1b2c3@cerb.example>

This is a test message to verify that all group members are added as watchers to new tickets.

Please assign this ticket to a group with multiple members to see the workflow in action.
{% endraw %}
{% endhighlight %}

After importing, check the created ticket's watchers to verify that all members of the assigned group have been automatically added.

<div class="cerb-screenshot">
<img src="/assets/images/workflows/group-watchers/watchers-list.png" class="screenshot">
</div>