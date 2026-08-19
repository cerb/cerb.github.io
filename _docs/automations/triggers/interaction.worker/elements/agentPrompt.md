---
title: AgentPrompt - Interaction Form Element
excerpt: This page provides detailed information on the use of the **agentPrompt** element in interaction web forms within Cerb.
summary: This page documents the agentPrompt element for worker interaction forms in Cerb. It is the composer a worker types into when an automation runs an agent conversation, and it is the write-side counterpart to the llmTranscript element. The page covers its optional keys -- label, placeholder, session_id, agent, models, commands, references, default, required, hidden, and validation -- along with the values it posts back, how to share one session between the composer, the llm.agent command, and the transcript, how to offer built-in and rewrite slash commands, and how to opt into @mention references for workers and agent filesystem files.
permalink: /docs/automations/triggers/interaction.worker/elements/agentPrompt/
toc:
  title: AgentPrompt
  expand: Automations
jumbotron:
  title: AgentPrompt
  tagline: ~
  breadcrumbs:
  - label: Docs &raquo;
    url: /docs/home/
  - label: Automations &raquo;
    url: /docs/automations/
  - label: interaction.worker &raquo;
    url: /docs/automations/triggers/interaction.worker/
  - label: Elements &raquo;
    url: /docs/automations/triggers/interaction.worker/#elements
---

In [interaction](/docs/automations/triggers/interaction.worker/) web forms, an **agentPrompt** element is the composer a worker types into when an automation runs an [AI agent](/docs/agents/) conversation.

It's the write-side counterpart to the [llmTranscript](/docs/automations/triggers/interaction.worker/elements/llmTranscript/) element, which displays the conversation.

{% highlight cerb %}
{% raw %}
start:
  set:
    session_id: {{uuid()}}
  await:
    form:
      elements:
        llmTranscript/transcript:
          session_id: {{session_id}}
        agentPrompt/prompt_agent:
          label: Ask the agent:
          session_id: {{session_id}}
          agent: @researcher
{% endraw %}
{% endhighlight %}

<div class="cerb-screenshot">
<img src="/assets/images/docs/automations/triggers/interaction.worker/elements/agentPrompt.png" class="screenshot">
</div>

Above, the composer in an [agent pane](/docs/developers/cerb-ui/#ai-agents) beside an editor, with its model picker open. This pane doesn't declare a `label:`, so the worker sees its `placeholder:` instead.

* TOC
{:toc}

# Syntax

### label:

The label displayed above the composer. This is optional; with no `label:`, nothing is displayed above the input.

### placeholder:

Placeholder text shown in the empty composer.

### session_id:

The agent session this composer contributes to. Mint one ID with {% raw %}`{{uuid()}}`{% endraw %} and pass the same value to this element, to [`llm.agent:`](/docs/automations/commands/llm.agent/#session_id), and to the [llmTranscript](/docs/automations/triggers/interaction.worker/elements/llmTranscript/) element, so all three work on one conversation.

Render the composer **before** the turn runs. Submitting it primes the session with the chosen model and the worker's message, so the agent resumes a conversation that already exists rather than starting its own.

### agent:

The [AI worker](/docs/agents/) this composer is talking to. The agent's name and image appear in the transcript, and the conversation uses that agent's memory and credentials.

**Identity only.** It doesn't supply the model catalog -- see [`models:`](#models) for that.

### models:

Which [agent models](/docs/records/types/agent_model/) the worker can pick between in the composer's model picker.

**Omit it and the worker is offered every [available](/docs/records/types/agent_model/#availability) model**, in the [`priority`](/docs/records/types/agent_model/#priority) order an admin set on the records. To narrow that, resolve a pool with [`llm.router:`](/docs/automations/commands/llm.router/) and pass it in as {% raw %}`models@key: routed:models`{% endraw %}, or list the names here.

Each entry is an [agent model](/docs/records/types/agent_model/) record name, optionally with overrides in that model's provider grammar. A record can be mounted more than once as {% raw %}`<record-name>/<alias>:`{% endraw %} to offer it twice with different settings. A model whose record is missing or disabled drops out of the picker.

#### effort_choices:
{: .no_toc}

An entry can offer a second level in the picker for [reasoning effort](/docs/automations/commands/llm.agent/#reasoning). Declare the levels with `effort_choices:` and that model gets a submenu; without it, clicking the model simply picks it.

{% highlight cerb %}
{% raw %}
models:
  claude-opus:
    effort: high
    effort_choices: medium,high,xhigh,max
{% endraw %}
{% endhighlight %}

The submenu lists exactly the levels declared, in the order declared. The `effort:` key is the fixed level, which is pre-selected and used when a worker clicks the model row rather than a submenu leaf. The chip then shows the pair -- `claude-opus · high` in the screenshot above -- though that composite is display only, and the two values arrive separately as [`__model` and `__effort`](#returned-values).

<div class="cerb-box note">
	<p>
		<code>effort_choices:</code> is an <b>offering</b> list, not a capability declaration. Cerb
		lowercases and de-duplicates whatever you write and validates a worker's pick against your list
		only -- it never checks the level against what the model actually supports. Offer a level a
		model doesn't accept and the provider's API rejects it when the turn is sent.
	</p>
</div>

### commands:

The slash commands this composer offers. There are two kinds.

A **built-in** command is opted in by bare key:

{% highlight cerb %}
{% raw %}
commands:
  compact:
{% endraw %}
{% endhighlight %}

A **rewrite** command expands into text in the browser before the turn is submitted, so the worker sees exactly what will be sent:

{% highlight cerb %}
{% raw %}
commands:
  rewrite/summarize:
    description: Summarize the conversation so far
    text@text:
      Summarize our conversation so far, including any open questions.
{% endraw %}
{% endhighlight %}

<div class="cerb-box note">
	<p>
		This is deliberately separate from <code>llm.agent:</code>'s own
		<a href="/docs/automations/commands/llm.agent/#commands"><code>commands:</code></a>.
		This side controls what the composer <b>offers</b>; that side controls what the agent
		<b>acts on</b>.
	</p>
</div>

### references:

Opt in to `@` completion. With no `references:` block, typing `@` completes nothing.

{% highlight cerb %}
{% raw %}
references:
  workers:
  filesystems:
{% endraw %}
{% endhighlight %}

| Key            | Notes
|-|-
| `workers:`     | Complete `@handle` for [workers](/docs/workers/)
| `filesystems:` | Complete `@<volume>/<path>` for [agent filesystem](/docs/records/types/agent_filesystem/) files

### default:

Prefill the composer with text.

### required:

{% highlight cerb %}
{% raw %}
required@bool: yes
{% endraw %}
{% endhighlight %}

### hidden:

This form element can be conditionally hidden.

{% highlight cerb %}
{% raw %}
hidden@bool: {{not prompt_user}}
{% endraw %}
{% endhighlight %}

A hidden element is skipped entirely rather than merely being invisible -- it renders no markup and posts no value. If you're expecting a field that submits without being seen, this isn't it.

The [Form Builder](/docs/automations/triggers/interaction.worker/#awaitform) is the exception: it keeps hidden elements on the canvas, dimmed and still selectable, so they stay editable at design time and disappear at runtime. There's no checkbox for `hidden:` in the builder's inspector for this element, so hand-author it in [KATA](/docs/kata/).

### validation:

A custom validation script, as on other form elements.

{% highlight cerb %}
{% raw %}
validation@raw:
  {% if prompt_agent__images is empty %}
  Attach a screenshot of the error before sending.
  {% endif %}
{% endraw %}
{% endhighlight %}

Three things about how this runs are worth knowing before you write one:

* **The output is the error.** The script is a template, and whatever it renders becomes the error message. Rendering nothing means valid. This is inverted from returning `true` for success.
* **It only runs when there's something to check** -- when the element is `required:`, or when the worker actually filled it in. A script on an optional element the worker left empty never fires at all. That's the usual reason validation "doesn't work".
* **It can read the [returned values](#returned-values).** They're derived before the script runs, so the same script can see the message text, the picked model in `__model`, the resolved effort in `__effort`, and the images in `__images` -- which is what makes rules like "require an image" or "not that model for this worker" expressible.

A `validation:` that isn't a string is itself an error, reported on the form and written to the [automation](/docs/records/types/automation/) log.

# Returned values

Submitting the form sets the element's own key to the worker's message text, plus these companions:

| Key                | Notes
|-|-
| `<name>`           | The message text
| `<name>_mentions`  | Any `@` references the worker inserted
| `<name>__model`    | The model the worker picked
| `<name>__effort`   | The resolved [reasoning effort](/docs/automations/commands/llm.agent/#reasoning) level
| `<name>__llm`      | A ready-to-use {% raw %}`{<provider>: <params>}`{% endraw %} block, with the effort already merged in
| `<name>__images`   | The picked images, as {% raw %}`{mime_type, uri}`{% endraw %} descriptors

<div class="cerb-box note">
	<p>
		<b>Mind the underscores.</b> <code>_mentions</code> has one; <code>__model</code>,
		<code>__effort</code>, <code>__llm</code>, and <code>__images</code> have two. This isn't a
		typo. Keys prefixed <code>&lt;name&gt;__</code> survive the continuation save, which is what
		lets the picker re-seed with the same model and effort on the next turn instead of reverting.
		Mentions are per-turn data, so they don't need to persist.
	</p>
</div>

Most automations don't need `__model:` or `__effort:` at all. Pass `__llm` straight to [`llm.agent:`](/docs/automations/commands/llm.agent/) as {% raw %}`inputs.llm@key`{% endraw %} and the provider and params are already resolved:

{% highlight cerb %}
{% raw %}
llm.agent:
  inputs:
    llm@key: prompt_agent__llm
{% endraw %}
{% endhighlight %}

Better still, when the composer shares a [`session_id:`](#session_id) with the command, submitting it primes that session with the pick -- so `llm.agent:` can resume with only the session and no `inputs.llm` wiring at all. Use `__model` and `__effort` for display and branching.

The value in `__model` is the key of the [`models:`](#models) entry, which is the [agent model](/docs/records/types/agent_model/) record's name. Two cases to watch:

* A `models:` entry can mount one record twice as {% raw %}`<record-name>/<alias>:`{% endraw %}, and the full key including the alias is what lands in `__model` -- so the value may legitimately contain a `/`.
* With no `models:` block and no models resolved from the router, the value falls back to the session's own model or provider string rather than a record name.

`__effort` is a bare lowercase level (e.g. `high`), or an empty string when the model declares no effort at all, meaning the provider's default applies.

# Images

Workers can paste or attach images directly in the composer. They're sent with the turn and render inline in the transcript, on models whose [agent model](/docs/records/types/agent_model/) record is flagged as accepting images.

<div class="cerb-screenshot">
<img src="/assets/images/docs/automations/triggers/interaction.worker/elements/agentPrompt-image.png" class="screenshot">
</div>

What reaches the automation in `__images` is a validated descriptor list, not the raw upload. Each entry is a `mime_type` and a `uri` of the form `cerb:attachment:<id>`. The MIME type is read from the stored [attachment](/docs/records/types/attachment/) record rather than trusted from the browser, anything that isn't an image is dropped, and the list is emptied entirely if the picked model doesn't accept images.
