---
title: "Automations: error"
#excerpt: 
#social_image_url: /assets/images/search/kata.png
permalink: /docs/automations/commands/error/
toc:
  title: error
  expand: Automations
jumbotron:
  title: error
  tagline: 
  breadcrumbs:
  -
    label: Docs &raquo;
    url: /docs/home/
  -
    label: Automations &raquo;
    url: /docs/automations/
  -
    label: Commands &raquo;
    url: /docs/automations/#commands
---

The **error:** command unsuccessfully terminates an [automation](/docs/automations/) in the `error` [state](/docs/automations/#exit-states) and returns a message.

# Syntax

<pre>
<code class="language-cerb">
{% raw %}
start:
  error: An unexpected error occurred!
{% endraw %}
</code>
</pre>

The error message is returned to the caller.