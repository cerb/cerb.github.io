---
title: Conditional values
excerpt: Perform inline conditional logic in a placeholder value.
summary: This page explains how to use ternary operators in Cerb automations to create
  conditional logic. You can chain multiple conditions together to check various states
  and return different values based on those conditions.
layout: solution
jumbotron: []
social_image_url: /assets/images/solutions/automations/conditional-values.png
redirect_from:
- /automation/cookbook/conditional-values/
---

{% comment %}
* Uses ternary operators for conditional logic
* Can chain multiple conditions together
* Works with boolean variables
* Common pattern for role-based checks
{% endcomment %}

## Using the ternary operator

The **ternary operator** provides a compact way to write an if/else condition: `{% raw %}{{expression ? if_true : if_false}}{% endraw %}`

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
