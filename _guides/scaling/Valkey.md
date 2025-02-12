---
title: Valkey
excerpt: How to set up Valkey caching to improve performance and scalability.
summary: This guide provides instructions for configuring Valkey
  as a caching solution using Docker containers. Learn how to set up
  a basic Valkey container and configure Cerb to use it through the Redis cache
  configuration interface for improved application performance.
topic: Scaling
jumbotron:
  title: Valkey
  breadcrumbs:
    -
      label: Resources &raquo;
      url: /resources/
    -
      label: Guides &raquo;
      url: /resources/guides/
    -
      label: Scaling &raquo;
      url: /resources/guides/#scaling
---

* TOC
{:toc}

# Introduction

Valkey[^valkey] is a high-performance data structure server that serves as a powerful [caching](/docs/setup/configure/cache/) solution for Cerb. While Cerb's default filesystem caching works well for single-server setups, Valkey enables you to scale your deployment across multiple servers while significantly reducing database query traffic. By caching frequently accessed but infrequently changed content (like worker data, groups, and bucket information), Valkey helps optimize your application's performance. This guide will walk you through configuring Valkey for caching in Cerb using Docker containers.

# Requirements

* Docker installed and running
* A working Cerb installation in Docker

# Local Development Setup

Start Valkey on a local port with the configuration:

{% highlight bash %}
docker run --name valkey-cerb -p 6379:6379 -d valkey/valkey
{% endhighlight %}

Finally, configure Cerb to use Valkey by navigating to **Setup >> Configure >> Cache** selecting Redis as your cache type, and entering these settings:

* Host: `host.docker.internal`
* Port: `6379`

<div class="cerb-screenshot">
<img src="/assets/images/docs/scaling/cache/redis-config.png" class="screenshot">
</div>

Once connected, Cerb will show: Objects are cached in **Redis** at **host.docker.internal:6379**

<div class="cerb-screenshot">
<img src="/assets/images/docs/scaling/cache/redis-running.png" class="screenshot">
</div>

# Verifying the Connection

To verify that Valkey is working properly:

Start by connecting to the Valkey CLI:

{% highlight bash %}
docker exec -it valkey-cerb valkey-cli
ping
{% endhighlight %}

You should receive `PONG` as a response.

<div class="cerb-screenshot">
<img src="/assets/images/docs/scaling/cache/valkey-cli.png" class="screenshot">
</div>

# References

[^valkey]: Valkey: dockerhub - <https://hub.docker.com/r/valkey/valkey>