---
title: Snippets
excerpt: This page explains the concept of snippets in Cerb, which allow workers and
  automations to insert predefined text into messages efficiently.
summary: This page explains the concept of snippets in Cerb, which allow workers and
  automations to insert predefined text into messages efficiently. Snippets function
  like a shared clipboard but with advanced scripting capabilities, including placeholders
  and conditional logic, enabling dynamic content adaptation based on context. A typical
  example provided is an auto-responder message that uses placeholders to personalize
  responses, demonstrating how snippets can streamline communication processes by
  automatically filling in details like names and ticket information.
permalink: /docs/snippets/
toc:
  title: Snippets
jumbotron:
  title: Snippets
  tagline: Quickly reply with predefined responses
  breadcrumbs:
  - label: Docs &raquo;
    url: /docs/home/
  - label: Tickets &raquo;
    url: /docs/tickets/
---

[Workers](/docs/workers/) and [automations](/docs/automations/) can use **snippets** to quickly insert predefined text into messages. You can think of snippets as _copying and pasting_ from a giant shared clipboard.

However, unlike the traditional _paste_ action, snippets also support [sophisticated scripting functionality](/docs/scripting/) with **placeholders** and **conditional logic**.  This means that the content of a snippet can change based on when and where you use it.

In a common use case, an auto-responder message will use placeholders in a snippet like:

{% highlight twig %}
{% raw %}
Hi <b>{{first_name}}</b>,

Thanks for contacting us!

A new support ticket has been opened in response to your message:

Reference #: <b>{{mask}}</b>
Subject: <b>{{subject}}</b>

We'll be in contact shortly.
{% endraw %}
{% endhighlight %}

The above snippet results in the following text when used by an [automation](/docs/automations/) on a new ticket:

{% highlight text %}
Hi <b>Charlotte</b>,

Thanks for contacting us!

A new support ticket has been opened in response to your message:

Reference #: <b>CRB-01092-002</b>
Subject: <b>Do you accept purchase orders?</b>

We'll be in contact shortly.
{% endhighlight %}

## Prompts

Snippets also support prompts for information prior to their pasting. You can use these prompts to dynamically insert relevant values into the snippet or to be used in further scripting. You set up prompts in the "Prompts"
section at the bottom of the snippet editor.

There are three types of prompt: `text`, `picklist`, and `checkbox`.

<div class="cerb-screenshot">
<img src="/assets/images/docs/snippets/snippet-prompt.png" class="screenshot">
</div>

### Text
`text` prompts provide a text box. You can insert any text you wish and use the set placeholder elsewhere in the snippet. The `multiple@bool` parameter determines whether it's a single or multi-line textbox.

### Picklist
`picklist` prompts provide a customizable picklist with multiple options. You can insert the chosen option as text in the snippet or use the result for further scripting.

### Checkbox

`checkbox` prompts provide a checkbox for true/false style answers. `checkbox` prompts return a `1` for true and blank for false. This can be used in further scripting in the snippet.