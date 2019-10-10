---
title: >-
  Bot Action: Respond with sheet
permalink: /docs/bots/events/event.form.interaction.worker/actions/respond_sheet/
toc:
  expand: Bots
jumbotron:
  title: >-
    Respond with sheet
  tagline: 
  breadcrumbs:
  -
    label: Docs &raquo;
    url: /docs/home/
  -
    label: Bots &raquo;
    url: /docs/bots/
  -
    label: Events &raquo;
    url: /docs/bots/events/
  -
    label: >-
      Form interaction &raquo;
    url: /docs/bots/events/event.form.interaction.worker/
  -
    label: Actions &raquo;
    url: /docs/bots/events/event.form.interaction.worker/#event-actions
---

|---
|-|-
| **Identifier (ID):** | respond_sheet
| **Event:** | event.form.interaction.worker

### Params

|---
| Req'd | Key | Type | Notes
|:-:|-|-|-
| **x** | `data_query` | text | The [data query](/docs/data-queries/) to run
|  | `placeholder_simulator_yaml` | yaml | The test placeholder values when using the simulator
| **x** | `sheet_yaml` | yaml | The [sheet](/docs/sheets/) schema to display
