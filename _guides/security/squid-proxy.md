---
title: Proxy outgoing HTTP requests through Squid
excerpt: Learn how to set up a Squid proxy for outgoing HTTP connections.
summary: This guide walks you through setting up a Squid proxy server for routing 
  outgoing HTTP connections. It covers creating a Docker-based Squid instance with basic 
  authentication and configuring to use this proxy. The guide includes steps for creating 
  configuration files, running the proxy container, testing the setup, and verifying the 
  integration works correctly.
permalink: /guides/security/squid/
social_image_url: /assets/images/guides/security/squid/social.png
layout: integration
topic: Security
jumbotron:
    title: Proxy Outgoing HTTP Requests Through Squid
    tagline: ""
    breadcrumbs:
    - label: Resources &raquo;
      url: /resources/
    - label: Guides &raquo;
      url: /resources/guides/
    - label: Security &raquo;
      url: /resources/guides/#security
---

* TOC
{:toc}

# Introduction

Squid[^squid] is a caching proxy for the Web supporting HTTP, HTTPS, FTP, and more. It reduces bandwidth and improves response times by caching and reusing frequently-requested web pages. When integrated with Cerb, a Squid proxy provides several benefits:

* Bandwidth reduction by caching frequently-requested content.
* Improved response times for external API calls and web requests.
* Enhanced security through centralized traffic control.
* Detailed logging of outbound traffic.
* Content filtering and access control for external services.
* Server acceleration for better performance.

This guide will help you set up a Squid proxy in Docker and configure Cerb to route all outgoing HTTP requests through it.

# Requirements

* Docker installed and running
* A working Cerb installation in Docker
* htpasswd utility (part of apache2-utils on Ubuntu/Debian, httpd-tools on CentOS/RHEL, or Apache HTTP Server on Windows/macOS)

# Setting Up Squid Proxy

## Create Required Directories

First, create a directory structure to hold your Squid configuration:

{% highlight bash %}
mkdir ~/squid-setup
cd ~/squid-setup
mkdir squid-config
{% endhighlight %}

## Create Squid Configuration Files

{% highlight bash %}
echo "http_port 3128
auth_param basic program /usr/lib/squid/basic_ncsa_auth /etc/squid/passwords
auth_param basic realm proxy
acl authenticated proxy_auth REQUIRED
http_access allow authenticated
http_access deny all" > squid-config/squid.conf
{% endhighlight %}

## Create password file

When prompted, enter a secure password.

{% highlight bash %}
htpasswd -c squid-config/passwords cerb_proxy
{% endhighlight %}

## Run Squid Docker Container

Start the Squid proxy container with your configuration files. This command maps port 8888 on your host to port 3128 in the container and mounts your configuration files.

{% highlight bash %}
docker run -d \       
  --name squid-proxy \
  -e TZ=UTC \
  -p 8888:3128 \
  -v $(pwd)/squid-config/squid.conf:/etc/squid/squid.conf \
  -v $(pwd)/squid-config/passwords:/etc/squid/passwords \
  ubuntu/squid:5.2-22.04_beta
{% endhighlight %}

## Test proxy with curl

Verify that your proxy is working correctly by making a test request through it. This command uses curl to fetch the first 100 characters from a Cerb documentation page.

{% highlight bash %}
curl -s -x "http://cerb_proxy:FJ\!3G\!ht3Y@localhost:8888" -H "Accept: application/json" "https://cerb.ai/docs/history/" | head -c 100
{% endhighlight %}

<div class="cerb-screenshot">
<img src="/assets/images/guides/security/squid/squid-test-proxy.png" class="screenshot">
</div>

# Configuring Cerb

## Update Configuration File

For a Docker-based Cerb installation, you need to modify the configuration file to use the Squid proxy.

The file to modify is `cerb.config.php` in the `install/docker/_conf` directory.

Add this line: `define('DEVBLOCKS_HTTP_PROXY', 'http://cerb_proxy:YOUR_PASSWORD@host.docker.internal:8888');` 

**Before** `require_once(DEVBLOCKS_PATH . 'framework.defaults.php');`

Note: `host.docker.internal` is a special DNS name that resolves to the host machine from inside Docker containers.

## Restart Cerb

After modifying the configuration, restart Cerb to apply the changes.

{% highlight bash %}
cd /path/to/cerb/install/docker
docker compose down
docker compose up -d
{% endhighlight %}

You can check to see if the config file has updated.

{% highlight bash %}
docker exec cerb-demo-php-fpm-1 cat /var/www/html/framework.config.php | grep DEVBLOCKS_HTTP_PROXY
{% endhighlight %}

<div class="cerb-screenshot">
<img src="/assets/images/guides/security/squid/squid-config-check.png" class="screenshot">
</div>

# Verifying Integration

Let's send an HTTP Get request from Cerb and verify we are routing through our Squid proxy.

We will use an example from [automations](/solutions/automations/http-response-xpath/) to make the request.

We can now monitor the Squid access logs to confirm requests from Cerb are being proxied.

{% highlight bash %}
docker exec squid-proxy tail -n 50 /var/log/squid/access.log
{% endhighlight %}

<div class="cerb-screenshot">
<img src="/assets/images/guides/security/squid/squid-access-logs.png" class="screenshot">
</div>

# References

[^squid]: Squid - <https://hub.docker.com/r/ubuntu/squid>
