---
title: "Automations: file.read"
#excerpt: 
#social_image_url: /assets/images/search/kata.png
permalink: /docs/automations/commands/file.read/
toc:
  title: file.read
  expand: Automations
jumbotron:
  title: file.read
  tagline: 
  breadcrumbs:
  -
    label: Docs &raquo;
    url: /docs/home/
  -
    label: Automations &raquo;
    url: /docs/automations/
  -
    label: Commands &raquo;
    url: /docs/automations/#commands
---

The **file.read:** command can read chunks of bytes from an [attachment](/docs/records/types/attachment/) or [automation resource](/docs/records/types/automation_resource/) record.

* TOC
{:toc}

# Syntax

## inputs:

### uri:

The URI of the record to read content from.

|Record Type|URI
|-|-
|attachment|`cerb:attachment:<id>`
|automation_resource|`cerb:automation_resource:<guid>`
|resource|`cerb:resource:<name>`

### filters:

Optional filters to apply to the read stream.

|---
| Key | Description
|-|-
| `gzip.decompress:` | Decompress a gzip (`.gz`) stream while reading bytes 

### offset:

The optional offset to begin reading bytes from. This defaults to `0` (the first byte).

### length:

The optional length to read bytes from starting at `offset:`. This defaults to `1024000` (1MB).

### length_split:

(Added in [10.4.1](/releases/10.4.1/))

The optional sequence to split the read bytes on. This will always be less than or equal to the requested length.

For instance, a `length: 2048` read with `length_split@json: "\n"` would return bytes up to the last linefeed character occurring before to the length position.

This simplifies processing line-based formats like CSV and JSONL as streams.

### password:

The optional password for an encrypted ZIP archive.

## output:

Save the output to this key name.

## on_simulate:

The [commands](/docs/automations/#commands) to run during simulation instead of reading the record URI.

If omitted, the file is read during simulation.

## on_success:

The [commands](/docs/automations/#commands) to run on success.

The key specified in `output:` is set to a dictionary with the following structure:

|Key|Description
|-|-
|`bytes`| The bytes returned from the file, starting from `offset` for `length`. If this contains binary data it is Base64-encoded and returned as a `data:` string.
|`uri`| The record URI of the file (an `attachment`, `automation_resource`, or `resource`).
|`name`| The filename of the record.
|`offset_from`| The first byte of the read range.
|`offset_to`| The last byte of the read range.
|`mime_type`| The MIME type of the file or resource. For instance, `image/png`.
|`size`| The total size in bytes of the file or resource.

## on_error:

The [commands](/docs/automations/#commands) to run on failure. If omitted, the automation exits in the `error` [state](/docs/automations/#exit-states).

The `output:` placeholder receives a dictionary with these keys:

| Key |
|-|-
| `error` | The error message.

# Examples

## Read the contents of a binary attachment

This automation reads the attachment with ID `1`:

<pre>
<code class="language-cerb">
{% raw %}
start:
  file.read:
    inputs:
      # image.png
      uri: cerb:attachment:1
    output: results
{% endraw %}
</code>
</pre>

Output:

<pre>
<code class="language-cerb">
results:
  bytes: data:image/png;base64,iVBORw0KGgoAAAA[...]
  uri: cerb:attachment:1
  name: image.png
  offset_from: 0
  offset_to: 23886
  mime_type: image/png
  size: 23886
</code>
</pre>

## Decompress and read a gzip file

<pre>
<code class="language-cerb">
{% raw %}
start:
  file.read:
    inputs:
      # smtp.example.com!cerb.ai!1661234567!1667654321.xml.gz
      uri: cerb:attachment:1234
      filters:
        gzip.decompress:
    output: results</code>
{% endraw %}
</pre>

Output:

<pre>
<code class="language-cerb">
{% raw %}
results:
  bytes@text:
    &lt;?xml version="1.0" encoding="UTF-8" ?&gt;
    &lt;feedback&gt;
      ...
    &lt;/feedback&gt;
  uri: cerb:attachment:1234
  name: smtp.example.com!cerb.ai!1661234567!1667654321.xml.gz
  offset_from: 0
  offset_to: 1284
  mime_type: application/x-gzip
  size: 599
{% endraw %}
</code>
</pre>
