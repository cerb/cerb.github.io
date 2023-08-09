---
title: Security
permalink: /docs/security/
excerpt: Best practices for securing your Cerb installation.
jumbotron:
  title: Security
  tagline: Best practices for securing your Cerb installation.
  breadcrumbs:
  -
    label: Docs &raquo;
    url: /docs/home/
  -
    label: Admin Guide &raquo;
  -
    label: Installation &raquo;
    url: /docs/installation/self-hosted/
---

{% comment %}
(( proxies, X-Forwarded-For ))

(( two-factor ))

(( admin vs worker account usage ))

(( XSS/CSRF ))

.. TODO: Password hashes (salting, key stretching)
.. TODO: Delay login failures
.. TODO: Log auth failures
{% endcomment %}

* TOC
{:toc}

## Introduction

Traditionally, when you access a URL like `http://www.example.com/pages/help.html` from your browser there is a corresponding file with the name `help.html` on the webserver in the `pages/` directory. This is how resources like HTML, images, Javascript, CSS, and other files are made available for download.

Cerb uses a different approach for serving content, which is known to web application developers as the **Model-View-Controller (MVC)**[^mvc] design pattern.  The pages that your workers interact with are _virtual_ -- there isn't a file on your webserver that corresponds with each URL.

All public interaction with the application occurs in two main files in the home directory of your Cerb installation:

- **index.php** returns *responses* for "full-cycle" HTTP *requests*. These requests occur when you type a URL into your browser, click a link, or request a resource (e.g. image, script, stylesheet, file download). The typical response is to render a new page of output, often including a header, top-level menu, body content, and footer.

- **ajax.php** returns *responses* for **Asynchronous Javascript And XML (Ajax)**[^ajax] *requests*. *"Asynchronous"* refers to the fact that these requests happen silently in the background, and your browser won't clear the existing page contents as it would during a full-cycle request. Ajax requests are used to provide functionality aimed at making web applications feel more responsive and interactive (in a way that only desktop applications used to be). These requests generally only affect one part of the greater whole.

Here are some common examples of Ajax functionality:

- Autocomplete suggestions from the address book when you begin typing an email address.

- A list that refreshes its contents after sorting or paging without redrawing the entire page.

- Pulling up supplemental information from the server without leaving the page you're on. For example, if you hover over an email address the interface may display a tooltip with the past 10 conversations you've had with that particular contact. This information is being downloaded from the server in real-time, as it's usually far too much information to send in advance for all possible interface interactions.

## Protecting filesystem access

You only need to expose three Cerb files to the outside world. The application will transparently manage access to other resources, such as images or file attachment downloads.

You should make the following files available to web requests:

-  `ajax.php`
-  `index.php`
-  `favicon.ico`

Browser access to the following locations should be forbidden:

-  `.git/`
-  `api/`
-  `features/`
-  `libs/`
-  `storage/`
-  `vendor/`

### Nginx

With **nginx**, you can use the following directive in your server configuration:

<pre>
<code class="language-nginx">
location ~ ^/cerb/(\.git|api|features|libs|storage|vendor)/ {
    return 403;
}
</code>
</pre>

Make sure that Nginx only sends requests for `/index.php` and `/ajax.php` to PHP.

### Apache

If you're using the provided `.htaccess` file for [friendly URLs](/docs/friendly-urls/) in Apache[^apache], then we've already given you some defaults for blocking access to these directories:

<pre>
<code class="language-apache">
RewriteRule ^(.*/)?\.git(/|$) - [F,L]
RewriteRule ^(.*/)?api(/|$) - [F,L]
RewriteRule ^(.*/)?features(/|$) - [F,L]
RewriteRule ^(.*/)?libs(/|$) - [F,L]
RewriteRule ^(.*/)?storage(/|$) - [F,L]
RewriteRule ^(.*/)?vendor(/|$) - [F,L]
</code>
</pre>

You can also prevent PHP from executing in certain locations (such as `storage/`) with the following directive in a `<VirtualHost>` block or an `.htaccess` file:

<pre>
<code class="language-apache">
php_flag engine off
</code>
</pre>

## File permissions

Cerb's files should be owned by your webserver user.  The webserver should have _read privileges_ on all files and directories, but only _write privileges_ on the `storage/` directory.

The following permissions are recommended.

Set the owner and group of files to the webserver user:

<pre class="command-line" data-user="user" data-host="host">
<code class="language-bash">
chown -R www-data:www-data .
</code>
</pre>

Make files read-only by the webserver, and nobody else:

<pre class="command-line" data-user="user" data-host="host">
<code class="language-bash">
find . -type f -exec chmod 400 {} \;
</code>
</pre>

Make directories read/list-only by the webserver, and nobody else:

<pre class="command-line" data-user="user" data-host="host">
<code class="language-bash">
find . -type d -exec chmod 500 {} \;
</code>
</pre>

Make everything in storage/ writeable by the webserver user:

<pre class="command-line" data-user="user" data-host="host">
<code class="language-bash">
chmod -R u+w storage/
</code>
</pre>

<div class="cerb-box note">
	<p>Your webserver's user and group may be something other than <tt>www-data</tt>.</p>
</div>

<div class="cerb-box warning">
	<p>The webserver user should never have write access to PHP files; because if the application is compromised through a vulnerability then it allows an attacker to modify a <tt>.php</tt> file and execute arbitrary code on your server.</p>
</div>

## Restricting PHP functions

It's a good idea to restrict PHP functions that allow arbitrary commands to be executed on the system.  In the `php.ini` file you can use the following option:

<pre>
<code class="language-ini">
disable_functions = pcntl_alarm,pcntl_fork,pcntl_waitpid,pcntl_wait,pcntl_wifexited,pcntl_wifstopped,pcntl_wifsignaled,pcntl_wifcontinued,pcntl_wexitstatus,pcntl_wtermsig,pcntl_wstopsig,pcntl_signal,pcntl_signal_dispatch,pcntl_get_last_error,pcntl_strerror,pcntl_sigprocmask,pcntl_sigwaitinfo,pcntl_sigtimedwait,pcntl_exec,pcntl_getpriority,pcntl_setpriority,show_source,system,exec,passthru,proc_nice,proc_open,popen,shell_exec,
</code>
</pre>

## Considerations for HTTP Authentication and IP-based security

Your organization may have a requirement that all worker access should be password protected or restricted to requests coming from inside your corporate network. That's a fine policy, but there are a few things you need to consider when implementing a firewall, HTTP authentication, or IP-based security restrictions.

### Scheduled tasks

All scheduled tasks are triggered by automated requests to the `/cerb/cron` URL. If these requests are coming from a cronjob on the same webserver then this usually doesn't present a problem. However, once you've established IP-based restrictions you should test the scheduled automated access to that URL to make sure it can get through. These scripts will also need to provide HTTP authentication details if you're enforcing them.

### Web-API

If you have applications that use the [Web-based API](/docs/api/) to integrate with Cerb then you'll need to make sure they can make requests to the `/cerb/rest/*` path. You'll need to provide some extra code to handle HTTP Authentication.

### Community portals

Community portals also make requests to Cerb. If you install a portal like the Support Center on an external webserver then you need to make sure that machine can make requests to the `/cerb/portal/*` path. The default community portal script doesn't provide a mechanism for HTTP authentication, but you could provide an override by IP address.

# References

[^ajax]: Wikipedia: *Asynchronous Javascript and XML (Ajax)* <http://en.wikipedia.org/wiki/Ajax_(programming)>
[^apache]: Apache: *Protecting Server Files* <http://httpd.apache.org/docs/2.4/misc/security_tips.html#protectserverfiles>
[^mvc]: Wikipedia: *Model-View-Controller (MVC)* <http://en.wikipedia.org/wiki/Model-View-Controller>
