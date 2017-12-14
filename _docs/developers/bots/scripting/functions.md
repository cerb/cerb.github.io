---
title: Bot Scripting Functions
excerpt: A reference of the template functions in bot scripting.
permalink: /docs/building-bots/scripting/functions/
jumbotron:
  title: Functions
  tagline: 
  breadcrumbs:
  -
    label: Docs &raquo;
    url: /docs/home/
  -
    label: Building Bots &raquo;
    url: /docs/building-bots/
  -
    label: Scripting &raquo;
    url: /docs/building-bots/scripting/#functions
---

These functions are available in bot scripts and snippets:

* TOC
{:toc}

## array_diff

The **array_diff** filter returns the items in the second array that are not present in the first array:

<pre>
<code class="language-twig">
{% raw %}
{% set arr1 = ['Apple', 'Google', 'Microsoft'] %}
{% set arr2 = ['Apple', 'Microsoft', 'Cerb'] %}
{% set diff = array_diff(arr2, arr1) %}
These are new: {{diff|join(', ')}}
{% endraw %}
</code>
</pre>

```
These are new: Cerb
```

## attribute

Access the values of an object with a variable key:

<pre>
<code class="language-twig">
{% raw %}
{% set person = {"first_name": "Kina", "last_name": "Halpue", "title": "Customer Support Supervisor"} %}
{% set key = 'title' %}
{{attribute(person, key)}}
{% endraw %}
</code>
</pre>

```
Customer Support Supervisor
```

## cerb_avatar_image

Retrieve the avatar image for a given record type and ID.

`cerb_avatar_image(record_type, id, updated)`

<pre>
<code class="language-twig">
{% raw %}
{{cerb_avatar_image('worker','1','now'|date('U'))}}
{% endraw %}
</code>
</pre>

```
<img src="https:/cerb.example/avatars/worker/1?v=1513212603" style="height:16px;width:16px;border-radius:16px;vertical-align:middle;">
```

## cerb_avatar_url

Retrieve the avatar image URL for a given record type and ID.

`cerb_avatar_url(record_type, id, updated)`

<pre>
<code class="language-twig">
{% raw %}
{{cerb_avatar_url('worker','1','now'|date('U'))}}
{% endraw %}
</code>
</pre>

```
https://cerb.example/avatars/worker/1?v=1513212702
```

## cerb_file_url

Retrieve the download link for a given attachment ID.

This automatically adapts to use within Cerb and community portals (e.g. SSL, proxies).

`cerb_file_url(id)`

<pre>
<code class="language-twig">
{% raw %}
{{cerb_file_url('1')}}
{% endraw %}
</code>
</pre>

```
https://cerb.example/files/1/original_message.html
```

## cerb_url

Retrieve a full URL to a page or resource in Cerb.

This automatically adapts to use within Cerb and community portals (e.g. SSL, proxies).

<pre>
<code class="language-twig">
{% raw %}
{{cerb_url("c=profiles&type=ticket&id=5")}}
{% endraw %}
</code>
</pre>

```
https://cerb.example/profiles/ticket/5
```

## cycle

Round-robin through an sequence.

<pre>
<code class="language-twig">
{% raw %}
{% set options = ['odd','even'] %}
{% for n in 1..10 %}
* {{cycle(options, n)}}
{% endfor %}
{% endraw %}
</code>
</pre>

```
* even
* odd
* even
* odd
* even
* odd
* even
* odd
* even
* odd
```

## date

Create a date object for use with the [date_modify](/docs/building-bots/scripting/filters/#date_modify) filter.

<pre>
<code class="language-twig">
{% raw %}
{% set d = date('1-Jan-2018 10:00am') %}
{{d|date_modify('+2 hours')|date('F d, Y g:ia')}}
{% endraw %}
</code>
</pre>

```
January 01, 2018 12:00pm
```

## dict_set

You can use the **dict_set** function to quickly modify, append, or remove items from an array or object.

You can set deeply nested keys in a single line using dot-notation:

<pre>
<code class="language-twig">
{% raw %}
{% set var = {"group": {}} %}
{% set var = dict_set(var, 'group.name', 'Support') %}
{% set var = dict_set(var, 'group.manager.name.first', 'Kina') %}
{% set var = dict_set(var, 'group.manager.name.last', 'Halpue') %}
{{var|json_encode|json_pretty}}
{% endraw %}
</code>
</pre>

```
{
  "group": {
    "name": "Support",
    "manager": {
      "name": {
        "first": "Kina",
        "last": "Halpue"
      }
    }
  }
}
```

Append items to an array by adding `.[]` to the key:

<pre>
<code class="language-twig">
{% raw %}
{% set var = {"group": {}} %}
{% set var = dict_set(var, 'group.name', 'Support') %}
{% set var = dict_set(var, 'group.members.[]', 'Kina Halpue') %}
{% set var = dict_set(var, 'group.members.[]', 'William Portcullis') %}
{% set var = dict_set(var, 'group.members.[]', 'Steven Emplois') %}
{{var|json_encode|json_pretty}}
{% endraw %}
</code>
</pre>

```
{
  "group": {
    "name": "Support",
    "members": [
      "Kina Halpue",
      "William Portcullis",
      "Steven Emplois"
    ]
  }
}
```

Append to nested arrays:

<pre>
<code class="language-twig">
{% raw %}
{% set var = [1,2,[3,4,[5,6]]] %}
{% set var = dict_set(var, '2.2.[]', 7) %}
{% set var = dict_set(var, '2.2.[]', 8) %}
{% set var = dict_set(var, '2.3', 9) %}
{{var|json_encode|json_pretty}}
{% endraw %}
</code>
</pre>

```
[
  1,
  2,
  [
    3,
    4,
    [
      5,
      6,
      7,
      8
    ],
    9
  ]
]
```

## json_decode

You can decode a JSON-encoded string with the **json_decode** function:

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

This returns an [object](/docs/building-bots/scripting/#objects).

## jsonpath_set

This is nearly identical to [dict_set](#dict_set).

<pre>
<code class="language-twig">
{% raw %}
{% set json_string = "{\"name\":\"Joe Customer\",\"order_id\":12345}" %}
{% set json = json_decode(json_string) %}
{% set json = jsonpath_set(json, 'order_id', '67890') %}
{{json.order_id}}
{% endraw %}
</code>
</pre>

```
67890
```

You can specify an array by appending `[]` without a leading dot (`.`):

<pre>
<code class="language-twig">
{% raw %}
{% set json_string = "{\"team\":{\"groups\":[]}}" %}
{% set json = json_decode(json_string) %}
{% set json = jsonpath_set(json, 'team.groups[]', 'Support') %}
{% set json = jsonpath_set(json, 'team.groups[]', 'Sales') %}
{% set json = jsonpath_set(json, 'team.groups[]', 'Development') %}
{{json|json_encode|json_pretty}}
{% endraw %}
</code>
</pre>

```
{
  "team": {
    "groups": [
      "Support",
      "Sales",
      "Development"
    ]
  }
}
```

## max

Return the largest value in an array or object.

<pre>
<code class="language-twig">
{% raw %}
{% set numbers = [1,9,8,4,2] %}
{{max(numbers)}}
{% endraw %}
</code>
</pre>

```
9
```

## min

Return the smallest value in an array or object.

<pre>
<code class="language-twig">
{% raw %}
{% set numbers = [1,9,8,4,2] %}
{{max(numbers)}}
{% endraw %}
</code>
</pre>

```
1
```

## placeholders_list

Return an [object](/docs/building-bots/scripting/#objects) with every placeholder in the current behavior.

<pre>
<code class="language-twig">
{% raw %}
{{placeholders_list()|json_encode|json_pretty}}
{% endraw %}
</code>
</pre>

```
{
  "worker__context": "cerberusweb.contexts.worker",
  "worker__loaded": true,
  "worker__label": "Kina Halpue",
  "worker__image_url": "https://cerb.example/avatars/worker/1?v=1512582324",
  "worker_at_mention_name": "Kina",
  "worker_calendar_id": 7,
  "worker_dob": null,
  "worker_id": 1,
  "worker_first_name": "Kina",
  "worker_full_name": "Kina Halpue",
  "worker_gender": "F",
  "worker_is_disabled": 0,
  "worker_is_superuser": 1,
  "worker_language": "en_US",
  "worker_last_name": "Halpue",
  "worker_location": "",
  "worker_mobile": "15555555555",
  "worker_phone": "",
  "worker_time_format": "D, d M Y h:i a",
  "worker_timezone": "America/Los_Angeles",
  "worker_title": "Customer Support",
  "worker_updated": 1512582324,
  "worker_record_url": "https://cerb.example/profiles/worker/1-Kina-Halpue",
  ...
}
```

## random

Return a random item from a string or array, or a random number between 0 and the given number (inclusive).

<pre>
<code class="language-twig">
{% raw %}
{{random([1,2,3,4,5,6,7,8,9,0])}}
{{random("abcdefghijklmnopqrstuvwxyz")}}
{{random(20)}}
{% endraw %}
</code>
</pre>

```
9
o
17
```

## random_string

Generate a random string of the given length.  This is useful for generating confirmation codes or temporary passwords.

<pre>
<code class="language-twig">
{% raw %}
{{random_string(16)}}
{% endraw %}
</code>
</pre>

```
61AE3XG3ZMW8QDTM
```

## range

Return an array with values between `from` and `to` (inclusive).

`range(from,to,step)`

<pre>
<code class="language-twig">
{% raw %}
{{range(5,15)|json_encode}}
{{range(5,15,2)|json_encode}}
{% endraw %}
</code>
</pre>

```
[5,6,7,8,9,10,11,12,13,14,15]
[5,7,9,11,13,15]
```

## regexp_match_all

`regexp_match_all(pattern, string, group)`

<pre>
<code class="language-twig">
{% raw %}
{% set headers = 
"X-Mailer: Cerb
From: customer@cerb.example
To: support@cerb.example
"
%}
{% set results = regexp_match_all("#^(.*?): (.*?)$#m", headers) %}
{{results|json_encode|json_pretty}}
{% endraw %}
</code>
</pre>

```
[
  [
    "X-Mailer: Cerb",
    "From: customer@cerb.example",
    "To: support@cerb.example"
  ],
  [
    "X-Mailer",
    "From",
    "To"
  ],
  [
    "Cerb",
    "customer@cerb.example",
    "support@cerb.example"
  ]
]
```

## shuffle

Randomize an array:

<pre>
<code class="language-twig">
{% raw %}
{{shuffle([1,2,3,4,5])|json_encode}}
{% endraw %}
</code>
</pre>

```
[2,4,5,1,3]
```

## validate_email

Validate an email address:

<pre>
<code class="language-twig">
{% raw %}
{{validate_email('kina')|json_encode}}
{{validate_email('kina#cerb.example')|json_encode}}
{{validate_email('kina@cerb.example')|json_encode}}
{% endraw %}
</code>
</pre>

```
false
false
true
```

## validate_number

Validate a number:

<pre>
<code class="language-twig">
{% raw %}
{{validate_number('abcde')|json_encode}}
{{validate_number('20.f')|json_encode}}
{{validate_number(10)|json_encode}}
{{validate_number('123.45')|json_encode}}
{% endraw %}
</code>
</pre>

```
false
false
true
true
```

## xml_decode

You can decode an XML[^xml] string into an XML object with the **xml_decode** function.

Use the [xml_xpath](#xml_xpath) function to extract values with XPath[^xpath] queries.

<pre>
<code class="language-twig">
{% raw %}
{% set string_of_xml = 
"&lt;response&gt;
  &lt;client_id&gt;1&lt;/client_id&gt;
  &lt;invoice_id&gt;123&lt;/invoice_id&gt;
&lt;/response&gt;"
-%}
{% set xml = xml_decode(string_of_xml) %}
{{xml_encode(xml)}}
{% endraw %}
</code>
</pre>

```
<?xml version="1.0"?>
<response>
  <client_id>1</client_id>
  <invoice_id>123</invoice_id>
</response>
```

## xml_encode

You can encode an object as XML with the **xml_encode** function:

<pre>
<code class="language-twig">
{% raw %}
{% set string_of_xml = 
"&lt;response xmlns=\"http://www.example.com/api/\"&gt;
  &lt;client_id&gt;1&lt;/client_id&gt;
  &lt;invoice_id&gt;123&lt;/invoice_id&gt;
&lt;/response&gt;"
-%}
{% set xml = xml_decode(string_of_xml) %}
{{xml_encode(xml.client_id)}}	
{% endraw %}
</code>
</pre>

```
<client_id>1</client_id>
```

## xml_xpath

Use the **xml_xpath** function to extract values with XPath[^xpath] queries:

<pre>
<code class="language-twig">
{% raw %}
{% set string_of_xml = 
"&lt;response&gt;
  &lt;client_id&gt;1&lt;/client_id&gt;
  &lt;invoice_id&gt;123&lt;/invoice_id&gt;
&lt;/response&gt;"
-%}
{% set xml = xml_decode(string_of_xml) %}
{% set client_id = xml_xpath(xml, '//client_id')|first %}
{% set invoice_id = xml_xpath(xml, '//invoice_id')|first %}
Client ID: {{client_id}}
Invoice ID: {{invoice_id}}
{% endraw %}
</code>
</pre>

```
Client ID: 1
Invoice ID: 123
```

## xml_xpath_ns

You can define an XML namespace with the **xml_xpath_ns** function:

<pre>
<code class="language-twig">
{% raw %}
{% set string_of_xml = 
"&lt;response xmlns=\"http://www.example.com/api/\"&gt;
  &lt;client_id&gt;1&lt;/client_id&gt;
  &lt;invoice_id&gt;123&lt;/invoice_id&gt;
&lt;/response&gt;"
-%}
{% set xml = xml_decode(string_of_xml) %}
{% set xml = xml_xpath_ns(xml, 'ns', 'http://www.example.com/api/') %}
{% set client_id = xml_xpath(xml, '//ns:client_id')|first %}
{% set invoice_id = xml_xpath(xml, '//ns:invoice_id')|first %}
Client ID: {{client_id}}
Invoice ID: {{invoice_id}}
{% endraw %}
</code>
</pre>

```
Client ID: 1
Invoice ID: 123
```

<div class="section-nav">
	<div class="left">
			<a href="/docs/building-bots/scripting/commands/" class="prev">&lt; Commands</a>
	</div>
	<div class="right align-right">
			<a href="/docs/building-bots/scripting/filters/" class="next">Filters &gt;</a>
	</div>
</div>
<div class="clear"></div>

# References

[^json]: Wikipedia: JSON - <https://en.wikipedia.org/wiki/JSON>

[^xml]: Wikipedia: XML - <https://en.wikipedia.org/wiki/XML>

[^xpath]: Wikipedia: XPath - <https://en.wikipedia.org/wiki/XPath>