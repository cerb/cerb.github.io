---
title: "Plugin: JIRA Integration (Legacy)"
permalink: /docs/plugins/wgm.jira/
toc:
  title: "JIRA Integration (Legacy)"
  expand: Plugins
jumbotron:
  title: "JIRA Integration (Legacy)"
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
| **Name:** | JIRA Integration (Legacy)
| **Identifier (ID):** | wgm.jira
| **Author:** | Webgroup Media, LLC.
| **Path:** | storage/plugins/wgm.jira/
| **Image:** | <img src="/assets/images/plugins/wgm.jira.png" class="screenshot">

This plugin provides integration with Atlassian JIRA via their REST API.  It is intended to be a bridge used by other plugins to communicate with JIRA services.

* TOC
{:toc}

# Extensions

### Bot Event

| New JIRA issue | `wgmjira.event.issue.created`
| New comment on JIRA issue | `wgmjira.event.issue.commented`
| New status on JIRA issue | `wgmjira.event.issue.status.changed`
| Record custom behavior on JIRA issue | `event.macro.jira_issue`
| Record custom behavior on JIRA project | `event.macro.jira_project`


### Page Section

| Jira Issue Section | `jira.page.profiles.jira_issue`
| Jira Project Section | `jira.page.profiles.jira_project`


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