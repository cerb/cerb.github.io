---
title: Interactions
excerpt: Interactions are interactive automations that use continuations to pause and resume a multi-step workflow.
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

**Interactions** are interactive [automations](/docs/automations/) that use [continuations](/docs/automations/#continuations) to pause and resume a multi-step workflow.

<div class="cerb-screenshot">
<img src="/assets/images/docs/automations/triggers/interaction.web.worker/interactions-participants.gif" class="screenshot">
</div>

For instance, a troubleshooter interaction can ask a series of increasingly specific questions to help narrow down the potential cause of a problem. A verification interaction can send a code to a new email address and ask the user to verify it.

The following [triggers](/docs/automations/#triggers) are used to build interactions:

| Trigger | 
|-|-
| [interaction.web.worker](/docs/automations/triggers/interaction.web.worker/) | Interactions with a [worker](/docs/workers/) using web forms.
| [interaction.website](/docs/automations/triggers/interaction.website/) | Interactions with visitors on third-party websites using web forms.

