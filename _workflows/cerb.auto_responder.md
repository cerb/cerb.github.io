---
title: Auto Responder
excerpt: Send an automatic response when new tickets are opened.
layout: integration
topic: Workflows
permalink: /workflows/cerb.auto_responder/
redirect_from:
  - /packages/autoreply-bot/
jumbotron:
  title: Auto Responder
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

This workflow automatically sends a confirmation email to clients when they open a new ticket.

# Installation

This workflow is built into Cerb [11.0+](/releases/11.0/). It will automatically update.

You can enable it from **Search >> Workflows >> (+) >> Auto Responder**.

# Usage

### Snippet templates

The workflow creates a **Ticket Auto-Response** snippet for the default auto-response email template. You can create as many ticket-based snippets as you like for different groups in **Search >> Snippets**.

### Enabling automatic responses per group

From **Search >> Groups**, edit each group to enable automatic responses to new tickets where desirable.

Click the **Add Fieldset** button and select the **Auto-Responder** fieldset.

<div class="cerb-screenshot">
<img src="/assets/images/workflows/auto-responder/group-fieldset.png" class="screenshot">
</div>

Check the **Enabled** box and select the snippet to use for the group.

<div class="cerb-screenshot">
<img src="/assets/images/workflows/auto-responder/group-fieldset-enabled.png" class="screenshot">
</div>

Click the **Save Changes** button.

### Test the auto responder

You can send a new message into Cerb from your normal email client, or paste a test message from **Setup >> Mail >> Incoming >> Import**

<pre>
<code class="language-text">
{% raw %}
From: customer@cerb.example
To: demo@cerb.example
Subject: This is a demo ticket

This is a demo ticket
{% endraw %}
</code>
</pre>

You'll see an auto-response queued for delivery on new tickets.

<div class="cerb-screenshot">
<img src="/assets/images/workflows/auto-responder/autoreply-draft.png" class="screenshot">
</div>

Automatic responses are queued so they can be delivered efficiently without impacting email parser performance.

### Suppressing auto responses to automated senders

The workflow will attempt to use message headers to detect automated senders to avoid sending them an automated response. It will also avoid sending an automated response to banned or defunct senders, or mailboxes that start with `mailer-daemon@`, `postmaster@`, `noreply@`, or `no-reply@`.

You can use a [mail.filter](/docs/automations/events/mail.filter/) automation to add an `Auto-Submitted: auto-generated` email header to inbound messages that should not receive an automatic response.

# Reference

You can build your own auto-responder workflow using this template as a reference.

Change occurrences of **cerb.auto_responder** to your own workflow identifier. Use a prefix based on a domain you own (e.g. `com.example.workflow`).

<pre style="max-height: 29.25em;">
<code class="language-cerb">
{% raw %}
workflow:
  name: cerb.auto_responder
  version@date: 2024-10-14T00:00:00Z
  description: Send an automatic response when new tickets are opened
  website: https://cerb.ai/workflows/cerb.auto_responder/
  requirements:
    cerb_version: >=11.0 <11.1
    cerb_plugins: cerberusweb.core,

records:
  custom_fieldset/fieldset_auto_responder:
    fields:
      name: Auto-Responder
      context: group
      owner__context: app
      owner_id@int: 0
  custom_field/field_auto_responder_enabled:
    fields:
      name: Enabled
      context: group
      uri: auto_responder_enabled
      custom_fieldset_id: {{records.fieldset_auto_responder.id}}
      type: C
      pos@int: 1
  custom_field/field_auto_responder_snippet:
    fields:
      name: Template
      context: group
      uri: auto_responder_snippet
      custom_fieldset_id: {{records.fieldset_auto_responder.id}}
      type: L
      pos@int: 2
      params:
        context: snippet

  snippet/snippet_autoresponder:
    updatePolicy@csv:
    fields:
      title: Ticket Auto-Response
      context: cerberusweb.contexts.ticket
      owner__context: app
      owner_id: 0
      content@raw:
        Thanks for contacting us! We'll get back to you as soon as possible.

        Reference #: {{mask}}
        Subject: {{subject}}

  automation/automation_autoresponder:
    fields:
      name: cerb.autoResponder.mailReceived
      extension_id: cerb.trigger.mail.received
      script@raw:
        start:
          outcome/validate:
            if@bool:
              {{
                not message_ticket_group_auto_responder_enabled
                or not message_ticket_group_auto_responder_snippet_id
              }}
            then:
              return:

          kata.parse:
            output: results
            inputs:
              kata:
                template: {{message_ticket_group_auto_responder_snippet_content}}
              dict@json:
                {% do message_ticket_ %}
                {{cerb_placeholders_list('message_ticket_', '')|json_encode}}

          record.create:
            output: new_draft
            inputs:
              record_type: draft
              fields:
                name: Auto-Response
                type: ticket.reply
                ticket_id: {{message_ticket_id}}
                is_queued: 1
                queue_delivery_date@date: 5 mins
                to: {{message_sender_address}}
                params:
                  to: {{message_sender_address}}
                  subject: [#{{message_ticket_mask}}] {{message_ticket_subject}}
                  headers:
                    In-Reply-To@optional: {{message_headers['in-reply-to']}}
                    Auto-Submitted: auto-replied
                  content: {{results.template}}
      policy_kata@raw:
        commands:
          record.create:
            deny/type@bool: {{inputs.record_type is not record type ('draft')}}
            allow@bool: yes

  automation_event_listener/listener_mail_received:
    fields:
      name: Email Auto-Responder
      event_name: mail.received
      priority: 10
      is_disabled: 0
      event_kata@raw:
        automation/autoresponder:
          uri: cerb:automation:cerb.autoResponder.mailReceived
          # Exclude automated senders
          disabled@bool:
            {{
              not is_new_ticket
              or not message_ticket_group_auto_responder_enabled
              or not message_ticket_group_auto_responder_snippet_id
              or message_sender_is_banned
              or message_sender_is_defunct
              or message_sender_address is pattern (
                'mailer-daemon@*',
                'postmaster@*',
                'noreply@*',
                'no-reply@*',
              )
              or message_headers['auto-submitted']
              or message_headers['x-autogenerated']
              or message_headers['x-autoreply']
              or message_headers['x-autoreply-from']
              or message_headers['x-autorespond']
              or 'auto_reply' == message_headers['x-precedence']
              or 'auto_reply' == message_headers['preference']
              or 'bulk' == message_headers['precedence']
              or message_ticket_subject is pattern (
                '*out of the office*',
                '*out of office*',
                '*auto response*',
                '*autoreply*',
              )
            }}
{% endraw %}
</code>
</pre>