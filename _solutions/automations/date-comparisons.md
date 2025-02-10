---
title: Date comparisons
excerpt: Check to see if a date is in the past or future.
summary: 'This page explains the usage of the `|date(''U'')` filter in Cerb, which
  converts human-readable dates to Unix timestamps for easier comparisons. It provides
  two examples: one showing how to check if a SLA coverage has expired within 2 weeks
  using an automation rule, and another demonstrating how to return a specific text
  output based on the expiration status of the SLA coverage.'
social_image_url: /assets/images/solutions/automations/date-comparisons.png
layout: solution
jumbotron:
  breadcrumbs:
  - label: Resources &raquo;
    url: /resources/
  - label: Solutions Hub &raquo;
    url: /solutions/
  - label: Automations &raquo;
    url: /solutions/#automations
---

The [\|date](/docs/scripting/filters/#date) filter can convert human-readable dates into Unix timestamps for easier comparisons as a numeric range.

{% tabs check_date %}

{% tab check_date automation %}
```cerb
{% raw %}
start:
  set:
    sla_expiration@date: +2 weeks
  return:
    output@text:
      {% if sla_expiration >= 'now'|date('U') %}
      Your SLA coverage is active.
      {% else %}
      Your SLA coverage has expired.
      {% endif %}
{% endraw %}
```
{% endtab %}

{% tab check_date output %}
```cerb
{% raw %}
__return:
  output: |
    Your SLA coverage is active.
{% endraw %}
```
{% endtab %}

{% endtabs %}
