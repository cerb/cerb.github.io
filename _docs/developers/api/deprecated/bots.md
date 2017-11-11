---
title: Bots
permalink: /docs/api/deprecated/bots/
jumbotron:
  title: Bots
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

# List Bots

**GET /bots/list.json**

Retrieve the bots accessible by the current worker.  This includes bots owned by the worker, their groups or roles, or the application.

**Parameters:**

|---
| Field | Description | Type
|-|-|-
| `expand` | The keys to expand for each object as a comma-separated list | string

### expand
{: .no_toc}
	
Includes additional information in the response.  The following tokens may be provided in a comma-separated list:

|---
| Field | Description
|-|-
| `behaviors` | Retrieve behavior records for each bot.
| `owner` | Retrieve owner records.

**Example:**

<pre>
<code class="language-php">
$out = $cerb->get($base_url . 'bots/list.json?expand=owner,behaviors');
</code>
</pre>

# Retrieve Bot

**GET /bots/`<id>`.json**

Retrieve a bot record by ID.

### Parameters
{: .no_toc}

|---
| Field | Description | Type
|-|-|-
| `expand` | The keys to expand for each object as a comma-separated list | string

**expand**
	
Includes additional information in the response.  The following tokens may be provided in a comma-separated list:

|---
| Field | Description
|-|-
| `behaviors` | Retrieve behavior records for each bot.
| `owner` | Retrieve owner records.

**Example:**

<pre>
<code class="language-php">
$out = $cerb->get($base_url . 'bots/123.json?expand=owner,behaviors');
</code>
</pre>

# Run Bot Behavior

**POST /bots/behavior/`<id>`/run.json**

Execute the specified bot _Custom API Request_ behavior.  The response will provide the values from the behavior's dictionary at conclusion.  A common strategy is to use the _Set custom placeholder_ action in the bot behavior in order to send information back to the API caller.

The parameters are the public variables defined on the behavior (if any).

|---
| Field | Type
|-|-
| `var_*` | mixed

**Example:**

<pre>
<code class="language-php">
$postfields = array(
  	array('var_name','Jeff@WGM'),
  	array('var_picklist','Red'),
  	array('var_number',1234),
  	array('var_date',"tomorrow 5pm"),
  	array('var_bool',1),
  	array('var_worker',1),
  	array('var_tickets',json_encode(array(1024,1025,1026))),
);
$out = $cerb->post($base_url . 'bots/behavior/123/run.json', $postfields);
</code>
</pre>

{% include api_toc.html %}