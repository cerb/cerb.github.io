---
title: Contexts
excerpt: This webpage provides detailed API documentation for Cerb, focusing on managing
  record types, activity logs, and links.
summary: This webpage provides detailed API documentation for Cerb, focusing on managing
  record types, activity logs, and links. It explains how to retrieve a list of object
  contexts, including those contributed by plugins, using the GET method. The page
  also covers how to list and create activity log events, detailing the necessary
  fields and data formats for creating log entries. Additionally, it describes how
  to add and remove links between context records using POST requests, with examples
  illustrating the process for both linking and unlinking records. The documentation
  is aimed at developers looking to integrate or extend Cerb's functionality through
  its REST API.
permalink: /docs/api/endpoints/contexts/
toc:
  expand: API
jumbotron:
  title: Contexts
  tagline: ""
  breadcrumbs:
  - label: Docs &raquo;
    url: /docs/home/
  - label: API &raquo;
    url: /docs/api/
  - label: Endpoints &raquo;
    url: /docs/api/endpoints/
---

* TOC
{:toc}

# Record Types

## List

**GET /rest/contexts/list.json**

Retrieve a list of object contexts with IDs, names, custom fields and fieldsets.  This includes object contexts contributed by [plugins](/docs/plugins/).

**Example:**

{% highlight http %}
GET /rest/contexts/list.json  
Host: cerb.example  
Authorization: Bearer <token>  
{% endhighlight %}

# Activity Log

## List Events

**GET /rest/contexts/activity/events.json**

Retrieve a list of activity log event IDs and names, including those contributed by [plugins](/docs/plugins/).

**Example:**

{% highlight http %}
GET /rest/contexts/activity/events.json  
Host: cerb.example  
Authorization: Bearer <token>  
{% endhighlight %}

## Create

**POST /rest/contexts/activity/create.json**

Create an activity log entry.

|---
| Field | Type | 
|-|-|-
| `on` | string
| `activity_point` | string
| `variables` | JSON array
| `urls` | JSON array

* The `on` field should be a target record in `context:context_id` format.

* The `activity_point` field contains an activity ID from List Events request above.  You can implement new Activity Log events in the `<activity_points>` section of a [plugin.xml](/docs/plugins/) manifest.

* The `variables` field should be a JSON encoded array, where the key is a placeholder in the activity log message and the value is the text to substitute.

* The `urls` field is an option JSON encoded array, where the key is a placeholder in the activity log message and the value is the URL to use for hyperlinking the text.

<div class="cerb-box note">
{% raw %}
	<p>You do not need to provide a value for <tt>{{actor}}</tt> in <tt>variables</tt> or <tt>urls</tt> since this is handled automatically by Cerb.</p>
{% endraw %}
</div>

**Example:**

{% highlight http %}
POST /rest/contexts/activity/create.json
Host: cerb.example
Authorization: Bearer <token>

on=cerberusweb.contexts.worker:2
&activity_point=example.worker_high_five
&variables={"target":"Dan Hildebrandt"}
&urls={"target":"ctx://cerberusweb.contexts.worker:2"}
{% endhighlight %}

# Links

## Link

**POST /rest/contexts/link.json**

Add any number of links to one context record.

|---
| Field | Type | 
|-|-|-
| `on` | string
| `targets` | JSON array string

**Example:**

{% highlight php %}
POST /rest/contexts/link.json
Host: cerb.example
Authorization: Bearer <token>

on=cerberusweb.contexts.ticket:1148
&targets=["cerberusweb.contexts.org:17581","cerberusweb.contexts.address:5447"]
{% endhighlight %}

## Unlink

**POST /rest/contexts/unlink.json**

Remove any number of links from one context record.

|---
| Field | Type | 
|-|-|-
| `on` | string
| `targets` | JSON array string

**Example:**

{% highlight http %}
POST /rest/contexts/unlink.json
Host: cerb.example
Authorization: Bearer <token>

on=cerberusweb.contexts.ticket:1148
&targets=["cerberusweb.contexts.org:17581"]
{% endhighlight %}
