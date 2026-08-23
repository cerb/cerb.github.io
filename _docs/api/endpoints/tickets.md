---
title: Tickets
excerpt: This page provides detailed instructions for using the Cerb API to create
  and reply to ticket messages.
summary: This page provides detailed instructions for using the Cerb API to create
  and reply to ticket messages. It outlines the parameters required for composing
  a new ticket and replying to an existing ticket, including fields such as `bcc`,
  `cc`, `content`, `group_id`, `status`, and more. The page also includes examples
  of how to structure the API requests with various optional and required fields,
  demonstrating how to handle attachments, set delivery times, and manage ticket statuses.
  The information is aimed at developers looking to integrate Cerb's ticketing functionality
  into their applications.
permalink: /docs/api/endpoints/tickets/
toc:
  expand: API
jumbotron:
  title: Tickets
  tagline: ""
  breadcrumbs:
  - label: Docs &raquo;
    url: /docs/home/
  - label: API &raquo;
    url: /docs/api/
  - label: Endpoints &raquo;
    url: /docs/api/endpoints/
---

* TOC
{:toc}

# Compose

**POST /rest/tickets/compose.json**

Create a ticket object.

### Parameters
{: .no_toc}

|---
| Req'd | Field | Type | Notes
|:-:|-|-|-
| | `bcc` | string
| | `bucket_id` | integer
| | `cc` | string
| **x** | `content` | string |
| | `content_format` | string | `markdown` for HTML or blank for plaintext
| | `custom_*` | mixed | 
| | `dont_send` | integer | `0`=create/send normally, `1`=create ticket without sending
| | `file_id[]` | ids | Upload with [attachments](/docs/api/endpoints/attachments/)
| **x** | `group_id` | integer
| | `html_template_id` | id | [html template](/docs/records/types/html_template/)
| | `org_id` | id | [organization](/docs/records/types/org/)
| | `owner_id` | id | [worker](/docs/api/endpoints/workers/)
| | `reopen_at` | mixed | unix timestamp or string (e.g. "Friday 2pm", "+2 hours")
| | `send_at` | mixed | When the message should be delivered. Defaults to `now`. Unix timestamp or string (e.g. "Friday 2pm", "+2 hours")
| | `status` | integer | `0`=open, `1`=waiting, `2`=closed, `3`=deleted
| **x** | `subject` | string |
| **x** | `to` | string

### Example
{: .no_toc}

{% highlight http %}
POST /rest/tickets/compose.json
Host: cerb.example
Authorization: Bearer <token>

expand=bucket_,group_,custom_
&group_id=6
&bucket_id=6
&org_id=123
&to=customer@example.com
&cc=cc@example.com
&bcc=bcc@example.com
&subject=Testing compose from API
&content=This is the raw message with an attachment
&status=1
&reopen_at=1712160000
&file_id[]=368
&html_template_id=1
&custom_5=+1 hour
&custom_6=Line 1\nLine 2\nLine 3
&custom_4=Option 3
{% endhighlight %}

# Reply

**POST /rest/tickets/reply.json**

Reply to a ticket message as a worker.

### Parameters
{: .no_toc}

|---
| Req'd | Field | Type | Notes
|:-:|-|-|-
| | `bcc` | string | A comma-separated list of email addresses that will privately receive a copy of this message.
| | `bucket_id` | id | Move the ticket to a new [bucket](/docs/api/endpoints/groups/)
| | `cc` | string | A comma-separated list of email addresses that will publicly receive a copy of this message.
| **x** | `content` | string | The content of the reply message
| | `content_format` | string | `markdown` for HTML or blank for plaintext
| | `custom_*` | mixed | 
| | `dont_keep_copy` | boolean | Send the reply by email without saving a copy in Cerb: 0=no, 1=yes
| | `dont_send` | boolean | Save the reply in Cerb without sending email: 0=no, 1=yes
| | `file_id[]` | ids | Upload with [attachments](/docs/api/endpoints/attachments/)
| | `group_id` | id | Move the ticket to a new [group](/docs/api/endpoints/groups/)
| | `html_template_id` | id | [mail template](/docs/records/types/html_template/)
| | `is_autoreply` | boolean | Automatically include auto-reply mail headers: 0=no, 1=yes
| | `is_broadcast` | boolean | Set the broadcast flag: 0=no, 1=yes
| | `is_forward` | boolean | Send the message without updating the ticket with the new subject or requesters: 0=no, 1=yes
| **x** | `message_id` | id | The [ticket](/docs/api/endpoints/tickets/) [message](/docs/records/types/message/) being replied to
| | `owner_id` | id | Assign the ticket to a [worker](/docs/api/endpoints/workers/), or `0` to unassign from the current owner
| | `reopen_at` | mixed | unix timestamp or string (e.g. "Friday 2pm", "+2 hours")
| | `send_at` | mixed | When the message should be delivered. Defaults to `now`. Unix timestamp or string (e.g. "Friday 2pm", "+2 hours")
| | `status` | integer | 0=open, 1=waiting, 2=closed, 3=deleted
| | `subject` | string | Update the ticket's subject
| | `to` | string | A comma-separated list of email addresses to include as recipients. If blank, it uses the ticket's current requesters
| | `worker_id` | id | The specific [worker](/docs/api/endpoints/workers/) to send the message as. This defaults to the current API user, and can only be changed by administrators

{% comment %}
	'html_template_id'
	'headers'  
{% endcomment %}


### Example
{: .no_toc}

{% highlight http %}
POST /rest/tickets/reply.json
Host: cerb.example
Authorization: Bearer <token>

expand=bucket_,group_,custom_
&message_id=1024
&content=This is the raw message with an attachment
&bcc=bcc@example.com
&bucket_id=6
&cc=cc@example.com
&custom_4=Option 3
&custom_5=+1 hour
&custom_6=Line 1\nLine 2\nLine 3
&file_id[]=368
&reopen_at=1712160000
&status=1
&subject=Testing compose from API
&to=customer@example.com
&html_template_id=1
{% endhighlight %}
