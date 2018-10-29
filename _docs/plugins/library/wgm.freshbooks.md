---
title: "Plugin: Freshbooks Integration"
permalink: /docs/plugins/wgm.freshbooks/
toc:
  title: "Freshbooks Integration"
  expand: Plugins
jumbotron:
  title: "Freshbooks Integration"
  tagline: 
  breadcrumbs:
  -
    label: Docs &raquo;
    url: /docs/home/
  -
    label: Plugins &raquo;
    url: /docs/plugins/
---

|---
|-|-
| **Name:** | Freshbooks Integration
| **Identifier (ID):** | wgm.freshbooks
| **Author:** | Webgroup Media, LLC.
| **Path:** | storage/plugins/wgm.freshbooks/
| **Image:** | <img src="/assets/images/plugins/wgm.freshbooks.png" class="screenshot">

This plugin provides integration with Freshbooks via their REST API. This plugin is intended to be a bridge used by other plugins to communicate with Freshbooks services. It adds records for Freshbooks Clients.  Plugin development has been sponsored by Nolan Interactive - http://www.nolaninteractive.com/

* TOC
{:toc}

# Extensions

### Connected Account Service Provider

| [**Freshbooks**](/docs/plugins/extensions/wgm.freshbooks.service.provider/) | `wgm.freshbooks.service.provider`


### Controller

| Freshbooks Controller | `wgm.freshbooks.controller`


### Event Listener

| Freshbooks Event Listener | `wgm.freshbooks.listener`


### Page Menu Item

| Freshbooks | `wgm.freshbooks.setup.menu.plugins.freshbooks`


### Page Section

| Freshbooks Client Section | `wgm.freshbooks.profiles.freshbooks_client`
| Setup Page Freshbooks Section | `wgm.freshbooks.setup.section.freshbooks`


### Record Type

| Freshbooks Client | `wgm.freshbooks.contexts.client`
| Freshbooks Invoice | `wgm.freshbooks.contexts.invoice`


### Scheduled Job

| Freshbooks Synchronize Cron | `wgm.freshbooks.cron.sync`


<div class="section-nav">
	<div class="left">
		<a href="/docs/plugins/#plugins" class="prev">&lt; Plugins</a>
	</div>
	<div class="right align-right">
	</div>
</div>
<div class="clear"></div>