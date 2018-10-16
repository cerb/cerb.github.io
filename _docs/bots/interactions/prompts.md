---
title: Prompts in interactive bot behaviors
excerpt: 
permalink: /docs/bots/interactions/prompts/
toc:
  title: Prompts
jumbotron:
  title: Prompts
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
---

{% comment %}
- interaction points / params
- sessions
- respond with
- delay
- prompts: types, formats, validation
{% endcomment %}

<div class="cerb-screenshot">
<img src="/assets/images/guides/bots/prompts/prompts.png" class="screenshot">
</div>

[Chat bots](/docs/bots/interactions/) use **prompts** to ask for user input. The conversational [behavior](/docs/bots/behaviors/) will pause at that point until the user responds.

{% comment %}
You can format, validate, and save a response within the prompt action itself.

Here's an example prompt that asks a user to choose a number between 1 and 100:

<div class="cerb-screenshot">
<img src="/assets/images/guides/bots/prompts/behavior-action-prompt.png" class="screenshot">
</div>

This might look a little complicated at first -- it's packing a lot of functionality into a few free-form options.

Let's look at each of these options in detail.
{% endcomment %}

Rather than always requiring the user to type an answer, prompts make it easier for them to respond in the right format.

There are different types of prompts available depending on the information your bot needs to collect.

The response to a prompt can determine the next step in a bot's behavior.

<div class="cerb-screenshot">
<img src="/assets/images/guides/bots/prompts/prompt-types.png" class="screenshot">
</div>

## Resources

You can import the [Prompt Bot](/packages/prompt-bot/) package with working examples.