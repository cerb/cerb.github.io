---
layout: page
title: Try Cerb Cloud
permalink: /demo/
redirect_from: /try/
jumbotron: 
  title: Evaluate Cerb with your team
  tagline: Try Cerb Cloud free for 30 days with no obligation
---

{% include forms/cloud_signup.html %}

# Frequently asked questions:

## What if I plan to host Cerb myself?

We still recommend that you start with a Cerb Cloud evaluation, so your team can immediately get to work learning about Cerb rather than getting bogged down with installation requirements and troubleshooting.

This also allows us to provide the highest level of assistance during your evaluation. We provide temporary email accounts so you can easily test incoming and outgoing messages, we've already installed the prerequisites for every plugin, etc.

All of your Cerb Cloud configuration and data can be exported to a standalone instance of Cerb at any time. Once you're confident that Cerb is a good fit for your team, we're happy to help you with that migration.

If you still need to evaluate Cerb in your own environment, you can simply [grab a copy of the project from GitHub](https://github.com/wgm/cerb) and follow the [installation instructions](/docs/installation).

## Do you require a credit card on file for evaluations?

Nope! All we require is a valid email address to contact you.

You'll never receive an invoice until you request one.

## Will an evaluation require me to change how I currently handle email?

Nope! A Cerb evaluation won't impact the way you're currently handling incoming or outgoing email (unless you want it to).

With Cerb Cloud, we provide you with a subdomain worth of temporary email addresses, like __*@example.cerb.email__. You can send and receive email from any of these addresses (e.g. billing@, support@, sales@), which makes it much easier to learn about automatically routing work to the appropriate groups/buckets in Cerb.

We also configure SPF, DKIM, and DMARC records for these temporary email addresses so you can [test our mail deliverability](http://mail-tester.com).

If you switch to a Cerb Cloud subscription, you can even use these email addresses in production, but you'll probably want to use your own domains.  We'll help you configure the SPF, DKIM, and DMARc records on your domains to optimize your mail deliverability from Cerb as well.

## How many workers can I invite to a Cerb Cloud evaluation?

All Cerb Cloud evaluations start in the _Pro_ tier. This provides unlimited worker accounts with __five__ seats (concurrent workers). Contact us if you need to test with more seats and we can raise the limit.