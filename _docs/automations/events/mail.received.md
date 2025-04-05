---
title: mail.received
excerpt: This page provides information on the "mail.received" automation events in
  Cerb, which are designed to respond to incoming messages once they are added to
  a ticket.
summary: This page provides information on the "mail.received" automation events in
  Cerb, which are designed to respond to incoming messages once they are added to
  a ticket. It explains how these events can be used, such as sending an automatic
  reply confirmation for new tickets. The page details the placeholders available
  in the automation event dictionary, including keys like `is_new_ticket` to determine
  if a message is opening a new ticket or replying to an existing one, and `message_*`
  for accessing the message record with key expansion. There are no outputs specified
  for these events.
permalink: /docs/automations/events/mail.received/
toc:
  title: mail.received
  expand: Automations
jumbotron:
  title: mail.received
  tagline: ~
  breadcrumbs:
  - label: Docs &raquo;
    url: /docs/home/
  - label: Automations &raquo;
    url: /docs/automations/
  - label: Events &raquo;
    url: /docs/automations/#events
---

**mail.received** [automation](/docs/automations/) [events](/docs/automations/#events) can react to received messages after they are appended to a ticket. For instance, sending an auto-reply confirmation to new tickets.

# Placeholders

The automation event [dictionary](/docs/automations/#dictionaries) starts with the following values:

| Key | Type | Notes
|-|-|-
|`is_new_ticket` | bool | `true` if the message opened a new ticket, `false` if a reply to an existing ticket
|`message_*` | record | The [message](/docs/records/types/message/) record. Supports key expansion.

# Outputs

(none)

# Examples

Send an autoresponder when a new ticket is created:
{% tabs event-mail-received %}

{% tab event-mail-received automation %}
{% highlight cerb %}
{% raw %}
start:
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
          content: Thank you for contacting us. We will respond as soon as possible.
{% endraw %}
{% endhighlight %}
{% endtab %}

{% tab event-mail-received policy %}
{% highlight cerb %}
{% raw %}
commands:
  record.create:
    deny/type@bool: {{inputs.record_type is not record type ('draft')}}
    allow@bool: yes
{% endraw %}
{% endhighlight %}
{% endtab %}

{% tab event-mail-received event %}
{% highlight cerb %}
{% raw %}
automation/autoreply:
  uri: cerb:automation:example.newticket.autoresponder
  disabled@bool:
    {{
      not is_new_ticket
      or not message_ticket_group_auto_responder_enabled
      or message_ticket_subject is pattern (
        '*out of the office*',
        '*out of office*',
        '*auto response*',
        '*autoreply*',
      )
    }}
{% endraw %}
{% endhighlight %}
{% endtab %}

{% tab event-mail-received inputs %}
{% highlight cerb %}
{% raw %}
message__context: message
message_id: 1
{% endraw %}
{% endhighlight %}
{% endtab %}

{% endtabs %}