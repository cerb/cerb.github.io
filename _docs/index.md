---
title: Documentation
excerpt: Guides and references for Cerb -- from getting started to advanced automation with KATA.
summary: This webpage serves as a comprehensive documentation hub for Cerb, covering
  various guides and references essential for different user roles. It opens by describing what
  Cerb is -- a collaboration platform with a built-in harness for building AI team members, each
  with its own mix of skills, tools, and knowledge, sitting beside your mail replies, worklists,
  automation editor, and command bar, built on shared mailboxes and records you can search,
  filter, chart, and automate against with KATA, and free to self-host forever. It includes an
  introduction and getting started section, an admin guide with topics like installation,
  security, and backups, and a worker guide focusing on the user interface. The developer
  guide provides insights into dictionaries, scripting, and plugins. The reference section
  is extensive, detailing features such as activity logs, automations, calendars, dashboards,
  notifications, and workflows, among others. Additionally, the API section offers information
  on authentication, requests, responses, and endpoints. The meta section provides release history,
  philosophy, and credits, making this a complete resource for understanding and utilizing Cerb
  effectively.
layout: page
permalink: /docs/home/
redirect_from:
  - /docs/
toc:
  title: Introduction
jumbotron:
  title: Documentation
  tagline: ~
  breadcrumbs:
    - label: Resources &raquo;
      url: /resources/
---

**Cerb** is a collaboration platform with a built-in harness for building AI team members, each with its own mix of skills, tools, and knowledge.

An [agent](/docs/agents/) sits beside your mail replies, your [worklists](/docs/worklists/), your [automation](/docs/automations/) editor and your command bar -- every surface Cerb has -- from the moment you install it. It reads whatever you have open and works on it with you, rather than describing a change and leaving you to make it. The mix ships with the product: Cerb's own documentation arrives as an [agent filesystem](/docs/records/types/agent_filesystem/), alongside a volume of skills covering automations, scripting, search, records, data queries, icons and replies, and a terminal into the platform so an agent can look up the record types and fields your installation actually has rather than guessing at them. The model is yours to choose -- an [agent model](/docs/records/types/agent_model/) is an ordinary record holding a provider, its credentials, an endpoint, and what that model is good at, and pointing one at a machine under your desk works the same way as any hosted provider.

None of it is a chat window bolted onto the side. An agent in Cerb is a [worker](/docs/workers/) record, so it can own a [ticket](/docs/tickets/), be `@mentioned`, join a [group](/docs/groups/) and hold its own [API](/docs/api/) credentials, exactly like the people it works alongside.

All of that sits on what Cerb has been for twenty-four years. Shared mailboxes become records you can search, filter, chart and automate against, and everything else your team keeps can become a [record](/docs/records/) too. [Worklists](/docs/worklists/) and [charts](/docs/dashboards/) run over any of it, and the automations tying it together are written in a language called [KATA](/docs/kata/).

Standing the whole thing up takes [three commands](/docs/installation/docker/), a [guided installer](/docs/guided-installer/), and one form to [connect a mailbox](/docs/setup/mail/mailboxes/). **Self-hosting Cerb is free, forever** -- unlimited workers, unlimited seats, no license key and no registration. A free installation runs three [concurrency slots](/docs/queues/#concurrency-slots), which is every feature in the product, just less of it running at once. A [subscription](/docs/setup/configure/license/) lifts that ceiling.

<div class="docs-sections">
	<a href="#getting-started" class="docs-section-card">
		<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><path d="M4.5 16.5c-1.5 1.26-2 5-2 5s3.74-.5 5-2c.71-.84.7-2.13-.09-2.91a2.18 2.18 0 0 0-2.91-.09z"></path><path d="m12 15-3-3a22 22 0 0 1 2-3.95A12.88 12.88 0 0 1 22 2c0 2.72-.78 7.5-6 11a22.35 22.35 0 0 1-4 2z"></path><path d="M9 12H4s.55-3.03 2-4c1.62-1.08 5 0 5 0"></path><path d="M12 15v5s3.03-.55 4-2c1.08-1.62 0-5 0-5"></path></svg>
		<span>Getting Started</span>
	</a>
	<a href="#reference" class="docs-section-card">
		<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><path d="M4 19.5A2.5 2.5 0 0 1 6.5 17H20"></path><path d="M6.5 2H20v20H6.5A2.5 2.5 0 0 1 4 19.5v-15A2.5 2.5 0 0 1 6.5 2z"></path></svg>
		<span>Reference</span>
	</a>
	<a href="#admin-guide" class="docs-section-card">
		<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><circle cx="12" cy="12" r="3"></circle><path d="M19.4 15a1.65 1.65 0 0 0 .33 1.82l.06.06a2 2 0 0 1 0 2.83 2 2 0 0 1-2.83 0l-.06-.06a1.65 1.65 0 0 0-1.82-.33 1.65 1.65 0 0 0-1 1.51V21a2 2 0 0 1-2 2 2 2 0 0 1-2-2v-.09A1.65 1.65 0 0 0 9 19.4a1.65 1.65 0 0 0-1.82.33l-.06.06a2 2 0 0 1-2.83 0 2 2 0 0 1 0-2.83l.06-.06a1.65 1.65 0 0 0 .33-1.82 1.65 1.65 0 0 0-1.51-1H3a2 2 0 0 1-2-2 2 2 0 0 1 2-2h.09A1.65 1.65 0 0 0 4.6 9a1.65 1.65 0 0 0-.33-1.82l-.06-.06a2 2 0 0 1 0-2.83 2 2 0 0 1 2.83 0l.06.06a1.65 1.65 0 0 0 1.82.33H9a1.65 1.65 0 0 0 1-1.51V3a2 2 0 0 1 2-2 2 2 0 0 1 2 2v.09a1.65 1.65 0 0 0 1 1.51 1.65 1.65 0 0 0 1.82-.33l.06-.06a2 2 0 0 1 2.83 0 2 2 0 0 1 0 2.83l-.06.06a1.65 1.65 0 0 0-.33 1.82V9a1.65 1.65 0 0 0 1.51 1H21a2 2 0 0 1 2 2 2 2 0 0 1-2 2h-.09a1.65 1.65 0 0 0-1.51 1z"></path></svg>
		<span>Admin Guide</span>
	</a>
	<a href="#developer-guide" class="docs-section-card">
		<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><polyline points="16 18 22 12 16 6"></polyline><polyline points="8 6 2 12 8 18"></polyline></svg>
		<span>Developer Guide</span>
	</a>
	<a href="#api" class="docs-section-card">
		<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><polyline points="4 17 10 11 4 5"></polyline><line x1="12" y1="19" x2="20" y2="19"></line></svg>
		<span>API</span>
	</a>
	<a href="#meta" class="docs-section-card">
		<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><circle cx="12" cy="12" r="10"></circle><line x1="12" y1="16" x2="12" y2="12"></line><line x1="12" y1="8" x2="12.01" y2="8"></line></svg>
		<span>Meta</span>
	</a>
</div>

{% for section in site.data.docs %}
<h2 id="{{ section.title | slugify }}" class="docs-section-title">
{% case section.title %}
{% when 'Getting Started' %}<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><path d="M4.5 16.5c-1.5 1.26-2 5-2 5s3.74-.5 5-2c.71-.84.7-2.13-.09-2.91a2.18 2.18 0 0 0-2.91-.09z"></path><path d="m12 15-3-3a22 22 0 0 1 2-3.95A12.88 12.88 0 0 1 22 2c0 2.72-.78 7.5-6 11a22.35 22.35 0 0 1-4 2z"></path><path d="M9 12H4s.55-3.03 2-4c1.62-1.08 5 0 5 0"></path><path d="M12 15v5s3.03-.55 4-2c1.08-1.62 0-5 0-5"></path></svg>
{% when 'Reference' %}<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><path d="M4 19.5A2.5 2.5 0 0 1 6.5 17H20"></path><path d="M6.5 2H20v20H6.5A2.5 2.5 0 0 1 4 19.5v-15A2.5 2.5 0 0 1 6.5 2z"></path></svg>
{% when 'Admin Guide' %}<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><circle cx="12" cy="12" r="3"></circle><path d="M19.4 15a1.65 1.65 0 0 0 .33 1.82l.06.06a2 2 0 0 1 0 2.83 2 2 0 0 1-2.83 0l-.06-.06a1.65 1.65 0 0 0-1.82-.33 1.65 1.65 0 0 0-1 1.51V21a2 2 0 0 1-2 2 2 2 0 0 1-2-2v-.09A1.65 1.65 0 0 0 9 19.4a1.65 1.65 0 0 0-1.82.33l-.06.06a2 2 0 0 1-2.83 0 2 2 0 0 1 0-2.83l.06-.06a1.65 1.65 0 0 0 .33-1.82 1.65 1.65 0 0 0-1.51-1H3a2 2 0 0 1-2-2 2 2 0 0 1 2-2h.09A1.65 1.65 0 0 0 4.6 9a1.65 1.65 0 0 0-.33-1.82l-.06-.06a2 2 0 0 1 0-2.83 2 2 0 0 1 2.83 0l.06.06a1.65 1.65 0 0 0 1.82.33H9a1.65 1.65 0 0 0 1-1.51V3a2 2 0 0 1 2-2 2 2 0 0 1 2 2v.09a1.65 1.65 0 0 0 1 1.51 1.65 1.65 0 0 0 1.82-.33l.06-.06a2 2 0 0 1 2.83 0 2 2 0 0 1 0 2.83l-.06.06a1.65 1.65 0 0 0-.33 1.82V9a1.65 1.65 0 0 0 1.51 1H21a2 2 0 0 1 2 2 2 2 0 0 1-2 2h-.09a1.65 1.65 0 0 0-1.51 1z"></path></svg>
{% when 'Developer Guide' %}<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><polyline points="16 18 22 12 16 6"></polyline><polyline points="8 6 2 12 8 18"></polyline></svg>
{% when 'API' %}<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><polyline points="4 17 10 11 4 5"></polyline><line x1="12" y1="19" x2="20" y2="19"></line></svg>
{% when 'Meta' %}<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><circle cx="12" cy="12" r="10"></circle><line x1="12" y1="16" x2="12" y2="12"></line><line x1="12" y1="8" x2="12.01" y2="8"></line></svg>
{% endcase %}
{{ section.title }}</h2>

<div class="docs-grid">
{% for item in section.docs %}
  {% assign item_id = item | prepend:"/docs/" %}
  {% assign solution = site.docs | where:"id",item_id | first %}
  <a href="{{ solution.url }}" class="docs-item">
    <div class="docs-item-title">{% if solution.toc.title %}{{ solution.toc.title }}{% else %}{{ solution.title }}{% endif %}</div>
    <div class="docs-item-excerpt">{{ solution.excerpt | truncatewords: 12 }}</div>
  </a>
{% endfor %}
</div>
{% endfor %}
