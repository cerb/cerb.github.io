---
title: "Automations: file.write"
#excerpt: 
#social_image_url: /assets/images/search/kata.png
permalink: /docs/automations/commands/file.write/
toc:
  title: file.write
  expand: Automations
jumbotron:
  title: file.write
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

The **file.write:** command writes arbitrary bytes to a temporary [automation resource](/docs/records/types/automation_resource/) record with a unique token identifier.

This is much more efficient than storing a large amount of data within the automation state.

The `file.write:` command can also optionally generate a ZIP file from multiple [attachments](/docs/records/types/automations/) or automation resources.

* TOC
{:toc}

# Syntax

## inputs:

|---
| Key | Req'd | Type
|-|:-:|-
| `content:` | √ | string, object
| `expires:` | | timestamp 
| `mime_type:` | | string 
| `name:` | | string

### content:

|---
| Key | Type | Description
|-|-|-
| `bytes:` | string | Arbitrary bytes to write
| `text:` | string | Arbitrary text to write
| `zip:` | object | A collection of `files:` to compress as a ZIP archive

### content:zip:

|---
| Key | Type | Description
|-|-|-
| `files:` | objects | A list of `file:` objects to compress
| `password:` | string | An optional password to encrypt the ZIP contents

<pre>
<code class="language-cerb">
{% raw %}
  zip:
    password: s3cr3t
    files:
      file/name0:
         path: /path/to/example.png
         uri: cerb:attachment:123
      file/name1:
         path: /path/to/example.txt
         bytes: This is arbitrary content
{% endraw %}
</code>
</pre>

### expires:

An optional Unix timestamp after which the temporary resource will be deleted. Defaults to `+15 minutes`.

Use the `@date` key annotation to use human friendly date strings like `+1 hour` or `2023-12-31 5pm Europe/Berlin`.

### mime_type:

An optional [MIME type](https://en.wikipedia.org/wiki/Media_type) for the file. Defaults to `application/octet-stream`.

### name:

An optional name for the file.

## output:

Save the output to this key name.

## on_simulate:

The [commands](/docs/automations/#commands) to run during simulation instead of writing the record URI.

If omitted, the file is written during simulation.

## on_success:

The [commands](/docs/automations/#commands) to run on success.

The key specified in `output:` is set to a dictionary with the following structure:

|Key|Description
|-|-
|`expires_at`| The timestamp after which the resource is expired.
|`id`| The ID of the resource record.
|`mime_type`| The MIME type of the file or resource. For instance, `image/png`.
|`name`| The filename of the record.
|`size`| The total size in bytes of the file or resource.
|`uri`| The record URI of the [automation_resource](/docs/records/types/automation_resource/). The `uri` uses a random UUID identifier rather than an ID, which is suitable for sharing publicly. 

## on_error:

The [commands](/docs/automations/#commands) to run on failure. If omitted, the automation exits in the `error` [state](/docs/automations/#exit-states).

The `output:` placeholder receives a dictionary with these keys:

| Key |
|-|-
| `error` | The error message.

# Examples

## Create a simple text file

<pre>
<code class="language-cerb">
{% raw %}
start:
  file.write:
    inputs:
      name: example.txt
      mime_type: text/plain
      expires@date: +15 mins
      content: This is some text
    output: results
{% endraw %}
</code>
</pre>

The command returns this dictionary:

<pre>
<code class="language-cerb">
results:
  uri: cerb:automation_resource:247cc278-450e-11ed-8cbd-e1c6a4043a12
  name: example.txt
  mime_type: text/plain
  expires_at: 1665017156
  size: 17
  id: 123
</code>
</pre>

## Create a ZIP file from mixed bytes and attachments

<pre>
<code class="language-cerb">
{% raw %}
start:
  file.write:
    inputs:
      content:
        zip:
          password: s3cr3t
          files:
            file/name0:
               path: /path/to/example.png
               uri: cerb:attachment:123
            file/name1:
               path: /path/to/example.txt
               bytes: This is arbitrary content
      name: example.zip
      expires@date: +15 mins
    output: results
{% endraw %}
</code>
</pre>

The command returns this dictionary:

<pre>
<code class="language-cerb">
results:
  uri: cerb:automation_resource:835ed6f2-4511-11ed-a716-f9b7c189003f
  mime_type: application/zip
  expires_at: 1665018603
  size: 557
  id: 123
  name: example.zip
</code>
</pre>

## Create an attachment from an automation resource

<pre>
<code class="language-cerb">
{% raw %}
start:
  record.create:
    inputs:
      record_type: attachment
      fields:
        name: example.zip
        mime_type: application/vnd.cerb.uri
        content: cerb:automation_resource:835ed6f2-4511-11ed-a716-f9b7c189003f
    output: results
{% endraw %}
</code>
</pre>

Output:

<pre>
<code class="language-cerb">
results:
  _context: cerberusweb.contexts.attachment
  id: 1234
  _type: attachment
  _loaded: true
  _label: example.zip
  mime_type: application/zip
  name: example.zip
  size: 557
  storage_extension: devblocks.storage.engine.disk
  storage_key: a/b/1234
  storage_sha1hash: fb528658ed4c4f8cd1b2e4b768b583e42c5a3ec3
  updated: 1665018318
  url_download: https://cerb.example/files/1234/example.zip
</code>
</pre>
