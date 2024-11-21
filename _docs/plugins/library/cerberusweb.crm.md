---
title: 'Plugin: Opportunity Tracking'
excerpt: This page provides detailed information about the Opportunity Tracking plugin
  for Cerb, developed by Webgroup Media, LLC.
summary: This page provides detailed information about the Opportunity Tracking plugin
  for Cerb, developed by Webgroup Media, LLC. It outlines the functionality of creating
  and managing sales leads linked to email addresses within the Cerb platform. The
  plugin allows users to create opportunity records from the Activity menu or while
  reading tickets. It includes various extensions such as Bot Actions for creating
  opportunities, Bot Events for recording custom behaviors, Event Listeners for CRM
  activities, Page Sections for opportunity profiles, Record Types for opportunity
  management, and a REST API Controller for handling opportunities programmatically.
permalink: /docs/plugins/cerberusweb.crm/
toc:
  title: Opportunity Tracking
  expand: Plugins
jumbotron:
  title: Opportunity Tracking
  tagline: ~
  breadcrumbs:
  - label: Docs &raquo;
    url: /docs/home/
  - label: Plugins &raquo;
    url: /docs/plugins/
---

|---
|-|-
| **Name:** | Opportunity Tracking
| **Identifier (ID):** | cerberusweb.crm
| **Author:** | Webgroup Media, LLC.
| **Path:** | features/cerberusweb.crm/
| **Image:** | <img src="/assets/images/plugins/cerberusweb.crm.png" class="screenshot">

Create opportunities (sales leads) linked to e-mail addresses. Opportunity records can be created from the Activity menu or while reading tickets.

* TOC
{:toc}

# Extensions

### Bot Action

| Create Opportunity | `va.action.create_opportunity`


### Bot Event

| Record custom behavior on opportunity | `event.macro.crm.opportunity`


### Event Listener

| CRM Listener | `crm.listeners.core`


### Page Section

| Opp Section | `crm.page.profiles.opportunity`


### Record Type

| Opportunity | `cerberusweb.contexts.opportunity`


### Rest API Controller

| Opportunities | `crm.rest.controller.opps`


<div class="section-nav">
	<div class="left">
		<a href="/docs/plugins/#plugins" class="prev">&lt; Plugins</a>
	</div>
	<div class="right align-right">
	</div>
</div>
<div class="clear"></div>