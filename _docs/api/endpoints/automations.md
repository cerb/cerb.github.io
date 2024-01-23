---
title: Automations
permalink: /docs/api/endpoints/automations/
toc:
  expand: API
jumbotron:
  title: Automations
  tagline: ""
  breadcrumbs:
  -
    label: Docs &raquo;
    url: /docs/home/
  -
    label: API &raquo;
    url: /docs/api/
  -
    label: Endpoints &raquo;
    url: /docs/api/endpoints/
---

# Search logs

(Available in [10.4.9](/releases/10.4.9/) or later)

**GET /rest/automations/logs/search.json**

Search automation logs.

## Parameters
{:.no_toc}

|---
| Field | Description | Type
|-|-|-
| `limit` | The number of results to display per page | integer
| `page` | The page of results to display given limit | integer
| `q` | Filters to add using a [search query](/docs/search/) | string

### Query filters

|---
| Filter | Type | Description 
|-|-|-
| `automation:(name:)` | [text](/docs/search/#text) | The [automation](/docs/automations/) that output the log entry.
| `automation:(node:)` | [text](/docs/search/#text) | The path to the `log:` action in the [automation](/docs/automations/).
| `created:` | [date](/docs/search/#dates) | The date of the log entry.
| `id:` | [number](/docs/search/#numbers) | The log entry ID (useful for pagination).
| `level:` | [text](/docs/search/#text) | The severity of the log entry: `error`, `warning`, or `debug`. Match multiple like `level:[warning,error]` or exclude `level:!debug`.
| `message:` | [text](/docs/search/#text) | Match the automation log message with `*` wildcards.

## Example
{:.no_toc}

<pre>
<code class="language-php">
$out = $cerb->get($base_url . 'automation/logs/search.json?q=level:error');
</code>
</pre>
