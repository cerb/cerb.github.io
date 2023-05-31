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

## array_count_values

(Added in [10.0.4](/releases/10.0.4/))

The **array_count_values** function takes an array of values as input, and returns an array with distinct values as keys and their count of occurrences. This function only works on arrays of strings or numbers.

<pre>
<code class="language-twig">
{% raw %}
{% set values = [1,2,3,1,3,2,3,1,2,1,3,1,3] %}
{{array_count_values(values)|json_encode|json_pretty}}
{% endraw %}
</code>
</pre>

```
{
    "1": 5,
    "2": 3,
    "3": 5
}
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

## array_fill_keys

(Added in [10.0](/releases/10.0/))

Create an array with the given keys, each set to the default value.

`array_fill_keys(keys,value)`

<pre>
<code class="language-twig">
{% raw %}
{{array_fill_keys(range(1,10),true)|json_encode}}
{% endraw %}
</code>
</pre>

```
{"1":true,"2":true,"3":true,"4":true,"5":true,"6":true,"7":true,"8":true,"9":true,"10":true}
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

## cerb_automation

Invoke a [scripting.function](/docs/automations/triggers/scripting.function/) automation from any feature that supports [scripting](/docs/bots/scripting/).

The function returns keys for `exit_state:` (`exit`, `return`, `error`) and `return:` (an arbitrary dictionary).

This brings the full functionality of automations to email signatures, snippets, legacy bot behaviors, automation event bindings, toolbars bindings, etc.

For instance, a snippet could use an automation to dynamically generate content based on the target record or current worker. This solves many feature requests.

`cerb_automation(uri, inputs)`

|-|-|-
| **uri** | The URI of an [automation](/docs/automations/) record to invoke. It must be of type `scripting.function`.
| **inputs** | A key/value dictionary of inputs. The possible keys depend on the function being invoked.

<pre>
<code class="language-twig">
{% raw %}
{% set ip_data = cerb_automation('wgm.scripting.getLocationByIP', { ip:"1.2.3.4" } ) %}
{% if ip_data.return.data %}
I see you are contacting us from {{ip_data.return.data.country_name}}.
{% endif %}
{% endraw %}
</code>
</pre>

```
I see you are contacting us from Australia.
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

## cerb_calendar_time_elapsed

(Added in [10.1.1](/releases/10.1.1/))

Calculate the time elapsed (in seconds) between two dates using calendar availability.

`cerb_calendar_time_elapsed(calendar,date_from,date_to)`

|-|-|-
| **calendar** | The ID of the [calendar](/docs/records/types/calendar/) to use for determining availability.
| **date_from** | The starting date/time.
| **date_to** | The ending date/time.

<pre>
<code class="language-twig">
{% raw %}
{{cerb_calendar_time_elapsed(123,'last Friday 5pm','now')|secs_pretty}}
{% endraw %}
</code>
</pre>

```
18 hours, 13 mins
```

## cerb_extract_uris

(Added in [9.5.3](/releases/9.5.3/))

Return an array of URLs found in HTML content, along with metadata (e.g. tag, attributes, URI parts).

In the response, URLs are replaced with `tokens` in the `template` which can be modified with the [\|replace](/docs/bots/scripting/filters/#replace) filter.

For instance, this function can be used to rewrite all links in an email template for click tracking.

`cerb_extract_uris(html)`

|-|-|-
| **html** | The HTML content to extract links from.

<pre>
<code class="language-twig">
{% raw %}
{% set html %}
This is some &lt;b&gt;HTML&lt;/b&gt; with &lt;a href="https://cerb.ai/"&gt;links&lt;/a&gt;.
{% endset %}
{% set results = cerb_extract_uris(html) %}
{{results|json_encode|json_pretty}}
{% endraw %}
</code>
</pre>

```
{
    "tokens": {
        "#uri-61411f091662a": "https://cerb.ai/"
    },
    "context": {
        "#uri-61411f091662a": {
            "is_tag": true,
            "name": "a",
            "attr": "href",
            "attrs": {
                "href": "https://cerb.ai/"
            },
            "uri_parts": {
                "scheme": "https",
                "userinfo": null,
                "host": "cerb.ai",
                "port": null,
                "path": "/",
                "query": null,
                "fragment": null
            }
        }
    },
    "template": "This is some <b>HTML</b> with <a href=\"#uri-61411f091662a\">links</a>.\n"
}
```

To rewrite links:

<pre>
<code class="language-twig">
{% raw %}
{% set html %}
This is some &lt;b&gt;HTML&lt;/b&gt; with &lt;a href="https://cerb.ai/"&gt;links&lt;/a&gt;.
{% endset %}
{% set results = cerb_extract_uris(html) %}
{% set new_urls = results.tokens|map(
  (url,token) => "https://proxy.example/click?url=" ~ url|url_encode
)%}
{{results.template|replace(new_urls)}}
{% endraw %}
</code>
</pre>

```
This is some <b>HTML</b> with <a href="https://proxy.example/click?url=https%3A%2F%2Fcerb.ai%2F">links</a>.
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

Return an [object](/docs/bots/scripting/arrays-objects/) with every placeholder in the current behavior.

`cerb_placeholders_list(extract, prefix)`

|-|-|-
| **extract** | The key prefix to extract (e.g. `ticket_group_`)
| **prefix** | The optional new prefix to add (e.g. `group_`)

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

## clamp_float

Set the range boundaries for a decimal value.

<pre>
<code class="language-twig">
{% raw %}
{{clamp_float(-105.19,0,100)}}
{% endraw %}
</code>
</pre>

```
0
```

## clamp_int

Set the range boundaries for an integer value.

<pre>
<code class="language-twig">
{% raw %}
{{clamp_int(110,-90,90)}}
{% endraw %}
</code>
</pre>

```
90
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

## date_lerp

Interpolate the timestamps between two dates with the given `unit` and `step`.

`date_lerp(date_range,unit,step,limit)`

**Arguments:**

|---
| Name | Notes
|-|-
| **date_range** | An absolute range like `2023-01-01 to 2023-12-31`, a relative range like `-7 days to now`, or a shortcut like `this month`. 
| **unit** | `minute`, `hour`, `day`, `week`, `month`, `year`
| **step** | The number of `unit` to increment (e.g. `5`). Default `1`.
| **limit** | The maximum number of results. Default `10000`.

**Returns:** An array of Unix timestamps.

<pre>
<code class="language-twig">
{% raw %}
{{date_lerp('this month',unit='day',step=5)|map((v) => v|date('r'))|json_encode|json_pretty}}
{% endraw %}
</code>
</pre>

```
[
    "Sat, 01 Oct 2022 00:00:00 -0700",
    "Thu, 06 Oct 2022 00:00:00 -0700",
    "Tue, 11 Oct 2022 00:00:00 -0700",
    "Sun, 16 Oct 2022 00:00:00 -0700",
    "Fri, 21 Oct 2022 00:00:00 -0700",
    "Wed, 26 Oct 2022 00:00:00 -0700",
    "Mon, 31 Oct 2022 00:00:00 -0700"
]
```

## dict_set

You can use the **dict_set** function to quickly add, modify, or append items in an array or object.

`dict_set(object,path,value,delimiter) : object`

**Arguments:**

|---
|Name|Notes
|-|-
| **object** | The object to modify
| **path** | The key or key path (with delimiters) to set
| **value** | The new value for the given key or key path
| **delimiter** | Defaults to dot (`.`), but may be any character sequence (e.g. `||`)

**Returns:**
The function returns a modified version of `object`.

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

## dns_get_record

(Added in [10.2.6](/releases/10.2.6/))

Resolve DNS records by hostname and type. This enables workflows like verifying domain ownership via TXT records, validating SPF/DKIM, verifying MX servers, etc.

`dns_get_record(hostname,type)`

* **hostname**: The lookup hostname.
* **type**: The record type (`a`, `aaaa`, `caa`, `cname`, `mx`, `ns`, `ptr`, `soa`, `srv`, `txt`)

<pre>
<code class="language-twig">
{% raw %}
{{dns_get_record('cerb.ai','a')|json_encode|json_pretty}}
{% endraw %}
</code>
</pre>

```
[
    {
        "host": "cerb.ai",
        "class": "IN",
        "ttl": 77,
        "type": "A",
        "ip": "54.192.81.51"
    },
    {
        "host": "cerb.ai",
        "class": "IN",
        "ttl": 77,
        "type": "A",
        "ip": "54.192.81.69"
    }
]
```

## dns_host_by_ip

(Added in [10.2.6](/releases/10.2.6/))

Resolve a hostname from an IP. If a name can’t be resolved for a valid IP, the IP is returned. If an invalid IP is provided, the result is an empty string.

`dns_host_by_ip(ip)`

* **ip**: The IP address to reverse lookup a hostname.

<pre>
<code class="language-twig">
{% raw %}
{{dns_host_by_ip('54.148.127.4')}}
{% endraw %}
</code>
</pre>

```
cerb.email
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

This returns an [object](/docs/bots/scripting/arrays-objects/).

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

## kata_parse

Parses a KATA text block into an object.

<pre>
<code class="language-twig">
{% raw %}
{% set kata %}
colors@list:
  red
  green
  blue
size@int: 100
{% endset %}
{{kata_parse(kata)|json_encode|json_pretty}}
{% endraw %}
</code>
</pre>

```
{
    "colors@list": "red\ngreen\nblue",
    "size@int": "100"
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
{{min(numbers)}}
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

## vobject_parse

Parse a block of text in VObject format (e.g. vCard, iCal).

`vobject_parse(text)`

**Arguments:**

|---
| Name | Notes
|-|-
| `text` | The VOBJECT text to parse

**Returns:** An object with properties and parameters.

<pre>
<code class="language-twig">
{% raw %}
{% set vcard %}
begin:vcard
source:ldap://cn=Meister%20Berger,o=Universitaet%20Goerlitz,c=DE
name:Meister Berger
fn:Meister Berger
n:Berger;Meister
bday;value=date:1963-09-21
o:Universit=E6t G=F6rlitz
title:Mayor
title;language=de;value=text:Burgermeister
note:The Mayor of the great city of
  Goerlitz in the great country of Germany.
email;internet:mb@goerlitz.de
home.tel;type=fax,voice,msg:+49 3581 123456
home.label:Hufenshlagel 1234\n
 02828 Goerlitz\n
 Deutschland
end:vcard
{% endset %}
{{vobject_parse(vcard)|json_encode|json_pretty}}
{% endraw %}
</code>
</pre>

```
{
    "VCARD": [
        {
            "props": {
                "SOURCE": [
                    {
                        "params": [],
                        "value": "ldap://cn=Meister%20Berger,o=Universitaet%20Goerlitz,c=DE"
                    }
                ],
                "NAME": [
                    {
                        "params": [],
                        "value": "Meister Berger"
                    }
                ],
                "FN": [
                    {
                        "params": [],
                        "value": "Meister Berger"
                    }
                ],
                "N": [
                    {
                        "params": [],
                        "value": "Berger;Meister"
                    }
                ],
                "BDAY": [
                    {
                        "params": {
                            "value": "date"
                        },
                        "value": "1963-09-21"
                    }
                ],
                "O": [
                    {
                        "params": [],
                        "value": "Universit=E6t G=F6rlitz"
                    }
                ],
                "TITLE": [
                    {
                        "params": [],
                        "value": "Mayor"
                    },
                    {
                        "params": {
                            "language": "de",
                            "value": "text"
                        },
                        "value": "Burgermeister"
                    }
                ],
                "NOTE": [
                    {
                        "params": [],
                        "value": "The Mayor of the great city of Goerlitz in the great country of Germany."
                    }
                ],
                "EMAIL": [
                    {
                        "params": {
                            "internet": ""
                        },
                        "value": "mb@goerlitz.de"
                    }
                ],
                "HOME.TEL": [
                    {
                        "params": {
                            "type": "fax,voice,msg"
                        },
                        "value": "+49 3581 123456"
                    }
                ],
                "HOME.LABEL": [
                    {
                        "params": [],
                        "value": "Hufenshlagel 1234\n02828 Goerlitz\nDeutschland"
                    }
                ]
            }
        }
    ]
}
```

## xml_attr

Return a single attribute from an XML node.

`xml_attr(xml_node, attr)`

**Arguments:**

|---
| Name | Notes
|-|-
| `xml_node` | An single XML node, usually from [xml_xpath](#xml_xpath)
| `attr` | The name of an attribute

**Returns:** A string from the given XML attribute, or `false`.

<pre>
<code class="language-twig">
{% raw %}
{% set xml_string %}
&lt;?xml version = "1.0" encoding = "UTF-8"?&gt;
&lt;Movies&gt;
    &lt;Movie rating="R"&gt;
        &lt;Title runtime="142"&gt;The Shawshank Redemption&lt;/Title&gt;
        &lt;Genre&gt;Drama&lt;/Genre&gt;
        &lt;Director&gt;
            &lt;Name highratedmovie="The Mist"&gt;
                &lt;First&gt;Frank&lt;/First&gt;
                &lt;Last&gt;Darabont&lt;/Last&gt;
            &lt;/Name&gt;
        &lt;/Director&gt;
        &lt;Studio&gt;Columbia Pictures&lt;/Studio&gt;
        &lt;Year&gt;1994&lt;/Year&gt;
    &lt;/Movie&gt;
&lt;/Movies&gt;
{% endset %}
{% set xml = xml_decode(xml_string) %}
{% set movie = xml_xpath(xml, '//Movie')|first %}
{% set runtime = xml_attr(movie.Title,'runtime') %}
The runtime of {{movie.Title}} is {{runtime ? (60*runtime)|secs_pretty : 'unknown'}}.
{% endraw %}
</code>
</pre>

```
The runtime of The Shawshank Redemption is 2 hours, 22 mins.
```

## xml_attrs

Return all attributes from an XML node.

`xml_attrs(xml_node)`

**Arguments:**

|---
| Name | Notes
|-|-
| `xml_node` | An single XML node, usually from [xml_xpath](#xml_xpath)

**Returns:** An array of attribute keys and values.

<pre>
<code class="language-twig">
{% raw %}
{% set xml_string %}
&lt;?xml version = "1.0" encoding = "UTF-8"?&gt;
&lt;Movies&gt;
    &lt;Movie rating="R"&gt;
        &lt;Title runtime="177"&gt;The Godfather&lt;/Title&gt;
        &lt;Genre&gt; Crime Drama &lt;/Genre&gt;
        &lt;Director&gt;
            &lt;Name&gt;
                &lt;First&gt;Francis Ford&lt;/First&gt;
                &lt;Last&gt;Coppola&lt;/Last&gt;
            &lt;/Name&gt;
        &lt;/Director&gt;
        &lt;Studio&gt;Paramount Pictures&lt;/Studio&gt;
        &lt;Year&gt;1972&lt;/Year&gt;
    &lt;/Movie&gt;
    &lt;Movie rating= "R"&gt;
        &lt;Title runtime="142"&gt;The Shawshank Redemption&lt;/Title&gt;
        &lt;Genre&gt;Drama&lt;/Genre&gt;
        &lt;Director&gt;
            &lt;Name highratedmovie="The Mist"&gt;
                &lt;First&gt;Frank&lt;/First&gt;
                &lt;Last&gt;Darabont&lt;/Last&gt;
            &lt;/Name&gt;
        &lt;/Director&gt;
        &lt;Studio&gt;Columbia Pictures&lt;/Studio&gt;
        &lt;Year&gt;1994&lt;/Year&gt;
    &lt;/Movie&gt;
&lt;/Movies&gt;
{% endset %}
{% set xml = xml_decode(xml_string) %}
{% set movies = xml_xpath(xml, '//Movie') %}
{{xml_attrs(movies[1])|json_encode|json_pretty}}
{% endraw %}
</code>
</pre>

```
{
    "rating": "R"
}
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