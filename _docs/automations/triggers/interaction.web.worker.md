---
title: "interaction.web.worker"
excerpt: interaction.web.worker automations are worker-based interactions that use continuations to pause and resume a multi-step workflow. 
#social_image_url: /assets/images/search/kata.png
permalink: /docs/automations/triggers/interaction.web.worker/
toc:
  title: interaction.web.worker
  expand: Automations
jumbotron:
  title: interaction.web.worker
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

**interaction.web.worker** [automations](/docs/automations/) are worker-based [interactions](/docs/interactions/) that use [continuations](/docs/automations/#continuations) to pause and resume a multi-step workflow.

* TOC
{:toc}
  
<div class="cerb-screenshot">
<img src="/assets/images/docs/automations/triggers/interaction.web.worker/interaction-map.gif" class="screenshot">
</div>

These interactions are started by a [caller](#callers) in response to a worker action within Cerb. The caller is usually a customizable [toolbar](/docs/toolbars/), but it could be any interface component or feature (e.g. buttons, links, images).

At its conclusion, an interaction returns a [dictionary](/docs/automations/#dictionaries) and [exit state](/docs/automations/#exit-states) to the caller, which is then responsible for acting on the results.

Each caller provides its own inputs, as well as the possible responses it accepts.

This separation of duties makes interactions simpler to build and reuse. An interaction doesn't have to be concerned with the capabilities of a specific caller.

For instance, an interaction may be started from a toolbar in the email reply editor to fetch information based on the recipients (e.g. order history). The interaction generates and returns a text snippet, which the caller pastes into the editor at the cursor. The interaction only needs to generate some text, without any consideration for how it will be pasted into the editor.

<div class="cerb-screenshot">
<img src="/assets/images/docs/automations/triggers/interaction.web.worker/interactions-participants.gif" class="screenshot">
</div>

# Inputs

An interaction automation [dictionary](/docs/automations/#dictionaries) starts with the following input values:

| Key | Type | Notes
|-|-|-
| `caller_name` | string | The [caller](#callers) which started the interaction.
| `caller_params` | dictionary | Built-in parameters based on the caller type.
| `inputs` | dictionary | [Custom input](/docs/automations/#inputs) values from the caller.
| `worker_*` | record | The active [worker](/docs/records/types/worker/) record. Supports key expansion.

# Outputs

## await:

When suspending in the `await` state, the interaction displays a web form with the desired elements. The form may prompt for user input, validate it, and set dictionary keys (placeholders) with the responses.

<pre>
<code class="language-cerb">
await:
  form:
    title: Your form title
    elements:
      # ...
</code>
</pre>

### form:title:

The title of this form to be displayed in the interaction popup. This is usually a summary of the current step.

### form:elements:

Form elements are defined with a key in the format `type/name:`.

The `name` must be unique within the form. When an element prompts for user input, a placeholder with the same name will be created with their response. For instance, `text/prompt_name:` will create a placeholder of `{% raw %}{{prompt_name}}{% endraw %}` with the value of that text element.

A form can be created with any combination of the following element types:

| Element |
|-|-
| [**editor:**](/docs/automations/triggers/interaction.web.worker/elements/editor/) | A code editor with syntax highlighting, autocompletion, and a custom toolbar.
| [**fileUpload:**](/docs/automations/triggers/interaction.web.worker/elements/fileUpload/) | File upload prompt
| [**map:**](/docs/automations/triggers/interaction.web.worker/elements/map/) | Interactive [map](/docs/maps/) 
| [**say:**](/docs/automations/triggers/interaction.web.worker/elements/say/) | Block of text or Markdown
| [**sheet:**](/docs/automations/triggers/interaction.web.worker/elements/sheet/) | [Sheet](/docs/sheets) with row selection
| [**submit:**](/docs/automations/triggers/interaction.web.worker/elements/submit/) | Continue to next step
| [**text:**](/docs/automations/triggers/interaction.web.worker/elements/text/) | Text input with data types
| [**textarea:**](/docs/automations/triggers/interaction.web.worker/elements/textarea/) | Multiple lines of text

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

# Callers

An interaction receives different inputs and expects different outputs depending on its caller.

## Toolbars

| Toolbar |
|-|-
| [**global.menu**](/docs/toolbars/interactions/global.menu/) | Global interactions from the floating icon in the lower right
| [**mail.compose**](/docs/toolbars/interactions/mail.compose/) | Composing new email messages
| [**mail.read**](/docs/toolbars/interactions/mail.read/) | Reading email messages
| [**mail.reply**](/docs/toolbars/interactions/mail.reply/) | Replying to email messages
| [**record.card**](/docs/toolbars/interactions/record.card/) | Viewing a record card popup
| [**record.profile**](/docs/toolbars/interactions/record.profile/) | Viewing a record profile page

## Built-in

### Interactions

| Caller | 
|-|-
| [**cerb.toolbar.cardWidget.interactions**](/docs/automations/triggers/interaction.web.worker/callers/cerb.toolbar.cardWidget.interactions/) | Interactions [toolbar](/docs/toolbars/) in [card widgets](/docs/records/types/card_widget/)
| [**cerb.toolbar.profileWidget.interactions**](/docs/automations/triggers/interaction.web.worker/callers/cerb.toolbar.profileWidget.interactions/) | Interactions [toolbar](/docs/toolbars/) in [profile widgets](/docs/records/types/profile_widget/)
| [**cerb.toolbar.workspaceWidget.interactions**](/docs/automations/triggers/interaction.web.worker/callers/cerb.toolbar.workspaceWidget.interactions/) | Interactions [toolbar](/docs/toolbars/) in [workspace widgets](/docs/records/types/workspace_widget/)

### Project boards

| Caller | 
|-|-
| [**cerb.toolbar.projectBoardColumn**](/docs/automations/triggers/interaction.web.worker/callers/cerb.toolbar.projectBoardColumn/) | [Project board](/docs/project-boards/) column [toolbar](/docs/toolbars/)

### Sheets

| Caller | 
|-|-
| [**cerb.toolbar.automation.interaction.web.worker.await.sheet**](/docs/automations/triggers/interaction.web.worker/callers/cerb.toolbar.automation.interaction.web.worker.await.sheet/) | [Sheet prompt](/docs/automations/triggers/interaction.web.worker/elements/sheet/) toolbar in an [interaction](/docs/interactions/)
| [**cerb.toolbar.cardWidget.sheet**](/docs/automations/triggers/interaction.web.worker/callers/cerb.toolbar.cardWidget.sheet/) | [Sheet](/docs/sheets/) toolbar in [card widgets](/docs/records/types/card_widget/) 
| [**cerb.toolbar.profileWidget.sheet**](/docs/automations/triggers/interaction.web.worker/callers/cerb.toolbar.profileWidget.sheet/) | [Sheet](/docs/sheets/) toolbar in [profile widgets](/docs/records/types/profile_widget/)

### Internal

| Caller | 
|-|-
| [**cerb.toolbar.editor.automation.script**](/docs/automations/triggers/interaction.web.worker/callers/cerb.toolbar.editor.automation.script/) | [Automation](/docs/automations/) script editor toolbar
| [**cerb.toolbar.editor.automation.trigger**](/docs/automations/triggers/interaction.web.worker/callers/cerb.toolbar.editor.automation.trigger/) | [Automation](/docs/automations/) editor trigger chooser
| [**cerb.toolbar.eventHandlers.editor**](/docs/automations/triggers/interaction.web.worker/callers/cerb.toolbar.eventHandlers.editor/) | [Automation](/docs/automations/) event handlers editor toolbar
| [**cerb.toolbar.editor**](/docs/automations/triggers/interaction.web.worker/callers/cerb.toolbar.editor/) | [Toolbar](/docs/toolbars/) editor
| [**cerb.toolbar.editor.map**](/docs/automations/triggers/interaction.web.worker/callers/cerb.toolbar.editor.map/) | Map editor toolbar
