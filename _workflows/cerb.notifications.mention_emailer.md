---
title: 'Email Notification Mentions'
excerpt: Email workers when they are @mentioned in a comment.
summary: This page provides detailed information on the @Mention Email Notifications
  workflow in Cerb. It covers the introduction, installation, usage, and reference
  for setting up email notifications when workers are @mentioned in comments. The
  workflow is integrated into Cerb version 11.0 and above, and it can be enabled through
  the Cerb interface. The page explains how to use the feature by commenting on records
  with @mentions, which triggers email notifications to the mentioned workers. Additionally,
  it offers a template for creating custom @Mention Email Notifications workflows,
  including instructions on modifying the workflow identifier and setting up the necessary
  automation scripts. The reference section provides a comprehensive guide to the
  workflow's structure and requirements, ensuring users can effectively implement
  and customize the notification system.
layout: integration
topic: Workflows
workflow:
  built_in: yes
permalink: /workflows/cerb.notifications.mention_emailer/
redirect_from:
  - /guides/bots/relay-comment-notifications-email/
jumbotron:
  title: '@Mention Email Notifications'
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

[Notifications](/docs/notifications/) keep workers informed about recent activity when they're watching a [record](/docs/records/) or someone `@mentions` them.  Notifications are displayed in the top right when a worker is logged in.  This is great for workers who use Cerb as part of their daily routine, but workers who only log in when they're needed should be notified in real-time a different way.

In this guide we'll build a workflow for instantly relaying new notifications to email. This can be customized to notify workers in different ways (Slack, SMS, etc).

You will need at least Cerb [11.0](/releases/11.0/) to follow along.

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

{% highlight cerb %}
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
{% endhighlight %}