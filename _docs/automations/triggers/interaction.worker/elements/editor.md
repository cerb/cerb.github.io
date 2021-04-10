---
title: "Editor - Interaction Form Element"
#excerpt: 
#social_image_url: /assets/images/search/kata.png
permalink: /docs/automations/triggers/interaction.worker/elements/editor/
toc:
  title: Editor
  expand: Automations
jumbotron:
  title: Editor
  tagline: 
  breadcrumbs:
  -
    label: Docs &raquo;
    url: /docs/home/
  -
    label: Automations &raquo;
    url: /docs/automations/
  -
    label: interaction.worker &raquo;
    url: /docs/automations/triggers/interaction.worker/
  -
    label: Elements &raquo;
    url: /docs/automations/triggers/interaction.worker/#elements
---

In [interaction](/docs/automations/triggers/interaction.worker/) web forms, an **editor** element displays a code editor with syntax highlighting, autocompletion, and a custom toolbar.

<pre>
<code class="language-cerb">
{% raw %}
start:
  await:
    form:
      title: Editor Example
      elements:
        editor/prompt_query:
          label: Data query:
          syntax: cerb_query
          default@text:
            type:worklist.records
            of:ticket
            query:(
              status:o
              limit:10
            )
            format:dictionaries
{% endraw %}
</code>
</pre>

<div class="cerb-screenshot">
<img src="/assets/images/docs/automations/triggers/interaction.worker/elements/editor.png" class="screenshot">
</div>

# Syntax

### label:

The optional label to display above the form element.

### syntax:

The language for syntax highlighting and autocompletion.

|Language|
|-|-
|`cerb_query`| Cerb [data query](/docs/data-queries/) language
|`html`| HTML (Hypertext Markup Language)
|`json`| JSON (JavaScript Object Notation)
|`markdown`| Markdown
|`text`| Plain text
|`yaml`| YAML (YAML Ain't Markup Language)

### default:

The default editor text.

### required@bool:

If user input is required on this element use a value of `yes`. Otherwise, omit.