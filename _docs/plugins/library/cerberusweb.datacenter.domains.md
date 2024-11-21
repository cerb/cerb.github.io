---
title: 'Plugin: Domains'
excerpt: This page provides detailed information about the "Domains" plugin for Cerb,
  developed by Webgroup Media, LLC.
summary: This page provides detailed information about the "Domains" plugin for Cerb,
  developed by Webgroup Media, LLC. The plugin is designed to manage Domain objects
  within web hosting, SaaS, and on-demand infrastructure environments. It includes
  various extensions such as Bot Actions for creating domains, Bot Events for recording
  custom behaviors, Event Listeners, and Page Sections and Types for domain management.
  Additionally, it supports a Record Type for domains and a REST API Controller for
  domain-related operations. The plugin is identified by the ID "cerberusweb.datacenter.domains"
  and is located in the specified storage path.
permalink: /docs/plugins/cerberusweb.datacenter.domains/
toc:
  title: Domains
  expand: Plugins
jumbotron:
  title: Domains
  tagline: ~
  breadcrumbs:
  - label: Docs &raquo;
    url: /docs/home/
  - label: Plugins &raquo;
    url: /docs/plugins/
---

|---
|-|-
| **Name:** | Domains
| **Identifier (ID):** | cerberusweb.datacenter.domains
| **Author:** | Webgroup Media, LLC.
| **Path:** | storage/plugins/cerberusweb.datacenter.domains/
| **Image:** | <img src="/assets/images/plugins/cerberusweb.datacenter.domains.png" class="screenshot">

This plugin adds Domain objects for managing webhosting/SaaS/On-Demand infrastructure.

* TOC
{:toc}

# Extensions

### Bot Action

| Create Domain | `va.action.create_domain`


### Bot Event

| Record custom behavior on domain | `event.macro.domain`


### Event Listener

| Event Listener | `cerberusweb.datacenter.domains.listener`


### Page Section

| Domain Section | `cerberusweb.datacenter.page.profiles.domain`


### Page Type

| Domains Page | `cerberusweb.datacenter.domains.page`


### Record Type

| Domain | `cerberusweb.contexts.datacenter.domain`


### Rest API Controller

| Domains | `cerberusweb.datacenter.domains.rest`


<div class="section-nav">
	<div class="left">
		<a href="/docs/plugins/#plugins" class="prev">&lt; Plugins</a>
	</div>
	<div class="right align-right">
	</div>
</div>
<div class="clear"></div>