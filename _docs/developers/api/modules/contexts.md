---
title: Contexts
permalink: /docs/api/modules/contexts/
jumbotron:
  title: Contexts
  tagline: ""
  breadcrumbs:
  -
    label: Developers &raquo; API
    url: /docs/api/
---

* TOC
{:toc}

# Object Types

## List

**GET /contexts/list.json**

Retrieve a list of object contexts with IDs, names, custom fields and fieldsets.  This includes object contexts contributed by [plugins](/docs/plugins/).

**Example:**

<pre>
<code class="language-php">
$out = $cerb->get($base_url . 'contexts/list.json');
</code>
</pre>

# Activity Log

## List Events

**GET /contexts/activity/events.json**

Retrieve a list of activity log event IDs and names, including those contributed by [plugins](/docs/plugins/).

**Example:**

<pre>
<code class="language-php">
$out = $cerb->get($base_url . 'contexts/activity/events.json');
</code>
</pre>

## Create

**POST /contexts/activity/create.json**

Create an activity log entry.

|---
| Field | Type | 
|-|-|-
| `on` | string
| `activity_point` | string
| `variables` | JSON array
| `urls` | JSON array

* The `on` field should be a target record in `context:context_id` format.

* The `activity_point` field contains an activity ID from List Events request above.  You can implement new Activity Log events in the `<activity_points>` section of a [plugin.xml](/docs/plugins/) manifest.

* The `variables` field should be a JSON encoded array, where the key is a placeholder in the activity log message and the value is the text to substitute.

* The `urls` field is an option JSON encoded array, where the key is a placeholder in the activity log message and the value is the URL to use for hyperlinking the text.

<div class="cerb-box note">
{% raw %}
	<p>You do not need to provide a value for <tt>{{actor}}</tt> in <tt>variables</tt> or <tt>urls</tt> since this is handled automatically by Cerb.</p>
{% endraw %}
</div>

**Example:**

<pre>
<code class="language-php">
$postfields = array(
	array('on','cerberusweb.contexts.worker:2'),
	array('activity_point','example.worker_high_five'),
    array('variables', json_encode(array(
        'target' => 'Dan Hildebrandt',
    ))),
    array('urls', json_encode(array(
        'target' => 'ctx://cerberusweb.contexts.worker:2'
    ))),
);
$out = $cerb->post($base_url . 'contexts/activity/create.json', $postfields);
</code>
</pre>

# Links

## Link

**POST /contexts/link.json**

Add any number of links to one context record.

|---
| Field | Type | 
|-|-|-
| `on` | string
| `targets` | JSON array string

**Example:**

<pre>
<code class="language-php">
$postfields = array(
  array('on','cerberusweb.contexts.ticket:1148'),
  array('targets', json_encode(array(
    'cerberusweb.contexts.org:17581',
    'cerberusweb.contexts.address:5447',
  ))),
);
$out = $cerb->post($base_url . 'contexts/link.json', $postfields);
</code>
</pre>

## Unlink

**POST /contexts/unlink.json**

Remove any number of links from one context record.

|---
| Field | Type | 
|-|-|-
| `on` | string
| `targets` | JSON array string

**Example:**

<pre>
<code class="language-php">
$postfields = array(
  array('on','cerberusweb.contexts.ticket:1148'),
  array('targets', json_encode(array(
    'cerberusweb.contexts.org:17581',
  ))),
);
$out = $cerb->post($base_url . 'contexts/unlink.json', $postfields);
</code>
</pre>

{% include api_toc.html %}