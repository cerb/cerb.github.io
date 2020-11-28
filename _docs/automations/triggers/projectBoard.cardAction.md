---
title: "projectBoard.cardAction"
#excerpt: 
#social_image_url: /assets/images/search/kata.png
permalink: /docs/automations/triggers/projectBoard.cardAction/
toc:
  title: projectBoard.cardAction
jumbotron:
  title: projectBoard.cardAction
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

**projectBoard.cardAction** [automations](/docs/automations/) are triggered when a [project board](/docs/project-boards/) card enters a new board column, either through the UI or procedurally. 

This trigger uses [event handler](/docs/automations/#event-handlers) KATA, and all enabled automations are executed.

* TOC
{:toc}

# Inputs

The automation [dictionary](/docs/automations/#dictionaries) starts with the following values:

| Key | Type | Notes
|-|-|-
| `board_*` | record | The [project board](/docs/records/types/project board/). Supports key expansion.
| `card_*` | record | The card record. Supports key expansion.
| `column_*` | record | The [project board column](/docs/records/types/project board_column/). Supports key expansion.
| `inputs` | dictionary | [Custom input](/docs/automations/#inputs) values from the caller
| `worker_*` | record | The active [worker](/docs/records/types/worker/)

# Outputs

## return:

This trigger doesn't expect any `return:` keys.