---
title: 'Plugin: Servers'
excerpt: This page provides detailed information about the "Servers" plugin for Cerb,
  developed by Webgroup Media, LLC.
summary: This page provides detailed information about the "Servers" plugin for Cerb,
  developed by Webgroup Media, LLC. The plugin is designed to manage datacenter assets
  by introducing Server objects. It includes various extensions such as Bot Actions
  for creating servers, Bot Events for recording custom server behaviors, Event Listeners,
  and Page Sections for server management. Additionally, it defines a specific Page
  Type for datacenter management, a Record Type for server contexts, and a REST API
  Controller for server-related operations. The plugin is identified by the ID "cerberusweb.datacenter.servers"
  and is located in the specified storage path.
permalink: /docs/plugins/cerberusweb.datacenter.servers/
toc:
  title: Servers
  expand: Plugins
jumbotron:
  title: Servers
  tagline: ~
  breadcrumbs:
  - label: Docs &raquo;
    url: /docs/home/
  - label: Plugins &raquo;
    url: /docs/plugins/
---

|---
|-|-
| **Name:** | Servers
| **Identifier (ID):** | cerberusweb.datacenter.servers
| **Author:** | Webgroup Media, LLC.
| **Path:** | storage/plugins/cerberusweb.datacenter.servers/
| **Image:** | <img src="/assets/images/plugins/cerberusweb.datacenter.servers.png" class="screenshot">

This plugin adds Server objects that can be used to manage datacenter assets.

* TOC
{:toc}

# Extensions

### Bot Action

| Create Server | `va.action.create_server`


### Bot Event

| Record custom behavior on server | `event.macro.server`


### Event Listener

| Event Listener | `cerberusweb.datacenter.listener`


### Page Section

| Server Page Section | `cerberusweb.profiles.server`


### Page Type

| Datacenter Page | `cerberusweb.datacenter.page`


### Record Type

| Server | `cerberusweb.contexts.datacenter.server`


### Rest API Controller

| Servers | `cerberusweb.datacenter.servers.rest`


<div class="section-nav">
	<div class="left">
		<a href="/docs/plugins/#plugins" class="prev">&lt; Plugins</a>
	</div>
	<div class="right align-right">
	</div>
</div>
<div class="clear"></div>