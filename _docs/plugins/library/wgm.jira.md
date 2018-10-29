---
title: "Plugin: JIRA Integration"
permalink: /docs/plugins/wgm.jira/
toc:
  title: "JIRA Integration"
  expand: Plugins
jumbotron:
  title: "JIRA Integration"
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
| **Name:** | JIRA Integration
| **Identifier (ID):** | wgm.jira
| **Author:** | Webgroup Media, LLC.
| **Path:** | storage/plugins/wgm.jira/
| **Image:** | <img src="/assets/images/plugins/wgm.jira.png" class="screenshot">

This plugin provides integration with Atlassian JIRA via their REST API.  It is intended to be a bridge used by other plugins to communicate with JIRA services.

* TOC
{:toc}

# Extensions

### Bot Action

| JIRA API | `wgmjira.event.action.api_call`


### Bot Event

| Custom behavior on JIRA issue | `event.macro.jira_issue`
| Custom behavior on JIRA project | `event.macro.jira_project`
| New JIRA issue | `wgmjira.event.issue.created`
| New comment on JIRA issue | `wgmjira.event.issue.commented`
| New status on JIRA issue | `wgmjira.event.issue.status.changed`


### Connected Account Service Provider

| [**JIRA**](/docs/plugins/extensions/wgm.jira.service.provider/) | `wgm.jira.service.provider`


### Page Menu Item

| JIRA | `wgm.jira.setup.menu.plugins`


### Page Section

| Jira Issue Section | `jira.page.profiles.jira_issue`
| Jira Project Section | `jira.page.profiles.jira_project`
| Setup Page JIRA Section | `wgm.jira.setup.section`


### Record Type

| Jira Issue | `cerberusweb.contexts.jira.issue`
| Jira Project | `cerberusweb.contexts.jira.project`


### Scheduled Job

| JIRA Synchronization | `wgmjira.cron`


### Search Schema

| Jira Issues | `jira.search.schema.jira_issue`


<div class="section-nav">
	<div class="left">
		<a href="/docs/plugins/#plugins" class="prev">&lt; Plugins</a>
	</div>
	<div class="right align-right">
	</div>
</div>
<div class="clear"></div>