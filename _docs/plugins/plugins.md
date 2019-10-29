---
title: Plugins
permalink: /docs/plugins/
toc:
  title: Plugins
jumbotron:
  title: Plugins
  tagline: Add new functionality to Cerb
  breadcrumbs:
  -
    label: Docs &raquo;
    url: /docs/home/
---

While Cerb's [source code](https://github.com/cerb/cerb-release/) is 100% public, any customizations you make to the platform itself will likely _"conflict"_ with ongoing improvements made by the official developers. This makes it more difficult for you to [upgrade](/docs/upgrading/).

You can avoid these issues by using **plugins** -- optional bundles of files that seamlessly contribute new functionality to Cerb.

Even the built-in functionality in Cerb is contributed by plugins. This way, as we continue to improve Cerb, we're also automatically expanding the ability for other people to build their own customizations too.

Common uses for plugins are:

* Integration with [third-party services](/docs/connected-services/)
* Adding new [record types](/docs/records/)
* Augmenting [bots](/docs/bots/) with new actions
* Expanding [workspaces](/docs/workspaces/) and dashboards with new widgets and data sources
* ...and much more

Plugins also allow unused functionality to be removed to keep everything simpler and more efficient.

* TOC
{:toc}

### IDs

Every plugin must have a unique ID comprised of lowercase letters (`a-z`), numbers (`0-9`), underscores (`_`), and dots (`.`).

By convention, the first segment of a plugin's ID is a namespace unique to its author. One way to ensure uniqueness is to base your namespace on a domain name you own.

For instance: `com.example.plugin_name`

### Structure

Every plugin is a directory with the same name as its ID, using the following filesystem structure:

|---
| Path | Description
|-|-
| **`api/`** 				| [Extensions](/docs/plugins/extensions/)
| **`patches/`** 		| [Patches](/docs/plugins/patches/)
| **`resources/`** 	| [Resources](/docs/plugins/resources/) (images, scripts, stylesheets)
| **`templates/`** 	| [Templates](/docs/plugins/templates/)
| `plugin.xml` 			| [Manifest](/docs/plugins/manifests/)
| `strings.xml` 		| [Translations](/docs/plugins/translations/)

The minimal set of plugins required for Cerb to work properly are called **features**. You'll find them in the `features/` directory.

Third-party plugins are found in the `storage/plugins/` directory. These plugins are installed and automatically updated from the Plugin Library.

# Plugins

### Features

| [Devblocks](/docs/plugins/devblocks.core/) | `devblocks.core`
| [Cerb Core](/docs/plugins/cerberusweb.core/) | `cerberusweb.core`
| [Chat Bots](/docs/plugins/cerb.bots.portal.widget/) | `cerb.bots.portal.widget`
| [Knowledgebase](/docs/plugins/cerberusweb.kb/) | `cerberusweb.kb`
| [Project Boards](/docs/plugins/cerb.project_boards/) | `cerb.project_boards`
| [Support Center](/docs/plugins/cerberusweb.support_center/) | `cerberusweb.support_center`
| [Web Services API (JSON/XML)](/docs/plugins/cerberusweb.restapi/) | `cerberusweb.restapi`
| [Webhooks](/docs/plugins/cerb.webhooks/) | `cerb.webhooks`

### Authentication

| [LDAP Integration](/docs/plugins/wgm.ldap/) | `wgm.ldap`

### Integration

| [JIRA Integration](/docs/plugins/wgm.jira/) | `wgm.jira`
| [Twitter Integration](/docs/plugins/wgm.twitter/) | `wgm.twitter`

### Legacy

| [Legacy Printing](/docs/plugins/cerb.legacy.print/) | `cerb.legacy.print`
| [Legacy Profile Attachments Download](/docs/plugins/cerb.legacy.profile.attachments/) | `cerb.legacy.profile.attachments`
| [Ticket Profile "Move To" Shortcut](/docs/plugins/cerb.profile.ticket.moveto/) | `cerb.profile.ticket.moveto`
| [Notifications Emailer](/docs/plugins/wgm.notifications.emailer/) | `wgm.notifications.emailer`
| [Record Simulator](/docs/plugins/cerberusweb.simulator/) | `cerberusweb.simulator`

### Localization

| [Translation Editor](/docs/plugins/cerberusweb.translators/) | `cerberusweb.translators`

### Record Types

| [Call Logging](/docs/plugins/cerberusweb.calls/) | `cerberusweb.calls`
| [Collaborative Feed Reader](/docs/plugins/cerberusweb.feed_reader/) | `cerberusweb.feed_reader`
| [Domains](/docs/plugins/cerberusweb.datacenter.domains/) | `cerberusweb.datacenter.domains`
| [Feedback Capture](/docs/plugins/cerberusweb.feedback/) | `cerberusweb.feedback`
| [Opportunity Tracking](/docs/plugins/cerberusweb.crm/) | `cerberusweb.crm`
| [Sensors](/docs/plugins/cerberusweb.datacenter.sensors/) | `cerberusweb.datacenter.sensors`
| [Servers](/docs/plugins/cerberusweb.datacenter.servers/) | `cerberusweb.datacenter.servers`
| [Time Tracking](/docs/plugins/cerberusweb.timetracking/) | `cerberusweb.timetracking`

### Storage

| [S3 Gatekeeper Storage Engine](/docs/plugins/wgm.storage.s3.gatekeeper/) | `wgm.storage.s3.gatekeeper`
