---
title: 'Plugin: Call Logging'
excerpt: This page provides detailed information about the Call Logging plugin for
  Cerb, developed by Webgroup Media, LLC.
summary: This page provides detailed information about the Call Logging plugin for
  Cerb, developed by Webgroup Media, LLC. The plugin introduces a new Call record
  type designed for logging both incoming and outgoing phone activities. It includes
  various extensions such as Bot Action, Bot Event, Event Listener, Page Section,
  and Record Type, each with specific identifiers and functionalities. These extensions
  enable users to log call events, record custom behaviors, listen to call events,
  and manage call records within the Cerb platform.
permalink: /docs/plugins/cerberusweb.calls/
toc:
  title: Call Logging
  expand: Plugins
jumbotron:
  title: Call Logging
  tagline: ~
  breadcrumbs:
  - label: Docs &raquo;
    url: /docs/home/
  - label: Plugins &raquo;
    url: /docs/plugins/
---

|---
|-|-
| **Name:** | Call Logging
| **Identifier (ID):** | cerberusweb.calls
| **Author:** | Webgroup Media, LLC.
| **Path:** | storage/plugins/cerberusweb.calls/
| **Image:** | <img src="/assets/images/plugins/cerberusweb.calls.png" class="screenshot">

This plugin adds a new Call record type for logging incoming and outgoing phone activity.

* TOC
{:toc}

# Extensions

### Bot Action

| Log Call Global Event Action | `calls.event.action.post`


### Bot Event

| Record custom behavior on call | `event.macro.call`


### Event Listener

| Event Listener | `calls.listener`


### Page Section

| Call Section | `calls.page.profiles.call`


### Record Type

| Call | `cerberusweb.contexts.call`


<div class="section-nav">
	<div class="left">
		<a href="/docs/plugins/#plugins" class="prev">&lt; Plugins</a>
	</div>
	<div class="right align-right">
	</div>
</div>
<div class="clear"></div>