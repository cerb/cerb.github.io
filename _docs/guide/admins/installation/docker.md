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
  tagline: Pre-built container images in an ideal environment
  breadcrumbs:
  - label: Docs &raquo;
    url: /docs/home/
  - label: Admin Guide &raquo;
  - label: Installation &raquo;
    url: /docs/installation/
---

* TOC
{:toc}

<p class="youtube-video-container"><iframe width="1040" height="585" src="https://www.youtube.com/embed/NkKUDS6oicw" title="" frameBorder="0"  allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" allowFullScreen></iframe></p>

# Install Docker

First, make sure [Docker Desktop](https://www.docker.com/products/docker-desktop/) (desktops) or the [Docker Engine](https://docs.docker.com/engine/install/) (servers) is installed.

# Launch Cerb

## Option 1: Docker Hub (Production)

Cerb is available as a pre-built container image for `amd64` or `arm64` on [Docker Hub](https://hub.docker.com/r/cerb/cerb/). It must be paired with a web server that supports the FastCGI protocol (e.g. Caddy, nginx, Apache, IIS).

[This repository](https://github.com/cerb/cerb-docker/) provides several usage examples. For example:

{% highlight bash %}
{% raw %}
git clone https://github.com/cerb/cerb-docker/

# ... or download + unzip: https://github.com/cerb/cerb-docker/archive/refs/heads/main.zip

cd cerb-docker/cerb-caddy-mysql

cat .env

docker compose up --build
{% endraw %}
{% endhighlight %}

The `cerb` container listens on port `:9000` using FastCGI and **must not** be exposed to the public network. The container is configured using environment variables:

|---
| ENV | 
|-|-
| `CERB_AUTHORIZED_IPS` | A comma-separated list of IPv4 addresses or subnets that can access `/cron` and `/update` without a session. 
| `CERB_INSTALL` | If `yes` the `/install/` path is available; otherwise it is blocked. Only enable during installation and disable afterward.
| `MYSQL_HOST` | The database server hostname. This is created for you in the `cerb-caddy-mysql` example, but should be a dedicated server like Amazon RDS in production.
| `MYSQL_DATABASE` | The database name. Use `CREATE DATABASE cerb CHARACTER SET utf8mb4` if using an external database server.
| `MYSQL_USER` | The database user with `GRANT SELECT, INSERT, UPDATE, DELETE, CREATE, DROP, INDEX, ALTER, CREATE TEMPORARY TABLES, LOCK TABLES`.
| `MYSQL_PASSWORD` | The database user's password.

The container uses the `/mnt/storage/` path for persistent data. In the example a local Docker volume binds to the path, but in production you should bind a shared filesystem like Amazon EFS, NFS, or GlusterFS. This allows you to scale containers horizontally.

The [cerb-caddy-mysql](https://github.com/cerb/cerb-docker/tree/main/cerb-caddy-mysql/) example above provides additional configuration options:

|---
| ENV |
|-|-
| `CERB_VERSION` | The Cerb versioned image [tag](https://hub.docker.com/r/cerb/cerb/tags) to use. Use tags like `11` for 11.x, `11.1` for 11.1.x, or `11.1.0` for a specific version. The `latest` tag always points to the latest stable version.
| `CERB_HOSTNAME` | If `localhost` a self-signed SSL certificate is generated; otherwise a LetsEncrypt certificate is automatically generated. Be sure the DNS for this hostname points to your server. Ports `:80` and `:443` must be exposed to the public network for LetsEncrypt to work.
| `CERB_PORT` | The HTTP port. This should be `80` in production, but can be something like `8080` for testing.
| `CERB_PORT_SSL` | The HTTPS/TLS port. This should be `443` in production, but can be something like `8443` for testing.

A `docker-compose.yml` file is provided for reference and testing. In production, you should use a container orchestration service like Amazon ECS/Fargate, Google Cloud Run, Azure Containers, or Kubernetes.

You can use the [cerb](https://github.com/cerb/cerb-docker/tree/main/cerb/) example to build your own customized image.

### Running the scheduler in the container from the host

You can use `docker exec` to ping the scheduler in the container.

{% highlight cerb %}
{% raw %}
docker exec cerb-docker-caddy-1 wget -O - --header "Host: localhost" "https://localhost/cron?loglevel=7&ignore_wait=1"
{% endraw %}
{% endhighlight %}

You can add this to `crontab` on the host.

## Option 2: GitHub (Development, Testing)

The Cerb source code ships with a Docker configuration for local evaluation, development, and testing. This creates preconfigured containers for Nginx (web server), PHP/FPM (code), and MySQL (database).

You can edit files in your local filesystem and the changes will be reflected instantly within the containers.

By default, data is stored in two volumes (one for the database and the other for the `./storage/` directory). A virtual network is created to connect the containers.

### Starting local containers with Docker Compose

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

<div class="section-nav">
	<div class="left">
		<a href="/docs/installation/" class="prev">&lt; Installation</a>
	</div>
	<div class="right align-right">
		<a href="/docs/guided-installer/" class="prev">Guided Installer &gt;</a>
	</div>
</div>
<div class="clear"></div>