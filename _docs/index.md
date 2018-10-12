---
title: Documentation
excerpt: The first step in mastering Cerb is becoming familiar with the new tools at your disposal.
layout: page
permalink: /docs/home/
redirect_from:
  - /docs/
  - /book/
  - /book/latest/
toc:
  title: Introduction
jumbotron:
  title: Documentation
  tagline: Let's get you up to speed
---

<div style="column-width:300px;">
{% for section in site.data.docs %}
<div style="break-inside: avoid-column;">
<h4>{{ section.title }}</h4>

<ul>
{% for item in section.docs %}
  {% assign item_id = item | prepend:"/docs/" %}
  {% assign p = site.docs | where:"id",item_id | first %}

  {% if p.id == page.id %}
  {% assign c = "current" %}
  {% else %}
  {% assign c = "" %}
  {% endif %}

  <li class="{{ c }}"><a href="{{ p.url }}">{% if p.toc.title %}{{ p.toc.title }}{% else %}{{ p.title }}{% endif %}</a></li>
{% endfor %}
</ul>
</div>
{% endfor %}
</div>

{% comment %}
**Cerb is a completely customizable team workflow platform.** Turn any email account into a supercharged team inbox. Bring your whole to-do list: email, calls, orders, projects, tasks, reminders, calendar events, and more. Triage and distribute work by taking into account its importance and the responsibilities of each team member. Build collaborative workspaces to easily keep track of everyone's assignments, contributions, and progress.

**Cerb is your digital record-keeper.** Create records for anything, and add your own fields to keep track of every important detail. Share notes with comments. Link related records together for future reference.
{% endcomment %}

{% comment %}
**Cerb is your tireless helper who's eager to learn new skills.** Automate common workflows by creating "bots" -- virtual team members who can respond to email, create and modify records, start chats to gather information, exchange data with third-party services, send reminders, notify people, monitor metrics, and do practically anything else that a human team member can.

**Cerb is instantly trainable.** Build and share improvements with "packages" -- blueprints for importing a set of pre-built records and bot behaviors.

**Cerb is focused on your goals.** Monitor team performance with customizable real-time dashboards. Pull in data from anywhere. Choose from a dozen built-in widgets, or even build your own.

**Cerb is ready to measure your success.** Track and improve customer satisfaction. Automatically send interactive surveys to your clients.

**Cerb is a home for all of your team's scattered tasks.** Plan and manage projects with interactive boards. Automatically trigger bot behaviors as tasks move through your workflow.
{% endcomment %}

{% comment %}
The software is distributed under the [Devblocks Public License](/license) as a commercial open source project. The full source code is publicly available on GitHub[^github].

Licenses are based on the maximum number of workers able to log in at the same time (i.e. seats). The software can be deployed on independent servers, or as a fully-managed, cloud-based service.

Cerb is developed in the PHP[^php] programming language. Relational data is stored in MySQL[^mysql]. See the [credits](/docs/credits) for a full list of third-party libraries, resources, and contributors.
{% endcomment %}
