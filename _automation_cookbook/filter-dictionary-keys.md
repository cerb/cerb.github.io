---
title: Filter dictionary keys
excerpt: Use the `|filter` modifier with arrow functions to match dictionary keys.
summary: This page demonstrates how to use the filter modifier with arrow functions to filter dictionaries based on their key names. It shows how to use lambda expressions with key parameters to filter objects by specific key patterns.
layout: automation-cookbook
jumbotron: []
---

{% comment %}
* Dictionary key filtering
* Arrow function usage with key parameter
* Key name pattern matching
* Header filtering example
{% endcomment %}

## Filtering headers by prefix

Here is an example of using the [\|filter](https://cerb.ai/docs/scripting/filters#filter) modifier with arrow functions to filter dictionary keys.

{% tabs example %}

{% tab example automation %}
```cerb
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
```
{% endtab %}

{% tab example output %}
```cerb
{% raw %}
__return:
  gitlab_headers:
    x-gitlab-project: abc123
{% endraw %}
```
{% endtab %}

{% endtabs %}