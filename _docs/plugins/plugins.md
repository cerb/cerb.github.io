---
title: Plugins
permalink: /docs/plugins/
redirect_from:
  - /docs/plugins/manifests/
  - /docs/plugins/extensions/
  - /docs/plugins/events/
  - /docs/plugins/patches/
  - /docs/plugins/classloader/
  - /docs/plugins/permissions/
  - /docs/plugins/translations/
  - /docs/plugins/resources/
  - /docs/plugins/templates/

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
* Augmenting [automations](/docs/automations/) with new events and commands
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
| **`api/`** 				| [Extensions](/docs/plugins/#extensions)
| **`patches/`** 		| [Patches](/docs/plugins/#patches)
| **`resources/`** 	| [Resources](/docs/plugins/#resources) (images, scripts, stylesheets)
| **`templates/`** 	| [Templates](/docs/plugins/#templates)
| `plugin.xml` 			| [Manifest](/docs/plugins/#manifests)
| `strings.xml` 		| [Translations](/docs/plugins/#translations)

The minimal set of plugins required for Cerb to work properly are called **features**. You'll find them in the `features/` directory.

Third-party plugins are found in the `storage/plugins/` directory. These plugins are installed and automatically updated from the Plugin Library.

# Manifests

Each plugin must have a **manifest** file named `plugin.xml` that describes its contents. This tells Cerb what kinds of new functionality the plugin is contributing.

Here's a minimal manifest:

<pre>
<code class="language-xml">
{% raw %}
&lt;?xml version="1.0" encoding="UTF-8"?&gt;
&lt;plugin xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xsi:noNamespaceSchemaLocation="http://www.devblocks.com/schema/plugin.xsd"&gt;
	&lt;id&gt;example.plugin&lt;/id&gt;
	&lt;name&gt;Plugin Name&lt;/name&gt;
	&lt;description&gt;This explains what your plugin does.&lt;/description&gt;
	&lt;author&gt;Webgroup Media, LLC.&lt;/author&gt;
	&lt;version&gt;0.0.0&lt;/version&gt;
	&lt;link&gt;https://cerb.example/path/to/docs&lt;/link&gt;
	&lt;image&gt;plugin.png&lt;/image&gt;

	&lt;requires&gt;
		&lt;app_version min="9.3" max="9.3.99" /&gt;
		&lt;!--&lt;php_extension name="curl" /&gt;--&gt;
	&lt;/requires&gt;

	&lt;dependencies&gt;
		&lt;require plugin_id="cerberusweb.core" version="9.3.0" /&gt;
	&lt;/dependencies&gt;

	&lt;patches/&gt;
	&lt;class_loader/&gt;
	&lt;event_points/&gt;
	&lt;acl/&gt;
	&lt;activity_points/&gt;
	&lt;extensions/&gt;
&lt;/plugin&gt;
{% endraw %}
</code>
</pre>

### Plugin metadata

* **`<id>`** is the globally unique [ID](/docs/plugins/#ids) of the plugin, prefixed with the author's namespace. This should only contain lowercase letters (`a-z`), numbers (`0-9`), underscore (`_`), and dots (`.`).

* **`<name>`** is the human-friendly name of the plugin.

* **`<description>`** is a brief description of the purpose and contributions of the plugin.

* **`<author>`** is the name used for attribution of the plugin's author.

* **`<version>`** is the semantic version of the plugin in `<generation>.<major>.<minor>` format. This should start with `0.0.0` and be incremented for each update.

* **`<link>`** is a URL to the plugin's documentation page.

* **`<image>`** is a path to the plugin's icon. This is relative to the plugin's `resources/` directory.

### Requirements

The **`<requires>`** block specifies the requirements for installing and enabling this plugin.

This block must contain one **`<app_version>`** element specifying the minimum and maximum version of Cerb that are verified compatible with this build of the plugin.

The block may contain any number of **`<php_extension>`** elements if specific PHP extensions are required for the plugin to operate (e.g. `ldap`, `oauth`, `zip`).

### Dependencies

The optional **`<dependencies>`** block specifies if this plugin depends on another plugin.

This block may contain any number of **`<require>`** elements specifying a required `plugin_id` and its minimum compatible `version`.

### Everything else

The other elements will be covered in more detail in the subsequent sections:

* [**`<extensions>`**](/docs/plugins/#extensions)
* [**`<event_points>`**](/docs/plugins/#events)
* [**`<patches>`**](/docs/plugins/#patches)
* [**`<class_loader>`**](/docs/plugins/#classloader)
* [**`<acl>`**](/docs/plugins/#permissions)

# Extensions

Plugins contribute new functionality by registering **extensions** on **extension points**.

Extensions are defined in a plugin's [manifest](/docs/plugins/#manifests) within the **`<extensions>`** block.

Each extension entry looks like:

<pre style="max-height:29.5em;">
<code class="language-xml">
{% raw %}
&lt;extension point="com.example.extension_point"&gt;
	&lt;id&gt;com.example.extension_name&lt;/id&gt;
	&lt;name&gt;Extension name&lt;/name&gt;
	&lt;class&gt;
		&lt;file&gt;relative/path/to/file.php&lt;/file&gt;
		&lt;name&gt;Class_Name&lt;/name&gt;
	&lt;/class&gt;
	&lt;params/&gt;
&lt;/extension&gt;
{% endraw %}
</code>
</pre>

* **`<extension point="...">`** specifies the [extension point](#extension-points) of the extension.

* **`<id>`** is the globally unique ID of the extension. Like plugins, this should only contain lowercase letters (`a-z`), numbers (`0-9`), underscores (`_`), and dots (`.`). The extension ID should always start with the [ID](/docs/plugins/#ids) of the plugin.

* **`<name>`** is the human-friendly name of the extension.

* **`<class>`** assigns code from the plugin to the extension. Each extension point provides a parent _class_ which must be _extended_ by the plugin's extension. The **`<name>`** element in this block specifies the class name of this implementation, and **`<file>`** is the path to a source code file, relative to the plugin's directory. This almost always starts with `api/`.

* **`<params>`** is where each extension manifest can set configuration details based on the extension point.

## Extension points

|---
| Name | Extension Point
|-|-
| [Automation Trigger](/docs/plugins/extensions/points/cerb.automation.trigger/) | `devblocks.event.action`
| [Bot Action](/docs/plugins/extensions/points/devblocks.event.action/) | `devblocks.event.action`
| [Bot Event](/docs/plugins/extensions/points/devblocks.event/) | `devblocks.event`
| [Cache Engine](/docs/plugins/extensions/points/devblocks.cache.engine/) | `devblocks.cache.engine`
| [Calendar Datasource](/docs/plugins/extensions/points/cerberusweb.calendar.datasource/) | `cerberusweb.calendar.datasource`
| [Card Widget Type](/docs/plugins/extensions/points/cerb.card.widget/) | `cerb.card.widget`
| [Community Portal](/docs/plugins/extensions/points/cerb.portal/) | `cerb.portal`
| [Connected Service Provider](/docs/plugins/extensions/points/cerb.connected_service.provider/) | `cerb.connected_service.provider`
| [Controller](/docs/plugins/extensions/points/devblocks.controller/) | `devblocks.controller`
| [Custom Field Type](/docs/plugins/extensions/points/cerb.custom_field/) | `cerb.custom_field`
| [Event Listener](/docs/plugins/extensions/points/devblocks.listener.event/) | `devblocks.listener.event`
| [Http Request Listener](/docs/plugins/extensions/points/devblocks.listener.http/) | `devblocks.listener.http`
| [Mail Transport Type](/docs/plugins/extensions/points/cerberusweb.mail.transport/) | `cerberusweb.mail.transport`
| [Message Toolbar Item](/docs/plugins/extensions/points/cerberusweb.message.toolbaritem/) | `cerberusweb.message.toolbaritem`
| [Page Menu Item](/docs/plugins/extensions/points/cerberusweb.ui.page.menu.item/) | `cerberusweb.ui.page.menu.item`
| [Page Section](/docs/plugins/extensions/points/cerberusweb.ui.page.section/) | `cerberusweb.ui.page.section`
| [Page Type](/docs/plugins/extensions/points/cerberusweb.page/) | `cerberusweb.page`
| [Prebody Renderer](/docs/plugins/extensions/points/cerberusweb.renderer.prebody/) | `cerberusweb.renderer.prebody`
| [Profile Script](/docs/plugins/extensions/points/cerberusweb.ui.context.profile.script/) | `cerberusweb.ui.context.profile.script`
| [Profile Tab Type](/docs/plugins/extensions/points/cerb.profile.tab/) | `cerb.profile.tab`
| [Profile Widget Type](/docs/plugins/extensions/points/cerb.profile.tab.widget/) | `cerb.profile.tab.widget`
| [Record Type](/docs/plugins/extensions/points/devblocks.context/) | `devblocks.context`
| [Reply Toolbar Item](/docs/plugins/extensions/points/cerberusweb.reply.toolbaritem/) | `cerberusweb.reply.toolbaritem`
| [Rest API Controller](/docs/plugins/extensions/points/cerberusweb.rest.controller/) | `cerberusweb.rest.controller`
| [Scheduled Job](/docs/plugins/extensions/points/cerberusweb.cron/) | `cerberusweb.cron`
| [Search Engine](/docs/plugins/extensions/points/devblocks.search.engine/) | `devblocks.search.engine`
| [Search Schema](/docs/plugins/extensions/points/devblocks.search.schema/) | `devblocks.search.schema`
| [Sensor Type](/docs/plugins/extensions/points/cerberusweb.datacenter.sensor/) | `cerberusweb.datacenter.sensor`
| [Storage Engine](/docs/plugins/extensions/points/devblocks.storage.engine/) | `devblocks.storage.engine`
| [Storage Schema](/docs/plugins/extensions/points/devblocks.storage.schema/) | `devblocks.storage.schema`
| [Support Center Controller](/docs/plugins/extensions/points/usermeet.sc.controller/) | `usermeet.sc.controller`
| [Support Center Login Authenticator](/docs/plugins/extensions/points/usermeet.login.authenticator/) | `usermeet.login.authenticator`
| [Support Center RSS Feed](/docs/plugins/extensions/points/usermeet.sc.rss.controller/) | `usermeet.sc.rss.controller`
| [Webhook Listener Type](/docs/plugins/extensions/points/cerb.webhooks.listener.engine/) | `cerb.webhooks.listener.engine`
| [Workspace Page Type](/docs/plugins/extensions/points/cerberusweb.ui.workspace.page/) | `cerberusweb.ui.workspace.page`
| [Workspace Tab Type](/docs/plugins/extensions/points/cerberusweb.ui.workspace.tab/) | `cerberusweb.ui.workspace.tab`
| [Workspace Widget Datasource](/docs/plugins/extensions/points/cerberusweb.ui.workspace.widget.datasource/) | `cerberusweb.ui.workspace.widget.datasource`
| [Workspace Widget Type](/docs/plugins/extensions/points/cerberusweb.ui.workspace.widget/) | `cerberusweb.ui.workspace.widget`

# Events

Plugins can add new **events** to Cerb based on the contributed functionality. The [activity log](/docs/activity-log/) will record the new events on [records](/docs/records/), [automations](/docs/automations/) can listen for them, etc.

<pre style="max-height:29.5em;">
<code class="language-xml">
{% raw %}
&lt;event_points&gt;
	&lt;event id="example.event"&gt;
		&lt;name&gt;Example Event&lt;/name&gt;
		&lt;param key="field_name" /&gt;
	&lt;/event&gt;
&lt;/event_points&gt;
{% endraw %}
</code>
</pre>

* **`<event id="...">`** specifies the ID of the event.

* **`<name>`** is the human-friendly name of the event.

* **`<param key="...">`** is a list of available parameters on the event.

<div class="cerb-box note">
<p>If you create a <a href="/docs/plugins/extensions/points/devblocks.event/">Bot Event</a> extension you do not need to add a separate event here.</p>
</div>

# Patches

Plugins that need to maintain a _schema_ in the database can do so with **patches**. A patch is a collection of changes used to migrate data between versions during an upgrade.

When you skip several versions of a plugin to upgrade to the latest version, Cerb will automatically handle the migration of your data through the intervening versions.  This is the same thing that happens when you upgrade Cerb itself.

<pre style="max-height:29.5em;">
<code class="language-xml">
{% raw %}
&lt;patches&gt;
	&lt;patch version="9.0.0" revision="1" file="patches/9.0.0.php" /&gt;
&lt;/patches&gt;
{% endraw %}
</code>
</pre>

# Classloader

The **class loader** is a map of source code classes and their filesystem paths. This enables Cerb to efficiently only load the files necessary to serve a specific request.

If your plugin introduces classes that will be referenced by code outside of the plugin, you should register them here. Class loader entries are automatically created for any [extensions](/docs/plugins/extensions/) you register.

<pre style="max-height:29.5em;">
<code class="language-xml">
{% raw %}
&lt;class_loader&gt;
	&lt;file path="api/dao/example.php"&gt;
		&lt;class name="Context_Example" /&gt;
		&lt;class name="DAO_Example" /&gt;
		&lt;class name="Model_Example" /&gt;
		&lt;class name="Plugin_Example" /&gt;
		&lt;class name="SearchFields_Example" /&gt;
		&lt;class name="View_Example" /&gt;
	&lt;/file&gt;
&lt;/class_loader&gt;
{% endraw %}
</code>
</pre>

# Permissions

Plugins can introduce new privileges into [roles](/docs/roles/).

<pre style="max-height:29.5em;">
<code class="language-xml">
{% raw %}
&lt;acl&gt;
	&lt;priv id="example.permission" label="acl.example.permission" /&gt;
&lt;/acl&gt;
{% endraw %}
</code>
</pre>

* **`id="..."`** is the ID of the new privilege. This uses dot-notation like plugins and extensions. It should also use your plugin ID as a namespace prefix.

* **`label="..."`** is the [translation](/docs/plugins/#translations) ID of the human-readable label for the privilege.

# Translations

Most of the text you see in Cerb is provided by the **translation** system using _American English_ defaults. All of this text is able to be translated into any other language using our built-in [Translation Editor](/docs/plugins/cerberusweb.translators/) plugin.

Plugins can add new text to the translation system with a `strings.xml` file in TMX format, which can then be translated into any language by anyone, as well as shared in our official translation packs.

<pre>
<code class="language-xml">
{% raw %}
&lt;?xml version="1.0" encoding="UTF-8"?&gt;
&lt;!DOCTYPE tmx PUBLIC "-//LISA OSCAR:1998//DTD for Translation Memory eXchange//EN" "tmx14.dtd"&gt;
&lt;tmx version="1.4"&gt;
	&lt;header creationtool="Cerb" creationtoolversion="9.0.7" srclang="en_US" adminlang="en" datatype="unknown" o-tmf="unknown" segtype="sentence" creationid="" creationdate=""/&gt;
	&lt;body&gt;

		&lt;tu tuid='example.plugin.string_name'&gt;
			&lt;tuv xml:lang="en_US"&gt;&lt;seg&gt;Replace this with your own text.&lt;/seg&gt;&lt;/tuv&gt;
		&lt;/tu&gt;
		
	&lt;/body&gt;
&lt;/tmx&gt;
{% endraw %}
</code>
</pre>

# Resources

Plugins can add new sharable resources like:

* Images

* Scripts (Javascript)

* Stylesheets

These must be stored in the `resources/` directory within the plugin.

Resources can then be accessed by URL with the format:

`/resource/`**`<plugin-id>`**`/path/to/resource/file.ext`

In [templates](/docs/plugins/#templates):

<pre>
<code class="language-smarty">
{% raw %}
{devblocks_url}c=resource&plugin=example.plugin&f=path/to/resource/file.ext{/devblocks_url}
{% endraw %}
</code>
</pre>

From [bot scripting](/docs/scripting/):

<pre>
<code class="language-twig">
{% raw %}
{{cerb_url('c=resource&plugin=example.plugin&f=path/to/resource/file.ext')}}
{% endraw %}
</code>
</pre>

<div class="cerb-box note">
<p>All plugin resources are public (world readable) and do not require a valid session to access. Do not store private content in this directory.</p>
</div>

# Templates

Cerb plugins use the [Smarty](https://smarty.net/) template engine.

Templates are stored in the plugin's `templates/` directory.

They are referenced from plugin code like:

<pre>
<code class="language-php">
{% raw %}
$tpl = DevblocksPlatform::services()->template();
$tpl->assign('name', 'Kina Halpue');
$tpl->display('devblocks:example.plugin::path/to/template.tpl');
{% endraw %}
</code>
</pre>

In `->display()`, `example.plugin` should be your plugin's [ID](/docs/plugins/#ids). The `path/to/` is relative to the plugin's `templates/` directory.

Here's an example template:

<pre>
<code class="language-smarty">
{% raw %}
&lt;div&gt;
	Hello, &lt;b&gt;{$name}&lt;/b&gt;!
&lt;/div&gt;
{% endraw %}
</code>
</pre>

# Activity Points

We previously mentioned **events** when discussing [automations](/docs/automations/) and the [activity log](/docs/records/#activity-log). Plugins can add new events to Cerb based on the contributed functionality. The activity log will record the new events on records, automations can listen for them, etc.

<pre style="max-height:29.5em;">
<code class="language-xml">
{% raw %}
&lt;activity_points&gt;
	&lt;activity point="example.event"&gt;
		&lt;param key="label_key" value="Example Event" /&gt;
		&lt;param key="string_key" value="activities.example_event" /&gt;
		&lt;param key="options" value="api_create, notifications" /&gt;
	&lt;/activity&gt;
&lt;/activity_points&gt;
{% endraw %}
</code>
</pre>

# Library

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
