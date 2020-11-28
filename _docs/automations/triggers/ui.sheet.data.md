---
title: "ui.sheet.data"
#excerpt: 
#social_image_url: /assets/images/search/kata.png
permalink: /docs/automations/triggers/ui.sheet.data/
toc:
  title: ui.sheet.data
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

This trigger uses [event handler](/docs/automations/#event-handlers) KATA, and the first enabled automation is executed.

* TOC
{:toc}

# Inputs

The automation [dictionary](/docs/automations/#dictionaries) starts with the following values:

| Key | Type | Notes
|-|-|-
| `inputs` | dictionary | [Custom input](/docs/automations/#inputs) values from the caller

# Outputs

## return:

| Key | Type | Notes
|-|-|-
| `data` | dictionaries | An array of dictionaries
| `paging` | dictionary | Paging metadata
