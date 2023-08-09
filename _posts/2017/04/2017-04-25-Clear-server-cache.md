---
layout: post
title: "Tip: Clear the server-side cache"
excerpt: Cerb uses a server-side cache to speed up operations like database queries. If you modify the database directly then you need to flush the cache.
author: The Cerb Team
date: 2017-04-25 13:20:00 -0700
permalink: /tips/clear-server-cache/
tags: cerb tips mailbag
---

You're probably familiar with the file cache in your web browser. It saves a temporary copy of website resources on your device to speed up subsequent network requests.  This is useful for files that change infrequently, like images, stylesheets, fonts, and scripts.

Cerb uses a similar cache on the web server to speed up expensive operations like database queries.

You usually don't have to think about the cache.  When you modify records or [upgrade](/docs/upgrading/), Cerb automatically clears the appropriate caches for you.

However, if you modify the database directly then you'll need to clear the cache yourself.

### Flushing the cache

1. Click on the [logo](/docs/guide/workers/user-interface/#logo) in the top left while logged into Cerb.

1. Append `update` to the URL in your browser and press `<ENTER>`.

1. This runs the updater and flushes the cache.  After a few seconds you should be returned to your default page.

<div class="cerb-box note"><p>
If you receive an error about your IP not being authorized, you can add it to the allowlist in <b>Setup &raquo; Configure &raquo; Security</b>.
</p></div>
