---
title: "Plugin: Collaborative Feed Reader"
permalink: /docs/plugins/cerberusweb.feed_reader/
toc:
  title: "Collaborative Feed Reader"
  expand: Plugins
jumbotron:
  title: "Collaborative Feed Reader"
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
| **Name:** | Collaborative Feed Reader
| **Identifier (ID):** | cerberusweb.feed_reader
| **Author:** | Webgroup Media, LLC.
| **Path:** | storage/plugins/cerberusweb.feed_reader/
| **Image:** | <img src="/assets/images/plugins/cerberusweb.feed_reader.png" class="screenshot">

This plugin adds new records for Feeds and Feed Items.  These can be used to share monitoring duties on RSS/Atom feeds: moderate blog comments, audit wiki changes, read new forum posts, track vendor announcements, etc.

* TOC
{:toc}

# Extensions

### Bot Event

| Record custom behavior on feed item | `event.macro.feeditem`


### Event Listener

| Event Listener | `cerberusweb.feed_reader.listener`


### Page Section

| Feed Item Page Section | `feeds.page.profiles.feed_item`
| Feed Page Section | `feeds.page.profiles.feed`


### Record Type

| Feed Item | `cerberusweb.contexts.feed.item`
| Feed | `cerberusweb.contexts.feed`


### Scheduled Job

| Feeds Cron | `feeds.cron`


<div class="section-nav">
	<div class="left">
		<a href="/docs/plugins/#plugins" class="prev">&lt; Plugins</a>
	</div>
	<div class="right align-right">
	</div>
</div>
<div class="clear"></div>