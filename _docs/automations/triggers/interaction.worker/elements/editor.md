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
          readonly@bool: no
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

### line_numbers@bool:

If `no`, the editor line numbers in the left gutter are hidden. They are enabled by default.

### readonly@bool:

If `yes`, the editor contents may not be modified. Editors are readable by default.

### required@bool:

If user input is required on this element use a value of `yes`. Otherwise, omit.

### toolbar:

An optional [toolbar](/docs/toolbars/) to display above the editor. This triggers [worker interactions](/docs/automations/triggers/interaction.worker/).

Interactions started from this toolbar will have a caller of `cerb.toolbar.interaction.worker.await.editor` with these `caller_params`:

|---
| Key | Description
|-|-
| `value` | The full content of the editor
| `selected_text` | The selected text within the editor (if any)
| `cursor_column` | The text cursor column (zero-based, left to right)
| `cursor_row` | The text cursor row (zero-based, top to bottom)

### validation:

An optional custom validation script. Any output is considered to be an error.

You can use `if...elseif` to check multiple conditions.

<pre>
<code class="language-cerb">
{% raw %}
editor/prompt_script:
  label: Script:
  validation@raw:
    {% if prompt_script is empty %}
    A script is required.
    {% elseif prompt_script|length < 25 %}
    A script must be at least 25 characters. 
    {% endif %}{% endraw %}
</code>
</pre>