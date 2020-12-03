---
title: "Say - Interaction Form Element"
#excerpt: 
#social_image_url: /assets/images/search/kata.png
permalink: /docs/automations/triggers/ui.interaction/elements/say/
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
    label: ui.interaction &raquo;
    url: /docs/automations/triggers/ui.interaction/
  -
    label: Elements &raquo;
    url: /docs/automations/triggers/ui.interaction/#elements
---

{% include docs/note_preview.html %}

In [interaction](/docs/automations/triggers/ui.interaction/) web forms, a **say** element displays a block of text or Markdown.

<pre>
<code class="language-cerb">
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
</code>
</pre>

<div class="cerb-screenshot">
<img src="/assets/images/docs/automations/triggers/ui.interaction/elements/say.png" class="screenshot">
</div>

# Syntax

### content:

Content to display in Markdown format.

### message:

Message to display as plain text.
