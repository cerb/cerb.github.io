---
title: "Automations: email.parse"
#excerpt: 
#social_image_url: /assets/images/search/kata.png
permalink: /docs/automations/commands/email.parse/
toc:
  title: email.parse
  expand: Automations
jumbotron:
  title: email.parse
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

The **email.parse:** command parses a MIME-encoded email message into a [ticket](/docs/records/types/ticket/).

<pre>
<code class="language-cerb">
{% raw %}
start:
  email.parse/parse:
    output: results
    inputs:
      message@text:
        From: customer@cerb.example
        To: support@cerb.example
        Subject: This is an example
        
        This is an example message.
    on_simulate:
      set:
        results:
          _context: ticket
          id@int: 123
    on_success:
      return:
        ticket_id@key: results:id
{% endraw %}
</code>
</pre>

* TOC
{:toc}

# Syntax

## inputs:

| Key | 
|-|-
| `message@text:` | A MIME-encoded email message as a text block. At minimum this should contain headers, a blank line, and a plaintext body.

## output:

Save the results in this placeholder.

## on_simulate:

The [commands](/docs/automations/#commands) to run during simulation instead of parsing the email.

If omitted, the email is parsed during simulation.

## on_success:

The [commands](/docs/automations/#commands) to run on success.

The `output:` placeholder receives a [ticket](/docs/records/types/ticket/#dictionary-placeholders) dictionary.

## on_error:

The [commands](/docs/automations/#commands) to run on failure. If omitted, the automation exits in the `error` [state](/docs/automations/#exit-states).

The `output:` placeholder receives a dictionary with these keys:

| Key |
|-|-
| `error` | The error message.
