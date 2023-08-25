---
title: Toolbars
excerpt: Toolbars...
#social_image_url: /assets/images/search/kata.png
permalink: /docs/toolbars/
toc:
  title: Toolbars
jumbotron:
  title: Toolbars
  tagline: 
  breadcrumbs:
  -
    label: Docs &raquo;
    url: /docs/home/
  -
    label: Automations &raquo;
    url: /docs/automations/
---

{% comment %}
<div class="cerb-screenshot">
<img src="{{page.social_image_url}}" class="screenshot">
</div>
{% endcomment %}

A **toolbar** is a collection of [**interactions**](/docs/interactions/) and **menus**.

Top-level toolbar items are displayed as **buttons**. Items within a menu are displayed as **links**.

* TOC
{:toc}

<div class="cerb-screenshot">
<img src="/assets/images/docs/automations/triggers/interaction.worker/toolbar.png" class="screenshot">
</div>

# KATA

Toolbars are configured using a [KATA](/docs/kata/) dialect, which can pass custom [input](/docs/automations/#inputs) to the interaction using placeholders (current worker, record, etc).

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

| Req'd | Key            |
|:-----:|----------------|
|   √   | `uri:`         | The URI of the [interaction.worker](/docs/automations/triggers/interaction.worker/) [automation](/docs/automations/) to start when clicked.
|       | `inputs:`      | The optional [inputs](/docs/automations/#inputs) dictionary for the interaction.
|       | `label:`       | The label to describe the interaction in buttons and menu links. This may be omitted if an icon is provided.
|       | `icon:`        | The optional [icon](/docs/developers/icons/) to display in buttons and menu links. This can be in addition to, or instead of, the label.
|       | `tooltip:`     | If a button only has an icon and not a label, the tooltip can show a label when hovering over it.
|       | `keyboard:`    | An alternative keyboard shortcut to start the interaction (e.g. `Ctrl+Shift+K`)
|       | `badge:`       | The optional counter to display on buttons.
|       | `hidden@bool:` | Conditionally determine whether to display this toolbar item or not. For instance, check worker permissions or record fields.
|       | `after:`       | Actions to take when the interaction completes successfully. For instance, a completed interaction on a dashboard can refresh any number of widgets by name to show updated data. Options here depend on the toolbar.

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
<img src="/assets/images/docs/automations/triggers/interaction.worker/toolbar-menu.png" class="screenshot">
</div>

|Req'd|Key|
|:-:|-
|√|`label:`| The label to describe the menu in buttons and menu links. This may be omitted if an icon is provided.
||`icon:`| The optional [icon](/docs/developers/icons/) to display in buttons and menu links. This can be in addition to, or instead of, the label.
|√|`items:`| A list of [menu](#menu) and [interaction](#interaction) items.
||`default:`| Display a "split" menu button. Clicking on the left-side immediately runs this default [interaction](#interaction) by name. Clicking on the right-side opens a menu of alternative options.

# Records

Toolbars can be configured from **Search >> Toolbars**.

| Toolbar | 
|-|-
| [automation.editor](/docs/toolbars/interactions/automation.editor/) | Editing an automation
| [comment.editor](/docs/toolbars/interactions/comment.editor/) | Editing a comment
| [draft.read](/docs/toolbars/interactions/draft.read/) | Reading a draft message
| [global.menu](/docs/toolbars/interactions/global.menu/) | Global interactions from the floating icon in the lower right
| [global.search](/docs/toolbars/interactions/global.search/) | Searching from the top right of any page
| [mail.compose](/docs/toolbars/interactions/mail.compose/) | Composing new email messages
| [mail.read](/docs/toolbars/interactions/mail.read/) | Reading email messages
| [mail.reply](/docs/toolbars/interactions/mail.reply/) | Replying to email messages
| [record.card](/docs/toolbars/interactions/record.card/) | Viewing a record card popup
| [record.profile](/docs/toolbars/interactions/record.profile/) | Viewing a record profile page
| [records.worklist](/docs/toolbars/interactions/records.worklist/) | Viewing a worklist of records

