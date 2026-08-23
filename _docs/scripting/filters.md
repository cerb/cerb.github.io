---
title: 'Scripting Reference: Filters'
excerpt: A reference of the template filters in automation scripting.
summary: This webpage serves as a comprehensive scripting reference for filters available
  in Cerb's automation scripting and snippets. It details a wide array of filters, such as
  `abs`, `alphanum`, `append`, `array_sum`, `base_convert`, `base64_encode`, `bin2hex`, `capitalize`,
  `cerb_translate`, `date`, `escape`, `filter`, `hash`, `hex2bin`, `json_encode`, `markdown_to_html`,
  `md5`, `number_format`, `number_pretty`, `parse_csv`, `regexp`, `reverse`, `sha1`, `sort`, `split`,
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
    - heading: "bin2hex"
      title: "Scripting Filter: bin2hex"
      summary: "Convert a binary string to its hexadecimal representation"
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
    - heading: "context_alias"
      title: "Scripting Filter: context_alias"
      summary: "Convert a Cerb context ID into its URI alias"
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
    - heading: "hex2bin"
      title: "Scripting Filter: hex2bin"
      summary: "Convert a hexadecimal string back to its binary string"
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
    - heading: "number_pretty"
      title: "Scripting Filter: number_pretty"
      summary: "Format a large number in a human-readable form with a magnitude suffix"
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
    - heading: "raw"
      title: "Scripting Filter: raw"
      summary: "Mark a value as markup that is already safe so it isn't escaped"
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
    - heading: "spaceless"
      title: "Scripting Filter: spaceless"
      summary: "Remove the whitespace between HTML tags (applied with {% apply %})"
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
      summary: "Remove the contents of PEM-formatted blocks like PGP keys and SSL certificates"
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
    - heading: "xml_encode"
      title: "Scripting Filter: xml_encode"
      summary: "Build XML from an array"
---

These filters are available in automation scripting and snippets:

* TOC
{:toc}

<p class="youtube-video-container"><iframe width="1280" height="720" src="https://www.youtube.com/embed/7rp_9WA2W1s" title="Cerb scripting: All 80+ filters explained" frameBorder="0"  allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" allowFullScreen></iframe></p>

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

## base_convert

Convert between number system bases.

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
    {
        "2": "green",
        "3": "(empty)"
    }
]
{% endhighlight %}

The padded final chunk keeps the numeric keys from the original list, so [json_encode](#json_encode) emits it as an object rather than an array. Pipe it through [values](#values) first if you need consistent arrays.

## bin2hex

Convert a binary string to its hexadecimal representation:

{% highlight twig %}
{% raw %}
{{"Cerb"|bin2hex}}
{% endraw %}
{% endhighlight %}

{% highlight text %}
43657262
{% endhighlight %}

Every byte becomes exactly two lowercase hex digits, so the result is twice as long as the input and safe to slice at any even offset. That's what makes it useful on decoded binary -- the bytes of a message header, a hash digest, or a packed identifier -- where the raw string would be unprintable and slicing it by character could split a multi-byte sequence.

{% highlight twig %}
{% raw %}
{% set bytes = "AAECf/8="|base64_decode %}
{{bytes|bin2hex}}
{% endraw %}
{% endhighlight %}

{% highlight text %}
0001027fff
{% endhighlight %}

Anything that isn't a string returns nothing at all. Use [hex2bin](#hex2bin) to convert back.

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

## context_alias

Convert a Cerb `context` ID into its URI alias.

`|context_alias`

{% highlight twig %}
{% raw %}
{{'cerberusweb.contexts.ticket'|context_alias}}
{% endraw %}
{% endhighlight %}

{% highlight text %}
ticket
{% endhighlight %}

This is [context_name](#context_name) with its `type` pinned to `uri`. {% raw %}`{{x|context_alias}}`{% endraw %} and {% raw %}`{{x|context_name('uri')}}`{% endraw %} are the same call.

## context_name

Convert a Cerb `context` ID into a human readable label.

`|context_name(type)`

|-|-|-
| **type** | `singular`, `plural` (default), `singular_short`, `plural_short`, `id`, `uri`

{% highlight twig %}
{% raw %}
{{'cerberusweb.contexts.ticket'|context_name('singular')}}
{{'cerberusweb.contexts.task'|context_name('plural')}}
{{'worker'|context_name('id')}}
{% endraw %}
{% endhighlight %}

{% highlight text %}
ticket
tasks
cerberusweb.contexts.worker
{% endhighlight %}

Every form accepts either an alias or a full context string, so `worker` and `cerberusweb.contexts.worker` are interchangeable as input.

Some record types register short names as well. For tickets, `singular_short` returns `convo` and `plural_short` returns `mail`.

Those two don't look like a pair, and that's expected: a record type can register many names, each declaring which forms it can fill, and every form is claimed by the first name that qualifies for it. `mail` is declared as singular, plural, *and* short, so it takes `plural_short` before a later name can.

## convert_encoding

Convert character encodings to the first argument from the second. If the second argument is blank then Cerb will attempt to auto-detect the current encoding.

`|convert_encoding(to, from)`

Converting _away_ from UTF-8 produces bytes that a UTF-8 page can't display, so a single conversion in that direction looks like mojibake even when it succeeded. A round trip shows the text survives intact:

{% highlight twig %}
{% raw %}
{{"Café"|convert_encoding('iso-8859-1', 'utf-8')|convert_encoding('utf-8', 'iso-8859-1')}}
{% endraw %}
{% endhighlight %}

{% highlight text %}
Café
{% endhighlight %}

<div class="cerb-box warning">
<p>When any character can't be represented in the target encoding, the <i>entire</i> conversion fails and returns an empty string. It is not a partial result with the unmappable characters removed. One emoji loses the whole message, and no error is reported.</p>
<p>Both of these return nothing: <tt>{% raw %}{{"This has 😂 emoji"|convert_encoding('iso-8859-1', 'utf-8')}}{% endraw %}</tt> and <tt>{% raw %}{{"Café"|convert_encoding('ASCII', 'utf-8')}}{% endraw %}</tt></p>
</div>

## csv

Format an array as a comma-separated values list. This is useful for exporting reports for Excel from bots.

Objects and dictionaries are automatically coerced to arrays.

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

Use the **date** filter to format a [string](/docs/scripting/strings/) or [variable](/docs/scripting/variables/) as a date:

{% highlight twig %}
{% raw %}
{{'now'|date('F d, Y h:ia T')}}
{{'tomorrow 5pm'|date('D, d F Y H:i T')}}
{{'+2 weeks 08:00'|date('Y-m-d h:ia T')}}
{% endraw %}
{% endhighlight %}

Relative English date strings like these are resolved when the script runs, so their output isn't shown here. The examples below use a fixed date instead.

You can use any of the formatting options from [PHP DateTime::format](https://www.php.net/manual/en/datetime.format.php).

The second parameter to the **date** filter is the timezone the result is displayed in. It does not change the timezone a date string is _parsed_ in, so include the zone in the string itself when it matters:

{% highlight twig %}
{% raw %}
{% set time_format = 'F j, Y H:i' %}
{% set ts = date('2017-12-12 14:57 America/New_York') -%}

Bangalore: {{ts|date(time_format, 'Asia/Kolkata')}}
Berlin: {{ts|date(time_format, 'Europe/Berlin')}}
New York: {{ts|date(time_format, 'America/New_York')}}
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
{{"2017-12-12 14:57 America/New_York"|date('U')}}
{{"1513108620"|date('F j, Y H:i', 'America/New_York')}}
{% endraw %}
{% endhighlight %}

{% highlight text %}
1513108620
December 12, 2017 14:57
{% endhighlight %}

## date_modify

If you need to manipulate a date, create a date object with the [date](/docs/scripting/functions/#date) function and use the **date_modify** filter:

{% highlight twig %}
{% raw %}
{% set format = 'D, d M Y' %}
{% set timestamp = date('2017-12-12', 'UTC') %}
Then: {{timestamp|date(format, 'UTC')}}
+2 days: {{timestamp|date_modify('+2 days')|date(format, 'UTC')}}
{% endraw %}
{% endhighlight %}

{% highlight text %}
Then: Tue, 12 Dec 2017
+2 days: Thu, 14 Dec 2017
{% endhighlight %}

## date_pretty

Convert a Unix timestamp into a human-readable, relative date:

{% highlight twig %}
{% raw %}
{% set an_hour_ago = date('now')|date('U') - 3600 %}
{% set three_days_ago = date('now')|date('U') - (86400 * 3) %}
{% set in_two_hours = date('now')|date('U') + 7200 %}
{{an_hour_ago|date_pretty}}
{{three_days_ago|date_pretty}}
{{in_two_hours|date_pretty}}
{% endraw %}
{% endhighlight %}

{% highlight text %}
1 hour ago
3 days ago
2 hours
{% endhighlight %}

A date in the future has no suffix, as in the `2 hours` above.

<div class="cerb-box warning">
<p>This filter takes a Unix timestamp, not a date object. Piping a <a href="/docs/scripting/functions/#date">date()</a> object straight in returns an empty string and reports no error, so convert it first with <tt>{% raw %}|date('U'){% endraw %}</tt>.</p>
</div>

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
This\u0020is\u0020\u0022escaped\u0022\u0020for\u0020Javascript
This is &quot;escaped&quot; for &lt;b&gt;HTML&lt;/b&gt;
{% endhighlight %}

`e` is a shorthand alias for `escape`, as in the second line above. Both are available.

## filter

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

Insert variables into a [string](/docs/scripting/strings/):

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

## hex2bin

Convert a hexadecimal string back to the binary string it represents. This is the inverse of [bin2hex](#bin2hex):

{% highlight twig %}
{% raw %}
{{"43657262"|hex2bin}}
{% endraw %}
{% endhighlight %}

{% highlight text %}
Cerb
{% endhighlight %}

The input must be an even number of hexadecimal digits and nothing else. An odd-length value, any non-hex character, and an empty string all return nothing rather than raising an error, so validate the source before relying on the result.

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

The input must already be a JSON string. Given anything else -- an array or a dictionary -- the filter renders nothing at all, with no error, so pipe it through [json_encode](#json_encode) first, as the example does.

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
size@int: 100
{% endhighlight %}

Each value is labeled with the [annotation](/docs/kata/#key-annotations) for its type -- `@int` for a whole number, `@float` for a decimal, `@bool` for true or false -- so a reader that applies those annotations gets numbers and booleans back rather than text. A value with no annotation is text.

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

## number_pretty

Format a large number in a human-readable form, with a magnitude suffix of `K`, `M`, `B`, or `T`:

{% highlight twig %}
{% raw %}
{{12345678|number_pretty(1)}}
{% endraw %}
{% endhighlight %}

{% highlight text %}
12.3M
{% endhighlight %}

The optional argument determines the number of digits of precision, and defaults to none:

{% highlight twig %}
{% raw %}
{{32768|number_pretty}}
{% endraw %}
{% endhighlight %}

{% highlight text %}
32K
{% endhighlight %}

<div class="cerb-box note">
	<p>
		This <b>truncates</b> rather than rounds, which is where it parts ways with
		<a href="#bytes_pretty"><code>bytes_pretty</code></a>. A 32,768-token context window is
		universally called "32K", never "33K", and truncating also keeps <code>999999</code> from
		rounding up into a nonsensical <code>1000K</code>.
	</p>
</div>

A number below 1,000 is returned as-is, and a negative number keeps its sign. A non-numeric value returns an empty string.

## parse_csv

Parse a document with rows of comma-separated columns. Returns an array of rows with elements for columns.

Cells are addressed by position rather than by name. A header row comes back as the first row of data, not as keys -- so reach a column with an index like {% raw %}`{{row.0}}`{% endraw %}, and skip the header yourself when the document has one.

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
        "personal": ""
    },
    "milo@cerb.example": {
        "full_email": "milo@cerb.example",
        "email": "milo@cerb.example",
        "mailbox": "milo",
        "host": "cerb.example",
        "personal": ""
    }
}
{% endhighlight %}

Addresses that don't validate are left out of the result. In the example above, the bare `karl` has no domain, so it doesn't appear at all -- compare the number of keys against the number of addresses you passed in to detect that.

## parse_url

Parse a URL string into an object for validation.

The filter takes no arguments and always returns the whole record. Reach a single component from the result -- {% raw %}`{{url|parse_url.host}}`{% endraw %} -- rather than asking for one by name.

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
{"platform":"Macintosh","browser":"Safari","version":"16.1"}
{% endhighlight %}

## permalink

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

## raw

Mark a value as markup that is already safe, so it isn't escaped.

Cerb doesn't escape template output in most places -- automations, snippets, email signatures, and mail templates all emit values as they are -- so on those surfaces `raw` makes no difference to what you see:

{% highlight twig %}
{% raw %}
{% set s = "<b>  <i>x</i>  </b>" %}
{{s}}
{{s|raw}}
{% endraw %}
{% endhighlight %}

{% highlight text %}
<b>  <i>x</i>  </b>
<b>  <i>x</i>  </b>
{% endhighlight %}

Where it does matter is with filters that escape their own input before they run, and they don't all fail the same way.

[spaceless](/docs/scripting/commands/#spaceless) matches on the `>` and `<` around whitespace, which are the characters escaping replaces. It finds nothing to collapse and returns the text unchanged, with no error.

[nl2br](#nl2br) matches on line breaks, which escaping leaves alone, so it still inserts its `<br />` -- but the markup around it comes back escaped.

Piping through `raw` first prevents both:

{% highlight twig %}
{% raw %}
{% set s = "<b>  <i>x</i>  </b>" %}
{{s|spaceless}}
{{s|raw|spaceless}}
{% endraw %}
{% endhighlight %}

{% highlight text %}
&lt;b&gt;  &lt;i&gt;x&lt;/i&gt;  &lt;/b&gt;
<b><i>x</i></b>
{% endhighlight %}

<div class="cerb-box note">
<p><a href="/docs/sheets/">Sheet</a> cells and HTML and JavaScript widget templates <i>do</i> escape their output. On those surfaces <tt>raw</tt> suppresses that escaping, but generally only when it comes last in the chain, because a later filter can produce a new value that is escaped again.</p>
</div>

## reduce

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

## spaceless

Remove the whitespace between HTML tags. `spaceless` is a **filter**, not a command, and it's applied to a block with [apply](/docs/scripting/commands/#apply): {% raw %}`{% apply spaceless %}`{% endraw %}.

It's Twig's own filter, and it's **deprecated as of Twig 3.12** and scheduled for removal in Twig 4.0. See [spaceless](/docs/scripting/commands/#spaceless) on the Commands page for the example, the history, and the non-deprecated alternative.

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

Remove the contents of [PEM-formatted](https://en.wikipedia.org/wiki/Privacy-Enhanced_Mail) blocks like PGP signatures, public keys, and SSL certificates from a block of text. This is particularly useful when sanitizing text for indexing by a custom [search index](/docs/records/types/search_index/), where the long base64 payloads contribute noise rather than searchable terms.

The `-----BEGIN-----` and `-----END-----` markers are kept, on one line, so the text still records that a block was there.

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

-----BEGIN PGP SIGNATURE----- -----END PGP SIGNATURE-----
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
support support support support ticket ticket ticket reply reply queue
{% endset %}
{{array_count_values(message|tokenize)|sort|reverse|json_encode|json_pretty}}{% endraw %}
{% endhighlight %}

{% highlight text %}
{
    "support": 4,
    "ticket": 3,
    "reply": 2,
    "queue": 1
}
{% endhighlight %}

<div class="cerb-box note">
<p>Sorting counts puts the most frequent tokens first, but <b>sort</b> is not stable for equal values, so tokens with the same count can come back in any order.</p>
</div>

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

Ensure that a string is no longer than the given limit. The limit includes the separator, so the result is never longer than `limit` characters.

`|truncate(limit, separator)`

|-|-|-
| **limit** | The maximum length of the result, counting the separator.
| **separator** | The text appended to a truncated string. This defaults to `...`

{% highlight twig %}
{% raw %}
{% set str = "This string is longer than we'd prefer" %}
{{str|truncate(11)}}
{% endraw %}
{% endhighlight %}

{% highlight text %}
This str...
{% endhighlight %}

<div class="cerb-box warning">
<p>This filter takes <tt>(limit, separator)</tt>. Twig's own <b>truncate</b> takes <tt>(length, preserve, separator)</tt>, so a snippet copied from Twig's documentation passes its second argument as the <i>separator</i>, and no error is reported:</p>
<p><tt>{% raw %}{{"The quick brown fox jumps over the lazy dog"|truncate(20, true)}}{% endraw %}</tt> returns <tt>The quick brown fox1</tt>, using <tt>true</tt> as the separator text. Without it, <tt>truncate(20)</tt> returns <tt>The quick brown f...</tt></p>
</div>

## unescape

Decode HTML entities:

{% highlight twig %}
{% raw %}
{{"&quot;iPhone&quot; is &copy; Apple, Inc."|unescape}}
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

## xml_encode

Build XML from an array.

`|xml_encode(format)`

**Arguments:**

| Name     | Notes                                                                    |
|----------|---------------------------------------------------------------------------|
| `format` | Optional. When `true`, the output is indented. Defaults to `false`.       |

**Returns:** The constructed XML as a string, or an empty string on failure.

<div class="cerb-box warning">
<p><b>The array must have exactly one top-level key.</b> It becomes the root element, and any
sibling keys beside it are <b>silently dropped</b> -- no error, no warning.</p>
</div>

{% highlight twig %}
{% raw %}
{% set data = {'name':'Acme','city':'Portland'} %}
{{data|xml_encode}}
{% endraw %}
{% endhighlight %}

{% highlight xml %}
<name>Acme</name>
{% endhighlight %}

`city` is gone. Wrap the whole thing in a single root key instead:

{% highlight twig %}
{% raw %}
{% set data = {'org':{'name':'Acme','city':'Portland'}} %}
{{data|xml_encode}}
{% endraw %}
{% endhighlight %}

{% highlight xml %}
<org><name>Acme</name><city>Portland</city></org>
{% endhighlight %}

String keys become tag names. Integer keys -- the elements of a list -- become `<item>`:

{% highlight twig %}
{% raw %}
{% set data = {'tickets':[{'mask':'ABC-1'},{'mask':'ABC-2'}]} %}
{{data|xml_encode}}
{% endraw %}
{% endhighlight %}

{% highlight xml %}
<tickets><item><mask>ABC-1</mask></item><item><mask>ABC-2</mask></item></tickets>
{% endhighlight %}

### Hints

Keys beginning with `@` are **hints rather than content**. They're skipped when walking children, and they're only read on integer-keyed entries -- on a string-keyed entry the key itself is already the tag name, and both hints are ignored.

`@tag` renames those `<item>` elements:

{% highlight twig %}
{% raw %}
{% set data = {'tickets':[
  {'@tag':'ticket','mask':'ABC-1'},
  {'@tag':'ticket','mask':'ABC-2'}
]} %}
{{data|xml_encode}}
{% endraw %}
{% endhighlight %}

{% highlight xml %}
<tickets><ticket><mask>ABC-1</mask></ticket><ticket><mask>ABC-2</mask></ticket></tickets>
{% endhighlight %}

`@attributes` sets attributes on that element, and a second argument of `true` indents the output:

{% highlight twig %}
{% raw %}
{% set data = {'tickets':[
  {'@tag':'ticket','@attributes':{'id':'1','status':'open'},'mask':'ABC-1'}
]} %}
{{data|xml_encode(true)}}
{% endraw %}
{% endhighlight %}

{% highlight xml %}
<tickets>
  <ticket id="1" status="open">
    <mask>ABC-1</mask>
  </ticket>
</tickets>
{% endhighlight %}

Only `@tag` and `@attributes` are read. Other `@` keys are ignored rather than raising an error. Scalar values become text content, with carriage returns stripped.

<div class="cerb-box note">
<p>There is also an <a href="/docs/scripting/functions/#xml_encode"><b>xml_encode</b> function</a>, and it is a different function doing the opposite job: it <em>serializes</em> an existing XML node back to a string. Passing an array to the function returns <code>false</code>, and piping a node into this filter won't serialize it.</p>
</div>

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