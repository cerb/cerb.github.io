---
title: Submit - Interaction Form Element
excerpt: This page provides information on the "submit" element used in website interaction
  forms within Cerb.
summary: This page provides information on the "submit" element used in website interaction
  forms within Cerb. It explains that the submit element is responsible for displaying
  'Continue' and 'Reset' buttons on forms. The submit element is automatically added
  when an interaction exits in the await state, meaning users do not need to manually
  add it. An example code snippet is provided to illustrate how the submit element
  is configured within a form.
permalink: /docs/automations/triggers/interaction.website/elements/submit/
toc:
  title: Submit
  expand: Automations
jumbotron:
  title: Submit
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

In [website interactions](/docs/automations/triggers/interaction.website/) forms, a **submit** element displays the 'Continue' and 'Reset' buttons.

This is automatically added when an interaction exits in the [await state](/docs/automations/#exit-states). You do not need to do it yourself.

{% highlight cerb %}
{% raw %}
start:
  await:
    form:
      title: Menu
      elements:
        submit:
          continue@bool: yes
{% endraw %}
{% endhighlight %}

<div class="cerb-screenshot">
<img src="/assets/images/docs/automations/triggers/interaction.website/elements/submit.png" class="screenshot">
</div>
