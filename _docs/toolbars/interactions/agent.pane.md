---
title: Agent launchers
excerpt: How an AI agent comes to appear on an editor's agent pane or in the command bar, and what the surface hands the conversation it starts.
summary: An agent pane is a collapsible chat beside an editor. Every pane and the command bar lists the agents enabled for that surface, one launcher tile per agent, with its own name, picture, and a line saying what it is for. An agent is enabled somewhere by having a block for that surface in its own configuration, edited in the AI tab of its worker record, so where an agent appears is part of the agent rather than a separate list to keep in sync. This page documents the eight surfaces and their component values, what a surface contributes to an agent and how the Setup Surfaces catalog reports it, how a launcher tile is derived, the reserved agent input and the agent scope an interaction reads instead, the caller names each surface posts and why an agent chat should normally leave its callers block unset, how closing a chat offers to continue it later or end it and why ending keeps the transcript, what reaches a running conversation through caller params, and the extra values a worklist search bar contributes.
permalink: /docs/toolbars/interactions/agent.pane/
toc:
  title: Agent launchers
  expand: Automations
jumbotron:
  title: Agent launchers
  tagline: ~
  breadcrumbs:
  - label: Docs &raquo;
    url: /docs/home/
  - label: Automations &raquo;
    url: /docs/automations/
  - label: AI Agents &raquo;
    url: /docs/agents/
---

An **agent pane** is a collapsible chat that sits beside an editor. Every pane, and the command bar, lists the [agents](/docs/agents/) enabled for *that* surface -- one launcher tile per agent, with its own name, picture, and a line saying what it's for.

Where an agent appears is part of the **agent**, not a separate list to keep in sync with it.

<p class="youtube-video-container"><iframe width="1280" height="720" src="https://www.youtube.com/embed/TPSTDjX6Unw" title="AI agents in the sidebar of Cerb editors" frameBorder="0"  allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" allowFullScreen></iframe></p>

* TOC
{:toc}

<div class="cerb-box note">
	<p>
		Before 12.0 this was configured on an <code>agent.pane</code>
		<a href="/docs/toolbars/">toolbar</a> whose items each had to name the hosts they appeared
		in. That toolbar is gone, and an upgrade removes it. The name survives as the
		<a href="#caller-names">caller name</a> a pane posts.
	</p>
</div>

# Enabling an agent on a surface

An agent is enabled on a surface by having a block for it under `components:` in the agent's own configuration, edited in the **AI** tab of its [worker](/docs/records/types/worker/) record.

{% highlight cerb %}
{% raw %}
components:
  automation:
    description: Help writing and debugging automations
  mail_reply:
    description: Draft a reply from the conversation so far
{% endraw %}
{% endhighlight %}

**Authoring the block is the opt-in.** An agent with no block for a surface isn't enabled there, so adding a new surface to Cerb never turns every existing agent loose on it. A block with no body is valid and means "yes, here, with the defaults".

<div class="cerb-box warning">
	<p>
		<b>A surface with no agent enabled on it hides its agent toggle entirely</b> -- it doesn't
		render a disabled control or an empty pane. Until at least one agent has a block for that
		surface, there is no agent affordance there at all.
	</p>
</div>

Turning a surface off is `disabled@bool: yes` rather than deleting the block, so everything you configured for that surface is still there when you turn it back on:

{% highlight cerb %}
{% raw %}
components:
  worklist:
    disabled@bool: yes
{% endraw %}
{% endhighlight %}

See [Everywhere, and per surface](/docs/agents/#everywhere-and-per-surface) for how a surface's settings combine with the agent's own.

# Surfaces

| Surface                                                            | `component`             |
|--------------------------------------------------------------------|-------------------------|
| Automation editor                                                  | `automation`            |
| Automation Scripting Tester                                        | `automation_scripting`  |
| Command bar                                                        | `commandbar`            |
| Data Query Tester                                                  | `data_query`            |
| [Icon Builder](/docs/setup/developers/icon-builder/)               | `icon`                  |
| Mail Reply                                                         | `mail_reply`            |
| Mail Routing                                                       | `mail_routing`          |
| [Worklist](/docs/worklists/) search fields                         | `worklist`              |

`component` is **functional, not informational**. It's what [`llm.agent:`](/docs/automations/commands/llm.agent/) resolves the surface's own UI-command tools from, and which of the agent's per-surface overrides apply.

An agent chat gets its surface's commands as tools automatically, and can drive the surface directly with the [`uiCommand`](/docs/automations/triggers/interaction.worker/elements/uiCommand/) element. Both come from the [`interaction.worker.agent`](/docs/automations/triggers/interaction.worker.agent/) trigger, so build a chat that drives its surface on that trigger rather than on [`interaction.worker`](/docs/automations/triggers/interaction.worker/). See [Hosts](/docs/automations/triggers/interaction.worker.agent/#hosts) for the tools each one offers.

## What a surface contributes

**Setup &raquo; AI &raquo; Surfaces** lists one card per surface, showing what that surface hands an agent at runtime. It's read from the surface catalog itself rather than written by hand, so it can't drift from what an agent is actually given.

Each card carries:

- The surface's `component` value, what it does, and the **default launcher text** its tile carries.
- **Tools** -- the commands this surface contributes, each marked **Browser** or **Server** by what answers it, with its parameters and which are required.
- **In the transcript** -- the two labels each tool shows while it runs and after it finishes, so you can match a line in a chat back to the tool that wrote it.
- **Bound parameters**, shown as *"Always sent, never asked of the model"*. These are pinned by the surface: the model never sees them and can't override them. A search bar's `cerb_set_query` pins `key = query`, because a field with exactly one writable target is an argument a model can only get wrong.
- **Reading** -- the documentation and skills the surface points the agent at.
- **Instructions** -- the surface's own orientation prompt, which is appended to the agent's.

<div class="cerb-screenshot">
<img src="/assets/images/docs/agents/setup-ai-surface-card.png" class="screenshot">
</div>

The **Reading** block uses exactly four kinds of line, across every surface:

|---
| Line | Meaning
|-|-
| A **mandatory** volume | Read before doing a named kind of work -- *"Before it will write or edit a search query, it reads search-queries."*
| **Conditional** volumes | Read when the agent needs them -- *"Reads when it needs one: records"*
| A **Documentation** pointer | A path into the mounted docs, such as `references/docs/search.md`
| The **mounted-only** caveat | Each of the above appears only when the volume holding it is actually mounted on the agent

That last one is the important one: a surface's reading list is a **description of what's available**, not a guarantee. An agent with no filesystems mounted is pointed at nothing, because sending an agent after files it can't read is worse than saying nothing.

Under **Instructions**, each card can expand **Show this surface's role** -- the full system prompt that surface contributes. It's already in the page, so expanding it costs nothing, and it's the authoritative copy: read it there rather than from documentation that would go stale the next time the prompt is tuned.

# The launcher tile

Each tile is derived from the agent record rather than authored, so there's nothing to keep in sync:

| What it shows | Where it comes from                                                                                           |
|---------------|-----------------------------------------------------------------------------------------------------------------|
| The name      | The agent's worker name. In the command bar, its `@handle` instead                                              |
| The picture   | The agent's own avatar                                                                                          |
| The second line | The surface block's `description:`, falling back to a sentence true of any agent running there                 |
| The chat      | The surface block's `automation:`, falling back to the agent's own, falling back to the built-in chat           |

The command bar labels a row with the `@handle` on purpose: the bar mixes agents with every other shortcut in Cerb, so a row should read as the agent you'd `@mention` anywhere else rather than as the name of the script behind it.

# Which agent is running

A launcher passes the agent it stands for as a **reserved** input named `agent`, which is consumed and removed before the automation's own `inputs:` are validated.

<div class="cerb-box warning">
	<p>
		<code>agent</code> is reserved. An automation that declares it in its own
		<code>inputs:</code> block fails to run with <b>Unknown inputs: agent</b>.
	</p>
</div>

A script reads the agent from **scope** instead. The [`interaction.worker.agent`](/docs/automations/triggers/interaction.worker.agent/) trigger provides `agent_*`, the AI worker the chat runs as, with key expansion -- so `agent_name` and `agent__image_url` are the agent's own name and avatar.

Pass it on rather than hardcoding an agent:

{% highlight cerb %}
{% raw %}
await:
  elements:
    agentPrompt/prompt_agent:
      agent@key: agent_id
{% endraw %}
{% endhighlight %}

`agent@key: agent_id` is the form for both [`llm.agent:`](/docs/automations/commands/llm.agent/) and [`agentPrompt`](/docs/automations/triggers/interaction.worker/elements/agentPrompt/). Which agent is running belongs to the trigger's **state**, exactly as the active worker does, rather than to anything a script configures -- and that's what lets one interaction serve every agent instead of being copied per agent.

# Caller names

Two caller names are in play, because the command bar isn't an agent pane:

| Surface                    | Caller name                 |
|----------------------------|-----------------------------|
| The six editors, and worklist search fields | `agent.pane`  |
| Command bar                | `cerb.toolbar.global.menu`  |

Both are resumable. A parked conversation started from a pane resumes into the same surface it was started on; one started from the command bar resumes there.

<div class="cerb-box warning">
	<p>
		<b>Leave <code>callers:</code> unset on an agent chat.</b> An automation with no
		<code>callers:</code> block allows every caller, which is what you want here. Naming only
		<code>agent.pane</code> is the tempting mistake: it loses the command bar and it breaks
		resuming the chat from History. If you do declare a <code>callers:</code> block, it has to
		allow <b>both</b> names.
	</p>
</div>

The shipped default chat (`cerb.ai.agent.chat`) declares no `callers:` block for exactly this reason. Its whole [policy](/docs/automations/#policies) is the command it needs:

{% highlight cerb %}
{% raw %}
commands:
  llm.agent:
    allow@bool: yes
{% endraw %}
{% endhighlight %}

## Values available to a policy

A launcher is rendered through the [toolbar](/docs/toolbars/) machinery, so an agent chat's policy is evaluated against a dictionary before its tile is drawn. A policy that denies hides the tile.

| Placeholder  | Notes                                                              |
|--------------|----------------------------------------------------------------------|
| `caller_name`| The caller posting the launcher                                     |
| `component`  | The surface the pane is mounted on                                  |
| `worker_*`   | The current [worker](/docs/records/types/worker/)                   |
| `worklist_*` | On `worklist` surfaces only -- see [Worklist search fields](#worklist-search-fields) |

<div class="cerb-box note">
	<p>
		<b>This is not audience control.</b> A policy decides whether a tile is <i>drawn</i>, not who
		may run the agent. There is no per-agent permission model yet, so don't rely on a policy to
		keep an agent away from a worker who can open a pane.
	</p>
</div>

# Closing a conversation

A pane has exactly **one** conversation control: the **Close** button in the chat header. Pausing and ending aren't separate buttons -- they're the two answers to what Close asks. The button itself never terminates a conversation.

Clicking it opens a small menu with two choices:

|---
| Choice | What it does
|-|-
| **Continue later** | Parks the conversation and gives it the name it will wear under **Recent conversations**
| **End** | Closes the conversation out. It stops being resumable

How the menu behaves matters as much as what it offers:

- **Escape parks the conversation** -- the same as choosing **Continue later**. It's captured ahead of the menu's own handling and ahead of anything still focused in the panel, so the reflex key is the safe answer rather than a way to lose work.
- **Enter also picks Continue later**, since the first item is pre-highlighted and focus is taken off the composer when the menu opens.
- **Clicking outside dismisses without choosing**, and nothing happens to the conversation at all.

When the pane is floating rather than docked in the sidebar, the chat header is hidden -- the dialog's own titlebar already carries a close -- and the same prompt hangs off that instead. The wording and icons are identical to the prompt a chat opened from the command bar gives you, deliberately: closing a chat shouldn't mean one thing in the sidebar and another in a popup.

With no conversation running, **Close just collapses the pane**, as it always did. The prompt only appears when there's something resumable to make a choice about, so an unfinished run or a non-resumable await closes silently rather than offering a choice that wouldn't stick.

## Recent conversations

The pane's picker lists your **Recent conversations** for that surface. Each tile has its own dismiss button, labeled **End this conversation** -- it's per-conversation, not a bulk clear, and it's a separate button rather than a gesture on the tile because the tile's whole surface already means *resume this*.

<div class="cerb-box note">
	<p>
		<b>Ending a conversation doesn't delete it.</b> It marks the conversation finished so it
		drops out of the resumable list -- nothing more. The
		<a href="/docs/setup/developers/llm-agent-transcripts/">transcript</a> and its token
		accounting are kept and stay readable by an administrator at
		<b>Setup &raquo; AI &raquo; Transcripts</b>. Ending is tidying the sidebar, not erasing the
		record of what was said.
	</p>
</div>

## Pause is parking, plus a name

**Continue later** changes no state. The conversation was already parked the moment the pane closed -- the [`await`](/docs/automations/triggers/interaction.worker/) it was sitting on re-emits its own state either way. What the choice adds is the **label** the conversation will carry in the list, so you can tell three parked chats apart later. Only **End** is a state change.

That's also why a parked pane conversation doesn't reappear in the command bar: it comes back under the pane's own **Recent conversations**, on the surface it was started from.

# What reaches the conversation

A running conversation reads its surface from `caller_params`:

| Key               | Notes                                                                  |
|-------------------|--------------------------------------------------------------------------|
| `component`       | The surface, one of the eight values above                              |
| `ui_capabilities` | The commands that surface answers                                        |

Those two are the whole set on seven of the eight surfaces. A [worklist](#worklist-search-fields) search bar adds two more.

<div class="cerb-box note">
	<p>
		<b>Which page the worker is on is deliberately absent.</b> It would be a snapshot taken at
		launch and would go stale the moment they navigate. The command bar's
		<code>cerb_get_page</code> tool reads it live instead.
	</p>
</div>

For the same reason, don't interpolate a changing value into a chat's `system_prompt:`. The composed prompt is built on the first turn and reused unchanged after that -- it's rebuilt only when you *edit* the automation -- and a value that changes on its own rebuilds it every turn, throwing away the most cacheable part of the request. Your `system_prompt:` is **appended** to the prompt Cerb composes for the surface, rather than replacing it, so it's for what you want to add.

## Command bar

The command bar is the one surface that isn't tied to a screen at all. It follows the worker from page to page, so it has no document to read and everything it offers is one-way: it can put something in front of a worker, but nothing comes back through the bridge. An agent there knows where they are, never what's on the screen, and never what a search it opened matched.

The command bar's ordinary non-agentic shortcuts are unaffected. Those stay [`interaction.worker`](/docs/automations/triggers/interaction.worker/) items and keep working alongside a chat.

## Worklist search fields

A search field's agent is the one surface that isn't an editor. This covers more than the search bar above a [worklist](/docs/worklists/): the same field appears in popups throughout the interface -- the quick-search popup, record choosers -- and every one carries the same agent under the same `component`, with no state var distinguishing them.

A worklist launcher's **policy** additionally receives:

| Placeholder               | Notes                                                                                                |
|---------------------------|--------------------------------------------------------------------------------------------------------|
| `worklist_id`             | The worklist being searched                                                                          |
| `worklist_record_type`    | The record type **alias** (`ticket`) -- what [`data.query`](/docs/data-queries/) expects after `of:` |
| `worklist_record_context` | The record type's context ID                                                                         |
| `worklist_query`          | The current search query                                                                             |
| `worklist_query_required` | The worklist's required query, which a search can't escape                                           |
| `worklist_page`           | The current page                                                                                     |
| `worklist_limit`          | Rows per page                                                                                        |

Only two of those reach the running conversation, as `caller_params.worklist_id` and `caller_params.worklist_record_type`. The rest exist for the policy that decides whether the tile is drawn.

An agent reads what it's actually looking at -- including the current query -- with the surface's own `cerb_get_fields` tool, which stays current as the worker keeps typing. See [Worklist search fields](/docs/automations/triggers/interaction.worker.agent/#worklist-search-fields).
