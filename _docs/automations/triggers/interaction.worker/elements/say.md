---
title: Say - Interaction Form Element
excerpt: This page provides information on the "say" interaction form element used
  in Cerb's web forms.
summary: This page provides information on the "say" interaction form element used
  in Cerb's web forms. It explains how the "say" element is utilized to display blocks
  of text or Markdown within a form. The page includes syntax details, specifically
  focusing on the "content" attribute for displaying Markdown-formatted text and the
  "message" attribute for displaying plain text. An example is provided to illustrate
  the implementation of the "say" element in a form.
permalink: /docs/automations/triggers/interaction.worker/elements/say/
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
  - label: interaction.worker &raquo;
    url: /docs/automations/triggers/interaction.worker/
  - label: Elements &raquo;
    url: /docs/automations/triggers/interaction.worker/#elements
---

In [interaction](/docs/automations/triggers/interaction.worker/) web forms, a **say** element displays a block of text or Markdown.

{% highlight cerb %}
{% raw %}
start:
  await:
    form:
      elements:
        say/hello:
          content@text:
            # Heading
            This is a **paragraph** in Markdown.
{% endraw %}
{% endhighlight %}

<div class="cerb-screenshot">
<img src="/assets/images/docs/automations/triggers/interaction.worker/elements/say.png" class="screenshot">
</div>

# Syntax

### content:

Content to display in Markdown format.

### message:

Message to display as plain text.
