---
title: API Requests
permalink: /docs/api/topics/requests/
jumbotron:
  title: API Requests
  tagline: ""
  breadcrumbs:
  -
    label: Developers &raquo; API
    url: /docs/api/
---

The web API is organized into [modules](/docs/api/#modules).  For instance, ticket-related actions are found in the [tickets](/docs/api/modules/tickets/) module.

A request is performed by pairing an HTTP **verb** with the appropriate **path** as a URL.

An **extension** of `.json` or `.xml` is added to the path to specify the format that the server should use for the response.

Some actions require a **payload**, which uses the standard HTTP POST web form format[^http-post] of key/value pairs.

* TOC
{:toc}

# Verbs

There are four verbs: `GET`, `PUT`, `POST`, and `DELETE`.

## GET

A `GET` request performs simple retrieval actions.  It may only specify options in the URL (i.e. path and query string).

For instance, this request retrieves the record for ticket #5 in JSON format:

<pre>
<code class="language-http">
GET /rest/tickets/5.json
</code>
</pre>

Similarly, this request retrieves the record for organization #9 in XML format, including custom fields:

<pre>
<code class="language-http">
GET /rest/orgs/9.xml?expand=custom_
</code>
</pre>

## PUT

A `PUT` request updates an existing record.  It may specify options in the URL and must provide a payload.

For instance, this request updates the subject on ticket record #5 using a form-encoded payload:

<pre>
<code class="language-http">
PUT /rest/tickets/5.json
Content-Type: application/x-www-form-urlencoded; charset=utf-8

subject=This+is+a+new+subject
</code>
</pre>

Notice how the path above is exactly the same as the first `GET` example?  The path refers to a specific record, and the verb describes what is being done to it.  The `PUT` verb performs a different action.

<div class="cerb-box note"><p>
	When using the official libraries, payload encoding is performed automatically.  In this situation, you would just provide an associative array of key/value pairs instead.  The possible keys are available in the documentation for each module and action.
</p></div>

## POST

A `POST` request performs complex actions that require a payload, such as record creation and searching.

For instance, this request searches tickets for masks that start with *ABC* and returns results in JSON format:

<pre>
<code class="language-http">
POST /rest/tickets/search.json
Content-Type: application/x-www-form-urlencoded; charset=utf-8

criteria[]=mask&oper[]=like&value[]=ABC*
</code>
</pre>

<div class="cerb-box note"><p>
	Like with a <tt>PUT</tt> request, the payload encoding of a <tt>POST</tt> is handled automatically by the official libraries.  The payload format is described by the documentation for each module and action.
</p></div>

## DELETE

A `DELETE` request permanently removes the record specified in the URL.

For instance, this request deletes ticket record #5:

<pre>
<code class="language-http">
DELETE /rest/tickets/5.json
</code>
</pre>

# Payloads

Field names that end in `[]` can be provided multiple times.

# Data Types

Data types are provided for each request's options and payload fields.  Here are the possible data types:

|---
| Type | Description
|-|-
| **bit** | A binary flag with a value of `0` for **false** or `1` for **true**.
| **char** | A single character. Example: `C`
| **integer** | A whole number with no commas or decimals. Example: `1234`
| **mixed** | A mixed data type can be any of these, depending on the custom field in question. See [custom fields](/docs/api/topics/custom-fields/) for more information.
| **string** | A text value. Example: `This is a string of text.`
| **timestamp** | A Unix 32-bit timestamp representing the number of seconds since the Unix Epoch (January 1, 1970 00:00:00 GMT). Example: `1399376670`

{% include api_toc.html %}

# References

[^http-post]: Wikipedia: HTTP POST - <http://en.wikipedia.org/wiki/POST_(HTTP)>