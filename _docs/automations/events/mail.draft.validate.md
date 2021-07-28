---
title: "mail.draft.validate"
#excerpt: 
#social_image_url: /assets/images/search/kata.png
permalink: /docs/automations/events/mail.draft.validate/
toc:
  title: mail.draft.validate
  expand: Automations
jumbotron:
  title: mail.draft.validate
  tagline: 
  breadcrumbs:
  -
    label: Docs &raquo;
    url: /docs/home/
  -
    label: Automations &raquo;
    url: /docs/automations/
  -
    label: Events &raquo;
    url: /docs/automations/#events
---

**mail.draft.validate** [automation](/docs/automations/) [events](/docs/automations/#events) implement interactive custom validators when composing and replying to email. These automations have the same functionality as worker interactions.

For example: no recipients, profanity filter, missing attachment, using formatting in plaintext, and so on.

Interactive validators are configured on the `mail.draft.validate` automation event, and all enabled automations will run in sequence.

Through interactivity, a validator can allow a worker to bypass a warning and continue sending; whereas non-interactive custom validators would reject with an error message that a worker would have to correct before continuing.

For instance, a non-interactive validator would be problematic when suggesting that a worker *may* have omitted a mentioned "see attachment", when the omission was intentional. Interactive validators can instead make suggestions which are accepted or ignored.

While the most efficient option is to filter unneeded validators from the event, a `mail.draft.validate` automation that exits without an `await:` is silent and never opens the interaction popup.

# Placeholders

The automation event [dictionary](/docs/automations/#dictionaries) starts with the following values:

| Key | Type | Notes
|-|-|-
| `caller_name` | string | The [caller](#callers) which started the interaction.
| `caller_params` | dictionary | Built-in parameters based on the caller type.
| `draft_*` | record | The [draft](/docs/records/types/draft/) record. Supports key expansion.
| `inputs` | dictionary | [Custom input](/docs/automations/#inputs) values from the caller.
| `worker_*` | record | The active [worker](/docs/records/types/worker/) record. Supports key expansion.

# Outputs

| Key | Type | Notes
|-|-|-
|`reject:` | string | If set, sending the message is aborted. If omitted, message sending continues.

# Examples

* [Add custom interactive validators when composing and replying to email](https://github.com/cerb/cerb-release/discussions/36)