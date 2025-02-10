---
title: Extract dictionary columns
excerpt: Extract a column from a list of dictionaries.
summary: 'This page explains how to extract a column from a list of dictionaries using
  Cerb filters. Two methods are provided: `|column` and `|map`. The `|column` filter
  extracts the specified column directly, while the `|map` filter uses an arrow function
  to transform each dictionary into a value for that column. Both methods can be used
  to extract the email columns from a list of people dictionaries, with examples demonstrating
  their usage.'
layout: solution
jumbotron:
  breadcrumbs:
  - label: Resources &raquo;
    url: /resources/
  - label: Solutions Hub &raquo;
    url: /solutions/
  - label: Automations &raquo;
    url: /solutions/#automations
social_image_url: /assets/images/solutions/automations/extract-dictionary-columns.png
redirect_from:
- /automation/cookbook/extract-dictionary-columns/
---

## Using |column

You can extract the same column from a list of dictionaries with the `|column` filter.

{% tabs extract_dictionary_columns %}

{% tab extract_dictionary_columns automation %}
{% highlight cerb %}
{% raw %}
start:
  set:
    people:
      kina:
        name: Kina Halpue
        email: kina@cerb.example
      milo:
        name: Milo Dade
        email: milo@cerb.example 
  return:
    emails: {{people|column('email')|join(', ')}}
{% endraw %}
{% endhighlight %}
{% endtab %}

{% tab extract_dictionary_columns output %}
{% highlight yaml %}
{% raw %}
__return:
  emails: kina@cerb.example, milo@cerb.example
{% endraw %}
{% endhighlight %}
{% endtab %}

{% endtabs %}

## Using |map

You can extract the same column from a list of dictionaries with the `|map` filter.

{% tabs extract_dictionary_columns %}

{% tab extract_dictionary_columns automation %}
{% highlight cerb %}
{% raw %}
start:
  set:
    people:
      kina:
        name: Kina Halpue
        email: kina@cerb.example
      milo:
        name: Milo Dade
        email: milo@cerb.example
  return:
    emails: {{people|map((v)=>v['email'])|join(', ')}}
{% endraw %}
{% endhighlight %}
{% endtab %}

{% tab extract_dictionary_columns output %}
{% highlight yaml %}
{% raw %}
__return:
  emails: kina@cerb.example, milo@cerb.example
{% endraw %}
{% endhighlight %}
{% endtab %}

{% endtabs %}