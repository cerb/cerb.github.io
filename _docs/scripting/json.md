---
title: "Scripting Reference: JSON"
excerpt: 
permalink: /docs/scripting/json/
toc:
  title: JSON
  expand: Developer Guide
jumbotron:
  title: JSON
  tagline: 
  breadcrumbs:
  -
    label: Docs &raquo;
    url: /docs/home/
  -
    label: Developer Guide &raquo;
  -
    label: Scripting &raquo;
    url: /docs/scripting/
---

JSON[^json] is a popular format for serializing or exchanging human-readable data using key/value pairs.

# JSON Decoding

You can decode a JSON-encoded string with the [json_decode()](/docs/scripting/functions/#json_decode) function:

<pre>
<code class="language-twig">
{% raw %}
{% set json_string = "{\"name\":\"Joe Customer\",\"order_id\":12345}" %}
{% set json = json_decode(json_string) %}
Customer: {{json.name}}
Order #: {{json.order_id}}	
{% endraw %}
</code>
</pre>

```
Customer: Joe Customer
Order #: 12345
```

This returns an [object](/docs/scripting/arrays-objects/#objects).

# JSON Modification

You can construct or modify a JSON object using the [dict_set()](/docs/scripting/functions/#dict_set) function:

<pre>
<code class="language-twig">
{% raw %}
{% set json = {'name': 'Joe Customer', 'order_id': 12345} %}
{% set json = dict_set(json, 'order_id', 54321) %}
{% set json = dict_set(json, 'status.text', 'shipped') %}
{% set json = dict_set(json, 'status.tracking_id', 'Z1F238') %}
Customer: {{json.name}}
Order #: {{json.order_id}}
Status: {{json.status.text}}
Tracking #: {{json.status.tracking_id}}
{% endraw %}
</code>
</pre>

```
Customer: Joe Customer
Order #: 54321
Status: shipped
Tracking #: Z1F238
```

# JSON Encoding

You can encode any variable as a JSON string with the [json_encode](/docs/scripting/filters/#json_encode) filter:

<pre>
<code class="language-twig">
{% raw %}
{% set json = {'name': 'Joe Customer'} %}
{% set json = dict_set(json, 'order_id', 54321) %}
{% set json = dict_set(json, 'status.text', 'shipped') %}
{% set json = dict_set(json, 'status.tracking_id', 'Z1F238') %}
{{json|json_encode}}	
{% endraw %}
</code>
</pre>

```
{"name":"Joe Customer","order_id":54321,"status":{"text":"shipped","tracking_id":"Z1F238"}}	
```

# JSON Prettification

You can _"prettify"_ a JSON string with the [json_pretty](/docs/scripting/filters/#json_pretty) filter:

<pre>
<code class="language-twig">
{% raw %}
{% set json = {'name': 'Joe Customer'} %}
{% set json = dict_set(json, 'order_id', 54321) %}
{% set json = dict_set(json, 'status.text', 'shipped') %}
{% set json = dict_set(json, 'status.tracking_id', 'Z1F238') %}
{{json|json_encode|json_pretty}}
{% endraw %}
</code>
</pre>

```
{
  "name": "Joe Customer",
  "order_id": 54321,
  "status": {
    "text": "shipped",
    "tracking_id": "Z1F238"
  }
}
```

<div class="section-nav">
	<div class="left">
		<a href="/docs/scripting/regex/" class="prev">&lt; Regular Expressions</a>
	</div>
	<div class="right align-right">
		<a href="/docs/scripting/xml/" class="prev">XML &gt;</a>
	</div>
</div>
<div class="clear"></div>

# References

[^json]: Wikipedia: JSON - <https://en.wikipedia.org/wiki/JSON>
