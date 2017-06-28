---
title: Build a test environment with WebDriver automation
excerpt: Cerb provides a WebDriver test suite that automatically builds a test environment by remote controlling a web browser.
layout: integration
topic: Developers
jumbotron:
  title: Build a test environment with WebDriver automation
  tagline: ""
  breadcrumbs:
  -
    label: Resources &raquo;
    url: /resources/
  -
    label: Guides &raquo;
    url: /resources/guides/
  -
    label: Developers &raquo;
    url: /resources/guides/#developers
---

# Introduction

Cerb provides a WebDriver test suite that automatically builds a clean test environment by remote controlling a web browser. This verifies that Cerb functions as expected and creates realistic sample data for testers, developers, and evaluators.

<div class="cerb-box note">
	<p>
	You must run the WebDriver tests in a development environment on a fresh copy of Cerb.
	</p>
</div>

* TOC
{:toc}

# Create a development environment

### Clone a copy of Cerb from GitHub

<pre>
<code class="language-bash">
git clone https://github.com/cerb/cerb-release.git cerb_test
</code>
</pre>

<pre>
<code class="language-bash">
cd cerb_test
</code>
</pre>

### Create a new database

Log into MySQL as an administrator and create a new database and user:

<pre>
<code class="language-sql">
CREATE DATABASE cerb_test CHARACTER SET utf8;
GRANT ALL PRIVILEGES ON cerb_test.* TO cerb@localhost IDENTIFIED BY 's3cr3t';
</code>
</pre>

### Configure the database connection

Edit the `framework.config.php` file and configure the database connection:

<pre>
<code class="language-php">
define('APP_DB_ENGINE','innodb');
define('APP_DB_DATABASE','cerb_test');
define('APP_DB_HOST','localhost');
define('APP_DB_USER','cerb');
define('APP_DB_PASS','s3cr3t');
</code>
</pre>

### Start PHP's built-in web server

<pre>
<code class="language-bash">
php -S localhost:8080
</code>
</pre>

# Prepare the test suite

### Navigate to the tests directory

<pre>
<code class="language-bash">
cd tests
</code>
</pre>

### Install Composer

Run the following command to see if Composer is already installed:

<pre>
<code class="language-bash">
	composer --version
</code>
</pre>

If the command isn't found, follow these instructions to install Composer:

<https://getcomposer.org/download/>

### Run Composer

Once Composer is installed, you can install the required dependencies like PHPUnit:

<pre>
<code class="language-bash">
	composer install
</code>
</pre>

# Run the platform unit tests

At this point you should run the platform unit tests to make sure everything is working properly.

<pre>
<code class="language-bash">
vendor/bin/phpunit -c phpunit.cerb.platform.xml 
</code>
</pre>

You should see output like:

<pre>
<code class="language-text">
PHPUnit 5.7.21 by Sebastian Bergmann and contributors.

.............................................                     45 / 45 (100%)

Time: 122 ms, Memory: 12.00MB

OK (45 tests, 225 assertions)
</code>
</pre>

This means that Cerb is ready to install on your server.

# Run the database installation tests

Test the installation process by populating the new Cerb database:

<pre>
<code class="language-bash">
vendor/bin/phpunit -c phpunit.cerb.install.xml
</code>
</pre>

You should see output like:

<pre>
<code class="language-text">
PHPUnit 5.7.21 by Sebastian Bergmann and contributors.

.....                                                               5 / 5 (100%)

Time: 4.85 seconds, Memory: 14.00MB
</code>
</pre>

This means that no issues were encountered while running the installer and creating Cerb's database schema.

### Finish the installation

Navigate to <http://localhost:8080/index.php/> and complete the installation.

Close the browser window when finished.

# Run the WebDriver tests

Now we'll configure the WebDriver tests to automatically create sample data using Cerb's web interface.

### Configure WebDriver

Edit the `bootstrap.eval.php` file.

The defaults will work for the steps above, but if you need to make changes these are the two important lines:

<pre>
<code class="language-php">
// The URL to Selenium's WebDriver API
define('WEBDRIVER_URL', 'http://localhost:4444/wd/hub');

// The URL where you installed Cerb
define('BROWSER_URL', 'http://localhost:8080/index.php');
</code>
</pre>

By default, WebDriver will attempt to run the tests in the Safari browser.  You can choose a different browser by uncommenting only one of these lines:

<pre>
<code class="language-php">
// Pick one:
$capabilities = DesiredCapabilities::safari();
//$capabilities = DesiredCapabilities::firefox();
//$capabilities = DesiredCapabilities::chrome();
</code>
</pre>

### Start Selenium

Start the Selenium Server:

<pre>
<code class="language-bash">
vendor/bin/selenium-server-standalone
</code>
</pre>

This is where WebDriver will connect to remote control your web browser.

### Run the WebDriver tests

Now we're ready for the automation to begin.  Run the WebDriver unit tests:

<pre>
<code class="language-bash">
vendor/bin/phpunit -c phpunit.cerb.eval.xml 
</code>
</pre>

You should see a web browser start up and automatically perform a series of actions.

At the end, you should have output like:

<pre>
<code class="language-text">
PHPUnit 5.7.21 by Sebastian Bergmann and contributors.

.................................................                 49 / 49 (100%)

Time: 3.51 minutes, Memory: 9.06MB

OK (49 tests, 87 assertions)
</code>
</pre>

Your sample database has been created.

You can shut down the Selenium Server by pressing `<CTRL> + C`.

# Log in to your new test instance

Now you can log in to your new Cerb instance to begin your testing.

Navigate to: <http://localhost:8080/index.php/login/>

The following accounts are available:

| Email | Password
|:-|:-|
| `kina@cerb.example` (**admin**) | `cerb`
| `milo@cerb.example` | `cerb`
| `janey@cerb.example` | `cerb`
| `karl@cerb.example` | `cerb`
| `mara@cerb.example` | `cerb`
| `ned@cerb.example` | `cerb`

# Finishing up

You can [import additional packages](/resources/packages/) based on your needs.