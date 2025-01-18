---
title: Perform inline conditional logic in a placeholder value
excerpt: Use the ternary operator shortcut for conditional logic.
summary: "This page explains how to use ternary operators in Cerb automations to create conditional logic. You can chain multiple conditions together to check various states and return different values based on those conditions."
layout: integration
jumbotron:
  title: Ternary Operator
  breadcrumbs:
    -
      label: Resources &raquo;
      url: /resources/
    -
      label: Automation Cookbook &raquo;
      url: /resources/automation-cookbook/
---

{% comment %}
* Uses ternary operators for conditional logic
* Can chain multiple conditions together
* Works with boolean variables
* Common pattern for role-based checks
{% endcomment %}

## {% raw %}{{expression ? if_true : if_false}}{% endraw %}

The **ternary operator** provides a compact way to write an if/else condition in a single expression.

## Check user role using ternary operator

<pre>
<code class="language-cerb">
{% raw %}
start:
  set:
    is_admin@bool: true
  return:
    is_admin: {{is_admin ? 'yes' : 'no'}}
{% endraw %}
</code>
</pre>
