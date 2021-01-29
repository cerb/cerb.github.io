---
title: "automation.timer"
excerpt: automation.timer automations are executed by timers at a future time, or at various intervals. They support continuations to pause and resume. 
#social_image_url: /assets/images/search/kata.png
permalink: /docs/automations/triggers/automation.timer/
toc:
  title: automation.timer
  expand: Automations
jumbotron:
  title: automation.timer
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

**automation.timer** [automations](/docs/automations/) are executed by [timers](/docs/automations/#timers) at a future time, or at various intervals. They support [continuations](/docs/automations/#continuations) to pause and resume between executions.

<div class="cerb-screenshot">
<img src="/assets/images/docs/automations/automation-timer.png" class="screenshot">
</div>

On the first invocation of the timer, an automation is selected using [events KATA](/docs/automations/#events). This may optionally provide [inputs](/docs/automations/#inputs).

* TOC
{:toc}

# Inputs

The automation [dictionary](/docs/automations/#dictionaries) starts with the following values:

| Key | Type | Notes
|-|-|-
| `timer_*` | dictionary | The parent [timer](/docs/automations/#timers) dictionary
| `inputs` | dictionary | [Custom input](/docs/automations/#inputs) values from the caller

# Outputs

## await:

When the automation pauses in the `await` state, the timer is rescheduled to continue at a future date.

| Key | Type | Notes
|-|-|-
| `datetime` | timestamp | The future UNIX timestamp to resume the automation at the current point

<pre>
<code class="language-cerb">
{% raw %}
start:
  # Run some commands
  await:
    datetime: {{"+5 mins"|date('U')}}
{% endraw %}
</code>
</pre>

## return:

When the automation concludes in the `return` state, the timer is removed.
