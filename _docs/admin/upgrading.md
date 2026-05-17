---
title: Upgrading
excerpt: This page provides a comprehensive guide on upgrading Cerb, focusing on using
  Git for updates on Unix-based servers.
summary: This page provides a comprehensive guide on upgrading Cerb, focusing on using
  Git for updates on Unix-based servers. It covers preparation steps, including making
  backups and verifying Git installation, and details the process of updating Cerb
  files using Git commands. The guide also addresses handling conflicts during updates
  and outlines the necessary steps to finalize the upgrade, such as setting file permissions
  and updating the database schema. Additionally, it provides instructions for updating
  Community Portals if needed. The page emphasizes the advantages of using Git for
  version control and suggests using Cerb Cloud for those unable to manage upgrades
  themselves.
permalink: /docs/upgrading/
jumbotron:
  title: Upgrading
  breadcrumbs:
  - label: Docs &raquo;
    url: /docs/home/
  - label: Admin Guide &raquo;
  - label: Installation &raquo;
    url: /docs/installation/
keywords: upgrade
---

<div class="cerb-box note">
	<p>If you're using <b>Cerb Cloud</b> then we handle upgrades for you already.</p>
</div>

* TOC
{:toc}

# Option 1: Production (Docker)

The officially supported way of upgrading Cerb is by using [Docker image tags](https://hub.docker.com/r/cerb/cerb/tags/). This completely avoids the complexity of Git and dealing with file conflicts.

Cerb uses semantic versioning with the following format: `<platform>.<feature>.<maintenance>`

You can target version tags with this specificity:

* `11` (the latest 11.x platform version)
* `11.1` (the latest 11.1.x feature version)
* `11.1.9` (a specific maintenance version)
* `latest` (the latest stable version)

In production, we _strongly_ recommend using a full version number (e.g. `11.1.9`) in your deployment. A cluster of Cerb containers must be running the exact same version.

We recommend against "rolling" container upgrades because the code version will be inconsistent. For a zero-downtime upgrade, spin up a second cluster with the new version image. Once the new cluster is tested and ready, re-route traffic from your load balancer to the new cluster, and shut down the old one.

For a single container (e.g. Docker Compose) you can use a "fuzzy" tag like `latest`, but you must be available to finalize the upgrade in the browser. This may happen unexpectedly if a container is replaced automatically.

# Option 2: Development (Git)

A source code installation of Cerb is upgraded by using **Git**[^git], a distributed version control system.  The latest stable build of the project can be found on [GitHub](http://github.com/cerb/cerb-release). This environment makes it much easier for people to collaborate and share improvements.

You can use Git to quickly update your local Cerb files to the latest version. The major advantage of version control is that it will attempt to automatically merge official code improvements with any local configuration and customization you have performed. Git also gives you the ability to list all your changes to any project files, and to easily restore to an official version when desirable.

On Unix-based servers you can check if Git is installed by typing:

{% highlight bash %}
git --version
{% endhighlight %}

If you need to install Git, it's usually available in a package named `git`. The actual package name will depend on your operating system.

If you can't use Git, you really should consider using [Cerb Cloud](/pricing/) rather than managing it yourself.

## Preparation

- **Always make a backup** of your Cerb database prior to upgrading.  See the chapter on [Backups](/docs/backups/) for more information.

- Change directory to your cerb installation.

{% highlight bash %}
cd /path/to/cerb/
{% endhighlight %}

## Update using Git on a Unix-based server

Verify that you're using Git:

{% highlight bash %}
git status
{% endhighlight %}

You can also verify that a `.git` directory exists. If the above command returns an error, or the `.git` directory doesn't exist, then you probably installed the software a different way.  You should reinstall Cerb from GitHub.

Restore the `/install` directory:

{% highlight bash %}
git checkout -- install
{% endhighlight %}

Verify that you're using the proper remote repository:

{% highlight bash %}
git remote -v
origin	https://github.com/cerb/cerb-release.git (fetch)
origin	https://github.com/cerb/cerb-release.git (push)
{% endhighlight %}

If your `origin` isn't `https://github.com/cerb/cerb-release.git`, then run the following commands:

{% highlight bash %}
git remote rm origin
git remote add origin https://github.com/cerb/cerb-release.git
git fetch origin
{% endhighlight %}

Stash your uncommitted local changes (like your `framework.config.php` configuration file).  This leaves you with a clean version of the project files that simplifies merging:

{% highlight bash %}
git stash
{% endhighlight %}

Pull the latest changes from the remote repository:

{% highlight bash %}
git fetch origin
{% endhighlight %}

You can list [available versions](https://github.com/cerb/cerb-release/branches) with:

{% highlight bash %}
git branch --remote 
{% endhighlight %}

Switch to the desired major version branch:

{% highlight bash %}
git checkout v11.1
{% endhighlight %}

Pull the latest updates:

{% highlight bash %}
git pull origin
{% endhighlight %}

Reapply your local file changes:

{% highlight bash %}
git stash pop
{% endhighlight %}

Remove the `./install` directory:

{% highlight bash %}
rm -Rf install
{% endhighlight %}

## Dealing with conflicts

If you encounter conflicts while updating, you can attempt to resolve them manually, or you can revert your changes and restore your `framework.config.php` settings by hand. Don't simply copy over the new file with your old file, because it may have changed in the recent version.

Ensure that you have no remaining conflicts before continuing with the upgrade.

{% highlight bash %}
git status
{% endhighlight %}

A handy tool to visualize and reconcile conflicts is built into Git:

{% highlight bash %}
git mergetool
{% endhighlight %}

## Permissions

You should set file ownership and permissions again after updating your files.

#### Unix-based servers

Change directory to your Cerb installation:

{% highlight bash %}
cd /path/to/cerb/
{% endhighlight %}

Set owner:group to the webserver (this may be different in your environment):

{% highlight bash %}
chown -R www-data:www-data .
{% endhighlight %}

Set read file permissions for owner and deny everything else:

{% highlight bash %}
find . -type f -exec chmod 400 {} \;
{% endhighlight %}

Set read/list directory permissions for owner and deny everything else:

{% highlight bash %}
find . -type d -exec chmod 500 {} \;
{% endhighlight %}

Recursively grant write permission to owner on the storage directory:

{% highlight bash %}
chmod -R u+w storage/
{% endhighlight %}

<div class="cerb-box note">
	<p>
		Replace <tt>www-data</tt> with your webserver's user and group.
	</p>
</div>

#### Windows-based servers

Use Windows Explorer to set the appropriate write permissions on the `/cerb/storage` directory for your IIS user.

# Finishing the Upgrade

## Database schema updates

Some Cerb updates contain database changes which require an administrator to finalize. This will prohibit all Cerb activity (e.g., logins, scheduled tasks, mail parsing) to prevent any database corruption while you're between versions.

After your files are updated, attempt to log into your Cerb instance as you normally would. If a database update is required the software will automatically prompt you. Upon finalizing you should be able to log in and continue working.

## Community Portals

<div class="cerb-box note">
	<p>
		This is only required if you used the bundled <tt>index.php</tt> file to deploy a portal. This step isn't necessary if you use a true reverse proxy (e.g. Caddy, Nginx, or Apache <b>mod_proxy</b>) to serve your community portals.
	</p>
</div>

Very rarely, the `index.php` file which drives Community Portals like the Support Center may change during an upgrade.

How to tell if you need to update your Community Portal file:

- Log into Cerb.
- Click **setup** from the top right.
- Click the **Configure** menu and select *Community Portals*.
- Select any portal to edit it.
- Click the **Installation** tab.
- Compare the following line from the output with your deployed `index.php`:

{% highlight php %}
define('SCRIPT_LAST_MODIFY', 1234567890); // last change
{% endhighlight %}

If the number is different you should replace the `index.php` file for your community portal with the new version from Cerb.

# References

[^git]: <http://en.wikipedia.org/wiki/Git_(software)>
