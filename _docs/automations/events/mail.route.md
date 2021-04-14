---
title: "mail.route"
#excerpt: 
#social_image_url: /assets/images/search/kata.png
permalink: /docs/automations/events/mail.route/
toc:
  title: mail.route
  expand: Automations
jumbotron:
  title: mail.route
  tagline: 
  breadcrumbs:
  -
    label: Docs &raquo;
    url: /docs/home/
  -
    label: Automations &raquo;
    url: /docs/automations/
  -
    label: Events &raquo;
    url: /docs/automations/#events
---

**mail.route** [automation](/docs/automations/) [events](/docs/automations/#events) determine a destination group inbox given properties of an incoming message (e.g. sender, subject, recipients, headers, body). 

# Placeholders

The automation event [dictionary](/docs/automations/#dictionaries) starts with the following values:

| Key | Type | Notes
|-|-|-
|`email_sender_*` | record | The sender [email](/docs/records/types/address/) record. Supports key expansion.
|`email_subject` | text | The message subject.
|`email_headers` | object | A set of header/value pairs. Keys are lowercase with dashes as underscores (e.g. content_type).
|`email_body` | text | The email body as plaintext.
|`email_body_html` | text | The email body as HTML (if provided).
|`email_recipients` | array | An array of recipient email addresses in the To:/Cc:/Envelope-To:/Delivered-To: headers.
|`parent_ticket_*` | record | The parent [ticket](/docs/records/types/ticket/) record (if a reply). Supports key expansion.