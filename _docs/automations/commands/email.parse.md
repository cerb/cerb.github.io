---
title: 'Automations: email.parse'
excerpt: This page provides detailed information on the "email.parse" command used
  in Cerb automations to convert a MIME-encoded email message into a ticket.
summary: This page provides detailed information on the "email.parse" command used
  in Cerb automations to convert a MIME-encoded email message into a ticket. It outlines
  the syntax and structure of the command, including the necessary inputs, such as
  the MIME-encoded email message, and the expected output, which is a ticket dictionary.
  The page also explains the different stages of the command execution, including
  "on_simulate" for simulation commands, "on_success" for successful execution commands,
  and "on_error" for handling failures. Each section is clearly defined to guide users
  in implementing the command effectively within their automation workflows.
permalink: /docs/automations/commands/email.parse/
toc:
  title: email.parse
  expand: Automations
jumbotron:
  title: email.parse
  tagline: ~
  breadcrumbs:
  - label: Docs &raquo;
    url: /docs/home/
  - label: Automations &raquo;
    url: /docs/automations/
  - label: Commands &raquo;
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
