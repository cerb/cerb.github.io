---
title: Install Cerb on Microsoft Windows Server 2022
date: 2022-04-06 00:00:00 -0700
layout: integration
topic: Installation
excerpt: This guide will walk you through preparing a Microsoft Windows Server 2022 server for installing Cerb, including IIS, PHP, and MySQL.
permalink: /guides/installation/windows-server-2022/
jumbotron:
  title: Install Cerb on Microsoft Windows Server 2022
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

This guide will walk you through preparing a Microsoft Windows Server 2022 server for installing Cerb, including IIS, PHP, and MySQL.

* TOC
{:toc}

# Provision a Microsoft Windows Server 2022 server

If you don't already have a server, you can [create an EC2 instance in Amazon Web Services](/guides/installation/ec2/).

This guide uses the following Amazon Machine Image (AMI):

**Windows_Server-2022-English-Full-Base-2022.07.13** (`ami-0648d932874575779`)

# Connect to your server

Connect to your server using Remote Desktop Protocol (RDP).

If you're using AWS, go to the EC2 console, Instances, select your instance, and choose **Security >> Get Windows Password** from the instances menu.

# Install IIS

1. **Start >> Server Manager**

2. Add roles and features

3. Role-based or feature-based installation

4. Web Server (IIS)

5. **Include Application Development >> CGI**

# Install PHP with Web Platform Installer

1. Navigate to: <https://docs.microsoft.com/en-us/iis/install/web-platform-installer/web-platform-installer-direct-downloads>

2. Download and install **WebPI 5.1 x64**

## Install PHP

1. **Start >> Microsoft Web Platform Installer**

2. **Search >> PHP 8.0.0 (x64) >> Add**

3. Click the **Install** button.

## Install Git

1. **Start >> Microsoft Web Platform Installer**

2. **Search >> Git for Windows** 

3. Click the **Install** button.

# Install the PHP mailparse extension

<https://windows.php.net/downloads/pecl/releases/mailparse/3.1.3/php_mailparse-3.1.3-8.0-nts-vs16-x64.zip>

Copy `php_mailparse.dll` to `C:\Program Files\PHP\v8.0\ext\`

# Install the YAML extension

<https://windows.php.net/downloads/pecl/releases/yaml/2.2.2/php_yaml-2.2.2-8.0-nts-vs16-x64.zip>

Copy `php_yaml.dll` to `C:\Program Files\PHP\v8.0\ext\`

# Install MySQL

(Windows Platform Installer / Server Manager)

<https://dev.mysql.com/downloads/installer/>

Download MySQL 8.0.29+.

Install MySQL Server.

Server Configuration: Server Computer

Use Legacy Authentication Method (MySQL 5.x compatible)

Set a MySQL root password.

## Create a database and user

**Start >> MySQL 8.0 Command Line Client**

Enter your root password.

<pre>
<code class="language-sql">
CREATE DATABASE cerb CHARACTER SET utf8;

CREATE USER cerb@localhost IDENTIFIED BY 's3cr3t';

GRANT ALL PRIVILEGES ON cerb.* TO cerb@localhost;

QUIT;
</code>
</pre>

<div class="cerb-box note">
	<p>Replace <tt>s3cr3t</tt> above with your own secret password. If you're using a remote database server, replace <tt>@localhost</tt> with a subnet used by your web servers, like: <tt>@'10.0.0.%'</tt></p>
</div>

# Configure PHP

Edit `C:\Program Files\PHP\v8.0\php.ini`

```ini
extension=php_curl.dll
extension=php_gd.dll
extension=php_mbstring.dll
extension=php_mysqli.dll
extension=php_openssl.dll
extension=php_mailparse.dll
extension=php_tidy.dll
extension=php_yaml.dll
```

**Start >> Command Prompt**

```shell
iisreset /restart

exit
```

# Download Cerb from Git Shell

**Start >> Git Bash**

```shell
cd /c/inetpub/wwwroot/

git clone https://github.com/cerb/cerb-release.git cerb

cd cerb
```

# Permissions

**Start >> File Explorer**

Navigate to C:\inetpub\www\root\cerb\storage\

**Properties >> Security**

**IUSR >> Full Control >> Recursively**

# Run the Cerb installer

Type the hostname of your server (e.g. `http://localhost/cerb/`) into a browser and follow the [guided installer](/docs/installation/#run-the-guided-installer).

# Next Steps

Set up [Friendly URLs](/docs/friendly-urls/).

Read the [Security Best Practices](/docs/security/).