---
title: "data.query"
#excerpt: 
#social_image_url: /assets/images/search/kata.png
permalink: /docs/automations/triggers/data.query/
toc:
  title: data.query
  expand: Automations
jumbotron:
  title: data.query
  tagline: 
  breadcrumbs:
  -
    label: Docs &raquo;
    url: /docs/home/
  -
    label: Automations &raquo;
    url: /docs/automations/
  -
    label: Triggers &raquo;
    url: /docs/automations/#triggers
---

**data.query** [automations](/docs/automations/) generate custom data query results for an [automation.invoke](/docs/data-queries/automation/invoke/) data query.

For instance: reading from a resource file, fetching from an external API, post-processing search results, etc.

It's now possible to work with third-party data sources in any feature that supports data queries (sheets, charts, etc).

# Inputs

The automation [dictionary](/docs/automations/#dictionaries) starts with the following values:

| Key | Type | Notes
|-|-|-
| `inputs` | dictionary | [Custom input](/docs/automations/#inputs) values from the caller
| `query_format` | string | The requested query results format (e.g. `format:dictionaries`) 

# Outputs

## return:

|---
| Key |
|-|-
| `data:` | The results of the data query.

The format of `data:` will depend on the given `query_format`.

For instance, the `dictionaries` format is an array of dictionaries, like:

<pre>
<code class="language-cerb">
{% raw %}
return:
  data:
    0:
      id: 1
      name: Record 1
    1:
      id: 2
      name: Record 2
{% endraw %}
</code>
</pre>

More complex values can be returned using the `@json` or `@key` annotations.