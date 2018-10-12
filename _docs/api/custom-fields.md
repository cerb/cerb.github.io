---
title: "API: Custom Fields"
permalink: /docs/api/custom-fields/
toc:
  title: Custom Fields
jumbotron:
  title: Custom Fields
  tagline: ""
  breadcrumbs:
  -
    label: Docs &raquo;
    url: /docs/home/
  -
    label: API &raquo;
    url: /docs/api/
---

Records in Cerb can be extended with [custom fields](/docs/custom-fields/) and [fieldsets](/docs/custom-fieldsets/).  These fields are available in the [API responses](/docs/api/responses/) using [key expansion](/docs/api/responses/#expanding-keys-in-api-requests).

* TOC
{:toc}

# Custom field types

A custom field is created with one of the following types:

|---
| Type | Description
|-|-
| **(C) Checkbox/Bit** | A *true* or *false* value, represented by `1` or `0` respectively.
| **(D) Dropdown/Picklist** | A single selection from a predefined list of options.
| **(E) Date** | A 32-bit Unix timestamp integer, representing the number of elapsed seconds since January 1, 1970 00:00:00 GMT.
| **(F) File** | A file contained within the storage service.
| **(I) Multiple File** | Multiple files contained within the storage service.
| **(L) Record Link** | A link to another record.
| **(M) List** | A list of multiple text values.
| **(N) Number** | An unsigned 32-bit whole number.
| **(S) Single Line** | A single line of text.
| **(T) Multiple Lines** | Multiple lines of text, with linefeeds preserved.
| **(U) URL** | A Uniform Resource Locator to a web page.
| **(W) Worker** | A single selection from the list of active workers.
| **(X) Multiple Checkboxes** | Any number of selections from a predefined list of options.

# Working with custom fields in the API

### Building a list of the available custom fields

You can retrieve custom field information using the [/records](/docs/api/endpoints/records/) API endpoint.

The available custom fields and fieldsets for a specific record type can also be retrieved using the [/contexts/list](/docs/api/endpoints/contexts/#list) endpoint:

<pre>
<code class="language-http">
GET /rest/contexts/list.json
</code>
</pre>

This will return a list of record types with custom field information, like the following example:

<pre>
<code class="language-json">
{
   id: "cerberusweb.contexts.ticket",
   name: "Ticket",
   plugin_id: "cerberusweb.core",
   custom_fields: [
      {
         id: 146,
         name: "Due",
         type: "E"
      },
      {
         id: 143,
         name: "Priority",
         type: "D",
         params: {
            options: [
               "Moderate",
               "High",
               "Critical"
            ]
         }
      }
   ],
   custom_fieldsets: [
      {
         id: "1",
         name: "Billing",
         owner__context: "cerberusweb.contexts.group",
         owner_id: "5",
         custom_fields: [
            {
               id: 14,
               name: "Invoice #",
               type: "S"
            }
         ]
      },
      {
         id: "45",
         name: "Impact",
         owner__context: "cerberusweb.contexts.group",
         owner_id: "2",
         custom_fields: [
            {
               id: 166,
               name: "Severity",
               type: "D",
               params: {
                  options: [
                     "4 - Suggestion",
                     "3 - Need assistance",
                     "2 - Something isn't right",
                     "1 - Urgent"
                  ],
                  context: "cerberusweb.contexts.activity_log"
               }
            }
         ]
      }
   ]
}</code>
</pre>

### Retrieving custom fields on records

Custom fields can be retrieved on records using key expansion in `GET` requests:

<pre>
<code class="language-http">
GET /rest/records/tickets/123.json?expand=custom_
</code>
</pre>

The *keys* for custom fields are in the format `custom_123`, where `123` is the ID.  The labels and types of each custom field are in the `_labels` and `_types` keys respectively.

### Retrieving custom fields on search results

Custom fields can be retrieved in search results using key expansion in `POST` requests:

<pre>
<code class="language-http">
POST /rest/records/tickets/search.json
Content-Type: application/x-www-form-urlencoded; charset=utf-8

expand=custom_&q=subject:Receipt*
</code>
</pre>

When using an official library, the requests look like:

<pre>
<code class="language-php">
$postfields = array(
    array('expand','custom_'),
    array('q','subject:Receipt*'),
    array('sortBy','created'),
    array('sortAsc','0'),
    array('page','1'),
);
$out = $cerb->post($base_url . 'records/tickets/search.json', $postfields);
</code>
</pre>

The *keys* for custom fields are in the format `custom_123`, where `123` is the ID.  The labels and types of each custom field are in the `results_meta` key.

### Setting custom fields on records

Custom fields can be set on records in `PUT` requests:

<pre>
<code class="language-http">
PUT /rest/records/tickets/123.json?expand=custom_
Content-Type: application/x-www-form-urlencoded; charset=utf-8

fields[custom_14]=CERB-1234&fields[custom_143]=Critical
</code>
</pre>

When using an official library, the requests look like:

<pre>
<code class="language-php">
$putfields = array(
    array('fields[custom_14]','CERB-1234'),
    array('fields[custom_143]','Critical'),
);
$out = $cerb->put($base_url . 'records/tickets/123.json?expand=custom_', $putfields);
</code>
</pre>

Each custom field value is sent as a form field in the format `fields[custom_123]=value`, where `123` is the ID, and `value` is determined by the [custom field type](#field-types).
