---
title: File upload prompts in interactive bot behaviors
excerpt: 
permalink: /docs/bots/interactions/prompts/file-upload/
toc:
  title: File Upload
jumbotron:
  title: File Upload
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

When [prompting](/docs/bots/interactions/prompts/) with a **file upload**, the user selects a file from their computer to share with the bot.

File upload prompts are currently only available in [worker](/docs/workers/)-based [interactions](/docs/bots/interactions/).

<div class="cerb-screenshot">
<img src="/assets/images/guides/bots/prompts/prompt-file.png" class="screenshot">
</div>

In a conversational bot behavior, add the **Prompt With >> File Upload** action.

<div class="cerb-screenshot">
<img src="/assets/images/guides/bots/prompts/prompt-type-file.png" class="screenshot">
</div>

### Save to a placeholder

Name a [placeholder](/docs/bots/scripting/placeholders/) where a copy of the user's response will be saved. You can then later refer to this answer when making decisions or giving responses.

If the name your placeholder ends with `_id` then all of the placeholders for the uploaded file will be available.

For instance, a placeholder like `prompt_file_id` will be able to use `prompt_file_size` and `prompt_file_mime_type`.

### Format

See: [Formatting](/docs/bots/interactions/prompts/formatting/)

### Validate

See: [Validation](/docs/bots/interactions/prompts/validation/)
