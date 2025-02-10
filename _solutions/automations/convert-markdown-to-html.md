---
title: Convert Markdown to HTML
excerpt: Use the `|markdown_to_html` filter to convert Markdown content to HTML format.
summary: This page demonstrates how to use the `|markdown_to_html` filter to convert Markdown
  content into HTML format. The example shows converting a Markdown document with
  formatting into sanitized HTML output, with options for handling untrusted content.
layout: solution
jumbotron:
  breadcrumbs:
  - label: Resources &raquo;
    url: /resources/
  - label: Solutions Hub &raquo;
    url: /solutions/
  - label: Automations &raquo;
    url: /solutions/#automations
social_image_url: /assets/images/solutions/automations/convert-markdown-to-html.png
---

{% comment %}
* Converts Markdown to HTML
* Preserves formatting and structure
* Supports content sanitization
* Handles untrusted content safely
{% endcomment %}

## Using |markdown_to_html filter

Here is an example of using the [\|markdown_to_html](/docs/scripting/filters/#markdown_to_html) filter to convert Markdown content into HTML format.

The `is_untrusted` parameter sanitizes HTML output (e.g. script blocks and images).

{% tabs convert-markdown-to-html %}
{% tab convert-markdown-to-html automation %}
{% highlight cerb %}
{% raw %}
start:
  set:
    markdown_text@text:
      # Title
      This is a **Markdown** message.
  return:
    output: {{markdown_text|markdown_to_html(is_untrusted=true)}}
{% endraw %}
{% endhighlight %}
{% endtab %}

{% tab convert-markdown-to-html output %}
{% highlight yaml %}
{% raw %}
__return:
  output: |-
    <h1>Title</h1>
    <p>This is a <strong>Markdown</strong> message.</p>
{% endraw %}
{% endhighlight %}
{% endtab %}
{% endtabs %}