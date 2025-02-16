---
title: Say - Interaction Form Element
excerpt: This page provides information on the "say" interaction form element used
  in Cerb's website interaction forms.
summary: This page provides information on the "say" interaction form element used
  in Cerb's website interaction forms. It explains how the "say" element is utilized
  to display blocks of text or Markdown within a form. The page includes a syntax
  example demonstrating how to configure the "say" element with content in Markdown
  format, highlighting the use of headings and paragraphs. Additionally, it outlines
  the syntax options available for displaying content, such as using the "content"
  attribute for Markdown and the "message" attribute for plain text.
permalink: /docs/automations/triggers/interaction.website/elements/say/
toc:
  title: Say
  expand: Automations
jumbotron:
  title: Say
  tagline: ~
  breadcrumbs:
  - label: Docs &raquo;
    url: /docs/home/
  - label: Automations &raquo;
    url: /docs/automations/
  - label: interaction.website &raquo;
    url: /docs/automations/triggers/interaction.website/
  - label: Elements &raquo;
    url: /docs/automations/triggers/interaction.website/#elements
---

In [website interactions](/docs/automations/triggers/interaction.website/) forms, a **say** element displays a block of text or Markdown.

{% highlight cerb %}
{% raw %}
start:
  await:
    form:
      title: Example
      elements:
        say/hello:
          content@text:
            # Heading
            This is a **paragraph** in Markdown.
{% endraw %}
{% endhighlight %}

<div class="cerb-screenshot">
<img src="/assets/images/docs/automations/triggers/interaction.website/elements/say.png" class="screenshot">
</div>

# Syntax

### content:

Content to display in Markdown format.

### message:

Message to display as plain text.

### hidden:

This form element can be conditionally hidden.

{% highlight cerb %}
{% raw %}
hidden@bool: {{expression}}
{% endraw %}
{% endhighlight %}

### references:

{% highlight cerb %}
{% raw %}
await/router:
  form:
    title: How can we help?
    elements:
      say:
        content@text:
          ![Logo alt text =200x200](#logo)
        references:
          resource/logo:
            uri: cerb:resource:portal.logo.cerb
{% endraw %}
{% endhighlight %}