---
title: Integrate with Postmark
excerpt: A step-by-step guide for integrating Cerb and Postmark.
permalink: /guides/integrations/postmark/
layout: integration
topic: Integrations
subtopic: Postmark
jumbotron:
  title: Cerb + Postmark
  tagline: ""
  breadcrumbs:
  - label: Resources &raquo;
    url: /resources/
  - label: Guides &raquo;
    url: /resources/guides/
  - label: Integrations &raquo;
    url: /resources/guides/#integrations
  - label: Postmark &raquo;
    url: /resources/guides/#postmark
---

# Using Postmark for outgoing mail (SMTP)

Add a mail transport for delivering outgoing mail through [Postmark](https://postmarkapp.com/smtp-service).

Navigate to **Search >> Mail Transports >> (+)**

|---
|-:-:-
| **Name:** | Postmark
| **Type:** | SMTP
| **Host:** | `smtp.postmarkapp.com`
| **Port:** | `587`
| **Encryption:** | TLS
| **Authentication:** | Enabled
| **Username/Password:** | (your Postmark API token)

Click the **Save Changes** button.

# Preserving message ID headers

By default, Postmark replaces the `Message-Id:` header on outgoing email. This breaks reply threading in Cerb.

This workflow adds the `X-PM-KeepId: true` header to outgoing mail.

As an administrator, navigate to **Search >> Workflows >> (+) >> (Empty)** and paste the following template:

<pre>
<code class="language-cerb">
{% raw %}
workflow:
  name: cerb.integrations.postmark
  version: 2024-11-27T20:22:16Z
  description: Add the `X-PM-KeepId:` header to outgoing mail when using Postmark SMTP.
  website: https://cerb.ai/resources/workflows/
  requirements:
    cerb_version: >=11.0 <11.1
    cerb_plugins: cerberusweb.core, 
records:
  automation/automation_mailSend:
    fields:
      name: cerb.integrations.postmark.keepMessageId
      extension_id: cerb.trigger.mail.send
      description@text:
      script@raw:
        start:
          return:
            draft:
              params:
                headers:
                  X-PM-KeepId: true
  
  automation_event_listener/listener_mailSend:
    fields:
      name: Postmark
      event_name: mail.send
      priority@int: 100
      is_disabled: 0
      event_kata@raw:
        automation/keepId:
          uri: cerb:automation:cerb.integrations.postmark.keepMessageId
{% endraw %}
</code>
</pre>
