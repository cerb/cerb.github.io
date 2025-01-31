---
title: Create an email draft
excerpt: Create and schedule a draft record for outgoing email.
summary: This page provides a detailed guide on creating a transactional email draft
  in Cerb. It explains how to set up a `mail.transactional` draft, which is sent by
  the system rather than an individual worker and does not generate a ticket record.
  The guide includes a code snippet demonstrating how to create a draft with specific
  parameters such as the recipient's email, subject, and content. It also outlines
  the policy for allowing the creation of such drafts, ensuring that only drafts of
  the correct type are permitted. The example provided schedules the email for delivery
  five minutes after creation and includes a link to time-saving tips for the recipient.
layout: automation-cookbook
jumbotron: []
social_image_url: /assets/images/automation-cookbook/create-record-draft.png
---

{% comment %}
* #signature when using mail.compose from a worker
* Drafts scheduled for future delivery vs resume by worker/owner
* Markdown
* Attachments
{% endcomment %}

## Create a transactional email draft

A `mail.transactional` [draft](/docs/records/types/draft/) is sent by the system rather than a particular worker. This does not create a [ticket](/docs/tickets/) record.

{% tabs create_record_draft %}

{% tab create_record_draft automation %}
```cerb
{% raw %}
start:
  record.create:
    output: draft_record
    inputs:
      record_type: draft
      fields:
        type: mail.transactional
        name: Welcome to the product!
        is_queued@int: 1
        queue_delivery_date@date: 5 mins
        params:
          to: customer@cerb.example
          subject: Welcome to the product!
          status_id: 1
          ticket_reopen: tomorrow 8am
          content@text:
            Welcome to the product!

            Have you seen these time-saving tips?
            https://product.example/link/
{% endraw %}
```
{% endtab %}

{% tab create_record_draft policy %}
```cerb
{% raw %}
commands:
  record.create:
    deny/type@bool: {{inputs.record_type is not record type ('draft')}}
    allow@bool: yes
{% endraw %}
```
{% endtab %}

{% endtabs %}
