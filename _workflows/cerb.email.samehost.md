---
title: Find contacts from the same host
excerpt: Find a list of contacts with emails from the same hostname from an email profile card.
summary: This page provides an implementation guide for the "Find contacts from the same host" workflow in Cerb, which extracts emails from the same hostname and displays a list of matching contacts.
layout: integration
topic: Workflows
permalink: /workflows/cerb.email.samehost/
redirect_from:
- /tips/find-similar-senders/
jumbotron:
  title: Find contacts from the same host
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

This workflow adds a worker interaction and a toolbar button on email record cards. The interaction finds any other contacts in the system with emails from the same hostname.

# Installation

You can enable it from **Search >> Workflows >> (+) >> (empty)** and entering in the following Workflow KATA:

{% highlight cerb %}
{% raw %}
workflow:
  name: cerb.email.samehost
  description: Find contacts from the same host as a given profile
  version: 2025-01-18T01:10:19Z
records:
  automation/toolbarinteraction:
    fields:
      name: cerb.email.samehost.interaction
      extension_id: cerb.trigger.interaction.worker
      description@text:
      script@raw:
        inputs:
          record/email:
            record_type: address
            required@bool: yes
          
        start:
          await:
            form:
              title: Emails from the same host
              elements:
                sheet/prompt_results:
                  label: Results:
                  data:
                    automation:
                      uri: cerb:automation:cerb.data.records
                      inputs:
                        record_type: address
                        query_required:  host:"{{inputs.email.host}}"
                  limit: 10
                  schema:
                    layout:
                      title_column:  _label
                      headings@bool: yes
                      paging@bool: yes
                    columns:
                      card/_label:
                        params:
                          bold@bool: yes
                      text/email:
                      card/org_id:
                        label: Organization
                      text/num_nonspam:
                        label: Number of Messages
                
            #on_simulate:
            #on_success:
            #on_error:
      policy_kata@raw:
        commands:
          record.search:
            deny/type@bool: {{inputs.record_type is not record type ('address')}}
  toolbar_section/profiletoolbar:
    fields:
      name: Similar Email
      toolbar_name: record.card
      priority@int: 50
      is_disabled: 0
      toolbar_kata@raw:
        interaction/l1nn3e:
          label: Similar
          uri: cerb:automation:cerb.email.samehost.interaction
          inputs:
            email: {{record_id}}
          hidden@bool: {{record__type is not record type ('address')}}
{% endraw %}
{% endhighlight %}

# Usage

Load up any email record and click the "Similar" button.

<div class="cerb-screenshot">
<img src="/assets/images/workflows/email-samehost/email-profile.png" class="screenshot">
</div>

You will be presented with a sheet of every other contact with emails from that same hostname.

<div class="cerb-screenshot">
<img src="/assets/images/workflows/email-samehost/interaction-window.png" class="screenshot">
</div>