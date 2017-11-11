---
title: Sensors
permalink: /docs/api/deprecated/sensors/
jumbotron:
  title: Sensors
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

# Create

**POST /sensors/create.json**

Create a new sensor object.

### Parameters
{: .no_toc}

|---
| Field | Type | 
|-|-|-
| `metric` | string
| `name` | string | **required**
| `output` | string
| `status` | char | (O)K, (W)arning, (C)ritical
| `type` | string | `cerberusweb.datacenter.sensor.http`, `cerberusweb.datacenter.sensor.port`, or `cerberusweb.datacenter.sensor.external`
| `updated` | integer
| `custom_*` | mixed | 

### Example
{: .no_toc}

<pre>
<code class="language-php">
$postfields = array(
    array('name','Cerb Site'),
    array('type', `cerberusweb.datacenter.sensor.http`),
    array('status', 'O'),
);
$out = $cerb->post($base_url . 'sensors/create.json', $postfields);
</code>
</pre>

# Bulk Update

**POST /sensors/bulk_update.json**

Update multiple sensors at once. You'll need to post an XML string containing all of the sensors to update.

### Example
{: .no_toc}

<pre>
<code class="language-php">
$xml = <<< EOF
&lt;?xml version="1.0" encoding="UTF-8"?&gt;
    &lt;sensor id="1"&gt;
        &lt;name&gt;Cerb Site&lt;/name&gt;
        &lt;status&gt;C&lt;/status&gt;
        &lt;output&gt;500&lt;/output&gt;
    &lt;/sensor&gt;
&lt;/xml&gt;
EOF;

$out = $cerb->post($base_url . 'sensors/bulk_update.json', $contents);
</code>
</pre>

# Retrieve

**GET /sensors/`<id>`.json**

Retrieve a sensor object.

<pre>
<code class="language-php">
$out = $cerb->get($base_url . 'sensors/1.json');
</code>
</pre>

# Update

**PUT /sensors/`<id>`.json**

Update a sensor object.

### Parameters
{: .no_toc}

|---
| Field | Type | 
|-|-|-
| `metric` | string
| `name` | string | 
| `output` | string
| `status` | char | (O)K, (W)arning, (C)ritical
| `type` | string | `cerberusweb.datacenter.sensor.http`, `cerberusweb.datacenter.sensor.port`, or `cerberusweb.datacenter.sensor.external`
| `updated` | integer
| `custom_*` | mixed | 

### Example
{: .no_toc}

<pre>
<code class="language-php">
$postfields = array(
    array('output', 'C'),
);
$out = $cerb->put($base_url . 'sensors/1.json', $postfields);
</code>
</pre>

# Search

**POST /sensors/search.json**

Perform a search for sensor objects.

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

**sortBy**

|---
| Field | Type | 
|-|-|-
| `id` | integer
| `metric` | string
| `name` | string | 
| `output` | string
| `status` | char | (O)K, (W)arning, (C)ritical
| `type` | string | `cerberusweb.datacenter.sensor.http`, `cerberusweb.datacenter.sensor.port`, or `cerberusweb.datacenter.sensor.external`
| `updated` | integer
| `custom_*` | mixed | 

**subtotals[]**

|---
| Field | Type | 
|-|-|-
| `extension_id` | Sensors by extension
| `fieldsets` | Custom fieldsets on sensors
| `is_disabled` | Sensors by enabled/disabled
| `links` | Objects linked to sensors
| `status` | Sensors by status
| `watchers` | Watchers on sensors

### Examples
{: .no_toc}

<pre>
<code class="language-php">
$postfields = array(
     array('q','name:http status:c,w'),
     array('sortBy','updated'),
     array('sortAsc','1'),
     array('page','1'),
);
$out = $cerb->post($base_url . 'sensors/search.json', $postfields);
</code>
</pre>

<pre>
<code class="language-php">
$postfields = array(
     array('criteria[]','status'),
     array('oper[]','='),
     array('value[]','O'),
     array('sortBy','updated'),
     array('sortAsc','1'),
     array('page','1'),
);
$out = $cerb->post($base_url . 'sensors/search.json', $postfields);
</code>
</pre>

{% include api_toc.html %}