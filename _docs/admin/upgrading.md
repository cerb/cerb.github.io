---
title: Upgrading
permalink: /docs/upgrading/
excerpt: You can use Git to quickly update your local Cerb files to the latest version.
jumbotron:
  title: Upgrading
  #tagline: ...
  breadcrumbs:
  -
    label: Docs &raquo;
    url: /docs/home/
keywords: upgrade
---

* TOC
{:toc}

<div class="cerb-box note">
	<p>If you're using <b>Cerb Cloud</b> then we handle upgrades for you already.</p>
</div>

The officially supported way of upgrading Cerb is by using **Git**[^git], a distributed version control system.  The latest stable build of the project can be found on [GitHub](http://github.com/cerb/cerb-release). This environment makes it much easier for people to collaborate and share improvements.

You can use Git to quickly update your local Cerb files to the latest version. The major advantage of version control is that it will attempt to automatically merge official code improvements with any local configuration and customization you have performed. Git also gives you the ability to list all your changes to any project files, and to easily restore to an official version when desirable.

On Unix-based servers you can check if Git is installed by typing:

<pre class="command-line" data-user="user" data-host="host">
<code class="language-bash">
git --version
</code>
</pre>

If you need to install Git, it's usually available in a package named `git`. The actual package name will depend on your operating system.

If you can't use Git, you really should consider using [Cerb Cloud](/pricing/) rather than managing it yourself.

# Preparation

- **Always make a backup** of your Cerb database prior to upgrading.  See the chapter on [Backups](/docs/backups/) for more information.

- Change directory to your cerb installation.

<pre class="command-line" data-user="user" data-host="host">
<code class="language-bash">
cd /path/to/cerb/
</code>
</pre>

# Update using Git on a Unix-based server

Verify that you're using Git:

<pre class="command-line" data-user="user" data-host="host">
<code class="language-bash">
git status
</code>
</pre>

You can also verify that a `.git` directory exists. If the above command returns an error, or the `.git` directory doesn't exist, then you probably installed the software a different way.  You should reinstall Cerb from GitHub[^svn-to-git].

Restore the `/install` directory:

<pre class="command-line" data-user="user" data-host="host">
<code class="language-bash">
git checkout -- install
</code>
</pre>

Verify that you're using the proper remote repository:

<pre class="command-line" data-user="user" data-host="host" data-output="2-3">
<code class="language-bash">
git remote -v
origin	https://github.com/cerb/cerb-release.git (fetch)
origin	https://github.com/cerb/cerb-release.git (push)
</code>
</pre>

If your `origin` isn't `https://github.com/cerb/cerb-release.git`, then run the following commands:

<pre class="command-line" data-user="user" data-host="host">
<code class="language-bash">
git remote rm origin
git remote add origin https://github.com/cerb/cerb-release.git
git fetch origin
</code>
</pre>

Stash your uncommitted local changes (like your `framework.config.php` configuration file).  This leaves you with a clean version of the project files that simplifies merging:

<pre class="command-line" data-user="user" data-host="host">
<code class="language-bash">
git stash
</code>
</pre>

Switch to the `master` branch if it's not your current branch:

<pre class="command-line" data-user="user" data-host="host">
<code class="language-bash">
git checkout master
</code>
</pre>

Update to the latest stable version:

<pre class="command-line" data-user="user" data-host="host">
<code class="language-bash">
git pull origin master
</code>
</pre>

Reapply your local file changes:

<pre class="command-line" data-user="user" data-host="host">
<code class="language-bash">
git stash pop
</code>
</pre>

Remove the `./install` directory:

<pre class="command-line" data-user="user" data-host="host">
<code class="language-bash">
rm -Rf install
</code>
</pre>

# Dealing with conflicts

If you encounter conflicts while updating, you can attempt to resolve them manually, or you can revert your changes and restore your `framework.config.php` settings by hand. Don't simply copy over the new file with your old file, because it may have changed in the recent version.

Ensure that you have no remaining conflicts before continuing with the upgrade.

<pre class="command-line" data-user="user" data-host="host">
<code class="language-bash">
git status
</code>
</pre>

A handy tool to visualize and reconcile conflicts is built into Git:

<pre class="command-line" data-user="user" data-host="host">
<code class="language-bash">
git mergetool
</code>
</pre>

# Finishing the Upgrade

## Permissions

You should set file ownership and permissions again after updating your files.

### Unix-based servers

Change directory to your Cerb installation:

<pre class="command-line" data-user="user" data-host="host">
<code class="language-bash">
cd /path/to/cerb/
</code>
</pre>

Set owner:group to the webserver (this may be different in your environment):

<pre class="command-line" data-user="user" data-host="host">
<code class="language-bash">
chown -R www-data:www-data .
</code>
</pre>

Set read file permissions for owner and deny everything else:

<pre class="command-line" data-user="user" data-host="host">
<code class="language-bash">
find . -type f -exec chmod 400 {} \;
</code>
</pre>

Set read/list directory permissions for owner and deny everything else:

<pre class="command-line" data-user="user" data-host="host">
<code class="language-bash">
find . -type d -exec chmod 500 {} \;
</code>
</pre>

Recursively grant write permission to owner on the storage directory:

<pre class="command-line" data-user="user" data-host="host">
<code class="language-bash">
chmod -R u+w storage/
</code>
</pre>

<div class="cerb-box note">
	<p>
		Replace <tt>www-data</tt> with your webserver's user and group.
	</p>
</div>

### Windows-based servers

Use Windows Explorer to set the appropriate write permissions on the `/cerb/storage` directory for your IIS user.

## Database schema updates

Some Cerb updates contain database changes which require an administrator to finalize. This will prohibit all Cerb activity (e.g., logins, scheduled tasks, mail parsing) to prevent any database corruption while you're between versions.

After your files are updated, attempt to log into your Cerb instance as you normally would. If a database update is required the software will automatically prompt you. Upon finalizing you should be able to log in and continue working.

## Community Portals

Very rarely, the `index.php` file which drives Community Portals like the Support Center may change during an upgrade.

How to tell if you need to update your Community Portal file:

- Log into Cerb.
- Click **setup** from the top right.
- Click the **Configure** menu and select *Community Portals*.
- Select any portal to edit it.
- Click the **Installation** tab.
- Compare the following line from the output with your deployed `index.php`:
<pre>
<code class="language-php">
define('SCRIPT_LAST_MODIFY', 1234567890); // last change
</code>
</pre>

- If the number is different you should replace the `index.php` file for your community portal with the new version from Cerb.

<div class="cerb-box note">
	<p>
		This is only required if you used the bundled <tt>index.php</tt> file to deploy a portal. This step isn't necessary if you use a true reverse proxy (e.g. Nginx or Apache <b>mod_proxy</b>) to serve your community portals.
	</p>
</div>

# References

[^git]: <http://en.wikipedia.org/wiki/Git_(software)>
[^svn-to-git]: <https://cerb.official.support/kb/article/71-Switching_a_Cerb5_installation_from_Subversion_to_Git>
