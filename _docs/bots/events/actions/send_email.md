---
title: >-
  Bot Action: Send email
permalink: /docs/bots/events/actions/send_email/
toc:
  expand: Bots
jumbotron:
  title: >-
    Send email
  tagline: 
  breadcrumbs:
  -
    label: Docs &raquo;
    url: /docs/home/
  -
    label: Bots &raquo;
    url: /docs/bots/
  -
    label: Events &raquo;
    url: /docs/bots/events/
  -
    label: Actions &raquo;
    url: /docs/bots/events/
---

|---
|-|-
| **Identifier (ID):** | send_email
| **Event:** | (All)

### Params

|---
| Req'd | Key | Type | Notes 
|:-:|-|-|-
| **x** | `from_address_id` | id | The sender [email address](/docs/records/types/address/) ID to as `From:`
|  | `send_as` | text | The personalized `From:` name
| **x** | `to` | text | A list of `To:` recipient email addresses delimited with commas
|  | `cc` | text | A list of `Cc:` recipient email addresses delimited with commas
|  | `bcc` | text | A list of `Bcc:` recipient email addresses delimited with commas
| **x** | `subject` | text | The `Subject:` of the email message
|  | `headers` | text | A list of `Header: Value` pairs delimited with newlines
|  | `format` | text | `parsedown` for Markdown/HTML, or omitted for plaintext
|  | `content` | text | The email message body
|  | `html_template_id` | id | The [html template](/docs/records/types/html_template/) to use with Markdown format
|  | `bundle_ids` | id[] | An array of [file bundles](/docs/records/types/file_bundle/) to attach
|  | `run_in_simulator` | bit | Send live email in the simulator: `0`=no, `1`=yes
