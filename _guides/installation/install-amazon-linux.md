---
title: Install Cerb on Amazon Linux
layout: integration
topic: Installation
excerpt: This guide will walk you through preparing an Amazon Linux server for installing Cerb, including Nginx, PHP-FPM, and MySQL.
permalink: /guides/installation/amazon-linux/
jumbotron:
  title: Install Cerb on Amazon Linux
  tagline: ""
  breadcrumbs:
  -
    label: Resources &raquo;
    url: /resources/
  -
    label: Guides &raquo;
    url: /resources/guides/
  -
    label: Installation &raquo;
    url: /resources/guides/#installation
---

# Introduction
{:.no_toc}

This guide will walk you through preparing an Amazon Linux server for installing Cerb, including Nginx, PHP-FPM, and MySQL.

* TOC
{:toc}

# Provision an Amazon Linux server

If you don't already have a server, you can [create an EC2 instance in Amazon Web Services](/guides/installation/ec2/).

This guide uses the following Amazon Machine Image (AMI):

`Amazon Linux AMI 2016.09.1 (HVM), SSD Volume Type - ami-f173cc91`

# Connect to your server

Connect to your server using SSH:

<pre>
<code class="language-bash">
ssh ec2-user@1.2.3.4
</code>
</pre>

# Install packages

It's a good idea to update your installed packages first:

<pre>
<code class="language-bash">
sudo yum -y update
</code>
</pre>

Install PHP 7.0:

<pre>
<code class="language-bash">
sudo yum install -y php70 php70-fpm php70-mysqli php70-mbstring php70-gd php70-imap php70-opcache php70-devel php70-gmp php7-pear gcc
</code>
</pre>

Install Git:

<pre>
<code class="language-bash">
sudo yum install -y git
</code>
</pre>

Install the Nginx web server:

<pre>
<code class="language-bash">
sudo yum install -y nginx
</code>
</pre>

# Install mailparse

There isn't a package for the Mailparse PHP extension in Amazon Linux, but you can use PECL:

<pre>
<code class="language-bash">
sudo pecl7 install mailparse

sudo sh -c 'echo "extension=mailparse.so" > /etc/php-7.0.d/40-mailparse.ini'
</code>
</pre>

# Install MySQL

We recommend using a dedicated database server that replicates to a standby server.

If you need to install MySQL on your EC2 instance instead, you can use these instructions:

<pre>
<code class="language-bash">
sudo yum install -y mysql56-server

sudo service mysqld restart

sudo /usr/libexec/mysql56/mysql_secure_installation
</code>
</pre>

# Create the MySQL database

Connect to MySQL:

<pre>
<code class="language-bash">
mysql -h localhost -u root -p
</code>
</pre>

<div class="cerb-box note"><p>If you're using a remote MySQL server, use its internal IP in place of <tt>localhost</tt> above.</p></div>

Enter your root password.

Create a new database and user for Cerb:

<pre>
<code class="language-sql">
create database cerb character set utf8;

grant all privileges on cerb.* to cerb@localhost identified by 's3cr3t';

quit;
</code>
</pre>

<div class="cerb-box note">
	<p>Replace <tt>s3cr3t</tt> above with your own secret password. If you're using a remote database server, replace <tt>@localhost</tt> with a subnet used by your web servers, like: <tt>@'10.0.0.%'</tt></p>
</div>

# Install Cerb

You should now be ready to install Cerb.

<pre>
<code class="language-bash">
cd /usr/share/nginx/html/

sudo git clone https://github.com/cerb/cerb-release.git cerb

sudo chown -R apache:apache cerb

cd cerb
</code>
</pre>

You can test Cerb using PHP's built in webserver:

<pre>
<code class="language-bash">
sudo service nginx stop

sudo php -S 0.0.0.0:80
</code>
</pre>

Type your server IP into a browser.

You should see the requirements checker with all tests passed:

<div class="cerb-screenshot">
<img src="/assets/images/common/installer.png" class="screenshot">
</div>

If you're just testing Cerb, you can use PHP's built-in web server and skip the Nginx step below.

Type `CTRL + C` to kill the PHP web server process.

Since you just ran the web server as root, you should make sure any newly created files are owned by the `www-data` user and group:

<pre>
<code class="language-">
sudo chown -R apache:apache /usr/share/nginx/html/cerb/
</code>
</pre>

# Configure Nginx

We're going to install Nginx as the web server.  Cerb's code will run in PHP-FPM.

## SSL

### Add your SSL certificate

If you're using an Elastic Load Balancer you can configure SSL there and use internal IPs without SSL on your web servers.  Amazon Certificate Manager can also generate SSL certificates for free.

Otherwise, you'll need a valid SSL certificate for your server. We recommend [Let's Encrypt](https://letsencrypt.org) or a [RapidSSL certificate from CheapSSLsecurity](https://cheapsslsecurity.com/rapidssl/rapidsslcertificate.html).

Enable Perfect Forward Secrecy (this may take a few minutes):

<pre>
<code class="language-bash">
sudo openssl dhparam -out /etc/ssl/certs/dhparam.pem 2048
</code>
</pre>

### Creating a self-signed SSL certificate

For testing, you can also create a self-signed SSL certificate.  You **should not** use these instructions in production:

<pre>
<code class="language-bash">
sudo openssl req -x509 -nodes -days 365 -newkey rsa:2048 \
-keyout /etc/pki/tls/private/nginx-selfsigned.key \
-out /etc/ssl/certs/nginx-selfsigned.pem
</code>
</pre>

<pre>
<code class="language-text">
Country Name (2 letter code) [AU]:US
State or Province Name (full name) [Some-State]:California
Locality Name (eg, city) []:
Organization Name (eg, company) [Internet Widgits Pty Ltd]:Example, Inc.
Organizational Unit Name (eg, section) []:Internet
Common Name (e.g. server FQDN or YOUR name) []:cerb.example
Email Address []:support@cerb.example
</code>
</pre>

## Add a virtual host

Add a new virtual host to Nginx:

<pre>
<code class="language-bash">
sudo vi /etc/nginx/conf.d/cerb.conf
</code>
</pre>

Type `i` to switch to insert mode and paste the following:

<pre class="line-numbers">
<code class="language-nginx">
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
    fastcgi_pass   localhost:9000; #unix:/var/run/php/php7.0-fpm.sock;
  }

  location / {
    return 301 https://$host$request_uri;
  }
}

server {
  listen 443 ssl;
  server_name cerb.example;
  #access_log off;
  
  root /usr/share/nginx/html/cerb;
  index index.php;

  # Increase upload max size from default of 1MB
  client_max_body_size 30m;
	  
  charset utf-8;

  # SSL
  ssl_certificate /etc/ssl/certs/nginx-selfsigned.pem;
  ssl_certificate_key /etc/pki/tls/private/nginx-selfsigned.key;
  ssl_protocols TLSv1 TLSv1.1 TLSv1.2;
  ssl_prefer_server_ciphers on;
  ssl_ciphers HIGH:!CAMELLIA:!RC4:!PSK:!aNULL:@STRENGTH;
  ssl_dhparam /etc/ssl/certs/dhparam.pem;

  # DNS
  resolver 8.8.8.8 8.8.4.4 valid=300s;
  resolver_timeout 5s;

  # Always let people see the favicon file
  location = /favicon\.ico {
    allow all;
  }
  
  # Send PHP scripts to FPM
  location ~ /(index|ajax)\.php$ {
    proxy_connect_timeout 120;
    proxy_send_timeout 120;
    proxy_read_timeout 120;
    
    fastcgi_split_path_info ^(.+\.php)(/.+)$;
    fastcgi_pass   localhost:9000; #unix:/var/run/php/php7.0-fpm.sock;
    fastcgi_index  index.php;
    include    fastcgi_params;
    fastcgi_param  SCRIPT_FILENAME  $document_root$fastcgi_script_name;
  }

  location ~ \.php$ {
    deny all;
  }
  
  # Send all other paths to the Devblocks front controller index.php
  location / {
    try_files $uri /index.php?$query_string;
  }
}
{% endraw %}
</code>
</pre>

On lines `3` and `29` change `cerb.example` to the domain name of your server.  If for some reason you don't have one, you can temporarily use your server IP.

The first `server` block (lines `1-25`) redirects all HTTP requests to HTTPS with SSL.  It also defines some `/status` pages you can use to monitor the server (lines `6` and `13`).

On lines `41-42`, you should use your own SSL key and certificate.

Save the file with `:wq`

## Test Nginx configuration

You can test the Nginx configuration file with:

<pre class="command-line" data-output="2-3">
<code class="language-bash">
sudo nginx -t
nginx: the configuration file /etc/nginx/nginx.conf syntax is ok
nginx: configuration file /etc/nginx/nginx.conf test is successful
</code>
</pre>

## Restart Nginx and PHP-FPM

<pre>
<code class="language-bash">
sudo service nginx restart

sudo service php-fpm restart
</code>
</pre>

For more information about Nginx + PHP-FPM, see: <https://www.nginx.com/resources/wiki/start/topics/examples/phpfcgi/>

# Run the Cerb installer

Type the hostname of your server into a browser and follow the [guided installer](/docs/installation/#run-the-guided-installer).