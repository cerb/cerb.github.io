---
title: Guided Installer
excerpt: A guide to the Cerb config file, including settings and defaults.
summary: ""
permalink: /docs/guided-installer/
toc:
  title: Guided Installer
  expand: Admin Guide
jumbotron:
  title: Guided Installer
  tagline: A reference for the Cerb guided installer
  breadcrumbs:
  - label: Docs &raquo;
    url: /docs/home/
  - label: Installation &raquo;
    url: /docs/installation/
---

Cerb provides a guided installer that verifies your requirements, initializes the database, and walks you through the initial configuration of the software.

* TOC
{:toc}

To start the installer, open your browser to the location where you downloaded Cerb.  For instance:

* `http://localhost`
* `https://support.example.com/`
* `https://example.com/cerb/`

## Step 1: Requirements Check

The first step of the installer checks if your server meets the requirements for installing Cerb. Correct any problems before proceeding, and then click the **Continue** button.

<div class="cerb-screenshot">
<img src="/assets/images/docs/installation/installer_requirements.png" class="screenshot">
</div>

## Step 2: License

Review the software license agreement and then click the **I Accept** button.

## Step 3: Database Setup

**Driver**

Leave this at the default of **MySQLi** (the MySQL Improved extension).

Cerb currently only supports MySQL[^mysql] databases. You can also use one of the MySQL-based forks[^mysql-forks], like Amazon Aurora, MariaDB, Percona, or WebScaleSQL.  We recommend MySQL or Amazon Aurora, as they receive the most testing.

**Engine**

MySQL supports many _storage engines_[^mysql-storage-engines] that offer different functionality, strengths, and trade-offs.  Of those, Cerb is well-tested with the two most common:

- **InnoDB**: This is the default and recommended storage engine in recent versions of MySQL. It is transactional and designed to recover gracefully from unexpected interruptions. It implements row-based locking on writes, which reduces resource contention at scale in high-volume environments. It has slightly higher overhead than MyISAM due to transactions, durability, and indexing.  It may require more resources, and more experience to maintain and tune performance.

- **MyISAM**: This is the legacy storage engine in MySQL, and it is no longer under active development.  It's simpler to configure and maintain than InnoDB, and has slightly less overhead for some workloads (due to being non-transactional), but it risks data loss and corruption when the server is unexpectedly interrupted. It also implements table-based locking on writes, which generally doesn't scale well and may lead to resource contention in high volume environments.

In general, we recommend that you use InnoDB.  If you're in an environment that only supports MyISAM, or you just feel more comfortable with it, then go ahead and use it.

You can easily switch between storage engines at any time.

**Host**

This is the IP or hostname of your MySQL server.

If MySQL is installed on the same server as your web server, this value is usually _localhost_.

**Port**

This is the listening port of your MySQL server.

You can leave this blank unless you're running an unusual configuration.

**Database Name**

The name of the database on the MySQL server that you created earlier with the `CREATE DATABASE <database> CHARACTER SET utf8mb4` statement.

**Username**

The username that you created earlier with the `GRANT ALL PRIVILEGES ON <database> TO <user>@host` statement.

**Password**

The password that you created earlier with the `CREATE USER <user>@host IDENTIFIED BY '<password>'` statement.

**Test Settings**

Once you've entered your database connection details, click the **Test Settings** button to verify them.

## Step 4: Save Configuration File

If the web server has write access to the `framework.config.php` file then it will automatically handle this for you and skip to the next step.

If it can't write the file, it will generate the file for you to manually copy and paste.

## Step 5: Database Initialization

The installer will automatically  create your initial database schema. This may take a moment depending on the resources available to your database server.

## Step 6: Creating Your Account

In this step you'll create the administrator account that you use to log in.

**Name**

Enter your first and last name.

**Email Address**

Your **personal** email address.  This is how you will authenticate during logins, and it's where your notifications and account recovery details will be sent.  For that reason, this **should not** be an email address managed by Cerb.

This will likely be something like `you@company.com` or `you@gmail.com`.

**Password**

It is recommended that you choose a strong password here that you don't use anywhere else.  It should be fairly long, contain a mix of alphanumeric characters and symbols, in both upper and lower cases.

We highly recommend using a password manager like 1Password[^1password] to maintain strong password security practices.  You can also enable two-factor authentication for even stronger security.

**Timezone**

Cerb will use your timezone setting to display and interpret dates using your local timezone.  The installer attempts to automatically detect this for you, but you can adjust it as necessary.

**Default Sender**

This establishes your first shared outgoing email address.  You'll probably want to use something like `support@example.com` (where `example.com` is your own domain name).

You can also configure a personalized name for the email address, such as your organization name.

<div class="cerb-box note">
	<p>For everything to work properly, this email address <b>absolutely must</b> route back into Cerb so that you receive new messages. This is usually accomplished by configuring a POP/IMAP mailbox for Cerb to download mail from.</p>
</div>

Once you're done, click the **Continue** button.

## Step 7: Packages

|---
| Environment | 
|-|-
| **Demo** | Cerb will be configured for demonstration, development, and testing. Sample records will be created for tickets, contacts, and organizations. This test data can be removed later by deleting the `cerb.demo.data` [workflow](/docs/workflows/). 
| **Production** | Cerb will be configured for real-world use with a minimal configuration.

Select an environment and click the **Continue** button.

## Step 8: Community Mode

Without a license, Cerb operates in **community mode**. This allows full functionality with a single seat.

You can install a [purchased license](/pricing/) in **Setup >> Configure >> License**.

Click the **Continue** button.

## Step 9: Finished

That's it!  You're ready to start using Cerb.

Click the **Log in and get started** link.

<div class="cerb-box warning">
	<p>
		If this is a production installation, you need to delete the <b>/install/</b> directory since it is no longer necessary and it provides access to some sensitive information about your environment.
	</p>
</div>

<div class="cerb-box note">
	<p>
		If this is a development installation, you may leave the <b>/install/</b> directory in place since it contains useful scripts and examples for plugin development.
	</p>
</div>

# References

[^mysql]: <http://mysql.com>

[^mysql-forks]: <https://en.wikipedia.org/wiki/MySQL#Project_forks>

[^mysql-storage-engines]: <https://en.wikipedia.org/wiki/Comparison_of_MySQL_database_engines>

[^1password]: <https://1password.com>