---
title: Date input prompts in interactive bot behaviors
excerpt: 
permalink: /docs/bots/interactions/prompts/date-input/
toc:
  title: Date Input
jumbotron:
  title: Date Input
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

When [prompting](/docs/bots/interactions/prompts/) with a **date input**, the user can enter an absolute (`2020-12-31 08:00`) or relative (`tomorrow 8am`) date. A calendar popup can also be used to select a specific date.

If a relative date is given, it is automatically converted into an absolute date before sending.  This ensures that the bot is always receiving the response to a date prompt in a consistent format.

<div class="cerb-screenshot">
<img src="/assets/images/guides/bots/prompts/prompt-date.png" class="screenshot">
</div>

In a conversational bot behavior, add the **Prompt With >> Date Input** action.

<div class="cerb-screenshot">
<img src="/assets/images/guides/bots/prompts/prompt-type-date.png" class="screenshot">
</div>

### Placeholder

The instructive text shown in the date prompt before any text is entered.

### Default

The default text in the date prompt.

### Save to a placeholder

Name a [placeholder](/docs/bots/scripting/placeholders/) where a copy of the user's response will be saved. You can then later refer to this answer when making decisions or giving responses.

### Format

See: [Formatting](/docs/bots/interactions/prompts/formatting/)

### Validate

See: [Validation](/docs/bots/interactions/prompts/validation/)
