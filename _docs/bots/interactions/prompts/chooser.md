---
title: Chooser prompts in interactive bot behaviors
excerpt: 
permalink: /docs/bots/interactions/prompts/chooser/
toc:
  title: Chooser
jumbotron:
  title: Chooser
  tagline: 
  breadcrumbs:
  -
    label: Docs &raquo;
    url: /docs/home/
  -
    label: Bots &raquo;
    url: /docs/bots/
  -
    label: Interactions &raquo;
    url: /docs/bots/interactions/
  -
    label: Prompts &raquo;
    url: /docs/bots/interactions/prompts/
---

When [prompting](/docs/bots/interactions/prompts/) with a **chooser**, the user selects one or more existing [records](/docs/records/) using a helper popup or autocomplete text box.

Chooser prompts are currently only available on [worker](/docs/workers/)-based [interactions](/docs/bots/interactions/).

<div class="cerb-screenshot">
<img src="/assets/images/guides/bots/prompts/prompt-chooser.png" class="screenshot">
</div>

In a conversational bot behavior, add the **Prompt With >> Chooser** action.

<div class="cerb-screenshot">
<img src="/assets/images/guides/bots/prompts/prompt-type-chooser.png" class="screenshot">
</div>

### Type

The [record](/docs/records/) type to be selected.

### Query

The default [query](/docs/search/) to pre-filter records in the chooser popup.

### Selection

If selecting a single record, the popup will automatically close after the first selection. Otherwise the user is able to select multiple records.

### Autocomplete

If enabled, an autocomplete textbox will be added to the chooser button. This is useful if the user may already know what they want to select, as they can bypass the chooser popup.

### Save to a placeholder

Name a [placeholder](/docs/bots/scripting/placeholders/) where a copy of the user's response will be saved. You can then later refer to this answer when making decisions or giving responses.

If the name your placeholder ends with `_id` then all of the placeholders for the selected record will be available.

For instance, a placeholder like `prompt_worker_id` will be able to use `prompt_worker__label` and `prompt_worker_first_name`.