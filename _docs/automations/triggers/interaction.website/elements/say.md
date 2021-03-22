---
title: "Say - Interaction Form Element"
#excerpt: 
#social_image_url: /assets/images/search/kata.png
permalink: /docs/automations/triggers/interaction.website/elements/say/
toc:
  title: Say
  expand: Automations
jumbotron:
  title: Say
  tagline: 
  breadcrumbs:
  -
    label: Docs &raquo;
    url: /docs/home/
  -
    label: Automations &raquo;
    url: /docs/automations/
  -
    label: interaction.website &raquo;
    url: /docs/automations/triggers/interaction.website/
  -
    label: Elements &raquo;
    url: /docs/automations/triggers/interaction.website/#elements
---

{% include docs/note_preview.html %}

In [website interactions](/docs/automations/triggers/interaction.website/) forms, a **say** element displays a block of text or Markdown.

<pre>
<code class="language-cerb">
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
</code>
</pre>

<div class="cerb-screenshot">
<img src="/assets/images/docs/automations/triggers/interaction.website/elements/say.png" class="screenshot">
</div>

# Syntax

### content:

Content to display in Markdown format.

### message:

Message to display as plain text.
