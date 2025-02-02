---
title: Convert HTML to Markdown
excerpt: Use the `|html_to_text` filter to convert HTML content to Markdown format.
summary: This page demonstrates how to use the `|html_to_text` filter to convert HTML 
  content into Markdown format. The example shows converting an HTML document with 
  formatting into clean, readable Markdown text.
layout: solution
jumbotron:
  breadcrumbs:
  - label: Resources &raquo;
    url: /resources/
  - label: Solutions Hub &raquo;
    url: /solutions/
  - label: Automations &raquo;
    url: /solutions/#automations
social_image_url: /assets/images/solutions/automations/convert-html-to-markdown.png
---

{% comment %}
* Converts HTML to Markdown
* Preserves headings and formatting
* Supports truncation options
* Maintains text readability
{% endcomment %}

## Using |html_to_text filter

Here is an example of using the [\|html_to_text](/docs/scripting/filters/#html_to_text) filter to convert HTML content into Markdown format.

{% tabs convert-html-to-markdown %}
{% tab convert-html-to-markdown automation %}
```cerb
{% raw %}
start:
  set:
    message_html@text:
      <html><body><h1>Title</h1>This is an <b>HTML</b> message</body></html>
  return:
    output: {{message_html|html_to_text(truncate=50000)}}
{% endraw %}
```
{% endtab %}

{% tab convert-html-to-markdown output %}
```cerb
{% raw %}
__return:
  output: |-
    # Title
    This is an HTML message
{% endraw %}
```
{% endtab %}
{% endtabs %}