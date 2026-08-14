---
title: agent.pane
excerpt: This page provides detailed information on configuring and customizing the `agent.pane` toolbar in Cerb.
summary: This page documents the `agent.pane` toolbar in Cerb. It controls which agent chats an agent pane offers, and which hosts each chat appears in. The page covers its placeholders, the component placeholder used to gate items per host, its interaction inputs, how an interaction can refresh the toolbar when it finishes, the six hosts that provide an agent pane and their component values, the interaction.worker.agent trigger a chat needs to drive its host through uiCommand, the agent.pane caller policy an item requires, and the extra worklist placeholders a search bar host provides.
permalink: /docs/toolbars/interactions/agent.pane/
toc:
  title: Toolbars
  expand: Automations
jumbotron:
  title: agent.pane
  tagline: ~
  breadcrumbs:
  - label: Docs &raquo;
    url: /docs/home/
  - label: Automations &raquo;
    url: /docs/automations/
  - label: Toolbars &raquo;
    url: /docs/toolbars/
---

The `agent.pane` [toolbar](/docs/toolbars/) controls which [agent](/docs/agents/) chats an editor's agent pane offers.

An agent pane is a collapsible chat that sits beside an editor. This toolbar decides what it offers, and which editors each item appears in.

It ships with no sections, so items are authored per environment.

# Placeholders

| Placeholder  | Notes                                                                                                             |
|--------------|-------------------------------------------------------------------------------------------------------------------|
| `component`  | The host the pane is mounted on: `automation`, `bot_scripting`, `data_query`, `icon`, `mail_reply`, or `worklist` |
| `worker_*`   | The current [worker](/docs/records/types/worker/)                                                                 |
| `worklist_*` | On `worklist` hosts only -- see [Worklist search fields](#worklist-search-fields)                                 |

Use `component` to show an item only in the hosts where it makes sense:

{% highlight cerb %}
{% raw %}
interaction/describe_icon:
  label: Describe this icon
  hidden@bool: {{component != 'icon'}}
  uri: cerb:automation:example.agent.icon.describe
{% endraw %}
{% endhighlight %}

# Interaction inputs

| Input        | Notes                                                                             |
|--------------|-----------------------------------------------------------------------------------|
| `component`  | The host the pane is mounted on                                                   |
| `worker_*`   | The current worker                                                                |
| `worklist_*` | On `worklist` hosts only -- see [Worklist search fields](#worklist-search-fields) |

# Refreshing the toolbar

An interaction can reload the toolbar when it completes:

{% highlight cerb %}
{% raw %}
return:
  after:
    refresh_toolbar@bool: yes
{% endraw %}
{% endhighlight %}

# Hosts

| Host                                                 | `component`     |
|------------------------------------------------------|-----------------|
| Automation editor                                    | `automation`    |
| Automation Scripting Tester                          | `bot_scripting` |
| Data Query Tester                                    | `data_query`    |
| [Icon Builder](/docs/setup/developers/icon-builder/) | `icon`          |
| Mail Reply                                           | `mail_reply`    |
| [Worklist](/docs/worklists/) search fields           | `worklist`      |

An agent chat can read and write its host using the [`uiCommand`](/docs/automations/triggers/interaction.worker/elements/uiCommand/) element. That element is only available on the [interaction.worker.agent](/docs/automations/triggers/interaction.worker.agent/) trigger, so build a chat that drives its host on that trigger rather than [interaction.worker](/docs/automations/triggers/interaction.worker/).

An item also needs a [policy](/docs/automations/#policies) allowing the `agent.pane` caller, or its tile never appears in the pane.

## Worklist search fields

A search field's agent is the one host that isn't an editor. This covers more than the search bar above a [worklist](/docs/worklists/): the same field is included in popups throughout the interface -- the quick-search popup, record choosers -- and every one carries the same agent under the same `component`, with no state var distinguishing them.

Items on a `worklist` host additionally receive:

| Placeholder               | Notes                                                                                                |
|---------------------------|------------------------------------------------------------------------------------------------------|
| `worklist_id`             | The worklist being searched                                                                          |
| `worklist_record_type`    | The record type **alias** (`ticket`) -- what [`data.query`](/docs/data-queries/) expects after `of:` |
| `worklist_record_context` | The record type's context ID                                                                         |
| `worklist_query`          | The current search query                                                                             |
| `worklist_query_required` | The worklist's required query, which a search can't escape                                           |
| `worklist_page`           | The current page                                                                                     |
| `worklist_limit`          | Rows per page                                                                                        |

Gate an item to search fields with:

{% highlight cerb %}
{% raw %}
hidden@bool: {{component != 'worklist'}}
{% endraw %}
{% endhighlight %}
