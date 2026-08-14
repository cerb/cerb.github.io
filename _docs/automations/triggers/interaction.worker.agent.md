---
title: 'Automations: interaction.worker.agent'
excerpt: The interaction.worker.agent automation trigger runs an agent chat that drives the editor it was launched beside.
summary: This page documents the interaction.worker.agent automation trigger in Cerb. It extends interaction.worker with one additional form element, uiCommand, which round-trips a command to the host editor the interaction was launched beside. This is what lets an AI agent chat in an agent pane read and write the document in front of it. Because the capability depends on the caller providing a command bridge, uiCommand is advertised only on this trigger rather than on the generic worker trigger. The page covers when to choose this trigger over interaction.worker and interaction.internal, the uiCommand syntax, its return variable, gating several commands in one form with disabled, the caller policy an agent pane requires, and the host editors and worklist search bars that provide a bridge.
permalink: /docs/automations/triggers/interaction.worker.agent/
toc:
  title: interaction.worker.agent
  expand: Automations
jumbotron:
  title: interaction.worker.agent
  tagline: ~
  breadcrumbs:
  - label: Docs &raquo;
    url: /docs/home/
  - label: Automations &raquo;
    url: /docs/automations/
  - label: Triggers &raquo;
    url: /docs/automations/#triggers
---

The **interaction.worker.agent** [automation](/docs/automations/) trigger extends [interaction.worker](/docs/automations/triggers/interaction.worker/) with one additional form element: [uiCommand](/docs/automations/triggers/interaction.worker/elements/uiCommand/).

It's the trigger for an agent chat that sits beside an editor and can read and write the document in front of it.

Everything from `interaction.worker` -- its inputs, outputs, and form elements -- is available here as well.

* TOC
{:toc}

# Choosing a trigger

Three interaction triggers look similar from the outside. The difference is who the conversation belongs to, and whether it can reach the editor beside it.

| Trigger                                                                             | Use it for                                                                                                         |
|-------------------------------------------------------------------------------------|--------------------------------------------------------------------------------------------------------------------|
| [interaction.worker](/docs/automations/triggers/interaction.worker/)                | An ordinary [worker interaction](/docs/interactions/). No UI component access in the browser.                      |
| **interaction.worker.agent**                                                        | A worker's agent chat that drives the editor it was launched beside.                                               |
| [interaction.internal](/docs/plugins/extensions/cerb.trigger.interaction.internal/) | Automations Cerb runs on its own behalf -- record choosers, autocomplete helpers, the dialogs inside the builders. |

`interaction.internal` exists so a worker can filter Cerb's own plumbing out of an automation [worklist](/docs/worklists/) and never think about it again. Agent panes are the opposite: they're the worker's own conversations, they park as resumable continuations, and they appear in the pane's History and the command bar's Resume list.

# Why a separate trigger

`uiCommand` round-trips a command to the **host editor** the interaction was launched beside. That only works when the caller provides a command bridge, so the element is advertised on this trigger alone.

Gating it this way means no caller without the bridge is ever handed a capability it can't fulfill.

You don't have to keep track of it yourself: saving an automation whose `await:form:` uses an element its trigger doesn't offer is rejected, and the error names the trigger you need.

# uiCommand

A `uiCommand` element names a command for the host editor to run, and the key you give it is the **return variable**:

{% highlight cerb %}
{% raw %}
await:
  form:
    elements:
      uiCommand/current_value:
        command: getEditorValue
{% endraw %}
{% endhighlight %}

| Key         | Notes                                                                       |
|-------------|-----------------------------------------------------------------------------|
| `command:`  | The name of the host callback to run                                        |
| `params:`   | Optional parameters passed to the callback                                  |
| `disabled:` | When true, render inert -- emit an empty return variable with no round-trip |

Unlike most awaits, a `uiCommand` fills its value synchronously from the host's callback. It does **not** submit the form on its own; the form's own `submit:` posts it along with everything else.

See the [uiCommand](/docs/automations/triggers/interaction.worker/elements/uiCommand/) element reference for the full command vocabulary of each host, the shape of returned values, and the `ui_capabilities` input that makes one automation portable across editors.

## Gating several commands in one form

Because a disabled `uiCommand` emits an empty return variable instead of round-tripping, one `await:form:` can carry several commands and let the agent's request decide which actually runs:

{% highlight cerb %}
{% raw %}
await:
  form:
    elements:
      uiCommand/read_result:
        command: getEditorValue
        disabled@bool: {{__tool.parameters.command != 'getEditorValue'}}
      uiCommand/write_result:
        command: setEditorValue
        params:
          value: {{__tool.parameters.value}}
        disabled@bool: {{__tool.parameters.command != 'setEditorValue'}}
{% endraw %}
{% endhighlight %}

# Hosts

A host provides the command bridge and decides which chats its [agent pane](/docs/toolbars/interactions/agent.pane/) offers. The hosts today are:

| Host                                                 | `component`     |
|------------------------------------------------------|-----------------|
| Automation editor                                    | `automation`    |
| Automation Scripting Tester                          | `bot_scripting` |
| Data Query Tester                                    | `data_query`    |
| [Icon Builder](/docs/setup/developers/icon-builder/) | `icon`          |
| Mail Reply                                           | `mail_reply`    |
| [Worklist](/docs/worklists/) search fields           | `worklist`      |

Which chats each host offers is configured on the [`agent.pane`](/docs/toolbars/interactions/agent.pane/) [toolbar](/docs/toolbars/). Because one shared toolbar serves every host, gate an item to the hosts it makes sense in:

{% highlight cerb %}
{% raw %}
hidden@bool: {{ component != 'worklist' }}
{% endraw %}
{% endhighlight %}

There's no shared command vocabulary. Each host declares its own, so read `ui_capabilities` at runtime rather than hard-coding a list -- that's what makes one automation portable across hosts. Every return value is a **string**; commands that need structure return JSON the automation has to decode.

<div class="cerb-box note">
	<p>
		<b>No host exposes results.</b> The search bar can start a search and the testers can set a
		query, but neither hands anything back through the bridge. An interaction reads results
		server-side on its next turn with a <a href="/docs/data-queries/">data query</a> instead.
		Don't go looking for a <code>getResults</code>.
	</p>
</div>

## Caller policy

An agent pane launches its interactions as the `agent.pane` caller. An automation's [policy](/docs/automations/#policies) has to allow that caller, or its tile never appears in the pane:

{% highlight cerb %}
{% raw %}
callers:
  caller/agent_pane:
    name: agent.pane
{% endraw %}
{% endhighlight %}

## Automation editor

`component: automation`. The only field-keyed code host: `key:` selects `script` or `policy`.

| Command         | Params                                                                       | Returns                                                                                                                                                          |
|-----------------|------------------------------------------------------------------------------|------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| `getFields`     |                                                                              | JSON `{name, description, trigger, script, policy}`. `trigger` is the raw extension ID, not a label.                                                             |
| `setField`      | `key:` one of `name`, `description`, `trigger`, `script`, `policy`; `value:` | `ok`. Wholesale replace.                                                                                                                                         |
| `editField`     | `key:` `script` or `policy`; `old:`; `new:`                                  | `ok`. `old:` must match **exactly once** -- zero or several matches is an error naming the count. Unfolds the editor and flashes the changed range.              |
| `grepField`     | `key:` `script` or `policy`; `query:`; `limit:` (default 25)                 | JSON array of `{line, path, text}`. `line` is 1-based; `path` is the [KATA](/docs/kata/) key path of the row; `text` is trimmed and truncated to 200 characters. |
| `getDiff`       | `key:` `script` or `policy` (default `script`)                               | JSON `{key, tracked, hunks}` against the last save. See the caveat below.                                                                                        |
| `changeTab`     | `tab:` one of `run`, `policy`, `log`, `visualization`, `usage`               | `ok`                                                                                                                                                             |
| `highlightLine` | `line:` (1-based)                                                            | `ok`. Always the script editor -- it takes no `key:`.                                                                                                            |
| `highlightKey`  | `key:` `script` or `policy` (default `script`); `path:`                      | `ok`. Pairs with `grepField`, which reports the path to jump to -- more robust than counting lines.                                                              |

Only the script editor tracks changes, so `getDiff` with `key: policy` always reports `tracked: false` and no hunks. It doesn't error; it simply never has anything to say.

## Automation Scripting Tester

`component: bot_scripting`. A single-editor host -- no `key:` anywhere.

| Command          | Params                          | Returns                                                                                                                                                                            |
|------------------|---------------------------------|------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| `getEditorValue` |                                 | The raw editor text.                                                                                                                                                               |
| `setEditorValue` | `value:`                        | `ok`. Wholesale replace.                                                                                                                                                           |
| `editField`      | `old:`; `new:`                  | `ok`, with the same exactly-once rule as above.                                                                                                                                    |
| `grepField`      | `query:`; `limit:` (default 25) | JSON array of `{line, path, text}`. `path` is always empty here -- only the [KATA](/docs/kata/) editor knows key paths.                                                            |
| `highlightLine`  | `line:` (1-based)               | `ok`                                                                                                                                                                               |
| `getDiff`        |                                 | JSON `{tracked, hunks}` -- no `key`, since there's one editor. The baseline is the **last test run**, not the last save, so nothing is tracked until the script has been run once. |

## Data Query Tester

`component: data_query`. Identical to the Automation Scripting Tester for all five of its commands -- same params, same returns, same empty `path` -- minus `getDiff`, which this editor doesn't track.

| Command          | Params                          | Returns                             |
|------------------|---------------------------------|-------------------------------------|
| `getEditorValue` |                                 | The raw editor text.                |
| `setEditorValue` | `value:`                        | `ok`                                |
| `editField`      | `old:`; `new:`                  | `ok`                                |
| `grepField`      | `query:`; `limit:` (default 25) | JSON array of `{line, path, text}`  |
| `highlightLine`  | `line:` (1-based)               | `ok`                                |

## Icon Builder

`component: icon`. See the [Icon Builder](/docs/setup/developers/icon-builder/).

| Command           | Params                                               | Returns                                                                                                                     |
|-------------------|------------------------------------------------------|-----------------------------------------------------------------------------------------------------------------------------|
| `getGeometry`     |                                                      | The editor's raw SVG inner geometry. Not JSON.                                                                              |
| `setGeometry`     | `geometry:`                                          | `ok`. Pushes a new revision onto the history ring, so it stays navigable with the history arrows, and repaints the preview. |
| `getIconGeometry` | `name:` an icon name without its `cerb-icon-` prefix | That shipped glyph's geometry, or empty for an unknown name. This is how an agent looks up how a comparable icon is drawn.  |

## Mail Reply

`component: mail_reply`. Available on the popup reply editor.

| Command     | Params                                                                    | Returns                                                                                                      |
|-------------|---------------------------------------------------------------------------|--------------------------------------------------------------------------------------------------------------|
| `getFields` |                                                                           | JSON `{to, cc, bcc, subject, format, content}`. `format` is normalized on read to `markdown` or `plaintext`. |
| `setField`  | `key:` one of `to`, `cc`, `bcc`, `subject`, `content`, `format`; `value:` | `ok`                                                                                                         |

Setting `format:` to `markdown` switches the editor to Markdown; **any** other value means plaintext. There's no validation, so a typo silently selects plaintext rather than erroring.

## Worklist search fields

`component: worklist`. The one host that isn't an editor, and the only one that can *act* rather than only read and write.

This isn't only the quick search bar above a [worklist](/docs/worklists/). The same search field is included in popups throughout the interface -- the quick-search popup, record choosers -- and each one carries the same agent and reports the same `component`. An item gated to `worklist` appears in all of them, and there's no state var that tells them apart.

| Command     | Params                            | Returns                                                                                                                                                                                                           |
|-------------|-----------------------------------|-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| `getFields` |                                   | JSON `{query, record_type, record_context, view_id}`. `record_type` is the **alias** (`ticket`) -- what [`data.query`](/docs/data-queries/) expects after `of:` -- while `record_context` is the full context ID. |
| `setField`  | `key:` **only** `query`; `value:` | `ok`, and focuses the field with the caret at the end. Any other key is an error.                                                                                                                                 |
| `runSearch` |                                   | `ok`. Asynchronous -- it takes the same path as pressing `Enter`, so it can only report that the search **started**.                                                                                              |

Three commands rather than one per field is deliberate: the agent learns the field's shape from `getFields`, so state added later becomes a new key rather than a new command.

## Return values and failures

Conventions across the current hosts:

| Result          | Notes                                                                    |
|-----------------|--------------------------------------------------------------------------|
| Readers         | Return raw text, or JSON where the host has several fields               |
| Writers         | Return the literal string `ok`                                           |
| Errors          | Lead with `error:`, `unknown `, or `invalid `                            |
| Unknown command | Returns an empty string on every host except worklist, which names it    |

That error prefix is a **contract**, not a convention. An agent pane checks a mutating command's return against it to decide whether the editor now has unsaved changes, so a failure that doesn't lead with one of those three words leaves the editor falsely marked dirty. Anything you build a new host for should follow it.

<div class="cerb-box note">
	<p>
		<b>An empty string is ambiguous.</b> It means the command was unrecognized, <i>or</i> the
		editor was genuinely empty, <i>or</i> the host threw, <i>or</i> there was no command bridge at
		all. Failures here are silent -- the interaction proceeds either way, and never reports why.
		Branch on it accordingly when it matters.
	</p>
</div>
