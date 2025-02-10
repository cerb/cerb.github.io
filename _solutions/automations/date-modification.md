---
title: Date modification
excerpt: Use the `|date_modify` filter to add or subtract units of time from dates.
summary: This page demonstrates how to use the `|date_modify` filter to perform date 
  arithmetic. It shows how to add or subtract various time units from dates and format the results.
layout: solution
jumbotron:
  breadcrumbs:
  - label: Resources &raquo;
    url: /resources/
  - label: Solutions Hub &raquo;
    url: /solutions/
  - label: Automations &raquo;
    url: /solutions/#automations
social_image_url: /assets/images/solutions/automations/date-modification.png
---

{% comment %}
* Uses `|date_modify` filter
* Supports various time units
* Handles date formatting
* Allows multiple modifications
{% endcomment %}

## Using |date_modify filter

Here is an example of using the [\|date_modify](/docs/scripting/filters/#date_modify) filter to add or subtract units of time from dates.

{% tabs modify-dates %}
{% tab modify-dates automation %}
{% highlight cerb %}
{% raw %}
start:
  return:
    output@text:
      {% set format = 'D, d M Y T' %}
      {% set timestamp = date('2025-06-15') %}
      At: {{timestamp|date(format)}}
      +2 days: {{timestamp|date_modify('+2 days')|date(format)}}
      -1 week, 3 days: {{timestamp|date_modify('-1 week, -3 days')|date(format)}}
{% endraw %}
{% endhighlight %}
{% endtab %}

{% tab modify-dates output %}
{% highlight yaml %}
{% raw %}
__return:
  output: |-
    At: Sun, 15 Jun 2025 PDT
    +2 days: Tue, 17 Jun 2025 PDT
    -1 week, 3 days: Thu, 05 Jun 2025 PDT
{% endraw %}
{% endhighlight %}
{% endtab %}
{% endtabs %}