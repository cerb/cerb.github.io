---
title: "Plugin: Time Tracking"
permalink: /docs/plugins/cerberusweb.timetracking/
toc:
  title: "Time Tracking"
  expand: Plugins
jumbotron:
  title: "Time Tracking"
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
| **Name:** | Time Tracking
| **Identifier (ID):** | cerberusweb.timetracking
| **Author:** | Webgroup Media, LLC.
| **Path:** | features/cerberusweb.timetracking/
| **Image:** | <img src="/assets/images/plugins/cerberusweb.timetracking.png" class="screenshot">

Track time spent on various helpdesk activities (replying to tickets, etc).  This adds a Track Time button to Display Ticket and Organizations, and a Time Tracking tab to the Activity page.

* TOC
{:toc}

# Extensions

### Bot Event

| Record custom behavior on time tracking entry | `event.macro.timetracking`


### Event Listener

| Time Tracking Listener | `timetracking.listener.core`


### Page Section

| Time Tracking Activity Section | `cerb.page.profiles.timetracking_activity`
| Time Tracking Page Section | `cerberusweb.profiles.time_tracking`


### Page Type

| Time Tracking Page | `timetracking.page`


### Prebody Renderer

| Time Tracking Pre-body Renderer | `timetracking.renderer.prebody`


### Profile Script

| Time Tracking Profile Script | `timetracking.profile_script.timer`


### Record Type

| Time Tracking Activity | `cerberusweb.contexts.timetracking.activity`
| Time Tracking | `cerberusweb.contexts.timetracking`


### Reply Toolbar Item

| Time Tracking Reply Toolbar Timer | `timetracking.reply.toolbaritem.timer`


### Rest API Controller

| Time Tracking | `cerberusweb.rest.controller.timetracking`


<div class="section-nav">
	<div class="left">
		<a href="/docs/plugins/#plugins" class="prev">&lt; Plugins</a>
	</div>
	<div class="right align-right">
	</div>
</div>
<div class="clear"></div>