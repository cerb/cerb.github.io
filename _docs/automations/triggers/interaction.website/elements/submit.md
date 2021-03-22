---
title: "Submit - Interaction Form Element"
#excerpt: 
#social_image_url: /assets/images/search/kata.png
permalink: /docs/automations/triggers/interaction.website/elements/submit/
toc:
  title: Submit
  expand: Automations
jumbotron:
  title: Submit
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

In [website interactions](/docs/automations/triggers/interaction.website/) forms, a **submit** element displays the 'Continue' and 'Reset' buttons.

This is automatically added when an interaction exits in the [await state](/docs/automations/#exit-states). You do not need to do it yourself.

<pre>
<code class="language-cerb">
{% raw %}
start:
  await:
    form:
      title: Menu
      elements:
        submit:
          continue@bool: yes
{% endraw %}
</code>
</pre>

<div class="cerb-screenshot">
<img src="/assets/images/docs/automations/triggers/interaction.website/elements/submit.png" class="screenshot">
</div>
