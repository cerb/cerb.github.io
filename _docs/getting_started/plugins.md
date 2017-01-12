---
title: Plugins
permalink: /docs/plugins/
jumbotron:
  title: Plugins
  tagline: Add new functionality to Cerb
---

A **plugin** is a special bundle of files used to seamlessly add new functionality to Cerb. Plugins can integrate Cerb with third-party services, add new [record](/docs/records) types, augment bots with new conditions and actions, expand workspaces and dashboards, and much more.

For instance, the [Twilio](/docs/plugins/wgm.twilio) plugin gives bots the ability to send text messages and initiate voice calls.

In some other software projects, plugins are an afterthought and quite limited in what they can do. You may be surprised to learn that _everything_ in Cerb is contributed by plugins; even the most basic built-in functionality. This was an intentional decision from the very beginning.  It means that as we continue to officially improve Cerb, we're also automatically expanding the ability for other people to improve it as well. We're sharing _all_ of our tools with developers. When they add new functionality with a plugin, it's indistinguishable to Cerb from something that we added ourselves.

Another benefit of plugins is that they allow functionality to be _completely removed_ when it is not being used by a particular organization. This keeps Cerb fast and lean.

## Library

[Administrators](/docs/workers) can discover and install plugins from the [plugin library](/docs/setup/plugin-library).  All of the plugins found in the official plugin library have been audited and approved by Cerb's developers. They are safe to use.

Plugins are _versioned_ so that new updates can be downloaded automatically. Each plugin version is certified to work with a specific range of Cerb versions, and incompatible plugins won't be shown.

<div class="cerb-box warning">
	<p>You can also install third-party plugins from anywhere (like GitHub), but you should be very careful when doing so.  Plugins have access to all of your data, and they can execute code on your server and make queries against your database.  A malicious plugin could compromise your system, spy on you, expose sensitive data, or destroy things.</p>
</div>

## Manifests

Plugins follow a special convention, starting with a `plugin.xml` **manifest** file that describes the _assets_ being contributed. These assets are typically: extensions, patches, translations, permissions, and events.

### Extensions

Cerb provides plugin developers with a list of **extension points** that describes the types of functionality that can be added. In a plugin's manifest, an **extension** associates a contributed asset with a specific extension point.

For instance, the `devblocks.context` extension point accepts new record types. The `devblocks.event.action` point accepts new bot actions.

### Patches

Plugins that need to maintain a _schema_ in the database can do so with **patches**. A patch is a collection of changes used to migrate data between versions during an upgrade.

When you skip several versions of a plugin to upgrade to the latest version, Cerb will automatically handle the migration of your data through the intervening versions.  This is the same thing that happens when you upgrade Cerb itself.

### Translations

Most of the text you see in Cerb is provided by the **translation** system using _American English_ defaults. All of this text is able to be translated into any other language using our built-in _translation editor_ plugin.

Plugins can add new text to the translation system with a `strings.xml` file, which can then be translated into any language by anyone, as well as shared in our official translation packs.

### Permissions

Plugins can also take advantage of the role-based permissions system in Cerb by describing new privileges for the contributed functionality.

### Events

We previously mentioned **events** when discussing [bots](/docs/bots) and the [activity log](/docs/records#activity-log). Plugins can add new events to Cerb based on the contributed functionality. The activity log will record the new events on records, bots behaviors can listen for them, etc.
