---
title: Check a date
excerpt: Check to see if a date is in the past or future
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
The ```|date('U')``` filter converts human-readable dates to Unix timestamps for easier comparisons.

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
