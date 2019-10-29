---
title: >-
  Bot Action: Execute classifier prediction
permalink: /docs/bots/events/actions/core.va.action.classifier_prediction/
toc:
  expand: Bots
jumbotron:
  title: >-
    Execute classifier prediction
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
    label: Actions &raquo;
    url: /docs/bots/events/
---

|---
|-|-
| **Identifier (ID):** | core.va.action.classifier_prediction
| **Event:** | (All)

### Params

|---
| Req'd | Key | Type | Notes 
|:-:|-|-|-
| **x** | `classifier_id` | id | The ID of the [classifier](/docs/records/types/classifier/) to use
| **x** | `content` | text | The text to give the classifier
|  | `object_placeholder` | placeholder | The placeholder to set with the classifier results
