---
title: "projectBoard.renderCard"
#excerpt: 
#social_image_url: /assets/images/search/kata.png
permalink: /docs/automations/triggers/projectBoard.renderCard/
toc:
  title: projectBoard.renderCard
  expand: Automations
jumbotron:
  title: projectBoard.renderCard
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

{% include docs/note_preview.html %}

**projectBoard.renderCard** [automations](/docs/automations/) are triggered when a card is displayed on a [project board](/docs/project-boards/).

This trigger uses [event handler](/docs/automations/#event-handlers) KATA, and the first enabled automation is executed.

For instance, the match can be based on the record type of the card. The output is sheet KATA describing the card's layout.

* TOC
{:toc}

# Inputs

The automation [dictionary](/docs/automations/#dictionaries) starts with the following values:

| Key | Type | Notes
|-|-|-
| `board_*` | record | The [project board](/docs/records/types/project board/). Supports key expansion.
| `card_*` | record | The card record. Supports key expansion.
| `inputs` | dictionary | [Custom input](/docs/automations/#inputs) values from the caller
| `worker_*` | record | The active [worker](/docs/records/types/worker/)

# Outputs

## return:

| Key | Type | Notes
|-|-|-
| `sheet` | string | A [sheet schema](/docs/sheets/) to display for the card
