---
title: "Plugin: Knowledgebase"
permalink: /docs/plugins/cerberusweb.kb/
toc:
  title: "Knowledgebase"
  expand: Plugins
jumbotron:
  title: "Knowledgebase"
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
| **Name:** | Knowledgebase
| **Identifier (ID):** | cerberusweb.kb
| **Author:** | Webgroup Media, LLC.
| **Path:** | features/cerberusweb.kb/
| **Image:** | <img src="/assets/images/plugins/cerberusweb.kb.png" class="screenshot">

Create and categorize articles to share knowledge between workers or your community.

* TOC
{:toc}

# Extensions

### Bot Event

| Record custom behavior on knowledgebase article | `event.macro.kb_article`


### Controller

| KB Ajax Controller | `cerberusweb.kb.controller.ajax`


### Event Listener

| Event Listener | `kb.listener`


### Page Section

| KB Article Section | `cerberusweb.page.profiles.kb_article`
| Kb Category Section | `kb.page.profiles.kb_category`


### Page Type

| Knowledgebase | `core.page.kb`


### Profile Widget Type

| [**Knowledgebase Article**](/docs/plugins/extensions/cerb.profile.tab.widget.kb_article/) | `cerb.profile.tab.widget.kb_article`


### Record Type

| Knowledgebase Article | `cerberusweb.contexts.kb_article`
| Knowledgebase Category | `cerberusweb.contexts.kb_category`


### Reply Toolbar Item

| KB Reply Toolbar | `cerberusweb.kb.reply.toolbaritem.kb`


### Rest API Controller

| KB Articles | `cerberusweb.rest.controller.kbarticles`
| KB Categories | `cerberusweb.rest.controller.kbcategories`


### Search Schema

| Knowledgebase Articles | `cerberusweb.search.schema.kb_article`


### Support Center Controller

| Knowledgebase | `cerberusweb.kb.sc.controller`


### Support Center RSS Feed

| Knowledgebase RSS | `cerberusweb.kb.sc.rss.controller`


### Workspace Widget Type

| [**Knowledgebase Browser**](/docs/plugins/extensions/kb.workspace.widget.kb.browser/) | `kb.workspace.widget.kb.browser`


<div class="section-nav">
	<div class="left">
		<a href="/docs/plugins/#plugins" class="prev">&lt; Plugins</a>
	</div>
	<div class="right align-right">
	</div>
</div>
<div class="clear"></div>