---
title: Integrate with ipstack
excerpt: A step-by-step guide for integrating Cerb and ipstack.
permalink: /guides/integrations/ipstack/
social_image_url: /assets/images/guides/integrations/ipstack/interaction-geolocate.png
layout: integration
topic: Integrations
subtopic: Ipstack
jumbotron:
  title: Cerb + ipstack
  tagline: ""
  breadcrumbs:
  -
    label: Resources &raquo;
    url: /resources/
  -
    label: Guides &raquo;
    url: /resources/guides/
  -
    label: Integrations &raquo;
    url: /resources/guides/#integrations
  -
    label: ipstack &raquo;
    url: /resources/guides/#ipstack
---

* TOC
{:toc}

# Introduction

In this guide we'll walk through the process of linking Cerb to ipstack. You'll be able to use [ipstack's API](https://ipstack.com/documentation) from automations to perform geolocation.

Let's assume we have a list of client IP addresses and want to plot them on a map to visualize where activity is coming from.

First, it's important to acknowledge that locations derived from IP addresses are approximate. Clients may be using VPNs, proxies, third party services, etc. The location may be an ISP, or the contact information for the registered owner of a block of IP addresses.

<div class="cerb-screenshot">
<img src="/assets/images/guides/integrations/ipstack/interaction-geolocate.png" class="screenshot">
</div>

# Sign up at ipstack

Like [geocoding](https://github.com/cerb/cerb-release/discussions/9), IP-based geolocation uses a large dataset. It wouldn't make sense to ship this with Cerb, so we'll be using an API from [ipstack](https://ipstack.com/).

You can sign up for a [free API key](https://ipstack.com/product/) at ipstack and make 1,000 IP location requests per month at no cost.

Once you sign up, make a note of your API Access Key so you can use it within Cerb.

# Create the connected account in Cerb

In Cerb, navigate to **Search >> Connected Services >> (+)** and select IPstack from the **Library**.

Paste your API Access Key from above.

# Related Resources

* Workflow: [Geolocate IPs with IPstack](/workflows/cerb.integrations.ipstack/)
