---
title: Tickets
permalink: /docs/api/endpoints/tickets/
jumbotron:
  title: Tickets
  tagline: ""
  breadcrumbs:
  -
    label: Docs &raquo;
    url: /docs/home/
  -
    label: API &raquo;
    url: /docs/api/
  -
    label: Endpoints &raquo;
    url: /docs/api/endpoints/
---

* TOC
{:toc}

# Compose

**POST /tickets/compose.json**

Create a ticket object.

### Parameters
{: .no_toc}

|---
| Field | Type | 
|-|-|-
| `group_id` | integer | **required**
| `bucket_id` | integer
| `to` | string | **required**
| `cc` | string
| `bcc` | string
| `subject` | string | **required**
| `content` | string | **required**
| `content_format` | string | `markdown` for HTML or blank for plaintext
| `org_id` | id | [organization](/docs/api/endpoints/organizations/)
| `owner_id` | id | [worker](/docs/api/endpoints/workers/)
| `html_template_id` | id | [html template](/docs/api/endpoints/mail-html-template/)
| `file_id[]` | ids | Upload with [attachments](/docs/api/endpoints/attachments/)
| `status` | integer | 0=open, 1=waiting, 2=closed, 3=deleted
| `reopen_at` | mixed | unix timestamp or string (e.g. "Friday 2pm", "+2 hours")
| `custom_*` | mixed | 

### Example
{: .no_toc}

<pre>
<code class="language-php">
$postfields = array(
    array('expand','bucket_,group_,custom_'),
    array('group_id','6'),
    array('bucket_id','6'),
    array('org_id','123'), // optional
    array('to','customer@example.com'),
    array('cc','cc@example.com'), // optional
    array('bcc','bcc@example.com'), // optional
    array('subject','Testing compose from API'),
    array('content','This is the raw message with an attachment'),
    array('status','1'), // 0=open, 1=waiting, 2=closed, 3=deleted
    array('reopen_at', strtotime('+1 day')),
    array('file_id[]', '368'), // optional, can send multiple instances
    array('html_template_id', '1'), // optional
    array('custom_5','+1 hour'), // date custom field
    array('custom_6',"Line 1\nLine 2\nLine 3"), // multi-line
    array('custom_4','Option 3'), // picklist
);
$out = $cerb->post($base_url . 'tickets/compose.json', $postfields);
</code>
</pre>

# Reply

**POST /tickets/reply.json**

Reply to a ticket message as a worker.

### Parameters (Required)
{: .no_toc}

|---
| Field | Type | 
|-|-|-
| `content` | string | The content of the reply message
| `message_id` | id | The [ticket](/docs/api/tickets/) [message](/docs/api/messages/) being replied to

### Parameters
{: .no_toc}

|---
| Field | Type | 
|-|-|-
| `bcc` | string | A comma-separated list of email addresses that will privately receive a copy of this message.
| `bucket_id` | id | Move the ticket to a new [bucket](/docs/api/endpoints/groups/)
| `cc` | string | A comma-separated list of email addresses that will publicly receive a copy of this message.
| `content_format` | string | `markdown` for HTML or blank for plaintext
| `custom_*` | mixed | 
| `dont_keep_copy` | boolean | Send the reply by email without saving a copy in Cerb: 0=no, 1=yes
| `dont_send` | boolean | Save the reply in Cerb without sending email: 0=no, 1=yes
| `file_id[]` | ids | Upload with [attachments](/docs/api/endpoints/attachments/)
| `group_id` | id | Move the ticket to a new [group](/docs/api/endpoints/groups/)
| `html_template_id` | id | [mail template](/docs/api/endpoints/mail-html-template/)
| `is_autoreply` | boolean | Automatically include auto-reply mail headers: 0=no, 1=yes
| `is_broadcast` | boolean | Set the broadcast flag: 0=no, 1=yes
| `is_forward` | boolean | Send the message without updating the ticket with the new subject or requesters: 0=no, 1=yes
| `owner_id` | id | Assign the ticket to a [worker](/docs/api/endpoints/workers/), or `0` to unassign from the current owner
| `reopen_at` | mixed | unix timestamp or string (e.g. "Friday 2pm", "+2 hours")
| `status` | integer | 0=open, 1=waiting, 2=closed, 3=deleted
| `subject` | string | Update the ticket's subject
| `to` | string | A comma-separated list of email addresses to include as recipients. If blank, it uses the ticket's current requesters
| `worker_id` | id | The specific [worker](/docs/api/endpoints/workers/) to send the message as. This defaults to the current API user, and can only be changed by administrators

{% comment %}
	'html_template_id'
	'headers'  
{% endcomment %}


### Example
{: .no_toc}

<pre>
<code class="language-php">
$postfields = array(
    array('expand','bucket_,group_,custom_'),
    array('message_id','1024'),
    array('content','This is the raw message with an attachment'),
    array('bcc','bcc@example.com'), // optional
    array('bucket_id','6'), // group_id is unnecessary because this is non-zero
    array('cc','cc@example.com'), // optional
    array('custom_4','Option 3'), // picklist custom field
    array('custom_5','+1 hour'), // date custom field
    array('custom_6',"Line 1\nLine 2\nLine 3"), // multi-line custom field
    array('file_id[]', '368'), // optional, can send multiple instances
    array('reopen_at', strtotime('+1 day')),
    array('status','1'), // 0=open, 1=waiting, 2=closed, 3=deleted
    array('subject','Testing compose from API'), // optional
    array('to','customer@example.com'), // optional
    array('html_template_id', '1'), // optional
);
$out = $cerb->post($base_url . 'tickets/reply.json', $postfields);</code>
</pre>

# Split

# Merge
