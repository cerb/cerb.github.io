---
title: "interaction.worker"
excerpt: interaction.worker automations are worker-based interactions that use continuations to pause and resume a multi-step workflow. 
#social_image_url: /assets/images/search/kata.png
permalink: /docs/automations/triggers/interaction.worker/
redirect_from:
- /docs/automations/triggers/interaction.web.worker/
toc:
  title: interaction.worker
  expand: Automations
jumbotron:
  title: interaction.worker
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

**interaction.worker** [automations](/docs/automations/) are worker-based [interactions](/docs/interactions/) that use [continuations](/docs/automations/#continuations) to pause and resume a multi-step workflow.

* TOC
{:toc}
  
<div class="cerb-screenshot">
<img src="/assets/images/docs/automations/triggers/interaction.worker/interaction-map.gif" class="screenshot">
</div>

These interactions are started by a [caller](#callers) in response to a worker action within Cerb. The caller is usually a customizable [toolbar](/docs/toolbars/), but it could be any interface component or feature (e.g. buttons, links, images).

At its conclusion, an interaction returns a [dictionary](/docs/automations/#dictionaries) and [exit state](/docs/automations/#exit-states) to the caller, which is then responsible for acting on the results.

Each caller provides its own inputs, as well as the possible responses it accepts.

This separation of duties makes interactions simpler to build and reuse. An interaction doesn't have to be concerned with the capabilities of a specific caller.

For instance, an interaction may be started from a toolbar in the email reply editor to fetch information based on the recipients (e.g. order history). The interaction generates and returns a text snippet, which the caller pastes into the editor at the cursor. The interaction only needs to generate some text, without any consideration for how it will be pasted into the editor.

<div class="cerb-screenshot">
<img src="/assets/images/docs/automations/triggers/interaction.worker/interactions-participants.gif" class="screenshot">
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

## await:form:

When suspending in the `await:form:` state, the interaction displays a web form with the desired elements. The form may prompt for user input, validate it, and set dictionary keys (placeholders) with the responses.

<pre>
<code class="language-cerb">
await:
  form:
    title: Your form title
    elements:
      # ...
</code>
</pre>

### title:
{: .no_toc}

The title of this form to be displayed in the interaction popup. This is usually a summary of the current step.

### elements:
{: .no_toc}

Form elements are defined with a key in the format `type/name:`.

The `name` must be unique within the form. When an element prompts for user input, a placeholder with the same name will be created with their response. For instance, `text/prompt_name:` will create a placeholder of `{% raw %}{{prompt_name}}{% endraw %}` with the value of that text element.

A form can be created with any combination of the following element types:

| Element |
|-|-
| [**editor:**](/docs/automations/triggers/interaction.worker/elements/editor/) | A code editor with syntax highlighting, autocompletion, and a custom toolbar.
| [**fileUpload:**](/docs/automations/triggers/interaction.worker/elements/fileUpload/) | File upload prompt
| [**map:**](/docs/automations/triggers/interaction.worker/elements/map/) | Interactive [map](/docs/maps/) 
| [**say:**](/docs/automations/triggers/interaction.worker/elements/say/) | Block of text or Markdown
| [**sheet:**](/docs/automations/triggers/interaction.worker/elements/sheet/) | [Sheet](/docs/sheets) with row selection
| [**submit:**](/docs/automations/triggers/interaction.worker/elements/submit/) | Continue to next step
| [**text:**](/docs/automations/triggers/interaction.worker/elements/text/) | Text input with data types
| [**textarea:**](/docs/automations/triggers/interaction.worker/elements/textarea/) | Multiple lines of text

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

## await:draft:

When suspending in the `await:draft:` state, the interaction opens the email editor popup and waits for completion.

### uri:
{: .no_toc}

The `uri:` parameter specifies a compose or reply [draft](/docs/records/types/draft/) to resume (by ID or token). An automation can create a draft record prior to this step.

### output:
{: .no_toc}

An optional `output:` parameter has the following keys:

| `status` | One of: `compose.sent`, `compose.draft`, `compose.discard`, `reply.sent`, `reply.draft`, `reply.discard`
| `record` | The dictionary of the record. For `.sent` this will be a [message](/docs/records/types/message/). For `.draft` it will be a [draft](/docs/records/types/draft/).

This allows the interaction to make decisions based on those outcomes.

<pre>
<code class="language-cerb">
{% raw %}
start:
  record.create:
    output: draft_record
    inputs:
      record_type: draft
      # See: https://cerb.ai/docs/records/types/draft/
      fields:
        name: Draft for customer@cerb.example
        type: mail.compose
        worker_id@key,int: worker_id
        params:
          to: customer@cerb.example
          content@text:
            Hi,
            
            #signature

  await/resume:
    draft:
      uri: cerb:draft:{{draft_record.id}}
      output: results_draft

  outcome/sent:
    if@bool: {{results_draft.status ends with '.sent'}}
    then:
      await:
        form:
          say: Message sent!
{% endraw %}
</code>
</pre>

## await:interaction:

When suspending in the `await:interaction:` state, the interaction temporarily hands control to another delegate interaction. The interaction resumes at the current point when the delegate exits.

Delegates can be nested to any depth. For instance, a reusable delegate could handle email or SMS validation, and be shared by many other interactions.

This makes interactions much more modular and reusable.

### uri:
{: .no_toc}

The `uri:` parameter specifies the delegate [automation](/docs/records/types/automation/). This must use the [interaction.worker](/docs/automations/triggers/interaction.worker/) trigger.

### output:
{: .no_toc}

An `output:` key specifies the placeholder that should receive the results from the delegate.

<pre>
<code class="language-cerb">
{% raw %}
start:
  while:
    if@bool: yes
    do:
      await/menu:
        form:
          title: Menu
          elements:
            say:
              message: How can we help?
            sheet/prompt_menu:
              required@bool: yes
              data:
                0:
                  key: map
                  label: Map
                1:
                  key: echo
                  label: Echo
              schema:
                layout:
                  style: buttons
                  headings@bool: no
                  paging@bool: no
                  title_column: label
                columns:
                  selection/key:
                    params:
                      mode: single
                  text/label:
            submit:
              continue@bool: no
              reset@bool: no
      await/do:
        interaction:
          output: results
          uri@text:
            cerb:automation:{{{
                'map': 'wgm.interaction.locationByIP',
                'echo': 'wgm.interaction.echo',
              }[prompt_menu]}}
{% endraw %}
</code>
</pre>

## await:record:

When suspending in the `await:record:` state, the interaction opens a record editor popup and waits for completion.

### uri:
{: .no_toc}

This takes a `uri:` parameter which specifies a record type (and optionally record ID) to open in an editor popup.

If the ID is omitted then the editor is opened in 'create' mode.

### output:
{: .no_toc}

An optional `output:` parameter specifies a placeholder to store the status of the record after creation/modification (e.g. saved, deleted, aborted).

| `event` | `record.created`, `record.updated`, `record.deleted`, `record.aborted` 
| `record` | The dictionary of the created or modified record.

This allows the interaction to make decisions based on those outcomes.

<pre>
<code class="language-cerb">
{% raw %}
inputs:
  text/record_type:
    type: record_type
    required@bool: yes
  record/column:
    record_type: project_board_column
    required@bool: yes

start:
  await:
    record:
      uri: cerb:{{inputs.record_type}}
      output: result
  outcome:
    if@bool: {{result.record._context and result.record.id}}
    then:
      record.update:
        output: new_record
        inputs:
          record_type: {{result.record._context}}
          record_id: {{result.record.id}}
          fields:
            links@list:
              project_board_column:{{inputs.column.id}}

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
| [**cerb.toolbar.cardWidget.interactions**](/docs/automations/triggers/interaction.worker/callers/cerb.toolbar.cardWidget.interactions/) | Interactions [toolbar](/docs/toolbars/) in [card widgets](/docs/records/types/card_widget/)
| [**cerb.toolbar.profileWidget.interactions**](/docs/automations/triggers/interaction.worker/callers/cerb.toolbar.profileWidget.interactions/) | Interactions [toolbar](/docs/toolbars/) in [profile widgets](/docs/records/types/profile_widget/)
| [**cerb.toolbar.workspaceWidget.interactions**](/docs/automations/triggers/interaction.worker/callers/cerb.toolbar.workspaceWidget.interactions/) | Interactions [toolbar](/docs/toolbars/) in [workspace widgets](/docs/records/types/workspace_widget/)

### Project boards

| Caller | 
|-|-
| [**cerb.toolbar.projectBoardColumn**](/docs/automations/triggers/interaction.worker/callers/cerb.toolbar.projectBoardColumn/) | [Project board](/docs/project-boards/) column [toolbar](/docs/toolbars/)

### Sheets

| Caller | 
|-|-
| [**cerb.toolbar.automation.interaction.worker.await.sheet**](/docs/automations/triggers/interaction.worker/callers/cerb.toolbar.automation.interaction.worker.await.sheet/) | [Sheet prompt](/docs/automations/triggers/interaction.worker/elements/sheet/) toolbar in an [interaction](/docs/interactions/)
| [**cerb.toolbar.cardWidget.sheet**](/docs/automations/triggers/interaction.worker/callers/cerb.toolbar.cardWidget.sheet/) | [Sheet](/docs/sheets/) toolbar in [card widgets](/docs/records/types/card_widget/) 
| [**cerb.toolbar.profileWidget.sheet**](/docs/automations/triggers/interaction.worker/callers/cerb.toolbar.profileWidget.sheet/) | [Sheet](/docs/sheets/) toolbar in [profile widgets](/docs/records/types/profile_widget/)

### Internal

| Caller | 
|-|-
| [**cerb.toolbar.editor.automation.script**](/docs/automations/triggers/interaction.worker/callers/cerb.toolbar.editor.automation.script/) | [Automation](/docs/automations/) script editor toolbar
| [**cerb.toolbar.editor.automation.trigger**](/docs/automations/triggers/interaction.worker/callers/cerb.toolbar.editor.automation.trigger/) | [Automation](/docs/automations/) editor trigger chooser
| [**cerb.toolbar.eventHandlers.editor**](/docs/automations/triggers/interaction.worker/callers/cerb.toolbar.eventHandlers.editor/) | [Automation](/docs/automations/) event handlers editor toolbar
| [**cerb.toolbar.editor**](/docs/automations/triggers/interaction.worker/callers/cerb.toolbar.editor/) | [Toolbar](/docs/toolbars/) editor
| [**cerb.toolbar.editor.map**](/docs/automations/triggers/interaction.worker/callers/cerb.toolbar.editor.map/) | Map editor toolbar
