---
title: "Submit - Interaction Form Element"
#excerpt: 
#social_image_url: /assets/images/search/kata.png
permalink: /docs/automations/triggers/interaction.worker/elements/submit/
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
    label: interaction.worker &raquo;
    url: /docs/automations/triggers/interaction.worker/
  -
    label: Elements &raquo;
    url: /docs/automations/triggers/interaction.worker/#elements
---

In [interaction](/docs/automations/triggers/interaction.worker/) web forms, a **submit** element displays the 'Continue' and 'Reset' buttons.

This is automatically added when an interaction exits in the [await state](/docs/automations/#exit-states). You do not need to do it yourself.

<pre>
<code class="language-cerb">
{% raw %}
start:
  await:
    form:
      elements:
{% endraw %}
</code>
</pre>

<div class="cerb-screenshot">
<img src="/assets/images/docs/automations/triggers/interaction.worker/elements/submit.png" class="screenshot">
</div>