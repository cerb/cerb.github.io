---
title: Launch Cerb in Docker
excerpt: This page provides a comprehensive guide on launching Cerb using Docker for
  local evaluation, development, and testing.
summary: This page provides a comprehensive guide on launching Cerb using Docker for
  local evaluation, development, and testing. It details the setup process, including
  installing Docker, starting containers with Docker Compose, and accessing the Cerb
  installer via a web browser. The guide also covers updating Cerb, changing the web
  server port, connecting to the MySQL console, and managing containers, including
  pausing, resuming, and deleting them. Additionally, it explains how to edit code
  with immediate reflection in the containers, making it a useful resource for developers
  working with Cerb in a Docker environment.
toc:
  expand: Admin Guide
permalink: /docs/installation/docker/
jumbotron:
  title: Launch Cerb in Docker
  tagline: ""
  breadcrumbs:
  - label: Docs &raquo;
    url: /docs/home/
  - label: Admin Guide &raquo;
  - label: Installation &raquo;
    url: /docs/installation/
---

# Introduction
{:.no_toc}

Cerb ships with a Docker configuration for local evaluation, development, and testing. This creates preconfigured containers for Nginx (web server), PHP/FPM (code), and MySQL (database).

By default, data is stored in two volumes (one for the database and the other for the `./storage/` directory). A virtual network is created to connect the containers.

# Install Docker

First, make sure [Docker Desktop](https://www.docker.com/products/docker-desktop/) or the CLI is installed.

# Using Docker

### Starting containers with Docker Compose

Navigate to the directory where you want to install a copy of Cerb. Then run the following commands:

{% highlight bash %}
git clone -b v11.0 https://github.com/cerb/cerb-release.git v11.0

# ... or download + unzip: https://github.com/cerb/cerb-release/archive/refs/heads/v11.0.zip

cd v11.0

cd install/docker

docker compose up --build
{% endhighlight %}

It will take a few minutes to build the container images the first time you run them. Afterward, the containers will start almost instantly.

Once the containers are running, open your browser to: `http://localhost/`

The guided installer will finish installing Cerb based on your needs. For testing we recommend disabling outbound email when prompted (this can always be re-enabled later). At the end of the installer you can also choose "Demo" mode to have test data to experiment with.

### Updating Cerb

{% highlight bash %}
git stash

git pull origin --rebase

git stash pop
{% endhighlight %}

### Changing the web server port

If you're already using port `80` for a different project, you can bind Cerb to a different port (e.g. `8080`) by editing the `docker-compose.yml` file before running `docker compose up`.

{% highlight yaml %}
services:
  web:
    image: nginx:latest
    ports:
      - "8080:80"
...
{% endhighlight %}

### Connecting to the MySQL console

{% highlight bash %}
docker exec -it cerb-mysql-1 mysql -u root -p cerb
{% endhighlight %}

The default password is `s3cr3t`.

### Stopping the containers

To pause the containers, use the `Ctrl+C` keyboard shortcut or stop them from Docker Desktop.

Resume them later with `docker compose up --build` or the play button in Docker Desktop.

### Deleting containers

To delete the containers and their data, use the command:

{% highlight bash %}
docker compose down --volumes
{% endhighlight %}

### Editing code

You can edit files in your local filesystem and the changes will be reflected instantly within the containers.
<div class="section-nav">
	<div class="left">
		<a href="/docs/installation/" class="prev">&lt; Installation</a>
	</div>
	<div class="right align-right">
		<a href="/docs/setup/" class="prev">Setup &gt;</a>
	</div>
</div>
<div class="clear"></div>