---
title: "Data Queries: Attachment Manifest"
excerpt: 
permalink: /docs/data-queries/attachment/manifest/
social_image_url: /assets/images/docs/data-queries/data-queries.png
toc:
  title: Attachment Manifest
jumbotron:
  title: Attachment Manifest
  tagline: 
  breadcrumbs:
  -
    label: Docs &raquo;
    url: /docs/home/
  -
    label: Data Queries &raquo;
    url: /docs/data-queries/
---

# attachment.manifest
{: .no_toc}

`attachment.manifest` queries list files within an archive attachment (e.g. `.zip`).

# Inputs

|---
|Key|Description
|-|-
|`filter:`| An optional pattern to match on returned paths and files. (e.g. `*.png`, `/example/path/*`)
|`format:`| Must be `dictionaries` (default) or omitted
|`id:`| The `id` of an [attachment](/docs/records/types/attachment/) record to inspect (must be an archive)
|`limit:`| The number of file paths to return (defaults to `1000`)
|`offset:`| The file path to start returning from (defaults to `0`)

# Response Formats

The results can be returned in these formats:

* **dictionaries** (default) returns a table-based format suitable for [sheets](/docs/sheets/) and API results.

# Examples

<pre>
<code class="language-cerb">
{% raw %}
type:attachment.manifest
filter:*.xml
id:123
limit:100
format:dictionaries
{% endraw %}
</code>
</pre>