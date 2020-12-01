---
title: Interactions
excerpt: Interactions...
#social_image_url: /assets/images/search/kata.png
permalink: /docs/interactions/
toc:
  title: Interactions
  expand: Automations
jumbotron:
  title: Interactions
  tagline: 
  breadcrumbs:
  -
    label: Docs &raquo;
    url: /docs/home/
  -
    label: Automations &raquo;
    url: /docs/automations/
---

{% include docs/note_preview.html %}

{% comment %}
<div class="cerb-screenshot">
<img src="{{page.social_image_url}}" class="screenshot">
</div>
{% endcomment %}

**Interactions**...

* TOC
{:toc}

{% comment %}
* popup/inline
{% endcomment %}

# Interactions

See: [Automations](/docs/automations/)

See: [ui.interaction](/docs/automations/triggers/ui.interaction/)

# Toolbars

* [Toolbars/Automations] In toolbar KATA, `menu` nodes can specify a `default:` interaction using a key from the interactions. This will display as a split button, with the left-side running the default interaction instantly (e.g. "Reply") and the right-side displaying the menu of alternative options (e.g. "Reply without quoting").

* [Profiles/Tickets/Toolbars] Implemented custom toolbars for messages on ticket profiles. These are defined using toolbar KATA by editing the 'Conversation' widget. Any `ui.interaction` automation can be called with custom `inputs:`. This can also override the default actions for `reply` and `comment` by using those names for the interactions. Interactions receive the message ID and selected text as caller parameters. If the automation `return` dictionary contains a `draft_id` key, that draft will be opened with the reply editor at conclusion. If the return dictionary contains a `refresh_widgets` list, those widgets will be refreshed at conclusion (a shortcut value of `all` will refresh all widgets on the profile).

* [Mail/Reply/Toolbars] Implemented custom toolbars for the email reply popup. These are defined using toolbar KATA. Any `ui.interaction` automation can be called with custom `inputs:`. The formatting options (e.g. bold, link, image) have bee replaced with interaction automations. Interactions receive the selected text as caller parameters. If the automation `return` dictionary contains a `snippet:` key, this text will be inserted into the editor at the cursor. The former `mail.reply` interaction point has been retired.
