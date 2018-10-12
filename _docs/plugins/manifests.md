---
title: Plugin Manifests
permalink: /docs/plugins/manifests/
toc:
  title: Manifests
jumbotron:
  title: Manifests
  tagline: Add new functionality to Cerb
  breadcrumbs:
  -
    label: Docs &raquo;
    url: /docs/home/
  -
    label: Plugins &raquo;
    url: /docs/plugins/
---

# Manifests

Plugins follow a special convention, starting with a `plugin.xml` **manifest** file that describes the _assets_ being contributed. These assets are typically: extensions, patches, translations, permissions, and events.

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
	&lt;link&gt;https://cerb.example/&lt;/link&gt;
	&lt;image&gt;plugin.png&lt;/image&gt;

	&lt;!-- Requirements --&gt;

	&lt;requires&gt;
		&lt;app_version min="9.0" max="9.0.99" /&gt;
		&lt;!--&lt;php_extension name="curl" /&gt;--&gt;
	&lt;/requires&gt;

	&lt;!-- Plugin Dependencies --&gt;
	
	&lt;dependencies&gt;
		&lt;require plugin_id="cerberusweb.core" version="9.0.0" /&gt;
	&lt;/dependencies&gt;

	&lt;!-- Patches --&gt;
	
	&lt;patches&gt;
		&lt;!--
		&lt;patch version="9.0.0" revision="1" file="patches/9.0.0.php" /&gt;
		--&gt;
	&lt;/patches&gt;

	&lt;!-- Classloader --&gt;
	
	&lt;class_loader&gt;
		&lt;!--
		&lt;file path="api/dao/example.php"&gt;
			&lt;class name="Context_Example" /&gt;
			&lt;class name="DAO_Example" /&gt;
			&lt;class name="Model_Example" /&gt;
			&lt;class name="Plugin_Example" /&gt;
			&lt;class name="SearchFields_Example" /&gt;
			&lt;class name="View_Example" /&gt;
		&lt;/file&gt;
		--&gt;
	&lt;/class_loader&gt;

	&lt;!-- Event Points --&gt;

	&lt;!--
	&lt;event_points&gt;
		&lt;event id="example.event"&gt;
			&lt;name&gt;Example Event&lt;/name&gt;
			&lt;param key="field_name" /&gt;
		&lt;/event&gt;
	&lt;/event_points&gt;
	--&gt;

	&lt;!-- Permissions --&gt;
	
	&lt;!--
	&lt;acl&gt;
		&lt;priv id="example.permission" label="acl.example.permission" /&gt;
	&lt;/acl&gt;
	--&gt;

	&lt;!-- Activity Points --&gt;
	
	&lt;!--
	&lt;activity_points&gt;
		&lt;activity point="example.event"&gt;
			&lt;param key="label_key" value="Example Event" /&gt;
			&lt;param key="string_key" value="activities.example_event" /&gt;
			&lt;param key="options" value="api_create, notifications" /&gt;
		&lt;/activity&gt;
	&lt;/activity_points&gt;
	--&gt;
	
	&lt;!-- Extensions --&gt;

	&lt;extensions&gt;
	&lt;/extensions&gt;
&lt;/plugin&gt;
{% endraw %}
</code>
</pre>

## Extensions

Cerb provides plugin developers with a list of **extension points** that describes the types of functionality that can be added. In a plugin's manifest, an **extension** associates a contributed asset with a specific extension point.

For instance, the `devblocks.context` extension point accepts new record types. The `devblocks.event.action` point accepts new bot actions.

## Events

We previously mentioned **events** when discussing [bots](/docs/bots) and the [activity log](/docs/records#activity-log). Plugins can add new events to Cerb based on the contributed functionality. The activity log will record the new events on records, bots behaviors can listen for them, etc.

## Patches

Plugins that need to maintain a _schema_ in the database can do so with **patches**. A patch is a collection of changes used to migrate data between versions during an upgrade.

When you skip several versions of a plugin to upgrade to the latest version, Cerb will automatically handle the migration of your data through the intervening versions.  This is the same thing that happens when you upgrade Cerb itself.

## Translations

Most of the text you see in Cerb is provided by the **translation** system using _American English_ defaults. All of this text is able to be translated into any other language using our built-in _translation editor_ plugin.

Plugins can add new text to the translation system with a `strings.xml` file, which can then be translated into any language by anyone, as well as shared in our official translation packs.

## Permissions

Plugins can also take advantage of the role-based permissions system in Cerb by describing new privileges for the contributed functionality.
