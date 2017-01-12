---
title: Installation
permalink: /docs/installation/
jumbotron:
  title: Installation
  tagline: Deploy Cerb on your own server
---

<div class="cerb-box note">
	<p>If you're using <b>Cerb Cloud</b> you can <a href="/docs/quick-start">jump to Quick Start</a>. We've already handled the installation for you.</p>
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

- PHP 5.5 or later
	- With the following extensions enabled:
		- curl
		- dom
		- gd
		- imap
		- json
		- mailparse
		- mbstring
		- mysqli
		- openssl
		- pcre
		- session
		- simplexml
		- spl
		- xml
		- memcached _(optional)_
		- redis _(optional)_
	- With these _php.ini_ settings:
		- file_uploads = On
		- memory_limit = 128M _(or higher)_
		- upload_max_filesize = 32M _(or higher)_
		- post_max_size = 32M _(or higher)_

- MySQL 5.5 or later

<div class="cerb-box note">
	<p>If you are unable to meet these requirements, consider <a href="/cloud/try/">Cerb Cloud</a>.</p>
</div>

# Log in to your server

The following general instructions assume that you have console access to a Linux-based server that meets the above requirements.  You should already have a webserver, database, and PHP installed before proceeding.

# Download the source code from GitHub

Navigate to your website's document directory on the filesystem. The directory will usually be named something like `htdocs`, `httpdocs`, `public_html`, or `www`.

{% highlight bash %}
$ cd /path/to/example.com/httpdocs
{% endhighlight %}

When deploying Cerb on a production server you should use **Git** to manage the project files. This provides many useful capabilities:

* Quickly upgrade by just fetching files that have changed since your last update.
* See the local changes that you have made to any project files.
* Easily reset files back to their default condition.
* See what changes *would* occur before performing an upgrade.
* Continuously merge your local changes with our future updates.

You won't need to download the entire project again after your initial installation. You also won't have to hassle with copying your `framework.config.php` configuration file or storage directory when upgrading, or repeating any of your custom modifications to the source code.

You can download Cerb into a specific directory with a single command:

{% highlight bash %}
$ git clone git://github.com/wgm/cerb.git cerb
{% endhighlight %}

You would access Cerb at a URL with a base path like `https://example.com/cerb`.  You can change the last argument above to whatever path you want: `support`, `helpdesk`, etc.

To download Cerb into the root of your domain instead, use:

{% highlight bash %}
$ git clone git://github.com/wgm/cerb.git .
{% endhighlight %}

This results in a URL without a base path, like `https://support.example.com/`

# Set permissions

Next, we need to make sure that Cerb's files are owned by the webserver's user and group.  The default user and group are both `www-data` when using Apache or Nginx on Ubuntu.  If you're using something different, you should consult your configuration for the proper values.

You only need to enable write access to the webserver in two locations:

- `framework.config.php`
	This is your configuration file.
- `storage/`
	This is where any data unique to your installation is stored: third-party plugins, attachments, temporary files, caches, etc.

Give ownership of all the files to the webserver daemon using `chown`, and make the two locations above writable using `chmod`:

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

Create a new MySQL database using the console or your favorite GUI tool.

From the MySQL console, you can issue the following SQL statements:

{% highlight sql %}
CREATE DATABASE cerb CHARACTER SET utf8;

GRANT ALL PRIVILEGES ON cerb.*  
 TO cerb@localhost 
 IDENTIFIED BY 'secret_password';
{% endhighlight %}

Substitute your own database name and login in place of `cerb`, and replace `secret_password` with something that's actually a secret. If you're connecting to a remote database, change `@localhost` to the network address of the webserver where you'll be connecting from.

If you're concerned about granting `ALL PRIVILEGES`, the minimum required privileges for the database user are: `SELECT, INSERT, UPDATE, DELETE, CREATE, ALTER, DROP, INDEX, CREATE TEMPORARY TABLES`.

# Run the guided installer

Cerb has a guided installer that verifies your requirements, initializes the database, and walks you through the initial configuration of the software.

To start the installer, open your browser to the location where you downloaded Cerb.  For instance, `https://example.com/cerb` or `https://support.example.com/`.

## Step 1: Requirements Check

The first step of the installer checks if your server meets the requirements for installing Cerb. Correct any problems before proceeding, and then click the **Next Step** button.

<div class="cerb-screenshot">
<img src="/assets/images/docs/installation/installer_requirements.png" class="screenshot">
</div>

## Step 2: License

Review the software license agreement and then click the **I Accept** button.

## Step 3: Database Setup

### Driver

Leave this at the default of **MySQLi** (the MySQL Improved extension).

Cerb currently only supports MySQL[^mysql] databases. You can also use one of the MySQL-based forks[^mysql-forks], like Amazon Aurora, MariaDB, Percona, or WebScaleSQL.  We recommend MySQL or Amazon Aurora, as they receive the most testing.

### Engine

MySQL supports many _storage engines_[^mysql-storage-engines] that offer different functionality, strengths, and trade-offs.  Of those, Cerb is well-tested with the two most common:

- **InnoDB**: This is the default and recommended storage engine in recent versions of MySQL. It is transactional and designed to recover gracefully from unexpected interruptions. It implements row-based locking on writes, which reduces resource contention at scale in high-volume environments. It has slightly higher overhead than MyISAM due to transactions, durability, and indexing.  It may require more resources, and more experience to maintain and tune performance.

- **MyISAM**: This is the legacy storage engine in MySQL, and it is no longer under active development.  It's simpler to configure and maintain than InnoDB, and has slightly less overhead for some workloads (due to being non-transactional), but it risks data loss and corruption when the server is unexpectedly interrupted. It also implements table-based locking on writes, which generally doesn't scale well and may lead to resource contention in high volume environments.

In general, we recommend that you use InnoDB.  If you're in an environment that only supports MyISAM, or you just feel more comfortable with it, then go ahead and use it.  

This isn't a life-or-death decision.  You can easily switch between storage engines at any time (and even use different storage engines for each table).

### Host

This is the IP or hostname of your MySQL server.

If MySQL is installed on the same server as your web server, this value is usually _localhost_.

### Database Name

The name of the database on the MySQL server that you created earlier with the `CREATE DATABASE` statement.

### Username

The username that you created earlier with the `GRANT ALL PRIVILEGES ... TO <user>@host` statement.

### Password

The password that you created earlier with the `GRANT ALL PRIVILEGES ... IDENTIFIED BY '<password>'` statement.

### Test Settings

Once you've entered your database connection details, click the **Test Settings** button to verify them.

## Step 4: Save Configuration File

If the web server has write access to the `framework.config.php` file then it will automatically handle this for you and skip to the next step.

If it can't write the file, it will generate the file for you to manually copy and paste.

## Step 5: Database Initialization

If successful, the installer will create your initial database structure. This may take a while because the database is created by incrementally running the updates from each previous version.  Don’t worry if it doesn’t look like anything is happening right away.

## Step 6: General Settings

### Browser Title

This is the page title that shows up by default on browser tabs and in URL bookmarks.

### Default Sender

This establishes your first shared outgoing email address.  You'll probably want to use something like `support@example.com` (where `example.com` is your own domain name).

You can also configure a personalized name for the email address, such as your organization name.

<div class="cerb-box note">
	<p>For everything to work properly, this email address <b>absolutely must</b> route back into Cerb so that you receive new messages. This is usually accomplished by configuring a POP/IMAP mailbox for Cerb to download mail from.</p>
</div>

Once you're done, click the **Continue** button.

## Step 7: Outgoing Mail

This step configures your first outgoing mail transport. Once you become familiar with Cerb, you can configure several outgoing mail transports for fail-over, branding, etc.

### Mail Transport Type

When you intend to deliver real email to your contacts, you'll be using an **SMTP**[^smtp] transport.

If you use a mail delivery service like Google Apps[^smtp-google-apps] or Mailgun[^mailgun], these settings will have been provided to you.

If this is going to be a development or evaluation instance, you can select **None** to discard all outgoing mail without delivering it.  You won't need to enter any other details with this option.

### Host

This is the IP or hostname of your SMTP server.

For Google Apps, you would use `smtp.gmail.com`.

If you want to use a local mail server (like Postfix) that is installed on the same server as Cerb, you can usually enter `localhost` here.

### Port

This is the port where your SMTP server accepts new mail for relay.

The legacy port is `25`, although this is now intended for mail delivery and not relaying.

Generally, you'll use port `465` or `587`, depending on your configuration.

With Google Apps, `465` is used for SSL and `587` for TLS.

### Authentication User

This is your username when SMTP Authentication is required.

With Google Apps (and many other providers), it's your full Gmail or Google Apps email address.

### Authentication Password

This is the password established by your SMTP provider.

### Encryption

It is highly recommended that you enable encryption if you use a remote SMTP server.  Cerb supports both TLS[^tls] and SSL[^ssl] encryption, and your selection will depend on the configuration of your email provider.  Given recent SSL vulnerabilities, TLS is considered to be more secure.

As mentioned in the port configuration above, Google Apps requires you to pair the right encryption method to the corresponding port.  With Google Apps, we recommend port `587` for the port and `TLS` for encryption.

## Step 8: Admin Account

In this step you'll create the administrator account that you use to log in.

### Name

This is simply your first and last name (given and surname).

### Email Address

Your **personal** email address.  This is how you will authenticate during logins, and it's where your notifications and account recovery details will be sent.  For that reason, this **should not** be an email address managed by Cerb.

This will likely be something like `you@company.com` or `you@gmail.com`.

### Password

It is recommended that you choose a strong password here that you don't use anywhere else.  It should be fairly long, contain a mix of alphanumeric characters and symbols, in both upper and lower cases.

We highly recommend using a password manager like 1Password[^1password] to maintain strong password security practices.  You can also enable two-factor authentication for even stronger security.

### Timezone

Cerb will use your timezone setting to display and interpret dates using your local timezone.  The installer attempts to automatically detect this for you, but you can adjust it as necessary.

## Step 9: Register

In the final step of the installer you are given the opportunity to introduce yourself to us in exchange for a free 3-seat community license to help you get started. There are no strings attached. This community license provides full functionality, with no expiration, but it does not include priority support or future updates. We hope that you find the software useful, and we’re looking forward to growing along with you.

If you choose not to register your copy of Cerb then the software will default to _Evaluation Mode_, which is limited to a single seat but has no other restrictions.

Complete the short survey in exchange for your free license and then click the **Register** button.

## Step 10: Finished

That's it!  You're ready to start using Cerb.

Click the **Log in and get started** link.

<div class="cerb-box warning">
	<p>
		If this is a production installation, you need to delete the <b>/install</b> directory since it is no longer necessary and it provides access to some sensitive information about your environment.
	</p>
</div>

<div class="cerb-box note">
	<p>
		If this is a development installation, you may leave the <b>/install</b> directory in place since it contains useful scripts and examples for plugin development.
	</p>
</div>

# References

[^mysql]: <http://mysql.com>

[^mysql-forks]: <https://en.wikipedia.org/wiki/MySQL#Project_forks>

[^mysql-storage-engines]: <https://en.wikipedia.org/wiki/Comparison_of_MySQL_database_engines>

[^smtp]: <https://en.wikipedia.org/wiki/Simple_Mail_Transfer_Protocol>

[^smtp-google-apps]: <https://support.google.com/a/answer/176600?hl=en>

[^mailgun]: <http://mailgun.com>

[^ssl]: <https://en.wikipedia.org/wiki/SSL>

[^tls]: <https://en.wikipedia.org/wiki/Transport_Layer_Security>

[^1password]: <https://1password.com>