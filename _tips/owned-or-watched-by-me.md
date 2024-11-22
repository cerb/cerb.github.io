---
title: 'Build a worklist of tickets owned or watched by me'
excerpt: Learn how to use quick search to display your assignments and watched tickets
  on a single worklist.
summary: This page provides a tip for creating a unified worklist in Cerb that displays
  both tickets owned by the user and tickets they are watching. Previously, users
  needed to create two separate worklists for these categories, but now they can combine
  them into one using a quick search query. The example query provided is "(owner.id:me
  OR watchers:me) status:o", which efficiently consolidates the user's assignments
  and watched tickets into a single view.
layout: integration
author: The Cerb Team
date: "2017-03-15 18:30:00 -0700"
permalink: /tips/owned-or-watched-by-me/
jumbotron:
  title: 'Build a worklist of tickets owned or watched by me'
  breadcrumbs:
    -
      label: Resources &raquo;
      url: /resources/
    -
      label: Tips &raquo;
      url: /resources/tips/
---

In [earlier versions](/docs/history/) of Cerb you had to create two [worklists](/docs/worklists/) to display your watched [tickets](/docs/tickets/) and your assignments.

Now you can display both on a single worklist with a simple quick search:

<pre>
<code class="language-json">
(owner.id:me OR watchers:me) status:o
</code>
</pre>

<div class="cerb-screenshot">
<img src="/assets/images/tips/owned-or-watched-by-me/owned-or-watched.png" class="screenshot">
</div>
