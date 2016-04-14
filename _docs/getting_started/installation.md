---
title: Installation
permalink: /docs/installation/
jumbotron:
  title: Installation
  tagline: Deploying Cerb on your own server
---

<div class="cerb-box note">
	<p>If you're using <b>Cerb Cloud</b> you can <a href="/docs/ui">skip this section</a>. We've already handled the installation for you.</p>
</div>

# Requirements

<div id="requirements"></div>

## Browser requirements

- An Internet or intranet connection to the server (e.g. Ethernet, Wi-Fi, mobile data)
- The latest version of any of these modern HTML5 web browsers, with Javascript enabled:
	- Google Chrome
	- Mozilla Firefox
	- Apple Safari
	- Opera
	- Internet Explorer (10.0+)

## Server requirements

- Any of these operating systems:
	- Linux _(recommended, using Ubuntu LTS)_
	- BSD
	- Mac OS X
	- Windows

- Any of these webserver applications:
	- Nginx _(recommended, using PHP-FPM)_
	- Apache
	- lighttpd
	- Microsoft Internet Information Server (IIS)

- PHP 5.3 or later
	- With the following extensions enabled:
		- curl
		- dom
		- gd
		- imap
		- json
		- mailparse
		- mbstring
		- mysql
		- pcre
		- session
		- simplexml
		- spl
		- xml
		- memcached _(optional)_
		- oauth _(optional)_
	- With these _php.ini_ settings:
		- file_uploads = On
		- memory_limit = 64M _(or higher)_
		- upload_max_filesize = 32M _(or higher)_
		- post_max_size = 32M _(or higher)_

- MySQL 5.1 or later

<div class="cerb-box note">
	<p>If you are unable to meet these requirements, consider <a href="/demo">Cerb Cloud</a>.</p>
</div>

# Log in to your server

The following general instructions assume that you have console access to a Linux-based server that meets the requirements above.  You should already have a webserver, database, and PHP installed before proceeding.

# Download the source code from GitHub

Navigate to your website's document directory on the filesystem. The directory will usually be named something like `htdocs`, `httpdocs`, `public_html`, or `www`.

{% highlight bash %}
$ cd /path/to/support.example.com/httpdocs
{% endhighlight %}

When deploying Cerb on a production server you should use **Git** to manage the project files. This provides many useful capabilities:

* You can quickly upgrade by just fetching files that have changed since your last update.
* You can see the local changes that you have made to any project files.
* You can easily reset files back to their default condition.
* You can see what changes *would* occur before performing an upgrade.
* You can continuously merge your local changes with our future updates.

You won't need to download the entire project again after your initial installation. You also won't have to hassle with copying your `framework.config.php` configuration file or storage directory when upgrading, or repeating any of your custom modifications to the source code.

You can download Cerb using Git with a single command:

{% highlight bash %}
$ git clone git://github.com/wgm/cerb.git cerb
{% endhighlight %}

# Set permissions

Next, we need to make sure that Cerb's files are owned by the webserver's user and group.  The default user and group are both `www-data` when using Apache or Nginx on Ubuntu.  If you're using something different, you should consult your configuration for the proper values.

You only need to enable write access to the webserver in two locations:

- `framework.config.php`
	This is your configuration file.
- `storage/`
	This is where any data unique to your installation is stored: third-party plugins, attachments, temporary files, caches, etc.

Give ownership of all the files to the webserver daemon using `chown`, and make the two locations above writable using `chmod`::

{% highlight bash %}
$ cd cerb
$ chown -R www-data:www-data .
$ chmod -R u+w framework.config.php storage
{% endhighlight %}

You must use your own user and group for `www-data` in the example above.

<div class="cerb-box note">
	<p>
		There are special situations, such as PHP in FastCGI mode, custom PHP-FPM pools, or with security extensions like Suhosin, where the ownership and permissions of the files may need to be something else.  Consult a system administrator if you need assistance.  The Cerb installer will let you know if the permissions are incorrect.
	</p>
</div>

# Create the database

Create a new MySQL database using the console or your favorite GUI.

From the MySQL console, you can issue the following SQL statements:

{% highlight sql %}
CREATE DATABASE cerb CHARACTER SET utf8;

GRANT ALL PRIVILEGES ON cerb.*  
 TO cerb@localhost 
 IDENTIFIED BY 'secret_password';
{% endhighlight %}

Substitute your own database name and login in place of `cerb`, and replace `secret_password` with something that's actually a secret. If you're connecting to a remote database, change `@localhost` to the network address of the webserver.

If you're concerned about granting `ALL PRIVILEGES`, the minimum required privileges for the database user are: `SELECT, INSERT, UPDATE, DELETE, CREATE, ALTER, DROP, INDEX, CREATE TEMPORARY TABLES`.

# Run the guided installer

Cerb has a guided installer that verifies your requirements, initializes the database, and walks you through the initial configuration of the software.

To start the installer, open your browser to the location where you downloaded Cerb.  For instance, `https://example.com/cerb` or `https://support.example.com/`.

<div class="cerb-box warning">
	<p>
		After the installer finishes running, be sure to remove the <b>/install</b> directory.
	</p>
</div>
