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

A **plugin** is a special bundle of files used to seamlessly add new functionality to Cerb. Plugins can integrate Cerb with third-party services, add new [record](/docs/records/) types, augment bots with new conditions and actions, expand workspaces and dashboards, and much more.

For instance, the [Twilio](/docs/plugins/wgm.twilio/) plugin gives bots the ability to send text messages and initiate voice calls.

In some other software projects, plugins are an afterthought and quite limited in what they can do. You may be surprised to learn that _everything_ in Cerb is contributed by plugins; even the most basic built-in functionality. This was an intentional decision from the very beginning.  It means that as we continue to officially improve Cerb, we're also automatically expanding the ability for other people to improve it as well. We're sharing _all_ of our tools with developers. When they add new functionality with a plugin, it's indistinguishable to Cerb from something that we added ourselves.

Another benefit of plugins is that they allow functionality to be _completely removed_ when it is not being used by a particular organization. This keeps Cerb fast and lean.