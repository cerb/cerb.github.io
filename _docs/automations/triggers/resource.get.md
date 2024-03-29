---
title: "resource.get"
#excerpt: 
#social_image_url: /assets/images/search/kata.png
permalink: /docs/automations/triggers/resource.get/
toc:
  title: resource.get
  expand: Automations
jumbotron:
  title: resource.get
  tagline: 
  breadcrumbs:
  -
    label: Docs &raquo;
    url: /docs/home/
  -
    label: Automations &raquo;
    url: /docs/automations/
  -
    label: Triggers &raquo;
    url: /docs/automations/#triggers
---

**resource.get** [automations](/docs/automations/) are triggered by dynamic [resource](/docs/resources/).

This trigger uses [event handler](/docs/automations/#events) KATA, and the first enabled automation is executed.

* TOC
{:toc}

# Inputs

The automation [dictionary](/docs/automations/#dictionaries) starts with the following values:

| Key | Type | Notes
|-|-|-
| `actor_*` | record | The current actor dictionary. Supports key expansion.
| `inputs` | dictionary | [Custom input](/docs/automations/#inputs) values from the caller.
| `resource_*` | record | The [resource](/docs/records/types/resource/) record. Supports key expansion.

# Outputs

## return:

| Key | Type | Notes
|-|-|-
| `file:` | object | The file metadata

### file:

| Key | Type | Notes
|-|-|-
| `content:` | string | The file contents in text (Base64 encode if binary)
| `expires_at:` | timestamp | Cache this response until this UNIX timestamp 
