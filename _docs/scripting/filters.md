---
title: 'Scripting Reference: Filters'
excerpt: A reference of the template filters in bot scripting.
summary: This webpage serves as a comprehensive scripting reference for filters available
  in Cerb's bot scripts and snippets. It details a wide array of filters, such as
  `abs`, `alphanum`, `append`, `array_sum`, `base_convert`, `base64_encode`, `capitalize`,
  `cerb_translate`, `date`, `escape`, `filter`, `hash`, `json_encode`, `markdown_to_html`,
  `md5`, `number_format`, `parse_csv`, `regexp`, `reverse`, `sha1`, `sort`, `split`,
  `striptags`, `title`, `trim`, `truncate`, `upper`, `url_encode`, and many more.
  Each filter is explained with its functionality, parameters, and examples, providing
  users with the necessary tools to manipulate data, format strings, handle arrays,
  and perform various transformations and calculations within Cerb's environment.
  This reference is essential for developers and users looking to enhance their automation
  and scripting capabilities in Cerb.
permalink: /docs/scripting/filters/
toc:
  title: Filters
  expand: Developer Guide
jumbotron:
  title: 'Reference: Filters'
  tagline: ~
  breadcrumbs:
  - label: Docs &raquo;
    url: /docs/home/
  - label: Developer Guide &raquo;
  - label: Scripting &raquo;
    url: /docs/scripting/
search_index:
  sections:
    - heading: "abs"
      title: "Scripting Filter: abs"
      summary: "Return the absolute value of a number"
    - heading: "alphanum"
      title: "Scripting Filter: alphanum"
      summary: "Remove non-alphanumeric characters from a string"
    - heading: "append"
      title: "Scripting Filter: append"
      summary: "Append a suffix to the current text with optional delimiter"
    - heading: "array_sum"
      title: "Scripting Filter: array_sum"
      summary: "Sum the numeric elements of an array"
    - heading: "base_convert"
      title: "Scripting Filter: base_convert"
      summary: "Convert between number system bases"
    - heading: "base64_decode"
      title: "Scripting Filter: base64_decode"
      summary: "Decode a base64-encoded string"
    - heading: "base64_encode"
      title: "Scripting Filter: base64_encode"
      summary: "Encode a string in base64"
    - heading: "base64url_decode"
      title: "Scripting Filter: base64url_decode"
      summary: "Decode a base64url-encoded string"
    - heading: "base64url_encode"
      title: "Scripting Filter: base64url_encode"
      summary: "Encode a string in base64url"
    - heading: "batch"
      title: "Scripting Filter: batch"
      summary: "Break a list into smaller chunks"
    - heading: "bytes_pretty"
      title: "Scripting Filter: bytes_pretty"
      summary: "Convert a number into a human readable number of bytes"
    - heading: "capitalize"
      title: "Scripting Filter: capitalize"
      summary: "Capitalize the first character of a string and lowercase the rest"
    - heading: "cerb_translate"
      title: "Scripting Filter: cerb_translate"
      summary: "Convert string IDs into text in the current worker's language"
    - heading: "column"
      title: "Scripting Filter: column"
      summary: "Extract a key from each item in an array as a new array"
    - heading: "context_name"
      title: "Scripting Filter: context_name"
      summary: "Convert a Cerb context ID into a human readable label"
    - heading: "convert_encoding"
      title: "Scripting Filter: convert_encoding"
      summary: "Convert character encodings between different formats"
    - heading: "csv"
      title: "Scripting Filter: csv"
      summary: "Format an array as a comma-separated values list"
    - heading: "date"
      title: "Scripting Filter: date"
      summary: "Format a string or variable as a date with custom formatting"
    - heading: "date_modify"
      title: "Scripting Filter: date_modify"
      summary: "Manipulate a date by adding or subtracting time"
    - heading: "date_pretty"
      title: "Scripting Filter: date_pretty"
      summary: "Convert a Unix timestamp into a human-readable, relative date"
    - heading: "default"
      title: "Scripting Filter: default"
      summary: "Give a default value to empty variables"
    - heading: "escape"
      title: "Scripting Filter: escape"
      summary: "Escape strings for HTML, JavaScript, CSS, URL, or HTML attributes"
    - heading: "filter"
      title: "Scripting Filter: filter"
      summary: "Exclude items from an array using an arrow function"
    - heading: "first"
      title: "Scripting Filter: first"
      summary: "Return the first item of an array, object, or string"
    - heading: "format"
      title: "Scripting Filter: format"
      summary: "Insert variables into a string using formatting specifiers"
    - heading: "hash"
      title: "Scripting Filter: hash"
      summary: "Generate a one-way hash using various algorithms"
    - heading: "hash_hmac"
      title: "Scripting Filter: hash_hmac"
      summary: "Generate a hash-based message authentication code using a secret key"
    - heading: "html_to_text"
      title: "Scripting Filter: html_to_text"
      summary: "Convert HTML content to plain text"
    - heading: "image_info"
      title: "Scripting Filter: image_info"
      summary: "Return information about an image from bytes or data URI"
    - heading: "indent"
      title: "Scripting Filter: indent"
      summary: "Prefix the start of each line with a given marker"
    - heading: "join"
      title: "Scripting Filter: join"
      summary: "Convert an array to a string with delimiters"
    - heading: "json_encode"
      title: "Scripting Filter: json_encode"
      summary: "Encode any variable as a JSON string"
    - heading: "json_pretty"
      title: "Scripting Filter: json_pretty"
      summary: "Prettify a JSON string with proper formatting"
    - heading: "kata_encode"
      title: "Scripting Filter: kata_encode"
      summary: "Emit an object/array as a KATA text block"
    - heading: "keys"
      title: "Scripting Filter: keys"
      summary: "Return the keys of an array or object"
    - heading: "last"
      title: "Scripting Filter: last"
      summary: "Return the last item of an array, object, or string"
    - heading: "length"
      title: "Scripting Filter: length"
      summary: "Return the length of a string or array"
    - heading: "lower"
      title: "Scripting Filter: lower"
      summary: "Convert a string to lowercase"
    - heading: "map"
      title: "Scripting Filter: map"
      summary: "Apply a function to each item in an array to create a new array"
    - heading: "markdown_to_html"
      title: "Scripting Filter: markdown_to_html"
      summary: "Convert Markdown formatting to HTML"
    - heading: "md5"
      title: "Scripting Filter: md5"
      summary: "Generate an MD5 hash for a string"
    - heading: "merge"
      title: "Scripting Filter: merge"
      summary: "Combine two arrays or objects"
    - heading: "nl2br"
      title: "Scripting Filter: nl2br"
      summary: "Convert newline characters to HTML breaks"
    - heading: "number_format"
      title: "Scripting Filter: number_format"
      summary: "Format a number with thousand separators and decimal places"
    - heading: "parse_csv"
      title: "Scripting Filter: parse_csv"
      summary: "Parse a document with rows of comma-separated columns"
    - heading: "parse_emails"
      title: "Scripting Filter: parse_emails"
      summary: "Parse a delimited string of email addresses into an object"
    - heading: "parse_url"
      title: "Scripting Filter: parse_url"
      summary: "Parse a URL string into an object for validation"
    - heading: "parse_user_agent"
      title: "Scripting Filter: parse_user_agent"
      summary: "Parse a user-agent string into an object"
    - heading: "permalink"
      title: "Scripting Filter: permalink"
      summary: "Convert text into a URL-friendly permalink format"
    - heading: "qp_decode"
      title: "Scripting Filter: qp_decode"
      summary: "Decode a string in quoted-printable format"
    - heading: "qp_encode"
      title: "Scripting Filter: qp_encode"
      summary: "Encode a string in quoted-printable format"
    - heading: "quote"
      title: "Scripting Filter: quote"
      summary: "Add quote prefixes to lines of text for email replies"
    - heading: "reduce"
      title: "Scripting Filter: reduce"
      summary: "Reduce an array of items into a single output value"
    - heading: "regexp"
      title: "Scripting Filter: regexp"
      summary: "Use regular expressions to match or extract patterns"
    - heading: "repeat"
      title: "Scripting Filter: repeat"
      summary: "Repeat a string a given number of times"
    - heading: "replace"
      title: "Scripting Filter: replace"
      summary: "Replace text patterns with new values"
    - heading: "reverse"
      title: "Scripting Filter: reverse"
      summary: "Reverse a string or array"
    - heading: "round"
      title: "Scripting Filter: round"
      summary: "Round a number with desired precision and method"
    - heading: "secs_pretty"
      title: "Scripting Filter: secs_pretty"
      summary: "Convert seconds into human-readable time format"
    - heading: "sha1"
      title: "Scripting Filter: sha1"
      summary: "Generate an SHA-1 hash for a string"
    - heading: "slice"
      title: "Scripting Filter: slice"
      summary: "Extract part of a string, array, or object"
    - heading: "sort"
      title: "Scripting Filter: sort"
      summary: "Sort an array with optional custom comparator"
    - heading: "split"
      title: "Scripting Filter: split"
      summary: "Convert a string to an array with the given delimiter"
    - heading: "split_crlf"
      title: "Scripting Filter: split_crlf"
      summary: "Split a string on carriage return and linefeed delimiters"
    - heading: "split_csv"
      title: "Scripting Filter: split_csv"
      summary: "Split a string on comma delimiters with whitespace handling"
    - heading: "stat"
      title: "Scripting Filter: stat"
      summary: "Calculate statistical measures for an array of numbers"
    - heading: "str_pos"
      title: "Scripting Filter: str_pos"
      summary: "Return the position of a substring within a larger text"
    - heading: "str_sub"
      title: "Scripting Filter: str_sub"
      summary: "Extract a substring using starting and ending positions"
    - heading: "strip_data_uris"
      title: "Scripting Filter: strip_data_uris"
      summary: "Remove base64-encoded content from data URIs"
    - heading: "strip_lines"
      title: "Scripting Filter: strip_lines"
      summary: "Remove lines that begin with given prefixes"
    - heading: "strip_pem_blocks"
      title: "Scripting Filter: strip_pem_blocks"
      summary: "Remove PEM-formatted blocks like PGP keys and SSL certificates"
    - heading: "strip_url_querystrings"
      title: "Scripting Filter: strip_url_querystrings"
      summary: "Remove the query string from URLs in a block of text"
    - heading: "striptags"
      title: "Scripting Filter: striptags"
      summary: "Remove HTML tags from a string"
    - heading: "title"
      title: "Scripting Filter: title"
      summary: "Convert text to title case"
    - heading: "tokenize"
      title: "Scripting Filter: tokenize"
      summary: "Return an array of word tokens from a text block"
    - heading: "trim"
      title: "Scripting Filter: trim"
      summary: "Remove leading and/or trailing whitespace from a string"
    - heading: "truncate"
      title: "Scripting Filter: truncate"
      summary: "Ensure that a string is no longer than the given limit"
    - heading: "unescape"
      title: "Scripting Filter: unescape"
      summary: "Decode HTML entities"
    - heading: "upper"
      title: "Scripting Filter: upper"
      summary: "Convert a string to uppercase"
    - heading: "url_decode"
      title: "Scripting Filter: url_decode"
      summary: "Decode a URL query string into an array"
    - heading: "url_encode"
      title: "Scripting Filter: url_encode"
      summary: "Build a URL query string from an array"
    - heading: "values"
      title: "Scripting Filter: values"
      summary: "Return the values of an array with sequential keys"
---

These filters are available in bot scripts and snippets:

* TOC
{:toc}

## abs

Return the absolute value of a number:

{% highlight twig %}
{% raw %}
{{-5|abs}}
{% endraw %}
{% endhighlight %}

{% highlight text %}
5
{% endhighlight %}

## alphanum

Remove non-alphanumeric characters from a string:

{% highlight twig %}
{% raw %}
{{"* Ignore spaces and non-alphanumeric characters+1$2%3!"|alphanum}}
{% endraw %}
{% endhighlight %}

{% highlight text %}
Ignorespacesandnonalphanumericcharacters123
{% endhighlight %}

Also allow specific characters:

{% highlight twig %}
{% raw %}
{{"* Ignore non-alphanumeric but allow spaces$%#!"|alphanum(' !')}}
{% endraw %}
{% endhighlight %}


{% highlight text %}
Ignore nonalphanumeric but allow spaces!
{% endhighlight %}

## append

Append a suffix to the current text.

(Introduced in [10.0.3](/releases/10.0.3/))

`|append(suffix, delimiter, trim)`

|-|-|-
| **suffix** | The text to append.
| **delimiter** | An optional delimiter to add between the current text and the suffix, only if the current text is non-empty.
| **trim** | Optional characters to remove from the end of the current value (e.g. dangling commas). When omitted the trim is set to the same value as the delimiter.

{% highlight twig %}
{% raw %}
{% set emails = "customer@cerb.example" %}
{{emails|append('vendor@cerb.example', delimiter=', ')}}
{% endraw %}
{% endhighlight %}

{% highlight text %}
customer@cerb.example, vendor@cerb.example
{% endhighlight %}

{% highlight twig %}
{% raw %}
{% set emails = null %}
{{emails|append('vendor@cerb.example', delimiter=', ')}}
{% endraw %}
{% endhighlight %}

{% highlight text %}
vendor@cerb.example
{% endhighlight %}

## array_sum

Sum the numeric elements of an array.

{% highlight twig %}
{% raw %}
{{array_sum([1,2,3,4,5])}}
{% endraw %}
{% endhighlight %}

{% highlight text %}
15
{% endhighlight %}

## base_convert

Convert between number system bases.

(Introduced in [9.0.8](/releases/9.0.8/))

{% highlight twig %}
{% raw %}
{% set int = 123456789 %}
{{int|base_convert(10,16)}}

{% set hex = '75bcd15' %}
{{hex|base_convert(16,10)}}
{% endraw %}
{% endhighlight %}

{% highlight text %}
75bcd15

123456789
{% endhighlight %}

## base64_decode

Decode a base64-encoded string:

{% highlight twig %}
{% raw %}
{% set b64 = "VGhpcyB3YXMgYmFzZTY0LWVuY29kZWQ=" %}
{{b64|base64_decode}}
{% endraw %}
{% endhighlight %}

{% highlight text %}
This was base64-encoded
{% endhighlight %}

## base64_encode

Encode a string in base64:

{% highlight twig %}
{% raw %}
{{"This was base64-encoded"|base64_encode}}
{% endraw %}
{% endhighlight %}

{% highlight text %}
VGhpcyB3YXMgYmFzZTY0LWVuY29kZWQ=
{% endhighlight %}

## base64url_decode

(Added in [9.1.8](/releases/9.1.8/))

Decode a base64url-encoded string:

{% highlight twig %}
{% raw %}
{% set b64 = "VGhpcyB3YXMgYmFzZTY0dXJsLWVuY29kZWQ" %}
{{b64|base64url_decode}}
{% endraw %}
{% endhighlight %}

{% highlight text %}
This was base64url-encoded
{% endhighlight %}

## base64url_encode

(Added in [9.1.8](/releases/9.1.8/))

Encode a string in base64url:

{% highlight twig %}
{% raw %}
{{"This was base64url-encoded"|base64url_encode}}
{% endraw %}
{% endhighlight %}

{% highlight text %}
VGhpcyB3YXMgYmFzZTY0dXJsLWVuY29kZWQ
{% endhighlight %}

## batch

Break a list into smaller chunks with **batch**:

{% highlight twig %}
{% raw %}
{% set items = ['red','blue','green'] %}
{{items|batch(2, '(empty)')|json_encode|json_pretty}}
{% endraw %}
{% endhighlight %}

{% highlight text %}
[
    [
        "red",
        "blue"
    ],
    [
        "green",
        "(empty)"
    ]
]
{% endhighlight %}

## bytes_pretty

Convert a number into a human readable number of bytes:

{% highlight twig %}
{% raw %}
{{"123456789"|bytes_pretty(2)}}
{% endraw %}
{% endhighlight %}

{% highlight text %}
123.46 MB
{% endhighlight %}

The optional argument determines the number of digits of precision.

## capitalize

Capitalize the first character of a string (and lowercase the rest):

{% highlight twig %}
{% raw %}
{% set first_name = "kina" %}
{{first_name|capitalize}}
{% endraw %}
{% endhighlight %}

{% highlight text %}
Kina
{% endhighlight %}

## cerb_translate

(Added in [9.0](/releases/9.0/))

Converts string IDs (like `status.open`) into text in the current worker's language.

{% highlight twig %}
{% raw %}
The ticket is {{'status.open'|cerb_translate}}
{% endraw %}
{% endhighlight %}

{% highlight text %}
The ticket is open.
{% endhighlight %}

## column

(Added in [10.1.1](/releases/10.1.1/))

Extract a key from each item in an array as a new array. This has the same effect as the [array_column()](/docs/scripting/functions/#array_column) function.

{% highlight twig %}
{% raw %}
{% set people = [
  {'name':'Kina Halpue', 'email':'kina@cerb.example'},
  {'name':'Milo Dade', 'email': 'milo@cerb.example'}
] %}
{{people|column('email')|join(', ')}}
{% endraw %}
{% endhighlight %}

{% highlight text %}
kina@cerb.example, milo@cerb.example
{% endhighlight %}

## context_name

Convert a Cerb `context` ID into a human readable label.

`|context_name(type)`

|-|-|-
| **type** | `singular`, `plural`, `id`, `uri`

{% highlight twig %}
{% raw %}
{{'cerberusweb.contexts.ticket'|context_name('singular')}}
{{'cerberusweb.contexts.task'|context_name('plural')}}
{{'worker'|context_name('id')}}
{% endraw %}
{% endhighlight %}

{% highlight text %}
tickets
task
{% endhighlight %}

## convert_encoding

Convert character encodings to the first argument from the second. If the second argument is blank then Cerb will attempt to auto-detect the current encoding.

{% highlight twig %}
{% raw %}
{{"This has 😂 emoji"|convert_encoding('iso-8859-1', 'utf-8')}}
{% endraw %}
{% endhighlight %}

{% highlight text %}
This has ? emoji
{% endhighlight %}

## csv

(Added in [9.6.4](/releases/9.6.4/))

Format an array as a comma-separated values list. This is useful for exporting reports for Excel from bots.

As of [11.2](/releases/11.2/), objects and dictionaries are automatically coerced to arrays. Previously, the filter failed unless the input was already an array.

{% highlight twig %}
{% raw %}
{% set records = [
	{
		id: 1,
		subject: "Help with the API",
	},
	{
		id: 2,
		subject: "Automating email replies", 
	}
] %}
ID,Subject
{{records|csv}}
{% endraw %}
{% endhighlight %}

{% highlight text %}
ID,Subject
1,"Help with the API"
2,"Automating email replies"
{% endhighlight %}

## date

Use the **date** filter to format a [string](/docs/scripting/#strings) or [variable](/docs/scripting/#variables) as a date:

{% highlight twig %}
{% raw %}
{{'now'|date('F d, Y h:ia T')}}
{{'tomorrow 5pm'|date('D, d F Y H:i T')}}
{{'+2 weeks 08:00'|date('Y-m-d h:ia T')}}
{% endraw %}
{% endhighlight %}

{% highlight text %}
December 12, 2017 11:50am PST
Wed, 13 December 2017 17:00 PST
2017-12-26 08:00am PST
{% endhighlight %}

You can use any of the formatting options from [PHP DateTime::format](https://www.php.net/manual/en/datetime.format.php).

The second parameter to the **date** filter can specify a timezone to use:

{% highlight twig %}
{% raw %}
{% set ts_now = 'now' -%}

Bangalore: {{ts_now|date(time_format, 'Asia/Calcutta')}}
Berlin: {{ts_now|date(time_format, 'Europe/Berlin')}}
New York: {{ts_now|date(time_format, 'America/New_York')}}
{% endraw %}
{% endhighlight %}

{% highlight text %}
Bangalore: December 13, 2017 01:27
Berlin: December 12, 2017 20:57
New York: December 12, 2017 14:57
{% endhighlight %}

You can get a Unix timestamp (seconds since 1-Jan-1970 00:00:00 UTC) from a date value with the `|date('U')` filter:

{% highlight twig %}
{% raw %}
It has been {{'now'|date('U')}} seconds since {{'0'|date(null, 'UTC')}}
{% endraw %}
{% endhighlight %}

{% highlight text %}
It has been 1513108417 seconds since January 1, 1970 00:00
{% endhighlight %}

## date_modify

If you need to manipulate a date, create a date object with the [date](/docs/scripting/functions/#date) function and use the **date_modify** filter:

{% highlight twig %}
{% raw %}
{% set format = 'D, d M Y T' %}
{% set timestamp = date('now') %}
Now: {{timestamp|date(format)}}
+2 days: {{timestamp|date_modify('+2 days')|date(format)}}
{% endraw %}
{% endhighlight %}

{% highlight text %}
Now: Tue, 12 Dec 2017 PST
+2 days: Thu, 14 Dec 2017 PST
{% endhighlight %}

## date_pretty

Convert a Unix timestamp into a human-readable, relative date:

{% highlight twig %}
{% raw %}
{% set timestamp = date("Jan 9 2002 10am", "America/Los_Angeles") %}
{{timestamp|date('U')|date_pretty}}
{% endraw %}
{% endhighlight %}

{% highlight text %}
18 years ago
{% endhighlight %}

## default

You can use the **default** filter to give a default value to empty variables:

{% highlight twig %}
{% raw %}
{% set name = '' %}
Hi {{name|default('there')}}
{% endraw %}
{% endhighlight %}

{% highlight text %}
Hi there
{% endhighlight %}

## escape

Escape strings and variables with the following modes:

* `html`
* `js`
* `css`
* `url`
* `html_attr`

{% highlight twig %}
{% raw %}
{{'This is "escaped" for Javascript'|escape('js')}}
{{'This is "escaped" for <b>HTML</b>'|e('html')}}
{% endraw %}
{% endhighlight %}

{% highlight text %}
This\x20is\x20\x22escaped\x22\x20for\x20Javascript
This is &quot;escaped&quot; for <b>HTML</b>
{% endhighlight %}

## filter

(Added in [10.1.1](/releases/10.1.1/))

Exclude items from an array using an arrow function.

`|filter(func)`

|-|-|-
| **func(v,k)** | An arrow function that returns `true` (include) or `false` (exclude) for each item. It receives `v` (value) and `k` (key) as arguments.

{% highlight twig %}
{% raw %}
{% set arr = [1,2,3,4,5,6,7,8] %}
{{arr|filter((v,k) => v is even)|values|join(',')}}
{% endraw %}
{% endhighlight %}

{% highlight text %}
2,4,6,8
{% endhighlight %}

## first

Return the first item of an array, object, or string:

{% highlight twig %}
{% raw %}
{% set items = [1,2,3] %}
{{items|first}}
{% endraw %}
{% endhighlight %}

{% highlight text %}
1
{% endhighlight %}

## format

Insert variables into a [string](/docs/scripting/#strings):

{% highlight twig %}
{% raw %}
{% set who = "Kina" %}
{% set quantity = 120 %}
{{"%s closed %d tickets today!"|format(who, quantity)}}
{% endraw %}
{% endhighlight %}

{% highlight text %}
Kina closed 120 tickets today!
{% endhighlight %}

For formatting specifiers, see: <https://www.php.net/sprintf> 

## hash

Generate a one-way hash.

`|hash(algorithm, binary=false)`

|-|-|-
| **algorithm** | The algorithm of the returned hash (e.g. `sha256`, `sha512`).
| **binary** | Return raw binary data when `true`

The **algorithm** can be one of:
`crc32`, `md5`, `murmur3a`, `murmur3c`, `murmur3f`, `sha1`, `sha256`, `sha512/224`, `sha512/256`, `sha512`, `sha3-224`, `sha3-256`, `sha3-384`, `sha3-512`, `whirlpool`, `xxh32`, `xxh64`, `xxh3`, `xxh128`

{% highlight twig %}
{% raw %}
{% set text = 'This string will be hashed' %}
SHA-512: {{text|hash('sha512')}}
Murmur3a: {{text|hash('murmur3a')}}
xxh128: {{text|hash('xxh128')}}
{% endraw %}
{% endhighlight %}

{% highlight text %}
SHA-512: 8b0a3e297c0447e43e20e966d1cbf4a20163c9ddebb95e1d4ba44e2542c1915597375c1a39dfce4f5786d1d187a4ce5f780817d34632fcbc571694533b3961f0
Murmur3a: 4a9df623
xxh128: 0da37dd25c7ee8945e2947cd89e86549
{% endhighlight %}

## hash_hmac

Generate a hash-based message authentication code (HMAC[^hmac]) using a secret key.

`|hash_hmac(secret_key, algorithm, binary)`

|-|-|-
| **secret_key** | The secret key used to generate the HMAC digest
| **algorithm** | The algorithm of the returned hash (e.g. `sha256`, `sha512`). See: [hash_hmac_algos](https://www.php.net/manual/en/function.hash-hmac-algos.php)
| **binary** | Return raw binary data when `true`, otherwise lowercase hex (default) 

For instance, you can use this to sign parameters in a survey URL to verify that the recipient didn't modify them.

{% highlight twig %}
{% raw %}
{% set data = {'email': 'kina@cerb.example', 'survey_id': 123} %}
{{data|json_encode|hash_hmac("THIS IS SECRET","sha256")}}
{% endraw %}
{% endhighlight %}

{% highlight text %}
5514f8aed3b39159d455f9a8f74b5d23d4f96391fa4a27d1bea6f940cb7d410f
{% endhighlight %}

<div class="cerb-box note">
<p>Provide your own value for <tt>THIS IS SECRET</tt>. You an store it in the bot configuration.</p>
</div>

## html_to_text

Convert HTML content to plain text.

`|html_to_text(truncate=50000)`

|-|-|-
| **truncate** | The maximum length to parse (bytes)

{% highlight twig %}
{% raw %}
{% set html %}
<p>
	This has <b>bold</b> and <u>underlined</u> text with <a href="https://cerb.ai/">links</a>.
</p>
<p>
	List:
	<ul>
		<li>This</li>
		<li>is</li>
		<li>a</li>
		<li>list</li>
	</ul>
</p>
{% endset %}
{{html|html_to_text}}
{% endraw %}
{% endhighlight %}

{% highlight text %}
This has bold and underlined text with links <https://cerb.ai/>.
 
List:
* This
* is
* a
* list
{% endhighlight %}

## image_info

(Added in [9.6.7](/releases/9.6.7/))

Returns information about an image. The image may be provided as bytes or in [data URI format](https://en.wikipedia.org/wiki/Data_URI_scheme). 

`|image_info()`

{% highlight twig %}
{% raw %}
{% set image_string %}
data:image/png;base64,iVBORw0KGgoAAAA....
{% endset %}
{{image_string|image_info|json_encode|json_pretty}}
{% endraw %}
{% endhighlight %}

{% highlight text %}
{
    "width": 100,
    "height": 100,
    "channels": 3,
    "bits": 8,
    "type": "image/png"
}
{% endhighlight %}

## indent

(Added in [9.6.4](/releases/9.6.4/))

Prefix the start of each line with a given marker in a block of text.

`|indent(marker, start_line)`

|-|-|-
| **marker** | The prefix to add to the beginning of each line.
| **start_line** | The line number to start prefixing from (0-based).

{% highlight twig %}
{% raw %}
{% set text = "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Mauris eget diam 
eu orci hendrerit elementum. Suspendisse egestas, dolor at efficitur sollicitudin, magna eros 
scelerisque risus, at tincidunt massa augue a eros. Nullam scelerisque luctus suscipit. Sed 
dui metus, rhoncus sed diam non, pretium maximus augue. Phasellus feugiat justo mi, in 
tristique quam euismod pellentesque. Curabitur ut libero sagittis sem semper ultrices. Nullam 
et mi id arcu vulputate fringilla ut quis nibh. Fusce lobortis magna eu quam porta scelerisque.
Suspendisse maximus fringilla tellus, a pellentesque sem tincidunt sit amet." -%}

{{text|indent('> ')}}
{% endraw %}
{% endhighlight %}

{% highlight text %}
> Lorem ipsum dolor sit amet, consectetur adipiscing elit. Mauris eget diam 
> eu orci hendrerit elementum. Suspendisse egestas, dolor at efficitur sollicitudin, magna eros 
> scelerisque risus, at tincidunt massa augue a eros. Nullam scelerisque luctus suscipit. Sed 
> dui metus, rhoncus sed diam non, pretium maximus augue. Phasellus feugiat justo mi, in 
> tristique quam euismod pellentesque. Curabitur ut libero sagittis sem semper ultrices. Nullam 
> et mi id arcu vulputate fringilla ut quis nibh. Fusce lobortis magna eu quam porta scelerisque.
> Suspendisse maximus fringilla tellus, a pellentesque sem tincidunt sit amet.
{% endhighlight %}

## join

Convert an [array](/docs/scripting/arrays-objects/) to a string with delimiters:

{% highlight twig %}
{% raw %}
{% set items = [1,2,3] %}
{{items|join(',')}}
{{items|join(' ')}}
{% endraw %}
{% endhighlight %}

{% highlight text %}
1,2,3
1 2 3
{% endhighlight %}

## json_encode

You can encode any variable as a JSON string with the **json_encode** filter:

{% highlight twig %}
{% raw %}
{% set json = {'name': 'Joe Customer'} %}
{% set json = dict_set(json, 'order_id', 54321) %}
{% set json = dict_set(json, 'status.text', 'shipped') %}
{% set json = dict_set(json, 'status.tracking_id', 'Z1F238') %}
{{json|json_encode}}	
{% endraw %}
{% endhighlight %}

{% highlight text %}
{"name":"Joe Customer","order_id":54321,"status":{"text":"shipped","tracking_id":"Z1F238"}}	
{% endhighlight %}

## json_pretty

You can _"prettify"_ a JSON string with the **json_pretty** filter:

{% highlight twig %}
{% raw %}
{% set json = {'name': 'Joe Customer'} %}
{% set json = dict_set(json, 'order_id', 54321) %}
{% set json = dict_set(json, 'status.text', 'shipped') %}
{% set json = dict_set(json, 'status.tracking_id', 'Z1F238') %}
{{json|json_encode|json_pretty}}
{% endraw %}
{% endhighlight %}

{% highlight text %}
{
  "name": "Joe Customer",
  "order_id": 54321,
  "status": {
    "text": "shipped",
    "tracking_id": "Z1F238"
  }
}
{% endhighlight %}

## kata_encode

Emit an object/array as a KATA text block:

{% highlight twig %}
{% raw %}
{% set object = {
	colors: ["red","green","blue"],
	size: 100,
} %}
{{object|kata_encode}}
{% endraw %}
{% endhighlight %}

{% highlight text %}
colors@list:
  red
  green
  blue
size: 100
{% endhighlight %}

## keys

Return the keys of an array or object:

{% highlight twig %}
{% raw %}
{% set list = ['red','green','blue'] %}
{% set obj = { 'name': 'Kina', 'age': 35, 'title': 'Customer Support Supervisor'} %}

{{list|keys|join(',')}}
{{obj|keys|json_encode}}
{% endraw %}
{% endhighlight %}

{% highlight text %}
0,1,2

["name","age","title"]
{% endhighlight %}

## last

Return the last item of an array, object, or string:

{% highlight twig %}
{% raw %}
{% set items = [1,2,3] %}
{{items|last}}
{% endraw %}
{% endhighlight %}

{% highlight text %}
3
{% endhighlight %}

## length

Return the length of a string or array:

{% highlight twig %}
{% raw %}
{{"This is a string"|length}}
{{[1,2,3,4,5]|length}}
{% endraw %}
{% endhighlight %}

{% highlight text %}
16
5
{% endhighlight %}

## lower

Convert a string to lowercase:

{% highlight twig %}
{% raw %}
{{"WHY ARE YOU YELLING?"|lower}}
{% endraw %}
{% endhighlight %}

{% highlight text %}
why are you yelling?
{% endhighlight %}

## map

(Added in [10.1.1](/releases/10.1.1/))

Apply a function to each item in an array to create a new array.

`|map(func)`

|-|-|-
| **func(v,k)** | An arrow function that returns the new value for each item. It receives `v` (value) and `k` (key) as arguments.

{% highlight twig %}
{% raw %}
{% set samples = [
	[1,2,3,4,5],
	[6,7,8,9,10],
	[1,3,5,7,9],
	[2,4,6,8,10],
] %}
Averages:
{{samples|map((v,k) => array_sum(v)/(samples[k]|length))|join(', ')}}
{% endraw %}
{% endhighlight %}

{% highlight text %}
Averages:
3, 8, 5, 6
{% endhighlight %}

## markdown_to_html

(Added in [9.5.4](/releases/9.5.4/))

Convert Markdown[^markdown] formatting to HTML:

{% highlight twig %}
{% raw %}
{% set markdown %}
This is **bold** text with a [link](https://cerb.ai/)
{% endset %}
{{markdown|markdown_to_html}}
{% endraw %}
{% endhighlight %}

{% highlight text %}
<p>This is <strong>bold</strong> text with a <a href="https://cerb.ai/">link</a></p>
{% endhighlight %}

## md5

Generate an MD5[^md5] hash for a string:

{% highlight twig %}
{% raw %}
{{"You can verify this hash"|md5}}
{% endraw %}
{% endhighlight %}

{% highlight text %}
1c20552e3bae1c4711cf697137002581
{% endhighlight %}

## merge

Combine two arrays or objects:

{% highlight twig %}
{% raw %}
{% set mfgs = ['Tesla','Ford'] %}
{% set mfgs = mfgs|merge(['Toyota','GM']) %}
{{mfgs|json_encode}}
{% endraw %}
{% endhighlight %}

{% highlight text %}
["Tesla","Ford","Toyota","GM"]
{% endhighlight %}

## nl2br

Convert newline characters (`\n`) to HTML breaks (`<br />`):

{% highlight twig %}
{% raw %}
{% set text = "This has
line feeds
in the text
"%}
{{text|nl2br}}
{% endraw %}
{% endhighlight %}

{% highlight text %}
This has<br />
line feeds<br />
in the text<br />
{% endhighlight %}

## number_format

Format a number with thousand separators and decimal places:

{% highlight twig %}
{% raw %}
{% set cost = 16858 %}
That will be ${{cost|number_format(2,'.',',')}}
{% endraw %}
{% endhighlight %}

{% highlight text %}
That will be $16,858.00
{% endhighlight %}

## parse_csv

(Added in [10.2.4](/releases/10.2.4/))

Parse a document with rows of comma-separated columns. Returns an array of rows with elements for columns.

`parse_csv(separator=',',enclosure='"',escape='\\')`

|-|-|-
| **separator** | An optional character to separate fields by. Defaults to comma (`,`).
| **enclosure** | An optional character to enclose fields. Defaults to double quote (`"`). The enclosure field can be used inside a field by doubling it (as an alternative to escaping).
| **escape** | An optional character to escape special characters (e.g. `\n`). This defaults to backslash (`\`), and escaping can be disabled with an empty string.

{% highlight twig %}
{% raw %}
{% set text %}
"Person Name",Email,Organization
"Kina Halpue",kina@cerb.example,Cerb
"Claire Bertin",c.bertin@baston.example,"Baston Defence"
{% endset %}
{{text|parse_csv|json_encode|json_pretty}}
{% endraw %}
{% endhighlight %}

{% highlight text %}
[
    [
        "Person Name",
        "Email",
        "Organization"
    ],
    [
        "Kina Halpue",
        "kina@cerb.example",
        "Cerb"
    ],
    [
        "Claire Bertin",
        "c.bertin@baston.example",
        "Baston Defence"
    ]
]
{% endhighlight %}

## parse_emails

Parse a delimited string of email addresses into an object. This also assists with email validation.

{% highlight twig %}
{% raw %}
{% set emails = "kina@cerb.example, milo@cerb.example, karl" %}
{{emails|parse_emails|json_encode|json_pretty}}
{% endraw %}
{% endhighlight %}

{% highlight text %}
{
    "kina@cerb.example": {
        "full_email": "kina@cerb.example",
        "email": "kina@cerb.example",
        "mailbox": "kina",
        "host": "cerb.example",
        "personal": null
    },
    "milo@cerb.example": {
        "full_email": "milo@cerb.example",
        "email": "milo@cerb.example",
        "mailbox": "milo",
        "host": "cerb.example",
        "personal": null
    },
    "karl@localhost": {
        "full_email": "karl@localhost",
        "email": "karl@localhost",
        "mailbox": "karl",
        "host": "localhost",
        "personal": null
    }
}
{% endhighlight %}

## parse_url

Parse a URL string into an object for validation.

{% highlight twig %}
{% raw %}
{% set url = "https://cerb.ai/search?q=oauth2#fragment" %}
{{url|parse_url|json_encode|json_pretty}}
{% endraw %}
{% endhighlight %}

{% highlight text %}
{
    "scheme": "https",
    "host": "cerb.ai",
    "path": "/search",
    "query": "q=oauth2",
    "fragment": "fragment"
}
{% endhighlight %}

## parse_user_agent

(Added in [10.3.2](/releases/10.3.2/))

Parse a user-agent string into an object for validation.

{% highlight twig %}
{% raw %}
{% set user_agent %}
Mozilla/5.0 (Macintosh; Intel Mac OS X 13_0) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/16.1 Safari/605.1.15
{% endset %}
{{user_agent|parse_user_agent|json_encode}}
{% endraw %}
{% endhighlight %}

{% highlight text %}
{
    "platform": "Macintosh",
    "browser": "Safari",
    "version": "16.1"
}
{% endhighlight %}

## permalink

(Added in [9.2.3](/releases/9.2.3/))

{% highlight twig %}
{% raw %}
{% set text = "This is the title of a record!" %}
{{text|permalink|lower}}
{% endraw %}
{% endhighlight %}

{% highlight text %}
this-is-the-title-of-a-record
{% endhighlight %}

## qp_decode

(Added in [11.1.1](/releases/11.1.1/))

Decode a string in quoted-printable format.

{% highlight twig %}
{% raw %}
{% set message %}
Hello and welcome to our new service! =F0=9F=98=80

We're delighted =F0=9F=8E=89 to have you as a member of our community.
This is a sample email with emojis =F0=9F=9A=80 and quoted-printable encodi=
ng.

Have a great day! =F0=9F=8C=88

Best regards,
The Team =F0=9F=91=8B
{% endset %}

{{message|qp_decode}}
{% endraw %}
{% endhighlight %}

{% highlight text %}
Hello and welcome to our new service! 😀

We're delighted 🎉 to have you as a member of our community.
This is a sample email with emojis 🚀 and quoted-printable encoding.

Have a great day! 🌈

Best regards,
The Team 👋
{% endhighlight %}

## qp_encode

(Added in [11.1.1](/releases/11.1.1/))

Encode a string in quoted-printable format. For instance, creating tickets with emoji using [email.parse:](/docs/automations/commands/email.parse/).

{% highlight twig %}
{% raw %}
{% set message %}
Hello and welcome to our new service! 😀

We're delighted 🎉 to have you as a member of our community.
This is a sample email with emojis 🚀 and quoted-printable encoding.

Have a great day! 🌈

Best regards,
The Team 👋
{% endset %}

{{message|qp_encode}}
{% endraw %}
{% endhighlight %}

{% highlight text %}
Hello and welcome to our new service! =F0=9F=98=80

We're delighted =F0=9F=8E=89 to have you as a member of our community.
This is a sample email with emojis =F0=9F=9A=80 and quoted-printable encodi=
ng.

Have a great day! =F0=9F=8C=88

Best regards,
The Team =F0=9F=91=8B
{% endhighlight %}

## quote

{% highlight twig %}
{% raw %}
{% set text = "This is a message you are replying to.

You should quote it.
" %}
{{text|quote}}
{% endraw %}
{% endhighlight %}

{% highlight text %}
> This is a message you are replying to.
>
> You should quote it.
{% endhighlight %}

## reduce

(Added in [10.1.1](/releases/10.1.1/))

Reduce an array of items into a single output value.

`|reduce(func,initial)`

|-|-|-
| **func(carry,v)** | An arrow function that returns the new carry value after each item. It receives the old `carry` value and the current item `v` (value).
| **initial** | An optional starting value for `carry`.

{% highlight twig %}
{% raw %}
{% set samples = [
	[1,2,3,4,5],
	[6,7,8,9,10],
	[1,3,5,7,9],
	[2,4,6,8,10],
] %}
Sum:
{{samples|reduce((carry,v) => carry + array_sum(v))}}
{% endraw %}
{% endhighlight %}

{% highlight text %}
Sum:
110
{% endhighlight %}

## regexp

You can use regular expressions[^regexp] with the **regexp** filter to match or extract patterns.

`|regexp(pattern,group)`

* `pattern`
	The regular expression pattern to match.
* `group`:
	The matching group `()` from the pattern to extract as a string.

Example:

{% highlight twig %}
{% raw %}
{% set text = "Your Amazon Order #Z-1234-5678-9 has shipped!" %}
{% set order_id = text|regexp("/Amazon Order #([A-Z0-9\-]+)/", 1) %}
Amazon Order #: {{order_id}}
{% endraw %}
{% endhighlight %}

{% highlight text %}
Amazon Order #: Z-1234-5678-9
{% endhighlight %}

If you need to escape characters in your regexp pattern, you should use a [set](/docs/scripting/commands/#set) block rather than a string:

{% highlight twig %}
{% raw %}
{% set pattern %}
#\[.*?\] (.*)#
{% endset %}
{% set bracketed_text = "[ABC-123-45678] Order Processing - 7 Days" %}
{{bracketed_text|regexp(pattern, 1)}}
{% endraw %}
{% endhighlight %}

{% highlight text %}
Order Processing - 7 Days
{% endhighlight %}

## repeat

(Added in [10.2.3](/releases/10.2.3/))

Repeat a string a given number of times.

`|repeat(times)`

|-|-|-
| **times** | The number of times to repeat the string.

{% highlight twig %}
{% raw %}
{{"*"|repeat(5)}}
{% endraw %}
{% endhighlight %}

{% highlight text %}
*****
{% endhighlight %}

## replace

{% highlight twig %}
{% raw %}
{{"I really like %food%"|replace({'%food%':'ice cream'})}}
{% endraw %}
{% endhighlight %}

{% highlight text %}
I really like ice cream
{% endhighlight %}

## reverse

Reverse a string or array:

{% highlight twig %}
{% raw %}
{{"Leonardo da Vinci"|reverse}}
{{[1,2,3,4,5]|reverse|join}}
{% endraw %}
{% endhighlight %}

{% highlight text %}
icniV ad odranoeL
54321
{% endhighlight %}

<div class="cerb-box note">
<p>The optional <tt>preserve_keys</tt> parameter will maintain object keys.</p>
</div>

## round

Round a number with desired precision.

`|round(precision,method)`

* `precision`
	The number of floating point digits.
* `method`:
  * common
  * ceil
  * floor

{% highlight twig %}
{% raw %}
{% set pi = 3.141592653589793238462643383279502884197169399375105820974944592307816406286 %}
{{pi|round}}
{{pi|round(5)}}
{{pi|round(5,'ceil')}}
{% endraw %}
{% endhighlight %}

{% highlight text %}
3
3.14159
3.1416
{% endhighlight %}

## secs_pretty

{% highlight twig %}
{% raw %}
{{"300"|secs_pretty}}
{{"86400"|secs_pretty}}
{{"604800"|secs_pretty()}}
{% endraw %}
{% endhighlight %}

{% highlight text %}
5 mins
1 day
1 week
{% endhighlight %}

## sha1

Generate an SHA-1[^sha1] hash for a string:

{% highlight twig %}
{% raw %}
{{"You can verify this hash"|sha1}}
{% endraw %}
{% endhighlight %}

{% highlight text %}
50ae61a375994fd178cd47fc7d29f7ec5724dda3
{% endhighlight %}

## slice

Extract part of a string, array, or object.

`|slice(start, length, preserve_keys)`

{% highlight twig %}
{% raw %}
{{[1,2,3,4,5]|slice(2,2)|json_encode}}
{{"This is some text"|slice(0,4)}}
{% endraw %}
{% endhighlight %}

{% highlight text %}
[3,4]
This
{% endhighlight %}

## sort

Sort an array:

{% highlight twig %}
{% raw %}
{% set x = [9,5,1,6,4,3] %}
{{x|sort|slice(0,6)|json_encode}}
{% endraw %}
{% endhighlight %}

{% highlight text %}
[1,3,4,5,6,9]
{% endhighlight %}

You can also provide an arrow function as a custom comparator for advanced sorting rules. The spaceship operator (`<=>`) automatically returns in comparator format (e.g. `-1`, `0`, or `1`):
- (A <=> B) < 0 is true if A < B
- (A <=> B) > 0 is true if A > B
- (A <=> B) == 0 is true if A and B are equal/equivalent

{% highlight twig %}
{% raw %}
{% set items = [
    {name: "Item C", priority: 3},
    {name: "Item A", priority: 1},
    {name: "Item B", priority: 2}
] %}
{{items|sort((a,b) => a.priority <=> b.priority)|column('name')|join(', ')}}
{% endraw %}
{% endhighlight %}

{% highlight text %}
Item A, Item B, Item C
{% endhighlight %}

## split

Convert a string to an array with the given delimiter.

`|split(delimiter, limit)`

{% highlight twig %}
{% raw %}
{{"1,2,3,4,5"|split(',')|json_encode}}
{% endraw %}
{% endhighlight %}

{% highlight text %}
["1","2","3","4","5"]
{% endhighlight %}

## split_crlf

Split a string on any combination of carriage return (`\r`) and linefeed (`\n`) delimiters.

`|split_crlf(keep_blanks=false,trim_lines=true)`

|-|-
| **keep_blanks** | Remove lines that are comprised of only whitespace.
| **trim_lines** | Remove whitespace before and after each line.

{% highlight twig %}
{% raw %}
{% set rainbow = "red
orange
yellow
green
blue
indigo
violet" %}
{{rainbow|split_crlf|json_encode}}
{% endraw %}
{% endhighlight %}

{% highlight text %}
["red","orange","yellow","green","blue","indigo","violet"]
{% endhighlight %}

## split_csv

Split a string on comma delimiters. This automatically handles whitespace padding.

{% highlight twig %}
{% raw %}
{% set coins = "BTC,   ETH   ,LTC" %}
{{coins|split_csv|json_encode}}
{% endraw %}
{% endhighlight %}

{% highlight text %}
["BTC","ETH","LTC"]
{% endhighlight %}

## stat

(Added in [10.3.8](/releases/10.3.8/))

Calculate a statistical measure for a given array of numbers.

`|stat(measure, decimals)`

|-|-|-
| **measure** | `count`, `max`, `mean`, `median`, `min`, `mode`, `stdevp`, `stdevs`, `sum`, `varp`, `vars`
| **decimals** | The number of decimal places for rounding

{% highlight twig %}
{% raw %}
{% set samples = [1,2,3,4,5,6,7,8,9,10] %}
{{samples|stat(measure='median')}}
{% endraw %}
{% endhighlight %}

{% highlight text %}
5.5
{% endhighlight %}

## str_pos

(Added in [10.1.2](/releases/10.1.2/))

Return the position of a substring (needle) within a larger text (haystack). This returns `-1` if the substring is not found.

`|str_pos(needle, offset, ignoreCase)`

|-|-|-
| **needle** | The substring to search for.
| **offset** | The position to start searching from.
| **ignoreCase** | `true` for case-insensitive matching, `false` for case-sensitive

{% highlight twig %}
{% raw %}
{% set alphabet %}
ABCDEFGHIJKLMNOPQRSTUVWXYZ
{% endset %}
{{alphabet|str_pos(needle='hi', offset=0, ignoreCase=true)}}{% endraw %}
{% endhighlight %}

{% highlight text %}
7
{% endhighlight %}

## str_sub

(Added in [10.1.2](/releases/10.1.2/))

Extract a substring from a larger string using starting and ending positions. This is an alternative to [\|slice(from,length)](/docs/scripting/filters/#slice).

`|str_sub(from, to)`

|-|-|-
| **from** | The position to start extracting a substring from (inclusive).
| **to** | The position to end extraction at (exclusive).

{% highlight twig %}
{% raw %}
{% set alphabet %}
ABCDEFGHIJKLMNOPQRSTUVWXYZ
{% endset %}
{{alphabet|str_sub(7,9)}}{% endraw %}
{% endhighlight %}

{% highlight text %}
HI
{% endhighlight %}

## strip_data_uris

Remove the base64-encoded content from [data URIs](https://developer.mozilla.org/en-US/docs/Web/URI/Schemes/data) in a text block. This is particularly useful when sanitizing text for indexing by a custom [search index](/docs/records/types/search_index/), where the encoded payload contributes noise rather than searchable terms.

`|strip_data_uris`

{% highlight twig %}
{% raw %}
{% set html %}
<img src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAA...">
{% endset %}
{{html|strip_data_uris}}{% endraw %}
{% endhighlight %}

{% highlight text %}
<img src="data:image/png;base64,">
{% endhighlight %}

## strip_lines

Remove lines in a text block that begin with one of the given `prefixes`.

`|strip_lines(prefixes)`

{% highlight twig %}
{% raw %}
{% set email_message %}
> This is some quoted text
> on multiple lines

This is the original message
{% endset %}
{{email_message|strip_lines(prefixes='>')}}{% endraw %}
{% endhighlight %}

{% highlight text %}
This is the original message
{% endhighlight %}

## strip_pem_blocks

Remove [PEM-formatted](https://en.wikipedia.org/wiki/Privacy-Enhanced_Mail) blocks like PGP signatures, public keys, and SSL certificates from a block of text. This is particularly useful when sanitizing text for indexing by a custom [search index](/docs/records/types/search_index/), where the long base64 payloads contribute noise rather than searchable terms.

`|strip_pem_blocks`

{% highlight twig %}
{% raw %}
{% set message %}
Hello,

Here is my reply.

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEE...
-----END PGP SIGNATURE-----
{% endset %}
{{message|strip_pem_blocks}}{% endraw %}
{% endhighlight %}

{% highlight text %}
Hello,

Here is my reply.
{% endhighlight %}

## strip_url_querystrings

Remove the query string portion from URLs in a text block. This is particularly useful when sanitizing text for indexing by a custom [search index](/docs/records/types/search_index/), where tracking parameters and session IDs add noise.

`|strip_url_querystrings`

{% highlight twig %}
{% raw %}
{% set text %}
Check out https://example.com/page?utm_source=email&utm_campaign=q4 for details.
{% endset %}
{{text|strip_url_querystrings}}{% endraw %}
{% endhighlight %}

{% highlight text %}
Check out https://example.com/page for details.
{% endhighlight %}

## striptags

Remove HTML tags from a string.

{% highlight twig %}
{% raw %}
{% set html = "This <b>string</b> has <b>HTML</b> tags!" %}
{{html|striptags}}
{% endraw %}
{% endhighlight %}

{% highlight text %}
This string has HTML tags!
{% endhighlight %}

## title

{% highlight twig %}
{% raw %}
{% set book_title = "the ultimate bot builder handbook" %}
{{book_title|title}}
{% endraw %}
{% endhighlight %}

{% highlight text %}
The Ultimate Bot Builder Handbook
{% endhighlight %}

## tokenize

Return an array of word tokens from a text block. This ignores punctuation and returns tokens in the order they appear, including duplicates.

`|tokenize`

{% highlight twig %}
{% raw %}
{% set message %}
KATA ("Key Annotated Tree of Attributes") is a human-friendly format for modeling structured 
data that is used throughout Cerb to describe configurations, customizations, sheets, and 
automations. KATA was inspired by YAML but avoids many of its pitfalls.
{% endset %}
{{array_count_values(message|tokenize)|sort|reverse|json_encode|json_pretty}}{% endraw %}
{% endhighlight %}

{% highlight text %}
{
    "kata": 2,
    "of": 2,
    "is": 2,
    "that": 1,
    "data": 1,
    "structured": 1,
    "modeling": 1,
    "for": 1,
    "format": 1,
    "friendly": 1,
    "human": 1,
    "a": 1,
    "attributes": 1,
    "tree": 1,
    "annotated": 1,
    "used": 1,
    "key": 1,
    "throughout": 1,
    "to": 1,
    "its": 1,
    "many": 1,
    "avoids": 1,
    "but": 1,
    "yaml": 1,
    "by": 1,
    "cerb": 1,
    "inspired": 1,
    "automations": 1,
    "and": 1,
    "sheets": 1,
    "customizations": 1,
    "configurations": 1,
    "describe": 1,
    "was": 1,
    "pitfalls": 1
}
{% endhighlight %}

## trim

Remove leading and/or trailing whitespace from a string.

`|trim(character_mask, side)`

* `character_mask`
	The characters to remove
* `side`
	* both
	* left
	* right

{% highlight twig %}
{% raw %}
{% set str = "    whitespace    " %}
{{str|trim}}
{{str|trim(' ', 'left')}}
{{str|trim(' ', side='right')}}
{% endraw %}
{% endhighlight %}

{% highlight text %}
whitespace
whitespace    
    whitespace
{% endhighlight %}

## truncate

Ensure that a string is no longer than the given limit.

`|truncate(limit)`

{% highlight twig %}
{% raw %}
{% set str = "This string is longer than we'd prefer" %}
{{str|truncate(11)}}
{% endraw %}
{% endhighlight %}

{% highlight text %}
This string...
{% endhighlight %}

## unescape

Decode HTML entities:

{% highlight twig %}
{% raw %}
{{"&amp;quot;iPhone&amp;quot; is &amp;copy; Apple, Inc."|unescape}}
{% endraw %}
{% endhighlight %}

{% highlight text %}
"iPhone" is © Apple, Inc.
{% endhighlight %}

## upper

Convert a string to uppercase:

{% highlight twig %}
{% raw %}
{{"I can't hear you!"|upper}}
{% endraw %}
{% endhighlight %}

{% highlight text %}
I CAN'T HEAR YOU!
{% endhighlight %}

## url_decode

Decode a URL query string into an array:

{% highlight twig %}
{% raw %}
{% set query = "name=Kina&action=light_on" %}
{{query|url_decode('json')}}
{% endraw %}
{% endhighlight %}

{% highlight text %}
{"name":"Kina","action":"light_on"}
{% endhighlight %}

## url_encode

Build a URL query string from an array:

{% highlight twig %}
{% raw %}
{% set args = {"name": "Kina", "action": "light_on" } %}
{{args|url_encode}}
{% endraw %}
{% endhighlight %}

{% highlight text %}
name=Kina&action=light_on
{% endhighlight %}

## values

(Added in [10.1.1](/releases/10.1.1/))

Return the values of an array with sequential keys. This is the filter equivalent of the [array_values()](/docs/scripting/functions/#array_values) function.

{% highlight twig %}
{% raw %}
{% set countries = {
  'CA': 'Canada',
  'CN': 'China',
  'DE': 'Germany',
  'IN': 'India',
  'MX': 'Mexico',
  'US': 'United States',
} %}
{{countries|values|json_encode}}
{% endraw %}
{% endhighlight %}

{% highlight text %}
["Canada","China","Germany","India","Mexico","United States"]
{% endhighlight %}

<div class="section-nav">
	<div class="left">
		<a href="/docs/scripting/functions/" class="prev">&lt; Functions</a>
	</div>
	<div class="right align-right">
		<a href="/docs/scripting/tests/" class="prev">Tests &gt;</a>
	</div>
</div>
<div class="clear"></div>

# References
{:.no_toc}

[^hmac]: Wikipedia: Hash-based message authentication code (HMAC) - <https://en.wikipedia.org/wiki/Hash-based_message_authentication_code>

[^json]: Wikipedia: JSON - <https://en.wikipedia.org/wiki/JSON>

[^markdown]: Wikipedia: Markdown - <https://en.wikipedia.org/wiki/Markdown>

[^md5]: Wikipedia: MD5 - <https://en.wikipedia.org/wiki/MD5>

[^regexp]: Wikipedia: Regular Expression - <https://en.wikipedia.org/wiki/Regular_expression>

[^sha1]: Wikipedia: SHA-1 - <https://en.wikipedia.org/wiki/SHA-1>

[^xml]: Wikipedia: XML - <https://en.wikipedia.org/wiki/XML>

[^xpath]: Wikipedia: XPath - <https://en.wikipedia.org/wiki/XPath>