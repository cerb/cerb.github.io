---
title: >-
  Bot Action: Execute PGP encrypt
permalink: /docs/bots/events/actions/core.bot.action.pgp.encrypt/
toc:
  expand: Bots
jumbotron:
  title: >-
    Execute PGP encrypt
  tagline: 
  breadcrumbs:
  -
    label: Docs &raquo;
    url: /docs/home/
  -
    label: Bots &raquo;
    url: /docs/bots/
  -
    label: Events &raquo;
    url: /docs/bots/events/
  -
    label: Actions &raquo;
    url: /docs/bots/events/
---

|---
|-|-
| **Identifier (ID):** | core.bot.action.pgp.encrypt
| **Event:** | (All)

### Params

|---
| Req'd | Key | Type | Notes 
|:-:|-|-|-
| **x** | `public_key_ids` | records | The [PGP public keys](/docs/records/types/gpg_public_key/) to encrypt with
| **x** | `public_key_template` | text | An option [bot scripting](/docs/bots/scripting/) template with comma-separated public key IDs
| **x** | `message` | text | The message to encrypt
|  | `object_placeholder` | placeholder | The placeholder to set with the encrypted message
