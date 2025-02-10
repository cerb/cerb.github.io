---
title: Redis
excerpt: How to set up Redis caching to improve performance and scalability.
summary: This guide provides comprehensive instructions for configuring Redis 
  as a caching solution using Docker containers. It covers both basic and 
  secure configurations, including creating Redis containers, managing network 
  connectivity, setting passwords, and configuring Cerb to use Redis. The guide 
  also includes troubleshooting tips, best practices for security, and common 
  Docker commands for managing Redis containers, all aimed at improving application 
  performance through effective caching.
topic: Scaling
jumbotron:
  title: Redis
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

Redis[^redis] is an in-memory data structure store that serves as a powerful [caching](/docs/setup/configure/cache/) solution for Cerb. While Cerb's default filesystem caching works well for single-server setups, Redis enables you to scale your deployment across multiple servers while significantly reducing database query traffic. By caching frequently accessed but infrequently changed content (like worker data, groups, and bucket information), Redis helps optimize your application's performance. This guide will walk you through configuring Redis for caching in Cerb using Docker containers.

# Requirements

* Docker installed and running
* A working Cerb installation in Docker
* php8.3-redis package installed (for Ubuntu 24.04)

# Local Development Setup

Start Redis on a local port with the configuration:

{% highlight bash %}
docker run --name redis-cerb -p 6379:6379 -d redis
{% endhighlight %}

Finally, configure Cerb to use Redis by navigating to **Setup >> Configure >> Cache** and entering these settings:

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

To verify that Redis is working properly:

Start by connecting to the Redis CLI:

{% highlight bash %}
docker exec -it redis-cerb redis-cli
ping
{% endhighlight %}

You should receive `PONG` as a response.

<div class="cerb-screenshot">
<img src="/assets/images/docs/scaling/cache/redis-cli.png" class="screenshot">
</div>

# References

[^redis]: Redis: dockerhub - <https://hub.docker.com/_/redis>