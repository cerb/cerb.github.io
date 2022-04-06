---
title: Host community portals using Nginx
excerpt: This step-by-step guide explains how to host Cerb community portals using nginx.
layout: integration
topic: Portals
jumbotron:
  title: Host community portals using Nginx
  tagline: ""
  breadcrumbs:
  -
    label: Resources &raquo;
    url: /resources/
  -
    label: Guides &raquo;
    url: /resources/guides/
  -
    label: Portals &raquo;
    url: /resources/guides/#portals
---

# Introduction
{:.no_toc}

We provide a simple, PHP-based reverse proxy script for hosting [community portals](/docs/portals/) from any web server.  You'll find this `index.php` file on the **Installation** tab of your community portal configuration.  This is useful for testing; allowing you to serve a community portal from a directory on an existing website, or from the built-in PHP webserver.

However, we highly recommend that you use a production-ready proxy like nginx[^nginx] to serve community portals.  With this approach you can completely ignore the `index.php` script.

<div class="cerb-box note">
<p>If you're a <a href="/pricing/">Cerb Cloud</a> subscriber, we include high-availability community portal hosting. This is already handled for you.</p>
</div>

# Add a virtual host to Nginx

Create a new virtual host in nginx for your community portal. Use the following configuration file:

<pre>
<code class="language-nginx">
# HTTPS
server {
  set $cerb_host cerb.example;
  set $portal_host portal.example;
  set $portal_code abcd1234;

  listen 443 ssl;
  server_name $portal_host;
  #access_log off;

  # Increase upload max size from default of 1MB
  client_max_body_size 32m;

  charset utf-8;

  # DNS
  #resolver 8.8.8.8 8.8.4.4 valid=300s;
  #resolver_timeout 5s;

  # SSL
  # [TODO] Replace this with your own SSL certificate!
  ssl_certificate /etc/ssl/certs/nginx-selfsigned.pem;
  ssl_certificate_key /etc/ssl/private/nginx-selfsigned.key;
  ssl_protocols TLSv1.2;
  ssl_prefer_server_ciphers on;
  ssl_ciphers HIGH:!CAMELLIA:!RC4:!PSK:!aNULL:@STRENGTH;
  ssl_dhparam /etc/ssl/certs/dhparam.pem;

  # Resource proxy
  location ~* ^/resource/ {
    rewrite ^/resource/(.*) /resource/$1 break;
    proxy_pass https://$cerb_host;
  }

  # Everything else
  location / {
    rewrite ^/(.*) /portal/$portal_code/$1 break;
    proxy_pass https://$cerb_host;
    proxy_set_header DevblocksProxySSL 1;
    proxy_set_header DevblocksProxyHost $portal_host;
    proxy_set_header DevblocksProxyBase "";
  }

  # Deny any other PHP scripts
  location ~ \.php$ {
    deny all;
  }
}

# Redirect HTTP to HTTPS
server {
  set $portal_host portal.example;

  listen 80;
  server_name $portal_host;
  #access_log off;

  location / {
    return 301 https://$host$request_uri;
  }
}
</code>
</pre>

Modify the variables at the top of the **server** block:

* `$cerb_host` is the domain where you're hosting your Cerb installation.  We assume you're using `https://`.
* `$portal_host` is the domain where you're hosting the public Support Center.
* `$portal_code` is your portal's unique ID, which you can find in **Setup >> Portals**.

<div class="cerb-box note">
<p>You'll need to provide your own SSL certificate and private key in <tt>ssl_certificate</tt> and <tt>ssl_certificate_key</tt>.</p>
</div>

<div class="cerb-box note">
<h3>Note:</h3>
This guide assumes you have <a href="/docs/friendly-urls/">friendly URLs</a> enabled for Cerb.  If not, you'll need to modify the <tt>rewrite</tt> directives, like: 
<ul>
	<li><tt>/index.php/resource/$1</tt></li>
	<li><tt>/index.php/portal/$portal_code/$1</tt></li>
</ul>
</div>

# Reload nginx

Reload nginx to start serving your community portal.

On Ubuntu:

<pre>
<code class="language-bash">
service nginx reload
</code>
</pre>

# Test the community portal

Open your community portal URL a web browser.

# Related resources

* [Create a new Support Center community portal](/guides/portals/support-center/)

# References

[^nginx]: Nginx - <http://nginx.org>
