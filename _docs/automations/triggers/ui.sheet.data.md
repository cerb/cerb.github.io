---
title: ui.sheet.data
excerpt: This page provides detailed information about the "ui.sheet.data" automations
  in Cerb, which are triggered when a sheet requests dynamic data.
summary: This page provides detailed information about the "ui.sheet.data" automations
  in Cerb, which are triggered when a sheet requests dynamic data. It explains the
  use of event handler KATA, where the first enabled automation is executed. The page
  outlines the structure of the automation dictionary, including inputs such as custom
  input values, optional text for filtering results, the number of results per page,
  and the current page of the sheet. It also describes the expected outputs, which
  include an array of dictionaries representing the data and the total number of records
  without paging.
permalink: /docs/automations/triggers/ui.sheet.data/
toc:
  title: ui.sheet.data
  expand: Automations
jumbotron:
  title: ui.sheet.data
  tagline: ~
  breadcrumbs:
  - label: Docs &raquo;
    url: /docs/home/
  - label: Automations &raquo;
    url: /docs/automations/
  - label: Triggers &raquo;
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
