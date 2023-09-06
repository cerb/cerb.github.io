---
title: "ui.widget"
#excerpt: 
#social_image_url: /assets/images/search/kata.png
permalink: /docs/automations/triggers/ui.widget/
toc:
  title: ui.widget
  expand: Automations
jumbotron:
  title: ui.widget
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

**ui.widget** [automations](/docs/automations/) allow custom output to be implemented for card, profile, or workspace widgets. This replaces bot behavior-based widgets, which are now deprecated.

This trigger uses [event handler](/docs/automations/#events) KATA, and the first enabled automation is executed.

* TOC
{:toc}

# Inputs

The automation [dictionary](/docs/automations/#dictionaries) starts with the following values:

| Key        | Type       | Notes                                                                                                                                                                                      |
|------------|------------|--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| `inputs`   | dictionary | [Custom input](/docs/automations/#inputs) values from the caller                                                                                                                           |
| `record_*` | record     | The current [record](/docs/records/types/) dictionary (supports key expansion). Only available on card and profile widgets.                                                                |
| `widget_*` | record     | The [card](/docs/records/types/card_widget/), [profile](/docs/records/types/profile_widget/), or [workspace](/docs/records/types/workspace_widget/) widget record (supports key expansion) |
| `worker_*` | record     | The current [worker](/docs/records/types/worker/) record (supports key expansion)                                                                                                          |

# Outputs

## return:

| Key | Type | Notes
|-|-|-
| `html` | text | The HTML to render for the widget
