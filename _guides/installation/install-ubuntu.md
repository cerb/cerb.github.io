---
title: Install Cerb on Ubuntu Linux 26.04
layout: integration
topic: Installation
excerpt: This guide will walk you through preparing an Ubuntu 26.04 server for installing
  Cerb, including Nginx, PHP-FPM, and MySQL.
summary: This is a comprehensive guide for installing Cerb on an Ubuntu 26.04 LTS
  server. It covers the entire setup process, including provisioning a server using
  Docker or Amazon EC2, installing necessary packages like PHP 8.5, Nginx, and MySQL,
  and configuring the MySQL database for Cerb. The guide also details the installation
  of Cerb itself, setting up Nginx with SSL certificates, creating virtual hosts,
  and testing the Nginx configuration. Additionally, it includes instructions for
  enabling friendly URLs and running the Cerb installer, ensuring a complete and secure
  installation process.
permalink: /guides/installation/ubuntu/
jumbotron:
  title: Install Cerb on Ubuntu Linux 26.04
  tagline: ""
  breadcrumbs:
  - label: Resources &raquo;
    url: /resources/
  - label: Guides &raquo;
    url: /resources/guides/
  - label: Installation &raquo;
    url: /resources/guides/#installation
---

<div class="cerb-box note">
	<p>
		We do not recommend installing Cerb components on your server directly. 
		Use the <a href="/docs/installation/docker/">Docker instructions</a> as a reference.
	</p>
</div>

# Introduction
{:.no_toc}

{{page.summary}}

* TOC
{:toc}

# Provision an Ubuntu server

If you don't already have a server, you can use Docker or Amazon EC2.

## Docker

{% highlight bash %}
docker run -it --rm -p 80:80 -p 443:443 ubuntu:26.04 /bin/bash
{% endhighlight %}

For local evaluation, development, and testing, you can use the built-in [Docker](/docs/installation/docker/) configuration instead.

## EC2

1. Launch an [Amazon EC2](/guides/installation/ec2/) instance.

1. Connect to your server using SSH:

{% highlight bash %}
ssh ubuntu@1.2.3.4
{% endhighlight %}

1. `sudo` into the `root` user.

# Install packages

It's a good idea to update your installed packages first:

{% highlight bash %}
apt-get update && apt-get -y upgrade
{% endhighlight %}

Install PHP 8.5:

{% highlight bash %}
apt-get install -y php8.5 php8.5-cli php8.5-fpm php8.5-mysql php8.5-mbstring php8.5-gd \
   php8.5-curl php8.5-yaml php8.5-gmp php8.5-zip php8.5-mailparse php8.5-dom php8.5-xml
{% endhighlight %}

Install common tools:

{% highlight bash %}
apt-get install -y git vim
{% endhighlight %}

Install the Nginx web server:

{% highlight bash %}
apt-get install -y nginx nginx-extras
{% endhighlight %}

# Install MySQL

We recommend using a dedicated database server that replicates to a standby server. In Amazon Web Servers you should use RDS.

If you need to install MySQL on your Docker or EC2 instance instead, you can use these instructions:

{% highlight bash %}
apt-get install -y mysql-server
{% endhighlight %}

This installs MySQL 8.4 LTS on Ubuntu 26.04.

In Docker you need to start the MySQL service. The `ubuntu:26.04` image doesn't run `systemd` as PID 1, so `service mysql start` (which invokes `systemctl`) will fail. Start `mysqld` directly instead:

{% highlight bash %}
mysqld --user=mysql --daemonize
{% endhighlight %}

You really should use the `mysql:8.4` container instead.

# Create the MySQL database

Connect to MySQL:

{% highlight bash %}
mysql -h localhost -u root -p
{% endhighlight %}

The default password is empty, just press `<ENTER>`.

<div class="cerb-box note"><p>If you're using a remote MySQL server, use its internal IP in place of <tt>localhost</tt> above.</p></div>

Set a root password.

{% highlight sql %}
ALTER USER 'root'@'localhost' IDENTIFIED WITH caching_sha2_password BY 's3cr3t';
{% endhighlight %}

<div class="cerb-box note"><p>MySQL 8.4 removed the legacy <tt>mysql_native_password</tt> plugin. Use <tt>caching_sha2_password</tt> (the default since MySQL 8.0).</p></div>

<div class="cerb-box note"><p>Replace <tt>s3cr3t</tt> above with your own new password.</p></div>

Create a new database and user for Cerb:

{% highlight sql %}
CREATE DATABASE cerb CHARACTER SET utf8;

CREATE USER cerb@localhost IDENTIFIED BY 's3cr3t';

GRANT ALL PRIVILEGES ON cerb.* TO cerb@localhost;

QUIT;
{% endhighlight %}

<div class="cerb-box note">
	<p>Replace <tt>s3cr3t</tt> above with your own secret password. If you're using a remote database server, replace <tt>@localhost</tt> with a subnet used by your web servers, like: <tt>@'10.0.0.%'</tt></p>
</div>

# Install Cerb

You should now be ready to install Cerb.

{% highlight bash %}
cd /usr/share/nginx/html/
{% endhighlight %}

{% highlight bash %}
git clone https://github.com/cerb/cerb-release.git cerb
{% endhighlight %}

{% highlight bash %}
chown -R www-data:www-data cerb
{% endhighlight %}

{% highlight bash %}
cd cerb
{% endhighlight %}

You can test Cerb using PHP's built in webserver:

{% highlight bash %}
service nginx stop
{% endhighlight %}

{% highlight bash %}
php -S 0.0.0.0:80
{% endhighlight %}

Type your server IP into a browser.

You should see the requirements checker with all tests passed:

<div class="cerb-screenshot">
<img src="/assets/images/common/installer.png" class="screenshot">
</div>

If you're just testing Cerb, you can use PHP's built-in web server and skip the Nginx step below.

Type `CTRL+C` to kill the PHP web server process.

Since you just ran the web server as root, you should make sure any newly created files are owned by the `www-data` user and group:

{% highlight bash %}
chown -R www-data:www-data /usr/share/nginx/html/cerb/
{% endhighlight %}

# Configure Nginx

We're going to install Nginx as the web server.  Cerb's code will run in PHP-FPM.

## SSL

### Add your SSL certificate

If you're using an Elastic Load Balancer you can configure SSL there and use internal IPs without SSL on your web servers.  Amazon Certificate Manager can also generate SSL certificates for free.

Otherwise, you'll need a valid SSL certificate for your server. We recommend [Let's Encrypt](https://letsencrypt.org) or a [RapidSSL certificate from CheapSSLsecurity](https://cheapsslsecurity.com/rapidssl/rapidsslcertificate.html).

Enable Perfect Forward Secrecy (this may take a few minutes):

{% highlight bash %}
openssl dhparam -out /etc/ssl/certs/dhparam.pem 2048
{% endhighlight %}

### Creating a self-signed SSL certificate

For testing, you can also create a self-signed SSL certificate.  You **should not** use these instructions in production:

{% highlight bash %}
openssl req -x509 -nodes -days 365 -newkey rsa:2048 \
-keyout /etc/ssl/private/nginx-selfsigned.key \
-out /etc/ssl/certs/nginx-selfsigned.pem
{% endhighlight %}

{% highlight text %}
Country Name (2 letter code) [AU]:US
State or Province Name (full name) [Some-State]:California
Locality Name (eg, city) []:
Organization Name (eg, company) [Internet Widgits Pty Ltd]:Example, Inc.
Organizational Unit Name (eg, section) []:Internet
Common Name (e.g. server FQDN or YOUR name) []:cerb.example
Email Address []:support@cerb.example
{% endhighlight %}

## Add a virtual host

Add a new virtual host to Nginx:

{% highlight bash %}
vi /etc/nginx/sites-available/cerb
{% endhighlight %}

Type `i` to switch to insert mode and paste the following:

{% highlight nginx linenos %}
{% raw %}
server {
  listen 80;
  server_name cerb.example;
  #access_log off;

  location /status/nginx {
    stub_status on;
    access_log off;
    allow 127.0.0.1;
    deny all;
  }

  location /status/fpm {
    access_log off;
    allow 127.0.0.1;
    #allow 10.0.0.0/16;
    deny all;
    include fastcgi_params;
    fastcgi_pass unix:/run/php/php8.5-fpm.sock;
  }

  location / {
    return 301 https://$host$request_uri;
  }
}

limit_req_zone $binary_remote_addr zone=cerb:10m rate=15r/s;

server {
  listen 443 ssl;
  server_name cerb.example;
  #access_log off;
  
  root /usr/share/nginx/html/cerb/;
  index index.php;

  # Increase upload max size from default of 1MB
  client_max_body_size 30m;
	  
  charset utf-8;

  # SSL
  ssl_certificate /etc/ssl/certs/nginx-selfsigned.pem;
  ssl_certificate_key /etc/ssl/private/nginx-selfsigned.key;
  ssl_protocols TLSv1.2;
  ssl_prefer_server_ciphers on;
  ssl_ciphers HIGH:!CAMELLIA:!RC4:!PSK:!aNULL:@STRENGTH;
  ssl_dhparam /etc/ssl/certs/dhparam.pem;

  # DNS
  resolver 8.8.8.8 8.8.4.4 valid=300s;
  resolver_timeout 5s;

  # Always let people see the favicon file
  location = /favicon.ico {
    allow all;
  }

  # Always let people see the robots file
  location = /robots.txt {
    allow all;
  }

  # Send PHP scripts to FPM
  location ~ ^/(index|ajax)\.php$ {
    limit_req zone=cerb burst=40 delay=15;
    
    proxy_connect_timeout 30;
    proxy_send_timeout 30;
    proxy_read_timeout 30;
    
    fastcgi_split_path_info ^(.+\.php)(/.+)$;
    fastcgi_pass   unix:/run/php/php8.5-fpm.sock;
    fastcgi_index  index.php;
    include    fastcgi_params;
    fastcgi_param  SCRIPT_FILENAME  $document_root$fastcgi_script_name;
  }

  # ============================
  # ENABLE ONLY FOR INSTALLATION
  # ============================
  location /install/ {
    location = /install/ {
      rewrite ^(.*)$ /install/index.php?$1 last;
    }
    
    location ~ ^/install/(index|servercheck|phpinfo)\.php$ {
      fastcgi_split_path_info ^(.+\.php)(/.+)$;
      fastcgi_pass unix:/run/php/php8.5-fpm.sock;
      fastcgi_index  /install/index.php;
      include    fastcgi_params;
      fastcgi_param  SCRIPT_FILENAME  $document_root$fastcgi_script_name;
    }
    
    location ~ ^/install/(.*)\.(css|js|svg)$ {
      allow all;
    }
    
    #location ~ ^/install/ {
    #  deny all;
    #}
  }
  
  # Deny direct access to all other PHP files
  location ~ \.php$ {
    deny all;
  }
  
  # Send all other paths to the Devblocks front controller index.php
  location / {
    rewrite ^ /index.php last;
  }
}
{% endraw %}
{% endhighlight %}

On lines `3` and `29` change `cerb.example` to the domain name of your server.  If for some reason you don't have one, you can temporarily use your server IP.

The first `server` block (lines `1-25`) redirects all HTTP requests to HTTPS with SSL.  It also defines some `/status` pages you can use to monitor the server (lines `6` and `13`).

On lines `41-42`, you should use your own SSL key and certificate.

Save the file with `:wq`

To enable the site we need to add a symlink:

{% highlight bash %}
unlink /etc/nginx/sites-enabled/default

ln -s /etc/nginx/sites-available/cerb /etc/nginx/sites-enabled/cerb
{% endhighlight %}

## Test Nginx configuration

You can test the Nginx configuration file with:

{% highlight bash %}
nginx -t
nginx: the configuration file /etc/nginx/nginx.conf syntax is ok
nginx: configuration file /etc/nginx/nginx.conf test is successful
{% endhighlight %}

## Restart Nginx and PHP-FPM

{% highlight bash %}
service nginx restart
{% endhighlight %}

{% highlight bash %}
service php8.5-fpm restart
{% endhighlight %}

For more information about Nginx + PHP-FPM, see: <https://www.nginx.com/resources/wiki/start/topics/examples/phpfcgi/>

# Enable friendly URLs

{% highlight bash %}
touch .htaccess
{% endhighlight %}

# Run the Cerb installer

Type the hostname of your server into a browser and follow the [guided installer](/docs/installation/#run-the-guided-installer).

If you're installing with Docker, use `127.0.0.1` rather than `localhost` for the database server.