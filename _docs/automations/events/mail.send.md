---
title: "mail.send"
#excerpt: 
#social_image_url: /assets/images/search/kata.png
permalink: /docs/automations/events/mail.send/
toc:
  title: mail.send
  expand: Automations
jumbotron:
  title: mail.send
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

**mail.send** [automation](/docs/automations/) [events](/docs/automations/#events) can modify sent message drafts before they are delivered.

For instance, appending a unique survey link to only the sent html message (not text, nor the copy Cerb saves), setting custom fields, or adding custom mail headers to prevent Sendgrid from rewriting the `Message-Id:` header.

Content modifications can target any combination of text/html on the sent/saved message.

# Placeholders

The automation event [dictionary](/docs/automations/#dictionaries) starts with the following values:

| Key | Type | Notes
|-|-|-
|`draft_*` | record | The [draft](/docs/records/types/draft/) record. Supports key expansion.

# Outputs

| Key | Type | Notes
|-|-|-
|`content:` | dictionary | A dictionary of content modifications
|`draft:params:` | dictionary | A dictionary of [draft parameter](/docs/records/types/draft/) modifications

## content:

| Key | Type | Notes
|-|-|-
|`append:` | object | Append text to the message content
|`prepend:` | object | Prepend text to the message content
|`replace:` | object | Replace text in the message content

<div class="cerb-box note">
<p>Multiple instances of a content modification should have a unique name (e.g. <code>append/alias:</code>).</p>
</div>

### append:

| Key | Type | Notes
|-|-|-
|`on:` | object | `html@bool:`, `text@bool:`, `saved@bool:`, `sent@bool:` (default `yes` on all)
|`text:` | string | The text to append

### prepend:

| Key | Type | Notes
|-|-|-
|`on:` | object | `html@bool:`, `text@bool:`, `saved@bool:`, `sent@bool:` (default `yes` on all)
|`text:` | string | The text to prepend

### replace:

| Key | Type | Notes
|-|-|-
|`on:` | object | `html@bool:`, `text@bool:`, `saved@bool:`, `sent@bool:` (default `yes` on all)
|`text:` | string | The text to replace
|`with:` | string | The replacement text