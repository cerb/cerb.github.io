---
title: "ui.interaction"
excerpt: ui.interaction automations are worker-based interactions that use continuations to pause and resume a multi-step workflow. 
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

**ui.interaction** [automations](/docs/automations/) are worker-based [interactions](/docs/interactions/) that use [continuations](/docs/automations/#continuations) to pause and resume a multi-step workflow.

<div class="cerb-screenshot">
<img src="/assets/images/docs/automations/triggers/ui.interaction/interaction-map.gif" class="screenshot">
</div>

These interactions are started by a [caller](#callers) in response to a worker action within Cerb. The caller is usually a customizable [toolbar](#toolbars), but it could be any interface component or feature (e.g. buttons, links, images).

At its conclusion, an interaction returns a [dictionary](/docs/automations/#dictionaries) and [exit state](/docs/automations/#exit-states) to the caller, which is then responsible for acting on the results.

Each caller provides its own inputs, as well as the possible responses it accepts.

This separation of duties makes interactions simpler to build and reuse. An interaction doesn't have to be concerned with the capabilities of a specific caller.

For instance, an interaction may be started from a toolbar in the email reply editor to fetch information based on the recipients (e.g. order history). The interaction generates and returns a text snippet, which the caller pastes into the editor at the cursor. The interaction only needs to generate some text, without any consideration for how it will be pasted into the editor.

<div class="cerb-screenshot">
<img src="/assets/images/docs/automations/triggers/ui.interaction/interactions-participants.gif" class="screenshot">
</div>

* TOC
{:toc}

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
| [**editor:**](/docs/automations/triggers/ui.interaction/elements/editor/) | A code editor with syntax highlighting, autocompletion, and a custom toolbar.
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

# Toolbars

A **toolbar** is a collection of **interactions** and **menus**. Toolbars are configured using a [KATA](/docs/kata/) dialect, which can pass custom [input](/docs/automations/#inputs) to the interaction using placeholders (current worker, record, etc).

Top-level toolbar items are displayed as **buttons**. Items within a menu are displayed as **links**.

<div class="cerb-screenshot">
<img src="/assets/images/docs/automations/triggers/ui.interaction/toolbar.png" class="screenshot">
</div>

### interaction:

An interaction begins when it is clicked in the toolbar.

<pre>
<code class="language-cerb">
{% raw %}
interaction/participants:
  label: Participants
  badge: {{record_participants|length|default(0)}}
  uri: cerb:automation:cerb.ticket.participants.manage
  inputs:
    ticket@key: record_id
  #hidden@bool: no
  after:
    refresh_widgets@csv: Actions

interaction/locationByIp:
  uri: cerb:automation:example.interaction.locationByIP
  label: Location by IP
  icon: globe
  after:
    refresh_widgets@list: Actions
{% endraw %}
</code>
</pre>

|Req'd|Key|
|:-:|-
|√|`uri:`| The URI of the `ui.interaction` [automation](/docs/automations/) to start when clicked.
||`inputs:`| The optional [inputs](/docs/automations/#inputs) dictionary for the interaction.
|√|`label:`| The label to describe the interaction in buttons and menu links. This may be omitted if an icon is provided.
||`icon:`| The optional [icon](/docs/developers/icons/) to display in buttons and menu links. This can be in addition to, or instead of, the label.
||`tooltip:`| If a button only has an icon and not a label, the tooltip can show a label when hovering over it.
||`badge:`| The optional counter to display on buttons.
||`hidden@bool:`| Conditionally determine whether to display this toolbar item or not. For instance, check worker permissions or record fields.
||`after:`| Actions to take when the interaction completes successfully. For instance, a completed interaction on a dashboard can refresh any number of widgets by name to show updated data. Options here depend on the [caller](#callers).

### menu:

Menus may contain any combination of interactions and submenus.

<pre>
<code class="language-cerb">
{% raw %}
menu/moreMenu:
  icon: more
  tooltip: More
  items:
    menu/tools:
      label: Tools
      items:
        interaction/debug:
          uri: cerb:automation:example.interaction.echo
          label: Debug
          icon: bug
{% endraw %}
</code>
</pre>

<div class="cerb-screenshot">
<img src="/assets/images/docs/automations/triggers/ui.interaction/toolbar-menu.png" class="screenshot">
</div>

|Req'd|Key|
|:-:|-
|√|`label:`| The label to describe the menu in buttons and menu links. This may be omitted if an icon is provided.
||`icon:`| The optional [icon](/docs/developers/icons/) to display in buttons and menu links. This can be in addition to, or instead of, the label.
|√|`items:`| A list of [menu](#menu) and [interaction](#interaction) items.
||`default:`| Display a "split" menu button. Clicking on the left-side immediately runs this default [interaction](#interaction) by name. Clicking on the right-side opens a menu of alternative options.

# Callers

An interaction receives different inputs and expects different outputs depending on its caller.

### Automations

| Caller | 
|-|-
| [**cerb.toolbar.editor.automation.script**](/docs/automations/triggers/ui.interaction/callers/cerb.toolbar.editor.automation.script/) | [Automation](/docs/automations/) script editor toolbar
| [**cerb.toolbar.editor.automation.trigger**](/docs/automations/triggers/ui.interaction/callers/cerb.toolbar.editor.automation.trigger/) | [Automation](/docs/automations/) editor trigger chooser
| [**cerb.toolbar.eventHandlers.editor**](/docs/automations/triggers/ui.interaction/callers/cerb.toolbar.eventHandlers.editor/) | [Automation](/docs/automations/) event handlers editor toolbar

### Interactions

| Caller | 
|-|-
| [**cerb.toolbar.editor**](/docs/automations/triggers/ui.interaction/callers/cerb.toolbar.editor/) | [Toolbar](#toolbars) editor
| [**cerb.toolbar.cardWidget.interactions**](/docs/automations/triggers/ui.interaction/callers/cerb.toolbar.cardWidget.interactions/) | Interactions [toolbar](#toolbars) in [card widgets](/docs/records/types/card_widget/)
| [**cerb.toolbar.profileWidget.interactions**](/docs/automations/triggers/ui.interaction/callers/cerb.toolbar.profileWidget.interactions/) | Interactions [toolbar](#toolbars) in [profile widgets](/docs/records/types/profile_widget/)
| [**cerb.toolbar.workspaceWidget.interactions**](/docs/automations/triggers/ui.interaction/callers/cerb.toolbar.workspaceWidget.interactions/) | Interactions [toolbar](#toolbars) in [workspace widgets](/docs/records/types/workspace_widget/)

### Mail

| Caller | 
|-|-
| [**cerb.toolbar.mail.reply**](/docs/automations/triggers/ui.interaction/callers/cerb.toolbar.mail.reply/) | Email reply editor toolbar
| [**cerb.toolbar.profiles.ticket.message**](/docs/automations/triggers/ui.interaction/callers/cerb.toolbar.profiles.ticket.message/) | Message toolbars on ticket profiles 

### Maps

| Caller | 
|-|-
| [**cerb.toolbar.editor.map**](/docs/automations/triggers/ui.interaction/callers/cerb.toolbar.editor.map/) | Map editor toolbar

### Project boards

| Caller | 
|-|-
| [**cerb.toolbar.projectBoardColumn**](/docs/automations/triggers/ui.interaction/callers/cerb.toolbar.projectBoardColumn/) | [Project board](/docs/project-boards/) column [toolbar](#toolbars)

### Sheets

| Caller | 
|-|-
| [**cerb.toolbar.automation.uiInteraction.await.sheet**](/docs/automations/triggers/ui.interaction/callers/cerb.toolbar.automation.uiInteraction.await.sheet/) | [Sheet prompt](/docs/automations/triggers/ui.interaction/elements/sheet/) toolbar in an [interaction](/docs/interactions/)
| [**cerb.toolbar.cardWidget.sheet**](/docs/automations/triggers/ui.interaction/callers/cerb.toolbar.cardWidget.sheet/) | [Sheet](/docs/sheets/) toolbar in [card widgets](/docs/records/types/card_widget/) 
| [**cerb.toolbar.profileWidget.sheet**](/docs/automations/triggers/ui.interaction/callers/cerb.toolbar.profileWidget.sheet/) | [Sheet](/docs/sheets/) toolbar in [profile widgets](/docs/records/types/profile_widget/)
