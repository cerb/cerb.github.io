---
title: "Plugin: Twitter Integration"
permalink: /docs/plugins/wgm.twitter/
toc:
  title: "Twitter Integration"
  expand: Plugins
jumbotron:
  title: "Twitter Integration"
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
| **Name:** | Twitter Integration
| **Identifier (ID):** | wgm.twitter
| **Author:** | Webgroup Media, LLC.
| **Path:** | storage/plugins/wgm.twitter/
| **Image:** | <img src="/assets/images/plugins/wgm.twitter.png" class="screenshot">

This plugin provides integration with Twitter via their API. This plugin is intended to be a bridge used by other plugins to communicate with Twitter services. The plugin introduces record types for Twitter Accounts and Messages.  It supports multiple accounts;  @mentions are automatically synchronized and messages can be replied to from within Cerb.  In addition, it adds a new bot action with the ability to post status updates to Twitter.

* TOC
{:toc}

# Extensions

### Bot Action

| Update Twitter Status | `wgmtwitter.event.action.post`


### Connected Account Service Provider

| [**Twitter**](/docs/plugins/extensions/wgm.twitter.service.provider/) | `wgm.twitter.service.provider`


### Page Menu Item

| Twitter | `wgmtwitter.setup.menu.plugins.twitter`


### Page Section

| Setup Page Twitter Section | `wgmtwitter.setup.twitter`
| Twitter Message Profile Section | `cerberusweb.profiles.twitter.message`


### Record Type

| Twitter Message | `cerberusweb.contexts.twitter.message`


### Scheduled Job

| Twitter Checker | `wgmtwitter.cron`


<div class="section-nav">
	<div class="left">
		<a href="/docs/plugins/#plugins" class="prev">&lt; Plugins</a>
	</div>
	<div class="right align-right">
	</div>
</div>
<div class="clear"></div>