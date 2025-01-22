---
title: Filter dictionary keys
excerpt: Use the `|filter` modifier with arrow functions to match dictionary keys.
summary: This page demonstrates how to use the filter modifier with arrow functions to filter dictionaries based on their key names. It shows how to use lambda expressions with key parameters to filter objects by specific key patterns.
layout: integration
jumbotron:
  title: Filter dictionary keys
  breadcrumbs:
    -
      label: Resources &raquo;
      url: /resources/
    -
      label: Automation Cookbook &raquo;
      url: /resources/automation-cookbook/
---

{% comment %}
* Dictionary key filtering
* Arrow function usage with key parameter
* Key name pattern matching
* Header filtering example
{% endcomment %}

Here is an example of using the [\|filter](https://cerb.ai/docs/scripting/filters#filter) modifier with arrow functions to filter dictionary keys.

## Filtering headers by prefix

<pre>
<code class="language-cerb">
{% raw %}
start:
  set:
    message_headers:
      x-gitlab-project: abc123
      x-blah: def456
      x-example: ghi789
  return:
    gitlab_headers@json: {{message_headers|filter((v,k) => k is prefixed ('x-gitlab'))|json_encode}}
{% endraw %}
</code>
</pre>

## Output

<pre>
<code class="language-cerb">
{% raw %}
__return:
  gitlab_headers:
    x-gitlab-project: abc123
{% endraw %}
</code>
</pre>
