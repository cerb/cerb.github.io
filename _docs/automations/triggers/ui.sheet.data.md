---
title: "ui.sheet.data"
#excerpt: 
#social_image_url: /assets/images/search/kata.png
permalink: /docs/automations/triggers/ui.sheet.data/
toc:
  title: ui.sheet.data
  expand: Automations
jumbotron:
  title: ui.sheet.data
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

**ui.sheet.data** [automations](/docs/automations/) are triggered when a sheet requests dynamic data.

This trigger uses [event handler](/docs/automations/#events) KATA, and the first enabled automation is executed.

* TOC
{:toc}

# Inputs

The automation [dictionary](/docs/automations/#dictionaries) starts with the following values:

| Key | Type | Notes
|-|-|-
| `inputs` | dictionary | [Custom input](/docs/automations/#inputs) values from the caller
| `sheet_filter` | text | The optional text to filter results by (if `schema:layout:filtering:` is enabled)
| `sheet_limit` | number | The number of results per page
| `sheet_page` | number | The zero-based current page of the sheet (if `schema:layout:paging:` is enabled)

# Outputs

## return:

| Key | Type | Notes
|-|-|-
| `data` | dictionaries | An array of dictionaries
| `total` | number | The total number of records (without paging)
