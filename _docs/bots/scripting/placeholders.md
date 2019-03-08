---
title: Bot Scripting Placeholders
excerpt: 
permalink: /docs/bots/scripting/placeholders/
toc:
  title: Placeholders
jumbotron:
  title: Placeholders
  tagline: 
  breadcrumbs:
  -
    label: Docs &raquo;
    url: /docs/home/
  -
    label: Bots &raquo;
    url: /docs/bots/
  -
    label: Scripting &raquo;
    url: /docs/bots/scripting/
---

In the last section we learned about [variables](/docs/bots/scripting/variables/). You have to [set](/docs/bots/scripting/commands/#set) a variable before using it, and it can only be referenced by the same [template](/docs/bots/scripting/) that set it. In other words, they are temporary.

**Placeholders** are a special kind of variable that retain their value for the entire duration of a [bot](/docs/bots/) [behavior](/docs/bots/behaviors/). Once set, a placeholder is available for use by all templates within the same behavior.

Every key from a bot behavior's [dictionary](/docs/bots/behaviors/dictionaries/) is automatically available as a placeholder.

As far as template scripting is concerned, placeholders are variables. Anything you can do to a variable, you can do to a placeholder.

<pre>
<code class="language-twig">
{% raw %}
{{placeholder_name}}
{% endraw %}
</code>
</pre>

```
I am the placeholder's value
```

# Inserting placeholders

When building a template, you can use the **Insert placeholder** menu to browse and select placeholders.

<div class="cerb-screenshot">
<img src="/assets/images/docs/bots/scripting/insert-placeholder-menu.png" class="screenshot">
</div>

# Setting placeholders

To set or change a placeholder, you must use the **Set custom placeholder** action in a behavior, rather than the [set](/docs/bots/scripting/commands/#set) command in a template.

The value of a placeholder can be set with a template referencing other placeholders.

<div class="cerb-screenshot">
<img src="/assets/images/docs/bots/scripting/set-custom-placeholder.png" class="screenshot">
</div>

# Iterating placeholders

You can use the [placeholders_list()](/docs/bots/scripting/functions/#placeholders_list) function to retrieve the dictionary of placeholders as an [object](/docs/bots/scripting/arrays-objects/). This can be iterated, serialized as [JSON](/docs/bots/scripting/json/), etc.