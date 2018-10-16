---
title: Images prompts in interactive bot behaviors
excerpt: 
permalink: /docs/bots/interactions/prompts/images/
toc:
  title: Images
jumbotron:
  title: Images
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

When [prompting](/docs/bots/interactions/prompts/) with **images**, the user selects from a pre-defined list of responses represented by images.

<div class="cerb-screenshot">
<img src="/assets/images/guides/bots/prompts/prompt-images.png" class="screenshot">
</div>

In a conversational bot behavior, add the **Prompt With >> Images** action.

<div class="cerb-screenshot">
<img src="/assets/images/guides/bots/prompts/prompt-type-images.png" class="screenshot">
</div>

### Images

Click the **(+)** icon to add a new image-based response. Each response includes an image and a label.
  * **Image:** Upload or generate an image.
  * **Label:** Add a label for this image. This is the text response that will be sent when this image is selected.

### Save to a placeholder

Name a [placeholder](/docs/bots/scripting/placeholders/) where a copy of the user's response will be saved. You can then later refer to this answer when making decisions or giving responses.

### Format

See: [Formatting](/docs/bots/interactions/prompts/formatting/)

### Validate

See: [Validation](/docs/bots/interactions/prompts/validation/)
