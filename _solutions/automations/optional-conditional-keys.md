---
title: Optional conditional keys
excerpt: Use the `@optional` annotation to omit keys based on conditional values.
summary: This page demonstrates how to use the `@optional` annotation to conditionally
  include or omit dictionary keys based on their values. When a key with the `@optional`
  annotation evaluates to null, it is removed from the output.
layout: solution
jumbotron: []
social_image_url: /assets/images/solutions/automations/optional-conditional-keys.png
redirect_from:
- /automation/cookbook/optional-conditional-keys/
---

{% comment %}
* Optional key handling
* Conditional value evaluation
* Dictionary output formatting
{% endcomment %}

## Using @optional

Here is an example of using the [@optional](https://cerb.ai/docs/automations/#annotations) annotation to conditionally include dictionary keys based on their values. The key is omitted when the value is empty or false.

The `gdpr:` key will be removed when the region is not `EU`.

{% tabs optional_conditional_keys %}

{% tab optional_conditional_keys automation %}
```cerb
{% raw %}
start:
  set:
    record:
      name: Kina Halpue
      email: kina@cerb.example
      region: US
  return:
    output:
      name: {{record.name}}
      email: {{record.email}}
      gdpr@optional,bool: {{'EU' == record.region ? true}}
{% endraw %}
```
{% endtab %}

{% tab optional_conditional_keys output %}
```cerb
{% raw %}
__return:
  output:
    name: Kina Halpue
    email: kina@cerb.example
{% endraw %}
```
{% endtab %}

{% endtabs %}
