---
title: Tickets
permalink: /docs/api/deprecated/tickets/
jumbotron:
  title: Tickets
  tagline: ""
  breadcrumbs:
  -
    label: Developers &raquo; API
    url: /docs/api/
---

<div class="cerb-box note">
<p>This module is deprecated as of <a href="/releases/8.2/">Cerb 8.2</a> and will be removed in a later version. You should use the <a href="/docs/api/modules/records/">/records</a> API instead.</p>
</div>

* TOC
{:toc}

# Retrieve

**GET /tickets/`<id>`.json**

Retrieve a ticket object.

### Example
{: .no_toc}

<pre>
<code class="language-php">
$out = $cerb->get($base_url . 'tickets/1.json');
</code>
</pre>

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
| `org_id` | id | [organization](/docs/api/modules/organizations/)
| `owner_id` | id | [worker](/docs/api/modules/workers/)
| `html_template_id` | id | [html template](/docs/api/modules/mail-html-template/)
| `file_id[]` | ids | Upload with [attachments](/docs/api/modules/attachments/)
| `status_id` | integer | 0=open, 1=waiting, 2=closed, 3=deleted
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

# Update

**PUT /tickets/`<id>`.json**

Update a ticket object.

### Parameters
{: .no_toc}

|---
| Field | Type | 
|-|-|-
| `bucket_id` | id | [bucket](/docs/api/modules/groups/)
| `group_id` | id | [group](/docs/api/modules/groups/)
| `org_id` | id | [organization](/docs/api/modules/organizations/)
| `owner_id` | id | [worker](/docs/api/modules/workers/)
| `status_id` | integer | 0=open, 1=waiting, 2=closed, 3=deleted
| `subject` | string
| `custom_*` | mixed | 

### Example
{: .no_toc}

<pre>
<code class="language-php">
$postfields = array(
    array('subject','I replaced this subject through the Web-API'),
    array('custom_5','+1 hour'), // date custom field
    array('custom_6',"Line 1\nLine 2\nLine 3"), // multi-line
    array('custom_4','Option 3'), // picklist
    array('custom_3[]','Option 1'), // multi-checkbox (add)
    array('custom_3[]','-Option 2'), // multi-checkbox (remove)
);
$out = $cerb->put($base_url . 'tickets/1.json', $postfields);
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
| `bucket_id` | id | Move the ticket to a new [bucket](/docs/api/modules/groups/)
| `cc` | string | A comma-separated list of email addresses that will publicly receive a copy of this message.
| `content_format` | string | `markdown` for HTML or blank for plaintext
| `custom_*` | mixed | 
| `dont_keep_copy` | boolean | Send the reply by email without saving a copy in Cerb: 0=no, 1=yes
| `dont_send` | boolean | Save the reply in Cerb without sending email: 0=no, 1=yes
| `file_id[]` | ids | Upload with [attachments](/docs/api/modules/attachments/)
| `group_id` | id | Move the ticket to a new [group](/docs/api/modules/groups/)
| `html_template_id` | id | [mail template](/docs/api/modules/mail-html-template/)
| `is_autoreply` | boolean | Automatically include auto-reply mail headers: 0=no, 1=yes
| `is_broadcast` | boolean | Set the broadcast flag: 0=no, 1=yes
| `is_forward` | boolean | Send the message without updating the ticket with the new subject or requesters: 0=no, 1=yes
| `owner_id` | id | Assign the ticket to a [worker](/docs/api/modules/workers/), or `0` to unassign from the current owner
| `reopen_at` | mixed | unix timestamp or string (e.g. "Friday 2pm", "+2 hours")
| `status_id` | integer | 0=open, 1=waiting, 2=closed, 3=deleted
| `subject` | string | Update the ticket's subject
| `to` | string | A comma-separated list of email addresses to include as recipients. If blank, it uses the ticket's current requesters
| `worker_id` | id | The specific [worker](/docs/api/modules/workers/) to send the message as. This defaults to the current API user, and can only be changed by administrators

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

# Search

**POST /tickets/search.json**

Perform a search for ticket objects.

### Parameters
{: .no_toc}

|---
| Field | Description | Type
|-|-|-
| `expand` | The keys to expand for each object as a comma-separated list | string
| `limit` | The number of results to display per page | integer
| `page` | The page of results to display given limit | integer
| `q` | Filters to add using quick search syntax | string
| `sortAsc` | `0` _(descending)_ or `1` _(ascending)_ | bit
| `sortBy` | The field to sort results by | string
| `subtotals[]` | Multiple subtotal sets can be returned | string 

**expand**
	
Includes additional information in the response.  The following tokens may be provided in a comma-separated list:

|---
| Field | Description
|-|-
| `custom_*` | Include custom field values for each ticket.
| `latest_incoming_activity` | Include a timestamp for the latest incoming activity on each ticket.
| `latest_outgoing_activity` | Include a timestamp for the latest outgoing activity on each ticket.
| `owner` | Include full owner records.
| `requesters` | Include full participant records for each ticket.
| `signatures` | Include a signature for each ticket's group/bucket.
| `watchers` | Include watcher records for each ticket.

**sortBy**

|---
| Field | Type | 
|-|-|-
| `bucket_id` | integer
| `content` | string | Use `oper[]=fulltext`
| `created` | timestamp
| `first_wrote` | string | 
| `group_id` | integer
| `id` | integer
| `mask` | string | 
| `org_id` | integer
| `org_name` | string
| `requester` | string | 
| `status_id` | integer | 0=open, 1=waiting, 2=closed, 3=deleted
| `subject` | string | 
| `updated` | timestamp
| `custom_*` | mixed | 

**subtotals[]**

|---
| Field | Type | 
|-|-|-
| `fieldsets` | Custom fieldsets on the tickets
| `first_wrote` | Tickets by first sender email
| `group` | Tickets by group/bucket
| `last_action` | Tickets by last action
| `last_wrote` | Tickets by latest sender email
| `links` | Objects linked to tickets
| `org_name` | Tickets by organization
| `owner` | Tickets by owner
| `spam_training` | Tickets by spam classification
| `status_id` | Tickets by status
| `subject` | Tickets by subject
| `watchers` | Watchers on tickets

### Examples
{: .no_toc}

<pre>
<code class="language-php">
$postfields = array(
    array('q','owner:me status:o'),
    array('sortBy','updated'),
    array('sortAsc','1'),
    array('page','1'),
);
$out = $cerb->post($base_url . 'tickets/search.json', $postfields);
</code>
</pre>

<pre>
<code class="language-php">
$postfields = array(
    array('criteria[]','is_deleted'),
    array('oper[]','='),
    array('value[]','0'),
    array('criteria[]','group_id'),
    array('oper[]','='),
    array('value[]','1'),
    array('criteria[]','bucket_id'),
    array('oper[]','='),
    array('value[]','0'),
    array('criteria[]','mask'),
    array('oper[]','like'),
    array('value[]','e*'),
    array('sortBy','mask'),
    array('sortAsc','1'),
    array('page','1'),
);
$out = $cerb->post($base_url . 'tickets/search.json', $postfields);
</code>
</pre>

{% include api_toc.html %}