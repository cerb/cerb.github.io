---
layout: page
title: Try Cerb Cloud
permalink: /cloud/try/
redirect_from: /try/
jumbotron: 
  title: Try Cerb Cloud free for 30 days
  tagline: Risk-free with no payment information required.
  breadcrumbs:
  -
    label: Cerb Cloud Subscriptions &raquo;
    url: /cloud/
---

{% include forms/cloud_signup.html %}

<br>

# Frequently asked questions:

<br>

## What if I plan to eventually host Cerb myself?

We still recommend that you start with a Cerb Cloud trial, so your team can immediately get to work learning about Cerb rather than getting bogged down with installation requirements and troubleshooting.

This also allows us to provide the highest level of assistance during your evaluation. We provide temporary email accounts so you can easily test incoming and outgoing messages, we've already installed the prerequisites for every plugin, etc.

All of your Cerb Cloud configuration and data can be exported to a standalone instance of Cerb at any time. Once you're confident that Cerb is a good fit for your team, we're happy to help you with that migration.

If you still need to evaluate Cerb in your own environment, you can simply [grab a copy of the project from GitHub](https://github.com/wgm/cerb) and follow the [installation instructions](/docs/installation).

## Do you require a credit card to start a free trial?

No! All we require is a valid email address to contact you.

You'll never receive an invoice until you request one.

## Will a Cerb Cloud trial require me to change how I currently handle email?

Nope! A Cerb evaluation won't impact the way you're currently handling incoming or outgoing email (unless you want it to).

With Cerb Cloud, we provide you with a subdomain worth of temporary email addresses, like __*@example.cerb.email__. You can send and receive email from any of these addresses (e.g. billing@, support@, sales@), which makes it much practice routing work to the appropriate groups/buckets in Cerb.

We also configure SPF, DKIM, and DMARC records for these temporary email addresses so you can [test our mail deliverability](http://cerb.io/docs/quick-start/#send-a-message-to-test-mail-deliverability).

If you switch to a Cerb Cloud subscription, you can even use these email addresses in production, but you'll probably want to use your own domains.  We'll help you configure the SPF, DKIM, and DMARC records on your domains to optimize your mail deliverability from Cerb as well.

## How many workers can I invite to a Cerb Cloud trial?

All Cerb Cloud trials start in the _Pro_ tier. This provides unlimited worker accounts with __five__ seats (concurrent workers). Contact us if you need to test with more seats and we can raise the limit.