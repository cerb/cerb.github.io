---
title: Button prompts in interactive bot behaviors
excerpt: 
permalink: /docs/bots/interactions/prompts/buttons/
toc:
  title: Buttons
jumbotron:
  title: Buttons
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

When prompting with **buttons**, the user selects from a list of pre-defined responses.

<div class="cerb-screenshot">
<img src="/assets/images/guides/bots/prompts/prompt-buttons.png" class="screenshot">
</div>

In a conversational bot behavior, add the **Prompt With >> Buttons** action.

<div class="cerb-screenshot">
<img src="/assets/images/guides/bots/prompts/prompt-type-buttons.png" class="screenshot">
</div>

### Options

A list of pre-defined responses that will be displayed as buttons. One response per line. You can use [scripting](/docs/bots/scripting/) to build the list.

### Colors

You can configure a color gradient to automatically style the buttons.

For instance, a satisfaction survey asking about sentiment could start green (positive) and end red (negative).

### Custom CSS style

You can include custom CSS rules to further style the buttons. In the example above, we're configuring a fixed width and allowing the buttons to display _inline_ (i.e. adjacent rather than stacked).

### Save to a placeholder

Name a [placeholder](/docs/bots/scripting/placeholders/) where a copy of the user's response will be saved. You can then later refer to this answer when making decisions or giving responses.

### Format

See: [Formatting](/docs/bots/interactions/prompts/formatting/)

### Validate

See: [Validation](/docs/bots/interactions/prompts/validation/)

{% comment %}
## Tips for button prompts

* [Build a button prompt from a picklist custom field](/tips/404/).
{% endcomment %}