---
title: Bot Scripting
excerpt: Bot actions can generate text using a full-featured templating language. Here's everything you need to know.
permalink: /docs/building-bots/scripting/
jumbotron:
  title: Scripting
  tagline: 
  breadcrumbs:
  -
    label: Docs &raquo;
    url: /docs/home/
  -
    label: Building Bots &raquo;
    url: /docs/building-bots/
---

<div class="cerb-screenshot">
<img src="/assets/images/docs/building-bots/scripting/banner.png" class="screenshot">
</div>

The purpose of bot behaviors is to automatically perform actions in response to events.

Many of these actions need to generate text:
* Setting record fields
* Sending email messages
* Responding to chat messages
* Sending text messages
* Executing HTTP requests
* Generating notifications
* ...and so on

The content of this text may need to vary depending on any number of factors -- the event, record, behavior, time of day, day of week, etc.

To facilitate this, actions can generate text using a full-featured templating language based on Twig[^twig].

* TOC
{:toc}

# Templates

In a traditional programming language, you typically generate output like:

<pre>
<code class="language-python">
print("Hello, " + firstName + "!")
</code>
</pre>

This is cumbersome when you're dealing with a lot of text.

In contrast, a templating language makes the simple assumption that everything you type is text to output until it encounters a special command.

A basic template might look like:

<pre>
<code class="language-twig">
Hello!
</code>
</pre>

# Variables

Now let's assume that you want to change the output depending on who you are talking to.

This can be accomplished with **variables**.  A variable is a special token that is substituted with the current value of a particular piece of information.

Assuming we had a variable named `first_name`, we could write:

<pre>
<code class="language-twig">
{% raw %}
Hello, {{first_name}}!
{% endraw %}
</code>
</pre>

This will output something like:

```
Hello, Kina!
```

<div class="cerb-box note">
<p>A variable is indicated by a double pair of curly braces around the variable's name.</p>
</div>

## Creating variables

You can make your own variables in a template using the [set](/docs/building-bots/scripting/commands/#set) command:

<pre>
<code class="language-twig">
{% raw %}
{% set name = "Kina" %}
{% set quantity = 5 %}
{{name}} has {{quantity}} gold stars.
{% endraw %}
</code>
</pre>

```
Kina has 5 gold stars.
```

Variables are temporary. When you define a new variable in one action, it can't be referenced from other actions.  In programmer parlance, the **scope** of a variable is limited to the same template.

## Modifying variables with filters

The value of a variable may be modified by appending [filters](#filters) with a  pipe (`|`) character.

When editing actions on a bot behavior, the possible filters are automatically suggested when you type `|` after a variable name.

For example, we can use the [upper](/docs/building-bots/scripting/filters/#upper) filter to display a variable's value in uppercase:

<pre>
<code class="language-twig">
{% raw %}
Hi, {{first_name|upper}}!
{% endraw %}
</code>
</pre>

```
Hi, KINA!
```

## Default values

You can use the [default](/docs/building-bots/scripting/filters/#default) filter to give a default value to empty variables:

<pre>
<code class="language-twig">
{% raw %}
{% set name = '' %}
Hi {{name|default('there')}}
{% endraw %}
</code>
</pre>

```
Hi there
```

## Stacking filters

You can send the output from one filter as the input to another filter:

<pre>
<code class="language-twig">
{% raw %}
{% set first_name = null %}
Hi, {{first_name|default('there')|upper}}!
{% endraw %}
</code>
</pre>

```
Hi, THERE!
```

# Placeholders

A **placeholder** is a special kind of variable that is shared between all of the templates within the same behavior.

Events provide the initial placeholders to any behaviors that they trigger.

Otherwise, placeholders are functionally identical to variables.

<div class="cerb-box note">
<p>If you change the value of a placeholder using the <a href="/docs/building-bots/scripting/commands/#set">set</a> command, the new value is still only visible to the current template. You can use the <b>Set custom placeholder</b> behavior action to modify the value for all templates.</p>
</div>

# Strings

A **string** is some text within a variable.

## Literal text

You enclose a string within single (`'`) or double (`"`) quotes.

You can modify a string with filters just like a variable:

<pre>
<code class="language-twig">
{% raw %}
{{"This is literal text"|truncate(7)}}
{% endraw %}
</code>
</pre>

```
This is...
```

## Concatenation

You can join multiple strings or variables together with `~` (tilde):

<pre>
<code class="language-twig">
{% raw %}
{% set first_name = "Kina" %}
{% set last_name = "Halpue" %}
{% set full_name = first_name ~ " " ~ last_name %}
{{full_name}}
{% endraw %}
</code>
</pre>

```
Kina Halpue
```

## Whitespace

One issue with treating all template text as output is that you can get unintended whitespace around your commands.

You can ignore whitespace at the beginning or end of a command with a dash (`-`):

<pre>
<code class="language-twig">
{% raw %}
This text

{{-" has no leading or trailing whitespace "-}}

in it.
{% endraw %}
</code>
</pre>

```
This text has no leading or trailing whitespace in it.
```

# Arrays and objects

## Arrays

An **array** is a list of values in a single variable.  You create an array by providing multiple values within brackets (`[...]`) and separating them with commas.

Arrays are _numerically indexed_ starting with zero.  You can access individual array elements with a dot (`.`) or brackets (`[]`).

For example:

<pre>
<code class="language-twig">
{% raw %}
{% set colors = ['red','green','blue'] %}
Item 0 is {{colors.0}}
Item 2 is {{colors[2]}}
{% endraw %}
</code>
</pre>

```
Item 0 is red
Item 2 is blue
```

## Objects

**Objects** are similar to arrays, except that the items are indexed with a **key**:

<pre>
<code class="language-twig">
{% raw %}
{% set person = {
	"first_name": "William",
	"last_name": "Portcullis",
	"age": 63
} %}
{{person.first_name}} {{person.last_name}} is {{person.age}}.
{% endraw %}
</code>
</pre>

```
William Portcullis is 63.
```

## Dynamic keys

You can specify an object key with a variable by using brackets (`[]`):

<pre>
<code class="language-twig">
{% raw %}
{% set person = {
	"first_name": "William",
	"last_name": "Portcullis",
	"age": 63
} %}
{% set key = 'first_name' %}
His name is {{person[key]}}.
{% endraw %}
</code>
</pre>

```
His name is William.
```

## Modifying arrays and objects

You can use the [dict_set](/docs/building-bots/scripting/function/#dict_set) function to quickly modify, append, or remove items from an array or object.

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

## Compute the difference of two arrays

The [array_diff](/docs/building-bots/scripting/filters/#array_diff) filter returns the items in the second array that are not present in the first array:

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

# Conditional Logic

Conditional logic can display different content based on the result of any number of **expressions**:

<pre>
<code class="language-twig">
{% raw %}
{% set sla_expiration = '+2 weeks'|date('U') %}
{% if sla_expiration >= 'now'|date('U') %}
Your SLA coverage is active.
{% else %}
Your SLA coverage has expired.
{% endif %}
{% endraw %}
</code>
</pre>

```
Your SLA coverage is active.
```

# Operators

An **operator** makes comparisons between two values in an expression.

### Assignment

As you've seen with the [set](/docs/building-bots/scripting/commands/#set) command, a single `=` (equals) character _assigns_ a value to a variable:

<pre>
<code class="language-twig">
{% raw %}
{% set this = 0 %}
{% set that = 1 %}
this is {{this}} and that is {{that}}
{% endraw %}
</code>
</pre>

```
this is 0 and that is 1
```

### Equals

To check if a variable is equal to a specific value, use two equal signs (`==`):

<pre>
<code class="language-twig">
{% raw %}
{% set this = 1 %}
{% set that = 1 %}
{% if this == that %}
This and that are equal.
{% endif -%}
{% endraw %}
</code>
</pre>

```
This and that are equal.
```

### Doesn't equal

To check that a variable isn't equal to a specific value, use `!=`:

<pre>
<code class="language-twig">
{% raw %}
{% set this = 0 %}
{% set that = 1 %}
{% if this != that %}
This doesn't equal that.
{% endif -%}
{% endraw %}
</code>
</pre>

```
This doesn't equal that.
```

### Less than

To check if one variable is less than another, use `<` or `<=`:

<pre>
<code class="language-twig">
{% raw %}
{% set little = 5 %}
{% set big = 1000 %}
{% if little < big %}
{{little}} is less than {{big}}
{% endif -%}
{% endraw %}
</code>
</pre>

```
5 is less than 1000
```

### Greater than

To check if one variable is greater than another, use `>` or `>=`:

<pre>
<code class="language-twig">
{% raw %}
{% set little = 5 %}
{% set big = 1000 %}
{% if big > little %}
{{big}} is greater than {{little}}
{% endif -%}
{% endraw %}
</code>
</pre>

```
1000 is greater than 5
```

### Value in list

You can check if a value exists in a list by using the `in` test:

<pre>
<code class="language-twig">
{% raw %}
{% set colors = ['blue','green','red'] %}
{% if 'red' in colors %}
One of the colors is red.
{% endif -%}
{% endraw %}
</code>
</pre>

```
One of the colors is red.
```

You can also negate that test with `not in`:

<pre>
<code class="language-twig">
{% raw %}
{% set colors = ['blue','green','red'] %}
{% if 'orange' not in colors %}
Orange is not one of the colors.
{% endif -%}
{% endraw %}
</code>
</pre>

```
Orange is not one of the colors.
```

# Regular Expressions

You can use regular expressions[^regexp] with the [regexp](/docs/building-bots/scripting/filters/#regexp) filter to match or extract patterns in text:

<pre>
<code class="language-twig">
{% raw %}
{% set text = "Your Amazon Order #Z-1234-5678-9 has shipped!" %}
{% set order_id = text|regexp("/Amazon Order #([A-Z0-9\-]+)/", 1) %}
Amazon Order #: {{order_id}}
{% endraw %}
</code>
</pre>

```
Amazon Order #: Z-1234-5678-9
```

# Loops

## For

Arrays can be iterated with [for](/docs/building-bots/scripting/commands/#for) loops:

<pre>
<code class="language-twig">
{% raw %}
{% set list_of_names = ["Jeff", "Dan", "Darren"] %}
{% for name in list_of_names %}
* {{name}}
{% endfor %}
{% endraw %}
</code>
</pre>

```
* Jeff
* Dan
* Darren
```

<div class="cerb-box note">
<p>A variable defined within a loop is not accessible outside of it. You can first define a variable before using it in the loop to change this.</p>
</div>

## Ranges

Loop through a range of values with `..`:

<pre>
<code class="language-twig">
{% raw %}
{% for n in 1..5 %}
{{n}}...
{% endfor %}
{% endraw %}
</code>
</pre>

```
1...
2...
3...
4...
5...
```

# Dates

## Formatting dates

Use the [date](/docs/building-bots/scripting/filters/#date) filter to format a [string](#strings) or [variable](#variables) as a date:

<pre>
<code class="language-twig">
{% raw %}
{{'now'|date('F d, Y h:ia T')}}
{{'tomorrow 5pm'|date('D, d F Y H:i T')}}
{{'+2 weeks 08:00'|date('Y-m-d h:ia T')}}
{% endraw %}
</code>
</pre>

```
December 12, 2017 11:50am PST
Wed, 13 December 2017 17:00 PST
2017-12-26 08:00am PST
```
## Timezones

The second parameter to the [date](/docs/building-bots/scripting/filters/#date) filter can specify a timezone to use:

<pre>
<code class="language-twig">
{% raw %}
{% set ts_now = date() -%}

Bangalore: {{ts_now|date(time_format, 'Asia/Calcutta')}}
Berlin: {{ts_now|date(time_format, 'Europe/Berlin')}}
New York: {{ts_now|date(time_format, 'America/New_York')}}
{% endraw %}
</code>
</pre>

```
Bangalore: December 13, 2017 01:27
Berlin: December 12, 2017 20:57
New York: December 12, 2017 14:57
```

## Unix timestamps

You can get a Unix timestamp (seconds since 1-Jan-1970 00:00:00 UTC) from a date value with the `|date('U')` filter:

<pre>
<code class="language-twig">
{% raw %}
It has been {{'now'|date('U')}} seconds since {{'0'|date(null, 'UTC')}}
{% endraw %}
</code>
</pre>

```
It has been 1513108417 seconds since January 1, 1970 00:00
```

## Timestamp Manipulation

If you need to manipulate a date, create a date object with the [date](/docs/building-bots/scripting/functions/#date) function and use the [date_modify](/docs/building-bots/scripting/filters/#date_modify) filter:

<pre>
<code class="language-twig">
{% raw %}
{% set format = 'D, d M Y T' %}
{% set timestamp = date('now') %}
Now: {{timestamp|date(format)}}
+2 days: {{timestamp|date_modify('+2 days')|date(format)}}
{% endraw %}
</code>
</pre>

```
Now: Tue, 12 Dec 2017 PST
+2 days: Thu, 14 Dec 2017 PST
```

# JSON

JSON[^json] is a popular format for serializing or exchanging human-readable data using key/value pairs.

## JSON Decoding

You can decode a JSON-encoded string with the [json_decode](/docs/building-bots/scripting/functions/#json_decode) function:

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

This returns an [object](#objects).

## JSON Modification

You can construct or modify a JSON object using the [dict_set](/docs/building-bots/scripting/function/#dict_set) function:

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

## JSON Encoding

You can encode any variable as a JSON string with the [json_encode](/docs/building-bots/scripting/filters/#json_encode) filter:

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

## JSON Prettification

You can _"prettify"_ a JSON string with the [json_pretty](/docs/building-bots/scripting/filters/#json_pretty) filter:

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

# XML

XML[^xml] is another popular format for serializing or exchanging structured data.

## XML Decoding

You can decode an XML string into an XML object with the [xml_decode](/docs/building-bots/scripting/functions/#xml_decode) function.

Use the [xml_xpath](/docs/building-bots/scripting/functions/#xml_xpath) function to extract values with XPath[^xpath] queries.

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

## XML Namespaces

You can define an XML namespace with the [xml_xpath_ns](/docs/building-bots/scripting/functions/#xml_xpath_ns) function:

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

## XML Encoding

You can encode an object as XML with the [xml_encode](/docs/building-bots/scripting/functions/#xml_encode) function:

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

# Reference

## Commands

* [do](/docs/building-bots/scripting/commands/#do)
* [filter](/docs/building-bots/scripting/commands/#filter)
* [for](/docs/building-bots/scripting/commands/#for)
* [if](/docs/building-bots/scripting/commands/#if)
* [set](/docs/building-bots/scripting/commands/#set)
* [spaceless](/docs/building-bots/scripting/commands/#spaceless)
* [verbatim](/docs/building-bots/scripting/commands/#verbatim)
* [with](/docs/building-bots/scripting/commands/#with)

## Functions

* [**array_diff**](/docs/building-bots/scripting/functions/#array_diff)
* [attribute](/docs/building-bots/scripting/functions/#attribute)
* [**cerb_avatar_image**](/docs/building-bots/scripting/functions/#cerb_avatar_image)
* [**cerb_avatar_url**](/docs/building-bots/scripting/functions/#cerb_avatar_url)
* [**cerb_file_url**](/docs/building-bots/scripting/functions/#cerb_file_url)
* [**cerb_url**](/docs/building-bots/scripting/functions/#cerb_url)
* [cycle](/docs/building-bots/scripting/functions/#cycle)
* [date](/docs/building-bots/scripting/functions/#date)
* [**dict_set**](/docs/building-bots/scripting/functions/#dict_set)
* [**json_decode**](/docs/building-bots/scripting/functions/#json_decode)
* [**jsonpath_set**](/docs/building-bots/scripting/functions/#jsonpath_set)
* [max](/docs/building-bots/scripting/functions/#max)
* [min](/docs/building-bots/scripting/functions/#min)
* [**placeholders_list**](/docs/building-bots/scripting/functions/#placeholders_list)
* [random](/docs/building-bots/scripting/functions/#random)
* [**random_string**](/docs/building-bots/scripting/functions/#random_string)
* [range](/docs/building-bots/scripting/functions/#range)
* [**regexp_match_all**](/docs/building-bots/scripting/functions/#regexp_match_all)
* [**shuffle**](/docs/building-bots/scripting/functions/#shuffle)
* [**validate_email**](/docs/building-bots/scripting/functions/#validate_email)
* [**validate_number**](/docs/building-bots/scripting/functions/#validate_number)
* [**xml_decode**](/docs/building-bots/scripting/functions/#xml_decode)
* [**xml_encode**](/docs/building-bots/scripting/functions/#xml_encode)
* [**xml_xpath**](/docs/building-bots/scripting/functions/#xml_xpath)
* [**xml_xpath_ns**](/docs/building-bots/scripting/functions/#xml_xpath_ns)

## Filters

* [abs](/docs/building-bots/scripting/filters/#abs)
* [**alphanum**](/docs/building-bots/scripting/filters/#alphanum)
* [**base64_encode**](/docs/building-bots/scripting/filters/#base64_encode)
* [**base64_decode**](/docs/building-bots/scripting/filters/#base64_decode)
* [batch](/docs/building-bots/scripting/filters/#batch)
* [**bytes_pretty**](/docs/building-bots/scripting/filters/#bytes_pretty)
* [capitalize](/docs/building-bots/scripting/filters/#capitalize)
* [**context_name**](/docs/building-bots/scripting/filters/#context_name)
* [convert_encoding](/docs/building-bots/scripting/filters/#convert_encoding)
* [date](/docs/building-bots/scripting/filters/#date)
* [date_modify](/docs/building-bots/scripting/filters/#date_modify)
* [**date_pretty**](/docs/building-bots/scripting/filters/#date_pretty)
* [default](/docs/building-bots/scripting/filters/#default)
* [escape](/docs/building-bots/scripting/filters/#escape)
* [first](/docs/building-bots/scripting/filters/#first)
* [format](/docs/building-bots/scripting/filters/#format)
* [**hash_hmac**](/docs/building-bots/scripting/filters/#hash_hmac)
* [join](/docs/building-bots/scripting/filters/#join)
* [json_encode](/docs/building-bots/scripting/filters/#json_encode)
* [**json_pretty**](/docs/building-bots/scripting/filters/#json_pretty)
* [keys](/docs/building-bots/scripting/filters/#keys)
* [last](/docs/building-bots/scripting/filters/#last)
* [length](/docs/building-bots/scripting/filters/#length)
* [lower](/docs/building-bots/scripting/filters/#lower)
* [**md5**](/docs/building-bots/scripting/filters/#md5)
* [merge](/docs/building-bots/scripting/filters/#merge)
* [nl2br](/docs/building-bots/scripting/filters/#nl2br)
* [number_format](/docs/building-bots/scripting/filters/#number_format)
* [**parse_emails**](/docs/building-bots/scripting/filters/#parse_emails)
* [**quote**](/docs/building-bots/scripting/filters/#quote)
* [**regexp**](/docs/building-bots/scripting/filters/#regexp)
* [replace](/docs/building-bots/scripting/filters/#replace)
* [reverse](/docs/building-bots/scripting/filters/#reverse)
* [round](/docs/building-bots/scripting/filters/#round)
* [**secs_pretty**](/docs/building-bots/scripting/filters/#secs_pretty)
* [**sha1**](/docs/building-bots/scripting/filters/#sha1)
* [slice](/docs/building-bots/scripting/filters/#slice)
* [sort](/docs/building-bots/scripting/filters/#sort)
* [split](/docs/building-bots/scripting/filters/#split)
* [**split_crlf**](/docs/building-bots/scripting/filters/#split_crlf)
* [**split_csv**](/docs/building-bots/scripting/filters/#split_csv)
* [striptags](/docs/building-bots/scripting/filters/#striptags)
* [title](/docs/building-bots/scripting/filters/#title)
* [trim](/docs/building-bots/scripting/filters/#trim)
* [**truncate**](/docs/building-bots/scripting/filters/#truncate)
* [**unescape**](/docs/building-bots/scripting/filters/#unescape)
* [upper](/docs/building-bots/scripting/filters/#upper)
* [**url_decode**](/docs/building-bots/scripting/filters/#url_decode)
* [url_encode](/docs/building-bots/scripting/filters/#url_encode)

<div class="section-nav">
	<div class="left">
	</div>
	<div class="right align-right">
			<a href="/docs/building-bots/scripting/commands/" class="next">Commands &gt;</a>
	</div>
</div>
<div class="clear"></div>

# Links

[^json]: Wikipedia: JSON - <https://en.wikipedia.org/wiki/JSON>

[^regexp]: Wikipedia: Regular Expression - <https://en.wikipedia.org/wiki/Regular_expression>

[^twig]: Twig: The flexible, fast, and secure template engine for PHP - <https://twig.symfony.com>

[^xml]: Wikipedia: XML - <https://en.wikipedia.org/wiki/XML>

[^xpath]: Wikipedia: XPath - <https://en.wikipedia.org/wiki/XPath>