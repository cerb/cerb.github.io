---
title: "Bot Scripting Reference: Filters"
excerpt: A reference of the template filters in bot scripting.
permalink: /docs/bots/scripting/filters/
toc:
  title: Filters
jumbotron:
  title: "Reference: Filters"
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

These filters are available in bot scripts and snippets:

* TOC
{:toc}

## abs

Return the absolute value of a number:

<pre>
<code class="language-twig">
{% raw %}
{{-5|abs}}
{% endraw %}
</code>
</pre>

```
5
```

## alphanum

Remove non-alphanumeric characters from a string:

<pre>
<code class="language-twig">
{% raw %}
{{"* Ignore spaces and non-alphanumeric characters+1$2%3!"|alphanum}}
{% endraw %}
</code>
</pre>

```
Ignorespacesandnonalphanumericcharacters123
```

Also allow specific characters:

<pre>
<code class="language-twig">
{% raw %}
{{"* Ignore non-alphanumeric but allow spaces$%#!"|alphanum(' !')}}
{% endraw %}
</code>
</pre>


```
Ignore nonalphanumeric but allow spaces!
```

## append

Append a suffix to the current text.

(Introduced in [10.0.3](/releases/10.0.3/))

`|append(suffix, delimiter, trim)`

|-|-|-
| **suffix** | The text to append.
| **delimiter** | An optional delimiter to add between the current text and the suffix, only if the current text is non-empty.
| **trim** | Optional characters to remove from the end of the current value (e.g. dangling commas). When omitted the trim is set to the same value as the delimiter.

<pre>
<code class="language-twig">
{% raw %}
{% set emails = "customer@cerb.example" %}
{{emails|append('vendor@cerb.example', delimiter=', ')}}
{% endraw %}
</code>
</pre>

```
customer@cerb.example, vendor@cerb.example
```

<pre>
<code class="language-twig">
{% raw %}
{% set emails = null %}
{{emails|append('vendor@cerb.example', delimiter=', ')}}
{% endraw %}
</code>
</pre>

```
vendor@cerb.example
```

## array_sum

Sum the numeric elements of an array.

<pre>
<code class="language-twig">
{% raw %}
{{array_sum([1,2,3,4,5])}}
{% endraw %}
</code>
</pre>

```
15
```

## base_convert

Convert between number system bases.

(Introduced in [9.0.8](/releases/9.0.8/))

<pre>
<code class="language-twig">
{% raw %}
{% set int = 123456789 %}
{{int|base_convert(10,16)}}

{% set hex = '75bcd15' %}
{{hex|base_convert(16,10)}}
{% endraw %}
</code>
</pre>

```
75bcd15

123456789
```

## base64_decode

Decode a base64-encoded string:

<pre>
<code class="language-twig">
{% raw %}
{% set b64 = "VGhpcyB3YXMgYmFzZTY0LWVuY29kZWQ=" %}
{{b64|base64_decode}}
{% endraw %}
</code>
</pre>

```
This was base64-encoded
```

## base64_encode

Encode a string in base64:

<pre>
<code class="language-twig">
{% raw %}
{{"This was base64-encoded"|base64_encode}}
{% endraw %}
</code>
</pre>

```
VGhpcyB3YXMgYmFzZTY0LWVuY29kZWQ=
```

## base64url_decode

(Added in [9.1.8](/releases/9.1.8/))

Decode a base64url-encoded string:

<pre>
<code class="language-twig">
{% raw %}
{% set b64 = "VGhpcyB3YXMgYmFzZTY0dXJsLWVuY29kZWQ" %}
{{b64|base64url_decode}}
{% endraw %}
</code>
</pre>

```
This was base64url-encoded
```

## base64url_encode

(Added in [9.1.8](/releases/9.1.8/))

Encode a string in base64url:

<pre>
<code class="language-twig">
{% raw %}
{{"This was base64url-encoded"|base64url_encode}}
{% endraw %}
</code>
</pre>

```
VGhpcyB3YXMgYmFzZTY0dXJsLWVuY29kZWQ
```

## batch

Break a list into smaller chunks with **batch**:

<pre>
<code class="language-twig">
{% raw %}
{% set items = ['red','blue','green'] %}
{{items|batch(2, '(empty)')|json_encode|json_pretty}}
{% endraw %}
</code>
</pre>

```
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
```

## bytes_pretty

Convert a number into a human readable number of bytes:

<pre>
<code class="language-twig">
{% raw %}
{{"123456789"|bytes_pretty(2)}}
{% endraw %}
</code>
</pre>

```
123.46 MB
```

The optional argument determines the number of digits of precision.

## capitalize

Capitalize the first character of a string (and lowercase the rest):

<pre>
<code class="language-twig">
{% raw %}
{% set first_name = "kina" %}
{{first_name|capitalize}}
{% endraw %}
</code>
</pre>

```
Kina
```

## cerb_translate

(Added in [9.0](/releases/9.0/))

Converts string IDs (like `status.open`) into text in the current worker’s language.

<pre>
<code class="language-twig">
{% raw %}
The ticket is {{'status.open'|cerb_translate}}
{% endraw %}
</code>
</pre>

```
The ticket is open.
```

## context_name

Convert a Cerb `context` ID into a human readable label:

<pre>
<code class="language-twig">
{% raw %}
{{'cerberusweb.contexts.ticket'|context_name('singular')}}
{{'cerberusweb.contexts.task'|context_name('plural')}}
{% endraw %}
</code>
</pre>

```
tickets
task
```

## convert_encoding

Convert character encodings to the first argument from the second. If the second argument is blank then Cerb will attempt to auto-detect the current encoding.

<pre>
<code class="language-twig">
{% raw %}
{{"This has 😂 emoji"|convert_encoding('iso-8859-1', 'utf-8')}}
{% endraw %}
</code>
</pre>

```
This has ? emoji
```

## csv

(Added in [9.6.4](/releases/9.6.4/))

Format an array as a comma-separated values list. This is useful for exporting reports for Excel from bots.

<pre>
<code class="language-twig">
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
</code>
</pre>

```
ID,Subject
1,"Help with the API"
2,"Automating email replies"
```

## date

Use the **date** filter to format a [string](/docs/bots/scripting/#strings) or [variable](/docs/bots/scripting/#variables) as a date:

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

You can use any of the formatting options from [PHP DateTime::format](https://www.php.net/manual/en/datetime.format.php).

The second parameter to the **date** filter can specify a timezone to use:

<pre>
<code class="language-twig">
{% raw %}
{% set ts_now = 'now' -%}

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

## date_modify

If you need to manipulate a date, create a date object with the [date](/docs/bots/scripting/functions/#date) function and use the **date_modify** filter:

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

## date_pretty

Convert a Unix timestamp into a human-readable, relative date:

<pre>
<code class="language-twig">
{% raw %}
{% set timestamp = date("Jan 9 2002 10am", "America/Los_Angeles") %}
{{timestamp|date('U')|date_pretty}}
{% endraw %}
</code>
</pre>

```
18 years ago
```

## default

You can use the **default** filter to give a default value to empty variables:

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

## escape

Escape strings and variables with the following modes:

* `html`
* `js`
* `css`
* `url`
* `html_attr`

<pre>
<code class="language-twig">
{% raw %}
{{'This is "escaped" for Javascript'|escape('js')}}
{{'This is "escaped" for &lt;b&gt;HTML&lt;/b&gt;'|e('html')}}
{% endraw %}
</code>
</pre>

```
This\x20is\x20\x22escaped\x22\x20for\x20Javascript
This is &quot;escaped&quot; for &lt;b&gt;HTML&lt;/b&gt;
```

## first

Return the first item of an array, object, or string:

<pre>
<code class="language-twig">
{% raw %}
{% set items = [1,2,3] %}
{{items|first}}
{% endraw %}
</code>
</pre>

```
1
```

## format

Insert variables into a [string](/docs/bots/scripting/#strings):

<pre>
<code class="language-twig">
{% raw %}
{% set who = "Kina" %}
{% set quantity = 120 %}
{{"%s closed %d tickets today!"|format(who, quantity)}}
{% endraw %}
</code>
</pre>

```
Kina closed 120 tickets today!
```

## hash_hmac

Generate a hash-based message authentication code (HMAC[^hmac]) using a secret key.

`|hash_hmac(secret_key, algorithm, binary)`

|-|-|-
| **secret_key** | The secret key used to generate the HMAC digest
| **algorithm** | The algorithm of the returned hash (e.g. `sha256`, `sha512`). See: [hash_hmac_algos](https://www.php.net/manual/en/function.hash-hmac-algos.php)
| **binary** | Return raw binary data when `true`, otherwise lowercase hex (default) 

For instance, you can use this to sign parameters in a survey URL to verify that the recipient didn't modify them.

<pre>
<code class="language-twig">
{% raw %}
{% set data = {'email': 'kina@cerb.example', 'survey_id': 123} %}
{{data|json_encode|hash_hmac("THIS IS SECRET","sha256")}}
{% endraw %}
</code>
</pre>

```
5514f8aed3b39159d455f9a8f74b5d23d4f96391fa4a27d1bea6f940cb7d410f
```

<div class="cerb-box note">
<p>Provide your own value for <tt>THIS IS SECRET</tt>. You an store it in the bot configuration.</p>
</div>

## image_info

(Added in [9.6.7](/releases/9.6.7/))

Returns information about an image. The image may be provided as bytes or in [data URI format](https://en.wikipedia.org/wiki/Data_URI_scheme). 

`|image_info()`

<pre>
<code class="language-twig">
{% raw %}
{% set image_string %}
data:image/png;base64,iVBORw0KGgoAAAA....
{% endset %}
{{image_string|image_info|json_encode|json_pretty}}
{% endraw %}
</code>
</pre>

```
{
    "width": 100,
    "height": 100,
    "channels": 3,
    "bits": 8,
    "type": "image/png"
}
```

## indent

(Added in [9.6.4](/releases/9.6.4/))

Prefix the start of each line with a given marker in a block of text.

`|indent(marker, start_line)`

|-|-|-
| **marker** | The prefix to add to the beginning of each line.
| **start_line** | The line number to start prefixing from (0-based).

<pre>
<code class="language-twig">
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
</code>
</pre>

```
> Lorem ipsum dolor sit amet, consectetur adipiscing elit. Mauris eget diam 
> eu orci hendrerit elementum. Suspendisse egestas, dolor at efficitur sollicitudin, magna eros 
> scelerisque risus, at tincidunt massa augue a eros. Nullam scelerisque luctus suscipit. Sed 
> dui metus, rhoncus sed diam non, pretium maximus augue. Phasellus feugiat justo mi, in 
> tristique quam euismod pellentesque. Curabitur ut libero sagittis sem semper ultrices. Nullam 
> et mi id arcu vulputate fringilla ut quis nibh. Fusce lobortis magna eu quam porta scelerisque.
> Suspendisse maximus fringilla tellus, a pellentesque sem tincidunt sit amet.
```

## join

Convert an [array](/docs/bots/scripting/(/docs/bots/scripting/arrays-objects/)) to a string with delimiters:

<pre>
<code class="language-twig">
{% raw %}
{% set items = [1,2,3] %}
{{items|join(',')}}
{{items|join(' ')}}
{% endraw %}
</code>
</pre>

```
1,2,3
1 2 3
```

## json_encode

You can encode any variable as a JSON string with the **json_encode** filter:

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

## json_pretty

You can _"prettify"_ a JSON string with the **json_pretty** filter:

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

## kata_encode

Emit an object/array as a KATA text block:

<pre>
<code class="language-twig">
{% raw %}
{% set object = {
	colors: ["red","green","blue"],
	size: 100,
} %}
{{object|kata_encode}}
{% endraw %}
</code>
</pre>

```
colors@list:
  red
  green
  blue
size: 100
```

## keys

Return the keys of an array or object:

<pre>
<code class="language-twig">
{% raw %}
{% set list = ['red','green','blue'] %}
{% set obj = { 'name': 'Kina', 'age': 35, 'title': 'Customer Support Supervisor'} %}

{{list|keys|join(',')}}
{{obj|keys|json_encode}}
{% endraw %}
</code>
</pre>

```
0,1,2

["name","age","title"]
```

## last

Return the last item of an array, object, or string:

<pre>
<code class="language-twig">
{% raw %}
{% set items = [1,2,3] %}
{{items|last}}
{% endraw %}
</code>
</pre>

```
3
```

## length

Return the length of a string or array:

<pre>
<code class="language-twig">
{% raw %}
{{"This is a string"|length}}
{{[1,2,3,4,5]|length}}
{% endraw %}
</code>
</pre>

```
16
5
```

## lower

Convert a string to lowercase:

<pre>
<code class="language-twig">
{% raw %}
{{"WHY ARE YOU YELLING?"|lower}}
{% endraw %}
</code>
</pre>

```
why are you yelling?
```

## markdown_to_html

(Added in [9.5.4](/releases/9.5.4/))

Convert Markdown[^markdown] formatting to HTML:

<pre>
<code class="language-twig">
{% raw %}
{% set markdown %}
This is **bold** text with a [link](https://cerb.ai/)
{% endset %}
{{markdown|markdown_to_html}}
{% endraw %}
</code>
</pre>

```
<p>This is <strong>bold</strong> text with a <a href="https://cerb.ai/">link</a></p>
```

## md5

Generate an MD5[^md5] hash for a string:

<pre>
<code class="language-twig">
{% raw %}
{{"You can verify this hash"|md5}}
{% endraw %}
</code>
</pre>

```
1c20552e3bae1c4711cf697137002581
```

## merge

Combine two arrays or objects:

<pre>
<code class="language-twig">
{% raw %}
{% set mfgs = ['Tesla','Ford'] %}
{% set mfgs = mfgs|merge(['Toyota','GM']) %}
{{mfgs|json_encode}}
{% endraw %}
</code>
</pre>

```
["Tesla","Ford","Toyota","GM"]
```

## nl2br

Convert newline characters (`\n`) to HTML breaks (`<br />`):

<pre>
<code class="language-twig">
{% raw %}
{% set text = "This has
line feeds
in the text
"%}
{{text|nl2br}}
{% endraw %}
</code>
</pre>

```
This has<br />
line feeds<br />
in the text<br />
```

## number_format

Format a number with thousand separators and decimal places:

<pre>
<code class="language-twig">
{% raw %}
{% set cost = 16858 %}
That will be ${{cost|number_format(2,'.',',')}}
{% endraw %}
</code>
</pre>

```
That will be $16,858.00
```

## parse_emails

Parse a delimited string of email addresses into an object. This also assists with email validation.

<pre>
<code class="language-twig">
{% raw %}
{% set emails = "kina@cerb.example, milo@cerb.example, karl" %}
{{emails|parse_emails|json_encode|json_pretty}}
{% endraw %}
</code>
</pre>

```
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
```

## parse_url

Parse a URL string into an object for validation.

<pre>
<code class="language-twig">
{% raw %}
{% set url = "https://cerb.ai/search?q=oauth2#fragment" %}
{{url|parse_url|json_encode|json_pretty}}
{% endraw %}
</code>
</pre>

```
{
    "scheme": "https",
    "host": "cerb.ai",
    "path": "/search",
    "query": "q=oauth2",
    "fragment": "fragment"
}
```

## permalink

(Added in [9.2.3](/releases/9.2.3/))

<pre>
<code class="language-twig">
{% raw %}
{% set text = "This is the title of a record!" %}
{{text|permalink|lower}}
{% endraw %}
</code>
</pre>

```
this-is-the-title-of-a-record
```

## quote

<pre>
<code class="language-twig">
{% raw %}
{% set text = "This is a message you are replying to.

You should quote it.
" %}
{{text|quote}}
{% endraw %}
</code>
</pre>

```
> This is a message you are replying to.
>
> You should quote it.
```

## regexp

You can use regular expressions[^regexp] with the **regexp** filter to match or extract patterns.

`|regexp(pattern,group)`

* `pattern`
	The regular expression pattern to match.
* `group`:
	The matching group `()` from the pattern to extract as a string.

Example:

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

If you need to escape characters in your regexp pattern, you should use a [set](/docs/bots/scripting/commands/#set) block rather than a string:

<pre>
<code class="language-twig">
{% raw %}
{% set pattern %}
#\[.*?\] (.*)#
{% endset %}
{% set bracketed_text = "[ABC-123-45678] Order Processing - 7 Days" %}
{{bracketed_text|regexp(pattern, 1)}}
{% endraw %}
</code>
</pre>

```
Order Processing - 7 Days
```

## replace

<pre>
<code class="language-twig">
{% raw %}
{{"I really like %food%"|replace({'%food%':'ice cream'})}}
{% endraw %}
</code>
</pre>

```
I really like ice cream
```

## reverse

Reverse a string or array:

<pre>
<code class="language-twig">
{% raw %}
{{"Leonardo da Vinci"|reverse}}
{{[1,2,3,4,5]|reverse|join}}
{% endraw %}
</code>
</pre>

```
icniV ad odranoeL
54321
```

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

<pre>
<code class="language-twig">
{% raw %}
{% set pi = 3.141592653589793238462643383279502884197169399375105820974944592307816406286 %}
{{pi|round}}
{{pi|round(5)}}
{{pi|round(5,'ceil')}}
{% endraw %}
</code>
</pre>

```
3
3.14159
3.1416
```

## secs_pretty

<pre>
<code class="language-twig">
{% raw %}
{{"300"|secs_pretty}}
{{"86400"|secs_pretty}}
{{"604800"|secs_pretty()}}
{% endraw %}
</code>
</pre>

```
5 mins
1 day
1 week
```

## sha1

Generate an SHA-1[^sha1] hash for a string:

<pre>
<code class="language-twig">
{% raw %}
{{"You can verify this hash"|sha1}}
{% endraw %}
</code>
</pre>

```
50ae61a375994fd178cd47fc7d29f7ec5724dda3
```

## slice

Extract part of a string, array, or object.

`|slice(start, length, preserve_keys)`

<pre>
<code class="language-twig">
{% raw %}
{{[1,2,3,4,5]|slice(2,2)|json_encode}}
{{"This is some text"|slice(0,4)}}
{% endraw %}
</code>
</pre>

```
[3,4]
This
```

## sort

Sort an array:

<pre>
<code class="language-twig">
{% raw %}
{% set x = [9,5,1,6,4,3] %}
{{x|sort|slice(0,6)|json_encode}}
{% endraw %}
</code>
</pre>

```
[1,3,4,5,6,9]
```

## split

Convert a string to an array with the given delimiter.

`|split(delimiter, limit)`

<pre>
<code class="language-twig">
{% raw %}
{{"1,2,3,4,5"|split(',')|json_encode}}
{% endraw %}
</code>
</pre>

```
["1","2","3","4","5"]
```

## split_crlf

Split a string on any combination of carriage return (`\r`) and linefeed (`\n`) delimiters.

<pre>
<code class="language-twig">
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
</code>
</pre>

```
["red","orange","yellow","green","blue","indigo","violet"]
```

## split_csv

Split a string on comma delimiters. This automatically handles whitespace padding.

<pre>
<code class="language-twig">
{% raw %}
{% set coins = "BTC,   ETH   ,LTC" %}
{{coins|split_csv|json_encode}}
{% endraw %}
</code>
</pre>

```
["BTC","ETH","LTC"]
```

## striptags

Remove HTML tags from a string.

<pre>
<code class="language-twig">
{% raw %}
{% set html = "This &lt;b&gt;string&lt;/b&gt; has &lt;b&gt;HTML&lt;/b&gt; tags!" %}
{{html|striptags}}
{% endraw %}
</code>
</pre>

```
This string has HTML tags!
```

## title

<pre>
<code class="language-twig">
{% raw %}
{% set book_title = "the ultimate bot builder handbook" %}
{{book_title|title}}
{% endraw %}
</code>
</pre>

```
The Ultimate Bot Builder Handbook
```

## trim

Remove leading and/or trailing whitespace from a string.

`|trim(character_mask, side)`

* `character_mask`
	The characters to remove
* `side`
	* both
	* left
	* right

<pre>
<code class="language-twig">
{% raw %}
{% set str = "    whitespace    " %}
{{str|trim}}
{{str|trim(' ', 'left')}}
{{str|trim(' ', side='right')}}
{% endraw %}
</code>
</pre>

```
whitespace
whitespace    
    whitespace
```

## truncate

Ensure that a string is no longer than the given limit.

`|truncate(limit)`

<pre>
<code class="language-twig">
{% raw %}
{% set str = "This string is longer than we'd prefer" %}
{{str|truncate(11)}}
{% endraw %}
</code>
</pre>

```
This string...
```

## unescape

Decode HTML entities:

<pre>
<code class="language-twig">
{% raw %}
{{"&amp;quot;iPhone&amp;quot; is &amp;copy; Apple, Inc."|unescape}}
{% endraw %}
</code>
</pre>

```
"iPhone" is © Apple, Inc.
```

## upper

Convert a string to uppercase:

<pre>
<code class="language-twig">
{% raw %}
{{"I can't hear you!"|upper}}
{% endraw %}
</code>
</pre>

```
I CAN'T HEAR YOU!
```

## url_decode

Decode a URL query string into an array:

<pre>
<code class="language-twig">
{% raw %}
{% set query = "name=Kina&action=light_on" %}
{{query|url_decode('json')}}
{% endraw %}
</code>
</pre>

```
{"name":"Kina","action":"light_on"}
```

## url_encode

Build a URL query string from an array:

<pre>
<code class="language-twig">
{% raw %}
{% set args = {"name": "Kina", "action": "light_on" } %}
{{args|url_encode}}
{% endraw %}
</code>
</pre>

```
name=Kina&action=light_on
```

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