---
title: Attachment
permalink: /docs/api/records/attachment/
jumbotron:
  title: Attachment
  tagline: ""
  breadcrumbs:
  -
    label: Developers &raquo; API &raquo;
    url: /docs/api/
  -
    label: Records
    url: /docs/api/#records
---

* TOC
{:toc}

# Records API

**URI:** `attachment`

Refer to the [/records](/docs/api/modules/records/) API.

# Examples

## Create an attachment with plaintext content

**Request:**

<pre>
<code class="language-http">
POST /rest/records/attachment/create.json HTTP/1.1
Cerb-Auth: XXXX:XXXX
Date: {{'now'|date:"%a, %d %b %Y %T %Z"}}
Content-Type: application/x-www-form-urlencoded; charset=utf-8
Host: cerb.example

fields[name]=filename.txt
&fields[mime_type]=text/plain
&fields[content]=This is some plaintext content created through the API.
&fields[attach][]=message:123
&fields[attach][]=comment:123
</code>
</pre>

* `&fields[attach][]` is an optional list of `context:id` tuples to link the attachment to.
* The `POST` fields should be URL-encoded. They are decoded here for readability.

**Response:**

<pre>
<code class="language-json">
{
  "__build": 2017110901,
  "__status": "success",
  "__version": "8.2.2",
  "_context": "cerberusweb.contexts.attachment",
  "_label": "filename.txt",
  "id": 123,
  "mime_type": "text/plain",
  "name": "filename.txt",
  "size": 55,
  "storage_extension": "devblocks.storage.engine.disk",
  "storage_key": "a/b/123",
  "storage_sha1hash": "260588f317aec33c59534dddfa91da68e841c424",
  "updated": 1510680491
}
</code>
</pre>

## Create an attachment with binary content

**Request:**

<pre>
<code class="language-http">
POST /rest/records/attachment/create.json?expand= HTTP/1.1
Cerb-Auth: XXXX:XXXX
Date: {{'now'|date:"%a, %d %b %Y %T %Z"}}
Content-Type: application/x-www-form-urlencoded; charset=utf-8
Host: cerb.example

fields[name]=cerby.png
&fields[mime_type]=image/png
&fields[content]=data:application/octet-stream;base64,[BASE64-ENCODED-CONTENT]
&fields[attach][]=message:123
&fields[attach][]=comment:123
</code>
</pre>

* Replace `[BASE64-ENCODED-CONTENT]` above with your [Base64-encoded](https://en.wikipedia.org/wiki/Base64) binary content.
* The `POST` fields should be URL-encoded. They are decoded here for readability.

**Response:**

<pre>
<code class="language-json">
{
  "__build": 2017110901,
  "__status": "success",
  "__version": "8.2.2",
  "_context": "cerberusweb.contexts.attachment",
  "_label": "cerby.png",
  "custom": [],
  "id": 123,
  "mime_type": "image/png",
  "name": "cerby.png",
  "size": 15037,
  "storage_extension": "devblocks.storage.engine.disk",
  "storage_key": "a/b/123",
  "storage_sha1hash": "c44ebaf197155c080ae47809dc5cd51c7715fd7c",
  "updated": 1510681295
}
</code>
</pre>

{% include api_toc.html %}
