---
title: Apply filters
excerpt: Apply filters to a block of text.
summary: 
layout: solution
permalink: /solutions/automations/apply-filters
jumbotron:
  breadcrumbs:
  - label: Resources &raquo;
    url: /resources/
  - label: Solutions Hub &raquo;
    url: /solutions/
  - label: Automations &raquo;
    url: /solutions/#automations

---

You can filters to a block of text in scripting in 2 ways. The first is with the `apply` tag.

{% tabs apply_filters %}

{% tab apply_filters automation %}
{% highlight cerb %}
{% raw %}
start:
  return:
    output@text:
      {% apply upper %}
      All of this text will be uppercase.
      On every line.
      {% endapply %} 
{% endraw %}
{% endhighlight %}
{% endtab %}

{% tab apply_filters output %}
{% highlight cerb %}
{% raw %}
__return:
  output: |
    ALL OF THIS TEXT WILL BE UPPERCASE.
    ON EVERY LINE. 
{% endraw %}
{% endhighlight %}
{% endtab %}

{% endtabs %}

You can also chain multiple filters together with `|`. This can sometimes be useful when creating things like snippets.

{% tabs pipe_filters %}

{% tab pipe_filters automation %}
{% highlight cerb %}
{% raw %}
start:
  set:
    text@text:
      ALL OF THIS TEXT WILL BE LOWER CASE.
      ON EVERY LINE.
      WITH A >.
      AT THE START OF EACH LINE.
  return:
    output: {{text|lower|indent('> ')}}
{% endraw %}
{% endhighlight %}
{% endtab %}

{% tab pipe_filters output %}
{% highlight cerb %}
{% raw %}
__return:
  output: |
    > all of this text will be lower case
    > on every line.
    > with a >.
    > at the start of each line.
{% endraw %}
{% endhighlight %}
{% endtab %}

{% endtabs %}