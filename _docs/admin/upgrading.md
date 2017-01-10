---
title: Upgrading
permalink: /docs/upgrading/
jumbotron:
  title: Upgrading
  #tagline: ...
---

The officially supported way of upgrading Cerb is by using **Git**[^git], a distributed version control system.  The official project is hosted on [GitHub](http://github.com/wgm/cerb). This environment makes it much easier for people to collaborate and share improvements.

You can use Git to quickly update your local Cerb files to the latest version. The major advantage of version control is that it will attempt to automatically merge official code improvements with any local configuration and customization you have performed. Git also gives you the ability to list all your changes to any project files, and to easily restore to an official version when desirable.

On Unix-based servers you can check if Git is installed by typing:

{% highlight bash %}
git --version
{% endhighlight %}

If you need to install Git, it's usually available in a package named `git`. The actual package name will depend on your operating system.

If you can't use Git, you really should consider using [Cerb Cloud](/cloud) rather than managing it yourself.

# Preparation

- **Always make a backup** of your Cerb database prior to upgrading.  See the chapter on [Backups](/docs/backups/) for more information.

- Change directory to your cerb installation.

{% highlight php %}
cd /path/to/cerb/
{% endhighlight %}

# Update using Git on a Unix-based server

Verify that you're using Git:

{% highlight bash %}
git status
{% endhighlight %}

You can also verify that a `.git` directory exists. If the above command returns an error, or the `.git` directory doesn't exist, then you probably installed the software a different way.  You should reinstall Cerb from GitHub[^svn-to-git].

Restore the `/install` directory:

{% highlight bash %}
git checkout -- install
{% endhighlight %}

Update the list of branches from the remote repository:

{% highlight bash %}
git fetch origin
{% endhighlight %}

<div class="cerb-box note">
	<p>
		If this gives an error, you can check your list of remotes with the <tt>git remote</tt> command. Use another remote in place of <tt>origin</tt>.
	</p>
</div>

Stash your uncommitted local changes (like your `framework.config.php` configuration file).  This leaves you with a clean version of the project files that simplifies merging:

{% highlight bash %}
git stash
{% endhighlight %}

Switch to the `stable` branch if it's not your current branch:

{% highlight bash %}
git checkout stable
{% endhighlight %}

Update to the latest stable version:

{% highlight bash %}
git pull origin stable
{% endhighlight %}
    
Reapply your local file changes:

{% highlight bash %}
git stash pop
{% endhighlight %}

Remove the `/install` directory:

{% highlight bash %}
rm -Rf install
{% endhighlight %}

# Dealing with conflicts

If you encounter conflicts while updating, you can attempt to resolve them manually, or you can revert your changes and restore your `framework.config.php` settings by hand. Don't simply copy over the new file with your old file, because it may have changed in the recent version.

Ensure that you have no remaining conflicts before continuing with the upgrade.

{% highlight bash %}
git status
{% endhighlight %}

A handy tool to visualize and reconcile conflicts is built into Git:

{% highlight bash %}
git mergetool
{% endhighlight %}

# Finishing the Upgrade

## Permissions

You should set file ownership and permissions again after updating your files.

### Unix-based servers

{% highlight bash %}
# Change directory to your Cerb installation
cd /path/to/cerb/

# Set owner:group to the webserver (this may be different in your environment)
chown -R www-data:www-data .

# Set file permissions to read-only for owner and deny everything else
find . -type f -exec chmod 400 {} \;

# Set directory permissions to read-only for owner and deny everything else
find . -type d -exec chmod 500 {} \;

# Recursively grant write permission to owner on the storage directory
chmod -R u+w storage/
{% endhighlight%}

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
{% highlight php %}
<?php
//...
define('SCRIPT_LAST_MODIFY', 1234567890); // last change
{% endhighlight %}

- If the number is different you should replace the `index.php` file for your community portal with the new version from Cerb.

<div class="cerb-box note">
	<p>
		This is only required if you used the bundled <tt>index.php</tt> file to deploy a portal. This step isn't necessary if you use a true reverse proxy (e.g. Apache <b>mod_proxy</b> or Nginx) to serve your community portals.
	</p>
</div>

## Install directory

Delete the `install/` directory if it exists:

{% highlight bash %}
rm -Rf install/
{% endhighlight %}

# References

[^git]: <http://en.wikipedia.org/wiki/Git_(software)>
[^svn-to-git]: <http://cerbweb.com/support/kb/article/71-Switching_a_Cerb5_installation_from_Subversion_to_Git>
