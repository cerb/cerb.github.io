---
title: Cache
permalink: /docs/setup/configure/cache/
excerpt: To optimize performance, Cerb caches frequently accessed content.
jumbotron:
  title: Cache
  breadcrumbs:
  - 
    label: Docs &raquo;
    url: /docs/home/
  - 
    label: Setup &raquo;
    url: /docs/setup/
  - 
    label: Configure &raquo;
    url: /docs/setup/configure/
---

<div class="cerb-screenshot">
<img src="/assets/images/docs/setup/cache.png" class="screenshot">
</div>

To optimize performance, Cerb caches _frequently accessed_ but _infrequently changed_ content.  This significantly reduces database query traffic.

For instance, worker data is used on almost every page in Cerb, but you may go weeks without adding or modifying worker records.  We cache worker records and _invalidate_ the cache when one of the records changes.  If you retrieve a list of tickets with an _owner_ column, we can fill-in the worker information from the cache without requiring a potentially expensive `JOIN` in the database.

We use this approach in many other places as well: groups, buckets, sender addresses, bots, behaviors, etc.

By default, Cerb saves cache files to the filesystem in the `./storage/tmp/` directory. The underlying operating system usually caches the contents of these files in memory anyway.

If you experience filesystem I/O bottlenecks, or you want to [scale](/docs/scaling) beyond a single web server, you may choose to set up a distributed cache using Redis[^redis] or Memcached[^memcached].  We support both.


# References

[^memcached]: <https://memcached.org/>
[^redis]: <https://memcached.org/>