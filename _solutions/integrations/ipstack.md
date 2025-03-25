---
title: ipstack
excerpt: A step-by-step guide for integrating Cerb and ipstack.
summary: This page provides a guide on integrating Cerb with ipstack to utilize its
  API for geolocation purposes. It outlines the steps to sign up for an ipstack account,
  obtain a free API key, and create a connected account in Cerb to enable IP-based
  geolocation. The guide emphasizes the approximate nature of IP-derived locations
  due to factors like VPNs and proxies. Additionally, it includes related resources
  for further workflow automation using ipstack within Cerb.
social_image_url: /assets/images/solutions/integrations/ipstack/interaction-geolocate.png
redirect_from:
  - /guides/integrations/ipstack/
layout: solution
jumbotron:
  breadcrumbs:
    - label: Resources &raquo;
      url: /resources/
    - label: Solutions Hub &raquo;
      url: /solutions/
    - label: Integrations &raquo;
      url: /solutions/#integrations
---

* TOC
{:toc}

# Introduction

In this guide we'll walk through the process of linking Cerb to ipstack. You'll be able to use [ipstack's API](https://ipstack.com/documentation) from automations to perform geolocation.

Let's assume we have a list of client IP addresses and want to plot them on a map to visualize where activity is coming from.

First, it's important to acknowledge that locations derived from IP addresses are approximate. Clients may be using VPNs, proxies, third party services, etc. The location may be an ISP, or the contact information for the registered owner of a block of IP addresses.

# Sign up at ipstack

Like [geocoding](https://github.com/cerb/cerb-release/discussions/9), IP-based geolocation uses a large dataset. It wouldn't make sense to ship this with Cerb, so we'll be using an API from [ipstack](https://ipstack.com/).

You can sign up for a [free API key](https://ipstack.com/product/) at ipstack and make 1,000 IP location requests per month at no cost.

Once you sign up, make a note of your API Access Key so you can use it within Cerb.

# Create the connected account in Cerb

In Cerb, navigate to **Search >> Connected Services >> (+)** and select IPstack from the **Library**.

Paste your API Access Key from above.

# Examples

## Simple IP lookup

{% highlight cerb %}
{% raw %}
start:
  http.request/geolocate:
    output: http_response
    inputs:
      method: GET
      url: http://api.ipstack.com/1.2.3.4
      authentication: cerb:connected_account:ipstack
    on_success:
      set:
        response@json: {{http_response.body}}
        http_response@json: null
{% endraw %}
{% endhighlight %}

## Bulk IP lookup

*Not available on free or basic tier*

{% highlight cerb %}
{% raw %}
start:
  http.request/geolocate:
    output: http_response
    inputs:
      method: GET
      url: http://api.ipstack.com/1.2.3.4,5.4.3.2
      authentication: cerb:connected_account:ipstack
    on_success:
      set:
        response@json: {{http_response.body}}
        http_response@json: null
{% endraw %}
{% endhighlight %}

# Related Resources

* Workflow: [Geolocate IPs with IPstack](/workflows/cerb.integrations.ipstack/)
