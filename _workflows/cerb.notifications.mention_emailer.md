---
title: "@Mention Email Notifications"
excerpt: Email workers when they are @mentioned in a comment.
layout: integration
topic: Workflows
permalink: /workflows/cerb.notifications.mention_emailer/
jumbotron:
  title: "@Mention Email Notifications"
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

This workflow sends email notifications to workers when they are @mentioned in a comment.

# Installation

This workflow is built into Cerb [11.0+](/releases/11.0/). It will automatically update.

You can enable it from **Search >> Workflows >> (+) >> @Mention Email Notifications**.

# Usage

Comment on any record (e.g. ticket) with an `@mention`.

<div class="cerb-screenshot">
<img src="/assets/images/workflows/mentions-emailer/comment_mention.png" class="screenshot">
</div>

Cerb will send an email notification to the worker. You can find this in **Setup >> Mail >> Outgoing >> Queue** or **Setup >> Mail >> Outgoing >> Log**.

<div class="cerb-screenshot">
<img src="/assets/images/workflows/mentions-emailer/outgoing_email.png" class="screenshot">
</div>

# Reference

You can build your own @Mention Email Notifications workflow using this template as a reference.

Change occurrences of **cerb.notifications.mention_emailer** to your own workflow identifier. Use a prefix based on a domain you own (e.g. `com.example.workflow`).

<pre style="max-height: 29.25em;">
<code class="language-cerb">
{% raw %}
workflow:
  name: cerb.notifications.mention_emailer
  version@date: 2024-10-16T00:00:00Z
  description: Email workers when they are @mentioned in a comment
  website: https://cerb.ai/workflows/cerb.notifications.mention_emailer/
  requirements:
    cerb_version: >=11.0 <11.1
    cerb_plugins: cerberusweb.core,

records:
  automation/automationMentionEmail:
    fields:
      name: cerb.notifications.mention_emailer
      extension_id: cerb.trigger.record.changed
      description: Email workers when they are @mentioned in a comment
      script@raw:
        start:
          # We only want to process newly created comments
          outcome/validate:
            if@bool:
              {{
                'created' != change_type
                or record__context is not record type ('comment')
              }}
            then:
              return:

          # Find @mentions in the comment body
          set:
            mentions@json: {{cerb_extract_mentions(record_comment)|json_encode}}

          # Send an email to each mentioned worker
          repeat:
            each@csv: {{mentions|keys|join(',')}}
            as: i
            do:
              outcome/isWorker:
                if@bool: {{mentions[i]._type is record type ('worker')}}
                then:
                  record.create/draft:
                    output: new_draft
                    inputs:
                      record_type: draft
                      fields:
                        type: mail.transactional
                        is_queued@int: 1
                        queue_delivery_date@date: now
                        name: @mention notification for {{mentions[i]._label}}
                        to: {{mentions[i].address_email}}
                        params:
                          to: {{mentions[i].address_email}}
                          subject: [Cerb] You were @mentioned in a comment by {{record_author__label}}
                          content@text:
                            You were @mentioned in a comment by {{record_author__label}}:

                            {{record_comment}}

                            Link: {{record_record_url}}
                    on_error:
      policy_kata@raw:
        commands:
          record.create:
            deny/type@bool: {{inputs.record_type is not record type ('draft')}}
            allow@bool: yes
  automation_event_listener/listener_mentions:
    fields:
      name: @mentions Emailer
      event_name: record.changed
      priority: 200
      is_disabled: 0
      event_kata@raw:
        automation/mentions:
          uri: cerb:automation:cerb.notifications.mention_emailer
          disabled@bool:
            {{
              'created' != change_type
              or record__context is not record type ('comment')
              or '@' not in record_comment
            }}
{% endraw %}
</code>
</pre>