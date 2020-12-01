---
title: "ui.interaction"
#excerpt: 
#social_image_url: /assets/images/search/kata.png
permalink: /docs/automations/triggers/ui.interaction/
toc:
  title: ui.interaction
  expand: Automations
jumbotron:
  title: ui.interaction
  tagline: 
  breadcrumbs:
  -
    label: Docs &raquo;
    url: /docs/home/
  -
    label: Automations &raquo;
    url: /docs/automations/
  -
    label: Triggers &raquo;
    url: /docs/automations/#triggers
---

{% include docs/note_preview.html %}

**ui.interaction** [automations](/docs/automations/) open an [interaction](/docs/interactions/) popup in a worker's web browser.

This trigger uses [event handler](/docs/automations/#event-handlers) KATA, and the first enabled automation is executed.

An interaction is usually triggered from a [toolbar](/docs/interactions/toolbar/).

Interactions may enter the `await` state any number of times for multi-step workflows where user input is required.

At conclusion, the `return` dictionary is returned to the caller.

For instance, an interaction may be started from the reply popup to fetch third-party information based on the recipient. The result generates a text snippet that is pasted into the editor at the current cursor position.

* TOC
{:toc}

# Callers

An interaction receives different inputs and expects different outputs depending on its caller.

These are the built-in callers:

| Caller | 
|-|-
| [**cerb.toolbar.automation.uiInteraction.await.sheet**](/docs/automations/triggers/ui.interaction/callers/cerb.toolbar.automation.uiInteraction.await.sheet/) | 
| [**cerb.toolbar.cardWidget.interactions**](/docs/automations/triggers/ui.interaction/callers/cerb.toolbar.cardWidget.interactions/) | 
| [**cerb.toolbar.cardWidget.sheet**](/docs/automations/triggers/ui.interaction/callers/cerb.toolbar.cardWidget.sheet/) | 
| [**cerb.toolbar.editor**](/docs/automations/triggers/ui.interaction/callers/cerb.toolbar.editor/) | 
| [**cerb.toolbar.editor.automation.script**](/docs/automations/triggers/ui.interaction/callers/cerb.toolbar.editor.automation.script/) | 
| [**cerb.toolbar.editor.automation.trigger**](/docs/automations/triggers/ui.interaction/callers/cerb.toolbar.editor.automation.trigger/) | 
| [**cerb.toolbar.editor.map**](/docs/automations/triggers/ui.interaction/callers/cerb.toolbar.editor.map/) | 
| [**cerb.toolbar.eventHandlers.editor**](/docs/automations/triggers/ui.interaction/callers/cerb.toolbar.eventHandlers.editor/) | 
| [**cerb.toolbar.mail.reply**](/docs/automations/triggers/ui.interaction/callers/cerb.toolbar.mail.reply/) | 
| [**cerb.toolbar.profileWidget.interactions**](/docs/automations/triggers/ui.interaction/callers/cerb.toolbar.profileWidget.interactions/) | 
| [**cerb.toolbar.profileWidget.sheet**](/docs/automations/triggers/ui.interaction/callers/cerb.toolbar.profileWidget.sheet/) | 
| [**cerb.toolbar.profiles.ticket.message**](/docs/automations/triggers/ui.interaction/callers/cerb.toolbar.profiles.ticket.message/) | 
| [**cerb.toolbar.projectBoardColumn**](/docs/automations/triggers/ui.interaction/callers/cerb.toolbar.projectBoardColumn/) | Project board column toolbar
| [**cerb.toolbar.workspaceWidget.interactions**](/docs/automations/triggers/ui.interaction/callers/cerb.toolbar.workspaceWidget.interactions/) | 

This isn't an exhaustive list because interactions can be called from third-party functionality (e.g. plugins). 

# Inputs

The automation [dictionary](/docs/automations/#dictionaries) starts with the following values:

| Key | Type | Notes
|-|-|-
| `caller_name` | string | The [caller](#callers) which started the interaction
| `caller_params` | dictionary | Parameters based on the caller type
| `inputs` | dictionary | [Custom input](/docs/automations/#inputs) values from the caller
| `worker_*` | record | The active worker record (supports key expansion)

# Outputs

## await:

When suspending in the `await` state, the interaction displays a form with the desired elements. The form may prompt for user input, validate it, and set dictionary keys (placeholders) with the responses.

<pre>
<code class="language-cerb">
await:
  form:
    title:
    elements:
</code>
</pre>

### form:title:

The title of this form to be displayed in the interaction popup. This would usually be a summary of the current step.

### form:elements:

Form elements are defined with a key in the format `type/name:`.

The `name` must be unique within the form. When an element prompts for user input, a placeholder with the same name will be created with their response. For instance, `text/prompt_name:` will create a placeholder of `{% raw %}{{prompt_name}}{% endraw %}` with the value of that text element.

A form can be created with any combination of the following element types:

| Element |
|-|-
| [**editor:**](/docs/automations/triggers/ui.interaction/elements/editor/) | Code editor
| [**fileUpload:**](/docs/automations/triggers/ui.interaction/elements/fileUpload/) | File upload prompt
| [**map:**](/docs/automations/triggers/ui.interaction/elements/map/) | Interactive [map](/docs/maps/) 
| [**say:**](/docs/automations/triggers/ui.interaction/elements/say/) | Block of text or Markdown
| [**sheet:**](/docs/automations/triggers/ui.interaction/elements/sheet/) | [Sheet](/docs/sheets) with row selection
| [**submit:**](/docs/automations/triggers/ui.interaction/elements/submit/) | Continue to next step
| [**text:**](/docs/automations/triggers/ui.interaction/elements/text/) | Text input with data types
| [**textarea:**](/docs/automations/triggers/ui.interaction/elements/textarea/) | Multiple lines of text

When the interaction suspends in the `await` state, a `submit:` element is automatically appended to the form if one doesn't already exist.

<pre>
<code class="language-cerb">
{% raw %}
start:
  await/who:
    form:
      title: Introduction
      elements:
        text/prompt_name:
          label: What is your name?
          required@bool: yes
  
  await/hello:
    form:
      title: Hello!
      elements:
        say/hello:
          content: Hello, {{prompt_name}}!
  
  return:
    user:
      name@key: prompt_name
{% endraw %}
</code>
</pre>

## return:

When the interaction concludes in the `return` state, it returns any number of key/value pairs to the caller. Keys may be nested to return dictionaries.

Each [caller](#callers) has a set of expected return keys to control its behavior.

<pre>
<code class="language-cerb">
return:
  key1: value1
  key2: value2
  ...
</code>
</pre>