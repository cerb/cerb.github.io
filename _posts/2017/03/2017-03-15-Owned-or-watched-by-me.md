---
layout: post
title: "Tip: Build a worklist of tickets owned or watched by me"
excerpt: Learn how to use quick search to display your assignments and watched tickets on a single worklist.
author: The Cerb Team
date: 2017-03-15 18:30:00 -0700
permalink: /tips/owned-or-watched-by-me/
tags: cerb tips mailbag
---

In [earlier versions](/docs/history/) of Cerb you had to create two [worklists](/docs/workspaces/#worklists) to display your watched [tickets](/docs/tickets/) and your assignments.

Now you can display both on a single worklist with a simple quick search:

<pre>
<code class="language-json">
(owner.id:me OR watchers:me) status:o
</code>
</pre>

<div class="cerb-screenshot">
<img src="/assets/images/tips/owned-or-watched-by-me/owned-or-watched.png" class="screenshot">
</div>
