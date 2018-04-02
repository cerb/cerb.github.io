---
title: Friendly URLs
permalink: /docs/friendly-urls/
excerpt: Cerb supports rewriting to make the URLs shorter and more user-friendly.
jumbotron:
  title: Friendly URLs
  tagline: Enable professional looking URLs
---

# Enabling friendly URLs

You may notice that your URLs look a bit ugly with `/index.php/` in every path by default. 

This URL doesn't look very professional:
<div class="cerb-screenshot">
<img src="/assets/images/docs/friendly-urls/friendly_urls.png" class="screenshot">
</div>

This looks much nicer:
<div class="cerb-screenshot">
<img src="/assets/images/docs/friendly-urls/friendly_urls_done.png" class="screenshot">
</div>

Ironically, the default URLs are ugly because Cerb's underlying design is secure and elegant.  Every URL in Cerb is _virtual_ -- there isn't a corresponding file on the webserver for each link.  Every page request routes through the `index.php` script, and all asynchronous requests are routed through `ajax.php`.  Those two scripts are the only entry points into all of Cerb's functionality.

Cerb supports URL rewriting to make the URLs shorter and more user-friendly.  This isn't enabled by default because it requires your webserver to support it.

* TOC
{:toc}

## Enabling friendly URLs with Nginx

This is all you should need to do to enable friendly URLs in Nginx:

<pre class="command-line" data-user="user" data-host="host">
<code class="language-bash">
cd /path/to/cerb
touch .htaccess
</code>
</pre>

You can alternatively edit the `framework.config.php` file and manually set `DEVBLOCKS_REWRITE` to `true`.

## Enabling friendly URLs with Apache

If you’re using the Apache web server you can enable URL rewriting with the following commands:

<pre class="command-line" data-user="user" data-host="host">
<code class="language-bash">
cd /path/to/cerb
cp .htaccess-dist .htaccess
</code>
</pre>

For this to work you will need to enable `mod_rewrite` in your Apache configuration.  It is usually already enabled.

If `mod_rewrite` isn’t enabled, you can use the following commands on many Linux-based servers:

<pre class="command-line" data-user="user" data-host="host">
<code class="language-bash">
sudo a2enmod rewrite
service apache2 reload
</code>
</pre>

If these commands don't work, you'll need to enable the module manually.

## Enabling friendly URLs with IIS

Open **Internet Information Services (IIS) Manager**.

Click on the **Cerb** web site.

Double click on the **URL Rewrite** icon.

Click **Add Rule(s)...** in the right sidebar.

Double click **Blank Rule**:

  * Name: Friendly URLs
  * Requested URL: Matches the pattern
  * Using: Regular Expressions
  * Pattern: ^(.*)
  * Conditions: {REQUEST_FILENAME} 'is not a file'
  * Rewrite URL: /index.php/{R:1}

Click **Apply** in the right sidebar.

In the directory where you installed Cerb (e.g. `C:\inetpub\wwwroot\cerb\`), create an empty `.htaccess` file.