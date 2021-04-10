---
title: "Interaction Caller: cerb.toolbar.projectBoardColumn"
#excerpt: 
#social_image_url: /assets/images/search/kata.png
permalink: /docs/automations/triggers/interaction.worker/callers/cerb.toolbar.projectBoardColumn/
toc:
  title: cerb.toolbar.projectBoardColumn
  expand: Automations
jumbotron:
  title: cerb.toolbar.projectBoardColumn
  tagline: 
  breadcrumbs:
  -
    label: Docs &raquo;
    url: /docs/home/
  -
    label: Automations &raquo;
    url: /docs/automations/
  -
    label: interaction.worker &raquo;
    url: /docs/automations/triggers/interaction.worker/
  -
    label: Callers &raquo;
    url: /docs/automations/triggers/interaction.worker/#callers
---

# Parameters

The following `caller_params` are passed to the [interaction](/docs/automations/triggers/interaction.worker/):

| Key | Type | 
|-|-|-
| **`board_id`** | record | The ID of the [project board](/docs/records/types/project-board/)
| **`column_id`** | record | The ID of the project board column

# return:

The caller doesn't expect a `return:` dictionary.

The project board column is always refreshed after the interaction ends.