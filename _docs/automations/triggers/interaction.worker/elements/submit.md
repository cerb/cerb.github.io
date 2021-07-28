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

### Custom buttons

A `submit:` element may optionally specify any number of custom buttons.

Custom buttons can provide label, icon, icon position, style, and value. Each button is either a `continue:` or `reset:` type.

When clicked, a `continue:` button sets the `submit:` element's `key` to its value.

There may be multiple continue buttons (e.g. yes/no, allow/deny). This is much simpler than using a sheet, and it no longer requires a second click to continue.

When `submit:buttons:` isn't provided, the default 'continue' and 'reset' buttons are automatically added; and these can still be controlled with the `submit:continue@bool:` and `submit:reset@bool:` shortcuts.

The current alternative styles for buttons are 'secondary' (gray like reset) or 'outline' (blue like continue but not filled). This makes it easy to visually distinguish primary/default and secondary options.

<pre>
<code class="language-cerb">
{% raw %}
start:
  await:
    form:
      title: Confirmation
      elements:
        say:
          content: # Are you sure?
        submit/prompt_confirm:
          buttons:
            continue/yes:
              label: Yes
              value: yes
            continue/no:
              label: No
              style: secondary
              value: no{% endraw %}
</code>
</pre>

<div class="cerb-screenshot">
<img src="/assets/images/docs/automations/triggers/interaction.worker/elements/submit-buttons.png" class="screenshot">
</div>