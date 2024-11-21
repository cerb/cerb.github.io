---
title: 'Setup: Plugin Library'
excerpt: This page provides information on the Plugin Library for Cerb, where administrators
  can discover and install audited and approved plugins safely.
summary: This page provides information on the Plugin Library for Cerb, where administrators
  can discover and install audited and approved plugins safely. It explains that plugins
  are versioned to ensure compatibility with specific Cerb versions, and incompatible
  plugins are not displayed. Additionally, it warns about the risks of installing
  third-party plugins from external sources, as they have full access to data and
  can execute code on the server, potentially compromising the system.
permalink: /docs/setup/plugins/library/
toc:
  title: Plugin Library
  expand: Admin Guide
jumbotron:
  title: Plugin Library
  breadcrumbs:
  - label: Docs &raquo;
    url: /docs/home/
  - label: Setup &raquo;
    url: /docs/setup/
  - label: Plugins &raquo;
    url: /docs/setup/#plugins
---

[Administrators](/docs/workers/) can discover and install plugins from the **plugin library**.  All of the plugins found in the official plugin library have been audited and approved by Cerb's developers. They are safe to use.

Plugins are _versioned_ so that new updates can be downloaded automatically. Each plugin version is certified to work with a specific range of Cerb versions, and incompatible plugins won't be shown.

<div class="cerb-screenshot">
<img src="/assets/images/docs/using-cerb/plugins/plugin_library.png" class="screenshot">
</div>

<div class="cerb-box warning">
	<p>You can also install third-party plugins from anywhere (like GitHub), but you should be very careful when doing so.  Plugins have access to all of your data, and they can execute code on your server and make queries against your database.  A malicious plugin could compromise your system, spy on you, expose sensitive data, or destroy things.</p>
</div>

