---
title: 'Plugin: Webhooks'
excerpt: This page provides detailed information about the Webhooks plugin for Cerb,
  developed by Webgroup Media, LLC.
summary: This page provides detailed information about the Webhooks plugin for Cerb,
  developed by Webgroup Media, LLC. The plugin allows Cerb to handle webhooks and
  trigger bot behaviors in response. It includes various extensions such as Bot Event,
  Controller, Page Section, Portal, and Record Type, each with specific functionalities
  like receiving webhooks, managing webhook controllers, and setting up webhook listener
  sections and portals. The plugin is identified by the ID "cerb.webhooks" and is
  located in the "features/cerb.webhooks/" path.
permalink: /docs/plugins/cerb.webhooks/
toc:
  title: Webhooks
  expand: Plugins
jumbotron:
  title: Webhooks
  tagline: ~
  breadcrumbs:
  - label: Docs &raquo;
    url: /docs/home/
  - label: Plugins &raquo;
    url: /docs/plugins/
---

|---
|-|-
| **Name:** | Webhooks
| **Identifier (ID):** | cerb.webhooks
| **Author:** | Webgroup Media, LLC.
| **Path:** | features/cerb.webhooks/
| **Image:** | <img src="/assets/images/plugins/cerb.webhooks.png" class="screenshot">

This plugin enables Cerb to catch webhooks and execute bot behaviors in response.

* TOC
{:toc}

# Extensions

### Bot Event

| Webhook received | `event.webhook.received`


### Controller

| Webhooks Controller | `webhooks.controller`


### Page Section

| Webhook Listener Section | `webhooks.page.profiles.webhook_listener`


### Portal

| [**Webhook Portal**](/docs/plugins/extensions/webhooks.portal/) | `webhooks.portal`


### Record Type

| Webhook Listener | `cerberusweb.contexts.webhook_listener`


<div class="section-nav">
	<div class="left">
		<a href="/docs/plugins/#plugins" class="prev">&lt; Plugins</a>
	</div>
	<div class="right align-right">
	</div>
</div>
<div class="clear"></div>