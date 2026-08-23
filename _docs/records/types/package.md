---
title: Package Records
excerpt: This page provides detailed information about the structure and functionality
  of Package Records in Cerb.
summary: This page provides detailed information about the structure and functionality
  of Package Records in Cerb. It outlines the fields available in the Records API,
  including required fields like name, package_json, point, and uri, as well as optional
  fields such as description, image, and links. The page also describes dictionary
  placeholders used in automations, snippets, and API responses, offering a comprehensive
  list of fields and their types. Additionally, it covers search query fields that
  can be used to filter package records and lists the columns available in package
  worklists, providing a complete guide for managing and utilizing package records
  within the Cerb platform.
permalink: /docs/records/types/package/
toc:
  title: Package
  expand: Records
jumbotron:
  title: Package
  tagline: ~
  breadcrumbs:
  - label: Docs &raquo;
    url: /docs/home/
  - label: Records &raquo;
    url: /docs/records/
  - label: Types &raquo;
    url: /docs/records/types/
---

|---
|-|-
| **Name (singular):** | Package
| **Name (plural):** | Packages
| **Alias (uri):** | package
| **Identifier (ID):** | cerberusweb.contexts.package.library

* TOC
{:toc}

### Records API

These fields are available in the [Records API](/docs/api/endpoints/records/) and [packages](/docs/packages/):

|---
| Req'd | Field | Type | Notes
|:-:|-|-|-
|   | `description` | [text](/docs/records/fields/types/text/) | A description of this library package's contents 
|   | `image` | [image](/docs/records/fields/types/image/) | The library tile art. Either an image base64-encoded in [data URI format](https://en.wikipedia.org/wiki/Data_URI_scheme), or an [art spec](#tile-art) naming a Cerb icon and its colors 
|   | `links` | [links](/docs/records/fields/types/links/) | An array of record `type:id` tuples to link to. Prefix with `-` to unlink. 
| **x** | **`name`** | [text](/docs/records/fields/types/text/) | The name of this package 
| **x** | **`package_json`** | [text](/docs/records/fields/types/text/) |  
| **x** | **`point`** | [text](/docs/records/fields/types/text/) | The library section containing this package 
|   | `updated_at` | [timestamp](/docs/records/fields/types/timestamp/) | The date/time when this record was last modified 
| **x** | **`uri`** | [text](/docs/records/fields/types/text/) | The unique identifier of this package 

### Tile art

A package's `image` can name a [Cerb icon](/docs/developers/icons/) and the colors it's painted in, instead of carrying an embedded image. That's how a package tile in the library, and in the Add-tab and Add-widget choosers, can match the thing it installs.

An art spec is up to three space-delimited words:

{% highlight text %}
<icon> [background] [foreground]
{% endhighlight %}

| Written                    | Result                                            |
|----------------------------|---------------------------------------------------|
| `todo`                     | The icon on a neutral gray                        |
| `todo #7f7f7f`             | The icon on the background you named              |
| `todo #7f7f7f #ffffff`     | Both the background and the glyph color           |
| `todo auto #d62728`        | A glyph color with the background left at default |
| `todo #eeeeee:#333333`     | One background in the light theme, another in dark |

A color is `#rgb` or `#rrggbb`. Either color can be a `light:dark` pair, and a color with no pair is used in both themes. The word `auto` holds a slot at its default, which is how you set a foreground without pinning a background.

Anything unusable falls back on its own slot's default, so an unrecognized icon name still lets your colors through and a malformed color still lets your icon through. The default background is a neutral gray that follows the theme, and the default glyph color is whichever of near-black or white reads better on the background behind it.

### Dictionary Placeholders

These [placeholders](/docs/scripting/variables/#placeholders) are available in [dictionaries](/docs/guide/developers/dictionaries/) for [automations](/docs/automations/), [snippets](/docs/snippets/), and [API](/docs/api/) responses:

|---
| Field | Type | Description
|-|-|-
| `_context` | text | [Record type](/docs/records/types/) extension ID
| `_label` | text | Label
| `_type` | text | [Record type](/docs/records/types/) alias
| `description` | text | Description
| `id` | number | Id
| `name` | text | Name
| `point` | text | Extension Point
| `record_url` | text | Record Url
| `updated_at` | date | Updated
| `uri` | text | Uri

These optional placeholders are also available with **key expansion** in [dictionaries](/docs/guide/developers/dictionaries/#key-expansion) and the [API](/docs/api/responses/#expanding-keys-in-api-requests):

|---
| Field | Type | Description
|-|-|-
| `comment_count` | number | [Comment](/docs/records/types/comment/) count on the record
| `comments` | comments | [Comments](/docs/guide/developers/dictionaries/#key-expansion)
| `links` | links | [Links](/docs/guide/developers/dictionaries/#key-expansion)
	
### Search Query Fields

These [filters](/docs/search/#filters) are available in package [search queries](/docs/search/):

|---
| Field | Type | Description
|-|-|-
| `description:` | [text](/docs/search/#text) | Description
| `fieldset:` | [record](/docs/search/#deep-search) | [Fieldset](/docs/records/types/custom_fieldset/)
| `id:` | [number](/docs/search/#numbers) | Id
| `links:` | [links](/docs/search/#links) | Record Links
| `name:` | [text](/docs/search/#text) | Name
| `point:` | [text](/docs/search/#text) | Extension Point
| `updated:` | [date](/docs/search/#dates) | Updated
| `uri:` | [text](/docs/search/#text) | Uri
	
### Worklist Columns

These columns are available on package [worklists](/docs/worklists/):

|---
| Column | Description
|-|-
| `p_description` | Description
| `p_id` | Id
| `p_name` | Name
| `p_point` | Extension Point
| `p_updated_at` | Updated
| `p_uri` | Uri

<div class="section-nav">
	<div class="left">
		<a href="/docs/records/types/" class="prev">&lt; Record Types</a>
	</div>
	<div class="right align-right">
	</div>
</div>
<div class="clear"></div>