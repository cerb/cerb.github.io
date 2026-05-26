---
title: Installation
excerpt: This page provides a comprehensive guide for installing Cerb, detailing the
  necessary browser and server requirements, including supported operating systems,
  webserver applications, PHP version, and database servers.
summary: This page provides a comprehensive guide for installing Cerb, detailing the
  necessary browser and server requirements, including supported operating systems,
  webserver applications, PHP version, and database servers. It outlines the steps
  to log in to the server, download the source code from GitHub, set file permissions,
  and create a database. The guide walks through the Cerb installation process with
  a step-by-step guided installer, covering requirements check, license agreement,
  database setup, configuration file saving, database initialization, general settings,
  outgoing mail configuration, admin account creation, testing mode, and security
  recommendations. The page concludes with instructions for finalizing the installation
  and references for further information.
permalink: /docs/installation/self-hosted/
toc:
  expand: Admin Guide
jumbotron:
  title: Self-Hosted
  breadcrumbs:
  - label: Docs &raquo;
    url: /docs/home/
  - label: Admin Guide &raquo;
  - label: Installation &raquo;
    url: /docs/installation/
---

<div class="cerb-box note">
	<p>
		We do not recommend installing Cerb components on your server directly. 
		Use the <a href="/docs/installation/docker/">Docker instructions</a> as a reference.
	</p>
</div>

* TOC
{:toc}

# Requirements

<div id="requirements"></div>

## Browser requirements

- An Internet or intranet connection to the server (e.g. Ethernet, Wi-Fi, mobile data)
- The latest version of any of these modern HTML5 web browsers, with Javascript enabled:
	- Mozilla Firefox
	- Apple Safari
	- Brave
	- Opera
	- Google Chrome
	- Microsoft Edge
	- (Internet Explorer is no longer supported)

## Server requirements

- Any of these 64-bit operating systems:
	- Linux _(recommended, using Ubuntu 24.04 LTS)_
	- BSD
	- macOS
	- Windows

- Any of these webserver applications:
	- Caddy _(recommended, using PHP-FPM)_
	- Nginx _(recommended, using PHP-FPM)_
	- Apache
	- Microsoft Internet Information Server (IIS)
	- Built-in PHP webserver (for development and evaluation)

- PHP 8.5 (64-bit) or later
	- With the following extensions enabled:
		- curl
		- dom
		- gd
		- json
		- mailparse
		- mbstring
		- mysqli
		- openssl
		- pcre
		- session
		- simplexml
		- spl
		- yaml
		- xml
		- tidy _(recommended)_
		- gmp _(recommended)_
		- memcached _(optional)_
		- redis _(optional)_
	- With these _php.ini_ settings:
		- file_uploads = On
		- memory_limit = 128M _(or higher)_
		- upload_max_filesize = 32M _(or higher)_
		- post_max_size = 32M _(or higher)_

- Any of these database servers:
	- MySQL 8.0 or later
	- MariaDB 10.5 or later
	- Amazon Aurora 3.x or later

<div class="cerb-box note">
	<p>If you are unable to meet these requirements, consider <a href="/pricing/">Cerb Cloud</a>.</p>
</div>

# Log in to your server

The following general instructions assume that you have console access to a Linux-based server that meets the above requirements.  You should already have a webserver, database, and PHP installed before proceeding.

You can follow one of these guides to set up a new server:

* [Installing Cerb on Ubuntu 24.04 LTS with Nginx and PHP-FPM](/guides/installation/ubuntu/)
{% comment %}
* [Installing Cerb on Debian 9 with Nginx and PHP-FPM](/guides/installation/debian/)
{% endcomment %}

# Download the source code from GitHub

Navigate to your website's document directory on the filesystem. The directory will usually be named something like `htdocs`, `httpdocs`, `public_html`, or `www`.

{% highlight bash %}
cd /path/to/example.com/httpdocs
{% endhighlight %}

When deploying Cerb on a production server you should use **Git** to manage the project files. This provides many useful capabilities:

* Quickly upgrade by just fetching files that have changed since your last update.
* See the local changes that you have made to any project files.
* Easily reset files back to their default condition.
* See what changes *would* occur before performing an upgrade.
* Continuously merge your local changes with our future updates.

You won't need to download the entire project again after your initial installation. You also won't have to hassle with copying your `framework.config.php` [configuration file](/docs/config-file/) or storage directory when upgrading, or repeating any of your custom modifications to the source code.

You can download Cerb into a specific directory with a single command:

{% highlight bash %}
git clone git://github.com/cerb/cerb-release.git cerb
{% endhighlight %}

You would access Cerb at a URL with a base path like `https://example.com/cerb`.  You can change the last argument above to whatever path you want: `support`, `helpdesk`, etc.

To download Cerb into the root of your domain instead, use:

{% highlight bash %}
git clone git://github.com/cerb/cerb-release.git .
{% endhighlight %}

This results in a URL without a base path, like `https://support.example.com/`

# Set permissions

Next, we need to make sure that Cerb's files are owned by the webserver's user and group.  The default user and group are both `www-data` when using Apache or Nginx on Ubuntu.  If you're using something different, you should consult your configuration for the proper values.

You only need to enable write access to the webserver in two locations:

- `framework.config.php`
	This is your [configuration file](/docs/config-file/).
- `storage/`
	This is where any data unique to your installation is stored: third-party plugins, attachments, temporary files, caches, etc.

Give ownership of all the files to the webserver daemon using `chown`, and make the two locations above writable using `chmod`:

{% highlight bash %}
cd cerb
chown -R www-data:www-data .
chmod -R u+w framework.config.php storage
{% endhighlight %}

You must use your own user and group for `www-data` in the example above.

<div class="cerb-box note">
	<p>
		There are special situations, such as PHP in FastCGI mode, custom PHP-FPM pools, or with security extensions like Suhosin, where the ownership and permissions of the files may need to be something else.  Consult a system administrator if you need assistance.  The Cerb installer will let you know if the permissions are incorrect.
	</p>
</div>

# Create the database

Create a new MySQL database using the console or your favorite GUI tool.

From the MySQL console, you can issue the following SQL statements:

{% highlight sql %}
CREATE DATABASE cerb CHARACTER SET utf8mb4;

CREATE USER cerb@localhost IDENTIFIED BY 'secret_password';

GRANT ALL PRIVILEGES ON cerb.* TO cerb@localhost;
{% endhighlight %}

Substitute your own database name and login in place of `cerb`, and replace `secret_password` with something that's actually a secret. If you're connecting to a remote database, change `@localhost` to the network address of the webserver where you'll be connecting from.

If you're concerned about granting `ALL PRIVILEGES`, the minimum required privileges for the database user are: `SELECT, INSERT, UPDATE, DELETE, CREATE, ALTER, DROP, INDEX, CREATE TEMPORARY TABLES`.

# Run the guided installer

Cerb has a [guided installer](/docs/guided-installer/) that verifies your requirements, initializes the database, and walks you through the initial configuration of the software.

<div class="section-nav">
	<div class="left">
		<a href="/docs/installation/" class="prev">&lt; Installation</a>
	</div>
	<div class="right align-right">
		<a href="/docs/guided-installer/" class="prev">Guided Installer &gt;</a>
	</div>
</div>
<div class="clear"></div>
