---
title: Calculate values
excerpt: Compare values using boolean logic groups.
summary: 
layout: solution
permalink: /solutions/automations/compare-values
jumbotron:
  breadcrumbs:
  - label: Resources &raquo;
    url: /resources/
  - label: Solutions Hub &raquo;
    url: /solutions/
  - label: Automations &raquo;
    url: /solutions/#automations

---

We can compare different values using boolean logic groups in automations scripting.

{% tabs compare_values %}

{% tab compare_values automation %}
{% highlight cerb %}
{% raw %}
start:
  set:
    message:
      subject: Receipt for your recent order
      to: customer@example.com
      from: shop@example.com
  return:
    pass@bool:
      {{
        not (
          message.to starts with 'noreply@'
          or message.from starts with 'spammer@'
        ) and (
          'receipt' in message.subject|lower
          or 'kassenzettel' in message.subject|lower
        )
      }}
{% endraw %}
{% endhighlight %}
{% endtab %}

{% tab compare_values output %}
{% highlight cerb %}
{% raw %}
__return:
  pass: true
{% endraw %}
{% endhighlight %}
{% endtab %}

{% endtabs %}

In this case we use the `|lower` filter since `in` is case-sensitive.