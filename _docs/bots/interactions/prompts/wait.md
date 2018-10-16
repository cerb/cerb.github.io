---
title: Wait prompts in interactive bot behaviors
excerpt: 
permalink: /docs/bots/interactions/prompts/wait/
toc:
  title: Wait
jumbotron:
  title: Wait
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

The **wait** [prompt](/docs/bots/interactions/prompts/) is useful when your bot needs to run a potentially long-running [action](/docs/bots/behaviors/actions/) (e.g. remote API call) and you'd like to warn the user first.

Rather than leaving the working watching a loading spinner without an explanation, the bot can say _"Let me check on that for you. This may take a moment..."_, wait, and then run the action.

<div class="cerb-screenshot">
<img src="/assets/images/guides/bots/prompts/prompt-wait.png" class="screenshot">
</div>

In a conversational bot behavior, add the **Prompt With >> Wait** action.

<div class="cerb-screenshot">
<img src="/assets/images/guides/bots/prompts/prompt-type-wait.png" class="screenshot">
</div>

You don't need to configure anything for a wait prompt.

However, you can get creative with the responses that precede it. Using the [random()](/docs/bots/scripting/functions/#random) function will add some variety to your bot.
