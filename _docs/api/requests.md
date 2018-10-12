---
title: "API: Requests"
permalink: /docs/api/requests/
toc:
  title: Requests
jumbotron:
  title: Requests
  tagline: ""
  breadcrumbs:
  -
    label: Docs &raquo;
    url: /docs/home/
  -
    label: API &raquo;
    url: /docs/api/
---

The web API is organized into [endpoints](/docs/api/endpoints/).  For instance, ticket-related actions are found in the [tickets](/docs/api/endpoints/tickets/) module.

A request is performed by pairing an HTTP **verb** with the appropriate **path** as a URL.

An **extension** of `.json` or `.xml` is added to the path to specify the format that the server should use for the response.

Some actions require a **payload**, which uses the standard HTTP POST web form format[^http-post] of key/value pairs.

* TOC
{:toc}

# Verbs

There are five verbs: `GET`, `PUT`, `POST`, `PATCH`, and `DELETE`.

## GET

A `GET` request performs simple retrieval actions.  It may only specify options in the URL (i.e. path and query string).

For instance, this request retrieves the record for ticket #5 in JSON format:

<pre>
<code class="language-http">
GET /rest/records/ticket/5.json
</code>
</pre>

Similarly, this request retrieves the record for organization #9 in XML format, including custom fields:

<pre>
<code class="language-http">
GET /rest/records/org/9.xml?expand=custom_
</code>
</pre>

## PUT

A `PUT` request updates an existing record.  It may specify options in the URL and must provide a payload.

For instance, this request updates the subject on ticket record #5 using a form-encoded payload:

<pre>
<code class="language-http">
PUT /rest/records/ticket/5.json
Content-Type: application/x-www-form-urlencoded; charset=utf-8

fields[subject]=This+is+a+new+subject
</code>
</pre>

Notice how the path above is exactly the same as the first `GET` example?  The path refers to a specific record, and the verb describes what is being done to it.  The `PUT` verb performs a different action.

<div class="cerb-box note"><p>
	When using the official libraries, payload encoding is performed automatically.  In this situation, you would just provide an associative array of key/value pairs instead.  The possible keys are available in the documentation for each module and action.
</p></div>

## POST

A `POST` request performs complex actions that require a payload, such as record creation and searching.

For instance, this request searches tickets for masks that start with `ABC` and returns results in JSON format:

<pre>
<code class="language-http">
POST /rest/records/ticket/search.json
Content-Type: application/x-www-form-urlencoded; charset=utf-8

q=mask%3AABC%2A
</code>
</pre>

<div class="cerb-box note"><p>
	Like with a <tt>PUT</tt> request, the payload encoding of a <tt>POST</tt> is handled automatically by the official libraries.  The payload format is described by the documentation for each module and action.
</p></div>

## PATCH

A `PATCH` request partially modifies a record. Currently, patching is only used by [upserts](/docs/api/endpoints/records/#upsert).

For instance, this request upserts (updates or inserts) an organization record and returns results in JSON format:

<pre>
<code class="language-http">
PATCH /rest/records/org/upsert.json
Content-Type: application/x-www-form-urlencoded; charset=utf-8

query=name:"Apple"&fields[name]=Apple
</code>
</pre>

<div class="cerb-box note"><p>
	Like with a <tt>PUT</tt> request, the payload encoding of a <tt>PATCH</tt> is handled automatically by the official libraries.  The payload format is described by the documentation for each module and action.
</p></div>

## DELETE

A `DELETE` request permanently removes the record specified in the URL.

For instance, this request deletes ticket record #5:

<pre>
<code class="language-http">
DELETE /rest/records/ticket/5.json
</code>
</pre>

# References

[^http-post]: Wikipedia: HTTP POST - <http://en.wikipedia.org/wiki/POST_(HTTP)>