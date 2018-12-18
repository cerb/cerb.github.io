---
title: Plugin Extensions
permalink: /docs/plugins/extensions/
toc:
  title: Extensions
jumbotron:
  title: Extensions
  tagline: 
  breadcrumbs:
  -
    label: Docs &raquo;
    url: /docs/home/
  -
    label: Plugins &raquo;
    url: /docs/plugins/
---

Plugins contribute new functionality by registering **extensions** on **extension points**.

Extensions are defined in a plugin's [manifest](/docs/plugins/manifests/) within the **`<extensions>`** block.

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

# Extension points

|---
| Name | Extension Point
|-|-
| [Bot Action](/docs/plugins/extensions/points/devblocks.event.action/) | `devblocks.event.action`
| [Bot Event](/docs/plugins/extensions/points/devblocks.event/) | `devblocks.event`
| [Cache Engine](/docs/plugins/extensions/points/devblocks.cache.engine/) | `devblocks.cache.engine`
| [Calendar Datasource](/docs/plugins/extensions/points/cerberusweb.calendar.datasource/) | `cerberusweb.calendar.datasource`
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