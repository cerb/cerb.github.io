---
title: Share secure access to a local development environment with ngrok
excerpt: 
layout: integration
topic: Developers
jumbotron:
  title: Share secure access to a local development environment with ngrok
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

* TOC
{:toc}

# Introduction

We recommend building [bot](/docs/bots/) behaviors and [webhooks](/guides/webhooks/configure/) in a [local development environment](/guides/developers/run-webdriver-tests/) before deploying them to production.  This allows you to test without risking unexpected changes to your live data.

Your development machine may be behind a firewall or assigned a dynamic IP address. This makes it difficult to test functionality like webhooks where a remote server needs to directly access a URL on your machine. It also makes it difficult to use other testing tools like BrowserStack[^browserstack] that run against a publicly accessible URL.

You can solve these issues with **ngrok**[^ngrok] -- one of our favorite development tools.  You can use ngrok to quickly and easily create a temporary public URL for sharing secure access to your local machine.

# Install ngrok

To get started, you'll need to [download ngrok](https://ngrok.com/download) from their website and unzip it.  It runs on Mac, Windows, Linux, and FreeBSD.

On Linux, you can usually install ngrok from your package manager (e.g. apt, yum).

On Mac, you can also install ngrok using Homebrew[^homebrew] (note: you will need to install via `brew cask install ngok`).

# Start ngrok

Starting ngrok is incredibly simple:

<pre>
<code class="language-bash">
ngrok http localhost:80
</code>
</pre>

Above, we're starting ngrok in `http` mode using `localhost` on port `80`.  You can replace these values according to your needs.

When ngrok starts, it generates an HTTP and HTTPS URL for you to use.  This means you don't need to hassle with configuring SSL on your local development machine.

You can copy these links from the console and use them like any other public URL.

<div class="cerb-screenshot">
<img src="/assets/images/guides/ngrok/console.png" class="screenshot">
</div>

# Test ngrok

Paste your ngrok HTTPS URL into your web browser.  If you have a copy of Cerb running on `localhost:80` then you (and anyone else) will be able to use it as if it was installed on a public web server.

If you're testing webhooks, you can copy the ngrok version of the webhook URL from **Setup >> Services >> Webhooks** after logging in.  You can then paste this URL into any app or service that supports webhooks.

# Monitor ngrok connections

ngrok also has a web interface that starts on `http://127.0.0.1:4040` by default.

This allows you to inspect incoming requests and outgoing responses, which is incredibly helpful when you're debugging functionality like webhooks.

You also have the option of _replaying_ a previous request from this web interface, which makes your job a lot easier when developing webhooks. You won't have to waste your time constantly triggering an event and waiting for the webhook request to show up.

<div class="cerb-screenshot">
<img src="/assets/images/guides/ngrok/web-monitor.png" class="screenshot">
</div>

# Next steps

ngrok is free to use, with some limitations.  You're limited on the number of connections per minute to your machine, as well as the number of tunnels and processes.  On free plans, your tunnels will also always use a random hostname.

They offer paid plans to increase these limits, as well as enabling the use of reserved domains and IPs, and providing priority support.

# References

[^browserstack]: BrowserStack: Live web-based browser testing - <https://www.browserstack.com>

[^homebrew]: HomeBrew: The missing package manager for macOS - <https://brew.sh>

[^ngrok]: ngrok: Secure tunnels to localhost - <https://ngrok.com>
