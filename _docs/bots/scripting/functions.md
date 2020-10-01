---
title: "Bot Scripting Reference: Functions"
excerpt: A reference of the template functions in bot scripting.
permalink: /docs/bots/scripting/functions/
toc:
  title: Functions
jumbotron:
  title: "Reference: Functions"
  tagline: 
  breadcrumbs:
  -
    label: Docs &raquo;
    url: /docs/home/
  -
    label: Bots &raquo;
    url: /docs/bots/
  -
    label: Scripting &raquo;
    url: /docs/bots/scripting/
---

These functions are available in bot scripts and snippets:

* TOC
{:toc}

## array_column

(Added in [9.2.1](/releases/9.2.1/))

The **array_column** function extracts a column from the elements of an array:

<pre>
<code class="language-twig">
{% raw %}
{% set people = [
	{"id": 1, "name": "Kina Halpue", "email": "kina@cerb.example"},
	{"id": 2, "name": "Milo Dade", "email": "milo@cerb.example"},
	{"id": 3, "name": "Janey Youve", "email": "janey@cerb.example"},
] %}
The email addresses are: {{array_column(people,'email')|join(', ')}}
{% endraw %}
</code>
</pre>

```
The email addresses are: kina@cerb.example, milo@cerb.example, janey@cerb.example
```

## array_combine

(Added in [9.0](/releases/9.0/))

The **array_combine** function creates a new array with the given `keys` and `values`:

<pre>
<code class="language-twig">
{% raw %}
{% set keys = ['name', 'age', 'email'] %}
{% set values = ['Janey Youve', '30-ish', 'janey@cerb.example'] %}
{% set person = array_combine(keys, values) %}
{{person.name}} can be reached at {{person.email}}
{% endraw %}
</code>
</pre>

```
Janey Youve can be reached at janey@cerb.example
```

## array_diff

The **array_diff** function returns the items in the second array that are not present in the first array:

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

## array_extract_keys

(Added in [9.6.4](/releases/9.6.4/))

Returns the given keys from all elements of a list.

<pre>
<code class="language-twig">
{% raw %}
{% set records = [
	{
		id: 1,
		subject: "Help with the API",
		status: "open",
		sender: "customer@cerb.example",
	},
	{
		id: 2,
		subject: "Automating email replies",
		status: "open",
		sender: "customer@cerb.example",
	}
] %}
Sender,Subject,Status
{{array_extract_keys(records, ['sender','subject','status'])|csv}}
{% endraw %}
</code>
</pre>

```
Sender,Subject,Status
customer@cerb.example,"Help with the API",open
customer@cerb.example,"Automating email replies",open
```

## array_intersect

(Added in [9.0](/releases/9.0/))

Returns a new array for all the elements in array1 that are also present in array2. This is the opposite of [array_diff](#array_diff).

<pre>
<code class="language-twig">
{% raw %}
{% set arr1 = ['Apple', 'Google', 'Microsoft'] %}
{% set arr2 = ['Apple', 'Microsoft', 'Cerb'] %}
{% set intersect = array_intersect(arr2, arr1) %}
These are in both: {{intersect|join(', ')}}
{% endraw %}
</code>
</pre>

```
These are in both: Apple, Microsoft
```

## array_matches

(Added in [9.6.4](/releases/9.6.4/))

Compares an array of values to an array of patterns.

<pre>
<code class="language-twig">
{% raw %}
{% set recipients = ['support@cerb.example','sales@cerb.example'] %}
{% set patterns = ['sales@*'] %}
{% set results = array_matches(recipients, patterns) %}
Matches: {{results|join(', ')}}
{% endraw %}
</code>
</pre>

```
Matches: sales@cerb.example
```

## array_sort_keys

(Added in [9.0](/releases/9.0/))

Sort an associative array by its keys rather than its values.

<pre>
<code class="language-twig">
{% raw %}
{% set arr = {"z":"A", "a":"B", "m":"C"} %}
{% set arr = array_sort_keys(arr) %}
{{arr|keys|join(',')}}
{% endraw %}
</code>
</pre>

```
a,m,z
```

## array_unique

(Added in [9.0](/releases/9.0/))

Return a new array with only the distinct values from the `array` argument.

<pre>
<code class="language-twig">
{% raw %}
{% set arr = [1,1,2,2,3,3,4,4,5,5,6] %}
Unique values {{array_unique(arr)|join(',')}}
{% endraw %}
</code>
</pre>

```
Unique values 1,2,3,4,5,6
```

## array_values

(Added in [9.0](/releases/9.0/))

Return the values from an associative array as a new indexed array. For instance, this can affect the output in JSON encoding by using `[]` rather than `{key:value}`.

<pre>
<code class="language-twig">
{% raw %}
{% set arr = {"z":"A", "a":"B", "m":"C"} %}
{{array_values(arr)|json_encode}}
{% endraw %}
</code>
</pre>

```
["A","B","C"]
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

## cerb_has_priv

(Added in [9.0](/releases/9.0/))

Returns a boolean depending on whether the given actor has the given privilege among their roles. If no actor is given, the current worker is assumed. This allows bot functionality, snippets, and widgets, to adapt based on worker permissions. This is particularly useful in HTML-based profile widgets.

<pre>
<code class="language-twig">
{% raw %}
{% if cerb_has_priv('contexts.cerberusweb.context.ticket.create', 'worker', 1) %}
Worker #1 has permission to create tickets.
{% endif %}
{% endraw %}
</code>
</pre>

```
Worker #1 has permission to create tickets.
```

## cerb_placeholders_list

Return an [object](/docs/bots/scripting/(/docs/bots/scripting/arrays-objects/)) with every placeholder in the current behavior.

<pre>
<code class="language-twig">
{% raw %}
{{cerb_placeholders_list()|json_encode|json_pretty}}
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

## cerb_record_readable

(Added in [9.0](/releases/9.0/))

Returns a boolean if the given actor has read access to the given record. If no actor is provided then the current worker is assumed. This allows bots and widgets to adapt based on record permissions. For instance, an HTML widget on a profile dashboard could only show a button to workers who can modify the record.

<pre>
<code class="language-twig">
{% raw %}
{% if cerb_record_readable('ticket', 123, 'worker', 1) %}
Worker #1 can read ticket #123.
{% endif %}
{% endraw %}
</code>
</pre>

```
Worker #1 can read ticket #123.
```

## cerb_record_writeable

(Added in [9.0](/releases/9.0/))

Returns a boolean if the given actor has write access to the given record. If no actor is provided then the current worker is assumed. This allows bots and widgets to adapt based on record permissions. For instance, an HTML widget on a profile dashboard could only show a button to workers who can modify the record.

<pre>
<code class="language-twig">
{% raw %}
{% if cerb_record_writeable('ticket', 123, 'worker', 1) %}
Worker #1 can modify ticket #123.
{% endif %}
{% endraw %}
</code>
</pre>

```
Worker #1 can modify ticket #123.
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

Round-robin through a sequence.

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

Create a date object for use with the [date_modify](/docs/bots/scripting/filters/#date_modify) filter.

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

You can use the **dict_set** function to quickly add, modify, or append items in an array or object.

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

## dict_unset

You can use the **dict_unset** function to remove items by key from an array or object.

You can unset deeply nested keys in a single line using dot-notation:

<pre>
<code class="language-twig">
{% raw %}
{% set person = {"person":{"name":{"first":"Jane","last":"Tester"},"age":28,"location":"Secret"}} %}
{% set person = dict_unset(person, ['person.name.last','person.age','person.location']) %}
{{person|json_encode|json_pretty}}
{% endraw %}
</code>
</pre>

```
{
    "person": {
        "name": {
            "first": "Jane"
        }
    }
}
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

This returns an [object](/docs/bots/scripting/(/docs/bots/scripting/arrays-objects/)).

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

`xml_decode(xml_string,namespaces,mode)`

* **xml_string**: The string of XML to convert into an object.
* **namespaces**: An optional array of namespaces.
* **mode**: Use `html` to convert an HTML DOM into an XML document.

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

# References

[^json]: Wikipedia: JSON - <https://en.wikipedia.org/wiki/JSON>

[^xml]: Wikipedia: XML - <https://en.wikipedia.org/wiki/XML>

[^xpath]: Wikipedia: XPath - <https://en.wikipedia.org/wiki/XPath>