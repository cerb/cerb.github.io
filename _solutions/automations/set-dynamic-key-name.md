---
title: Set a dynamic key name
excerpt: Use `var.set:` to make a key with a dynamic name.
summary: This page demonstrates how to set dynamic key names using Cerb's `var.set:`
  command, which allows for flexible and non-standard key names that are not valid
  in KATA scripting. It provides examples of setting random key names, using special
  characters like `@`, and changing the delimiter from the standard `:` if needed.
layout: solution
jumbotron:
  breadcrumbs:
  - label: Resources &raquo;
    url: /resources/
  - label: Solutions Hub &raquo;
    url: /solutions/
  - label: Automations &raquo;
    url: /solutions/#automations
social_image_url: /assets/images/solutions/automations/set-dynamic-key-name.png
redirect_from:
- /automation/cookbook/set-dynamic-key-name/
---

## Using scripting in a key name

You can't use scripting in a KATA key, but if you want to set a dynamic key name, you can do so with [var.set:](https://cerb.ai/docs/automations/commands/var.set/)

{% tabs set_dynamic_key_name %}
{% tab set_dynamic_key_name automation %}
{% highlight cerb %}
{% raw %}
start:
  var.set/random:
    inputs:
      key: random_{{random_string(6)}}
      value: {{random_string(6)}}
{% endraw %}
{% endhighlight %}
{% endtab %}
{% endtabs %}


## Using forbidden characters in a key name

This approach can also be used if you want a key name that isn't valid in KATA, such as a `:` or `@`.

{% tabs set_dynamic_key_name2 %}
{% tab set_dynamic_key_name2 automation %}
{% highlight cerb %}
{% raw %}
start:
  var.set/email:
    inputs:
      key@text: customer@cerb.example
      value: allow
{% endraw %}
{% endhighlight %}
{% endtab %}
{% endtabs %}

## Changing the delimiter for key paths

You can also use the `delimiter:` field to change the delimiter from the standard `:` if necessary. This allows you to use `:` in a key name.

{% tabs set_dynamic_key_name3 %}
{% tab set_dynamic_key_name3 automation %}
{% highlight cerb %}
{% raw %}
start:
  var.set/colon:
    inputs:
      key@text: og:image
      delimiter: ::
      value: https://example.com/images/social.png
{% endraw %}
{% endhighlight %}
{% endtab %}
{% endtabs %}

