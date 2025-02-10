---
title: Trim whitespace in scripting tags
excerpt: Use tag modifiers and `|spaceless` filter to control whitespace.
summary: This page demonstrates techniques for controlling whitespace. 
  Learn how to trim leading and trailing whitespace using dash modifiers 
  in template tags, and remove whitespace between HTML tags using the `|spaceless` filter.
layout: solution
jumbotron:
  breadcrumbs:
  - label: Resources &raquo;
    url: /resources/
  - label: Solutions Hub &raquo;
    url: /solutions/
  - label: Automations &raquo;
    url: /solutions/#automations
social_image_url: /assets/images/solutions/automations/trim-whitespace.png
---

{% comment %}
* Controls whitespace in output
* Uses tag modifiers for trimming
* Handles multi-line text
* Maintains content formatting
{% endcomment %}

## Using tag modifiers

Adding a dash `-` to opening or closing scripting tags will trim leading or trailing whitespace.

{% tabs trim-whitespace %}
{% tab trim-whitespace automation %}
{% highlight cerb %}
{% raw %}
start:
  return:
    output@text:
      This text
      
      {{-" has no leading or trailing whitespace "-}}
      
      in it.
{% endraw %}
{% endhighlight %}
{% endtab %}

{% tab trim-whitespace output %}
{% highlight cerb %}
{% raw %}
__return:
  output: This text has no leading or trailing whitespace in it.
{% endraw %}
{% endhighlight %}
{% endtab %}
{% endtabs %}

## Using |spaceless filter

The `|spaceless` filter removes whitespace between HTML tags.

{% tabs trim-whitespace2 %}
{% tab trim-whitespace2 automation %}
{% highlight cerb %}
{% raw %}
start:
  return:
    output@text: 
      {{
        "<div>
          <p>This has extra space</p>
          <p>between tags</p>
        </div>"|spaceless
      }}
{% endraw %}
{% endhighlight %}
{% endtab %}

{% tab trim-whitespace2 output %}
{% highlight cerb %}
{% raw %}
__return:
  output: <div><p>This has extra space</p><p>between tags</p></div>
{% endraw %}
{% endhighlight %}
{% endtab %}
{% endtabs %}

## Using apply spaceless

For larger blocks of HTML, you can use the apply spaceless approach.

{% tabs trim-whitespace3 %}
{% tab trim-whitespace3 automation %}
{% highlight cerb %}
{% raw %}
start:
  return:
    output@text:
      {% apply spaceless %}
      <div>
        <span>This will all be on a single line.</span>
      </div>
      {% endapply %}
{% endraw %}
{% endhighlight %}
{% endtab %}

{% tab trim-whitespace3 output %}
{% highlight cerb %}
{% raw %}
__return:
  output: <div><span>This will all be on a single line.</span></div>
{% endraw %}
{% endhighlight %}
{% endtab %}
{% endtabs %}