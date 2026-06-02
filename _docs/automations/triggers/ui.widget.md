---
title: ui.widget
excerpt: This page provides information on the "ui.widget" automations in Cerb, which
  enable custom output for card, profile, or workspace widgets, replacing the deprecated
  bot behavior-based widgets.
summary: This page provides information on the "ui.widget" automations in Cerb, which
  enable custom output for card, profile, or workspace widgets, replacing the deprecated
  bot behavior-based widgets. It details the use of event handler KATA for triggering
  automations, with the first enabled automation being executed. The page outlines
  the structure of the automation dictionary, including inputs such as custom input
  values, current record dictionaries, widget records, and worker records. It also
  describes the expected output, specifically the HTML to be rendered for the widget.
permalink: /docs/automations/triggers/ui.widget/
toc:
  title: ui.widget
  expand: Automations
jumbotron:
  title: ui.widget
  tagline: ~
  breadcrumbs:
  - label: Docs &raquo;
    url: /docs/home/
  - label: Automations &raquo;
    url: /docs/automations/
  - label: Triggers &raquo;
    url: /docs/automations/#triggers
---

**ui.widget** [automations](/docs/automations/) allow custom output to be implemented for card, profile, or workspace widgets. This replaces bot behavior-based widgets, which are now deprecated.

This trigger uses [event handler](/docs/automations/#events) KATA, and the first enabled automation is executed.

* TOC
{:toc}

# Inputs

The automation [dictionary](/docs/automations/#dictionaries) starts with the following values:

| Key        | Type       | Notes                                                                                                                                                                                      |
|------------|------------|--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| `inputs`   | dictionary | [Custom input](/docs/automations/#inputs) values from the caller                                                                                                                           |
| `record_*` | record     | The current [record](/docs/records/types/) dictionary (supports key expansion). Only available on card and profile widgets.                                                                |
| `widget_*` | record     | The [card](/docs/records/types/card_widget/), [profile](/docs/records/types/profile_widget/), or [workspace](/docs/records/types/workspace_widget/) widget record (supports key expansion) |
| `worker_*` | record     | The current [worker](/docs/records/types/worker/) record (supports key expansion)                                                                                                          |

# Outputs

## return:

| Key | Type | Notes
|-|-|-
| `html` | text | The HTML to render for the widget

# Example

A workspace widget that greets the current worker and prints the number of tickets they're watching.

{% tabs ui-widget %}

{% tab ui-widget event-handler %}

On the [Automation widget](/docs/dashboards/widgets/automation/), select the **Automation** toolbar button and bind the widget to the automation by URI:

{% highlight cerb %}
{% raw %}
automation/greeting:
  uri: cerb:automation:example.dashboard.greeting
  disabled@bool: no
  inputs:
    title: Welcome back
{% endraw %}
{% endhighlight %}

The first enabled handler wins, so the same widget can switch between automations based on role, [dashboard prompts](/docs/dashboards/#prompts), or any other condition.

{% endtab %}

{% tab ui-widget automation %}

{% highlight cerb %}
{% raw %}
inputs:
  text/title:
    default: Welcome
    required@bool: no

start:
  data.query/watched:
    output: watched
    inputs:
      query@text:
        type:worklist.metrics
        values.count:(
          of:ticket
          function:count
          field:id
          query:(
            watchers:(id:{{worker_id}})
            status:o
          )
        )
        format:table

  return:
    html@text:
      <h3>{{inputs.title}}, {{worker_first_name}}.</h3>
      <p>You're watching <b>{{watched.data.rows|first.value}}</b> open tickets.</p>
{% endraw %}
{% endhighlight %}

The automation receives `worker_*` and `widget_*` placeholders automatically. The returned `html` is rendered inline in the widget's zone -- styles can come from inline CSS, the dashboard's stylesheet, or Cerb's built-in classes.

{% endtab %}

{% tab ui-widget automation policy %}

The automation's [policy](/docs/automations/#policies) must allow `data.query`, otherwise the call is blocked when the widget renders. Scope the allow to the specific query type the automation needs:

{% highlight cerb %}
{% raw %}
commands:
  data.query:
    deny/type@bool: {{query.type != 'worklist.metrics'}}
    allow@bool: yes
{% endraw %}
{% endhighlight %}

The `deny` rule fires first -- any query whose `type:` is not `worklist.metrics` is rejected before the `allow` is considered.

{% endtab %}

{% endtabs %}
