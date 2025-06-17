---
title: Export worklist records with a custom schema
excerpt: Export record fields to JSONL or CSV using a custom schema and scripting.
summary: This page provides a detailed guide on how to export worklist records from Cerb
  with a custom schema, specifically focusing on exporting data about PNG image
  attachments from tickets created in the past 90 days. It explains how to filter the
  attachment worklist using a search query, select an output format like CSV or JSONL, 
  and use Export KATA to define a custom export schema. The guide includes examples of 
  how to format fields such as creation date, ticket URL, and filename, and explains the 
  use of the `value@raw:` annotation for placeholder evaluation. Additionally, it offers
  tips on converting dates into human-readable formats and references the documentation
  for dictionary placeholders for each record type.
layout: integration
topic: Import/Export
permalink: /guides/impex/export-worklist-records/
jumbotron:
  title: Export worklist records with a custom schema
  breadcrumbs:
  - label: Resources &raquo;
    url: /resources/
  - label: Guides &raquo;
    url: /resources/guides/
  - label: Import/Export &raquo;
    url: /resources/guides/#impex
---

<p class="youtube-video-container"><iframe width="1040" height="585" src="https://www.youtube.com/embed/Q3-XkH6s4qU" title="" frameBorder="0"  allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" allowFullScreen></iframe></p>

You can transform and export data directly from Cerb into common formats expected by other apps and services (e.g. JSONL for training Hugging Face models).

In this example we'll export information about PNG image attachments on the past 90 days of tickets.

From **Search >> Attachments**, run a [search query](/docs/search/) to filter an attachment [worklist](/docs/worklists/).

For instance, PNG images attached to messages within tickets created in the past 90 days:

{% highlight json %}
name:*.png on.message:(ticket:(created:"-90 days"))
{% endhighlight %}

Click on the export icon in the top right of the worklist.

<div class="cerb-screenshot">
<img src="/assets/images/common/worklists/worklist-export.png" class="screenshot">
</div>

Select an output format in **Export rows as:**. Common formats are CSV or JSONL.

Select the **Build** tab.

You can use Export KATA to define a custom export schema, allowing you to format or generate fields using [scripting](/docs/scripting/).

For instance, the following Export KATA includes:

* A creation date (as a Unix timestamp)
* The URL of the first ticket linked to each attachment
* The filename

{% highlight cerb %}
{% raw %}
column/updated:
  label: Created

column/ticket_url:
  label: Ticket URL
  value@raw: {{on|filter((record) =>'message' == record._type)|first.ticket_record_url}}

column/name:
  label: Filename
{% endraw %}
{% endhighlight %}

The `value@raw:` annotation is used to delay evaluation of placeholders until each row is exported. Without the `@raw` annotation, a placeholder would be evaluated when the KATA is first read and its value would be the same for each record.

Click on the **Export** button to export the worklist results to your desired format using the schema.

You can optionally use the [\|date](/docs/scripting/filters/#date) filter to convert the date into a human-readable format:

{% highlight cerb %}
{% raw %}
column/updated:
  label: Created
  value@raw: {{updated|date('Y-m-d H:i:s')}}
{% endraw %}
{% endhighlight %}

You can find the dictionary placeholders for each [record type](/docs/records/types/) in the docs.