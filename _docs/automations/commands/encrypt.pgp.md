---
title: "Automations: encrypt.pgp"
#excerpt: 
#social_image_url: /assets/images/search/kata.png
permalink: /docs/automations/commands/encrypt.pgp/
toc:
  title: encrypt.pgp
  expand: Automations
jumbotron:
  title: encrypt.pgp
  tagline: 
  breadcrumbs:
  -
    label: Docs &raquo;
    url: /docs/home/
  -
    label: Automations &raquo;
    url: /docs/automations/
  -
    label: Commands &raquo;
    url: /docs/automations/#commands
---

The **encrypt.pgp:** command encrypts a block of text using one or more PGP public keys.

<pre>
<code class="language-cerb">
{% raw %}
start:
  encrypt.pgp:
    output: encrypted_message
    inputs:
      message@text:
        This is a secret message.
      public_keys:
        uri: cerb:gpg_public_key:D399DA5BA62A0472
    on_success:
      return:
        encrypted_message@key: encrypted_message
{% endraw %}
</code>
</pre>

* TOC
{:toc}

# Syntax

## inputs:

| Key | 
|-|-
| `message@text:` | The message to encrypt as a text block.
| `public_keys:uri:` | This contains one or more child recipient public keys in the format `uri/<nickname>: cerb:gpg_public_key:<id>`, where `<id>` is a record ID, fingerprint, or fingerprint-16.
| `public_keys:ids:` | Alternatively, an array of public key IDs can be provided.

## output:

Save the results in this placeholder.

## on_simulate:

The [commands](/docs/automations/#commands) to run during simulation instead of encrypting the message.

If omitted, the message is encrypted during simulation.

## on_success:

The [commands](/docs/automations/#commands) to run on success.

The `output:` placeholder is set to the encrypted message.

## on_error:

The [commands](/docs/automations/#commands) to run on failure. If omitted, the automation exits in the `error` [state](/docs/automations/#exit-states).

The `output:` placeholder receives a dictionary with these keys:

| Key |
|-|-
| `error` | The error message.
