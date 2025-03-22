---
title: Stripe
excerpt: A step-by-step guide for integrating Cerb and Stripe.
summary: This page provides a comprehensive guide on integrating Cerb with Stripe.
  It covers the steps to obtain API keys from the Stripe dashboard, create a Stripe
  service within Cerb, and utilize the connected account in bot behaviors. The guide
  explains how to automate processes using Stripe's API through Cerb bots, including
  executing HTTP requests with the connected account for authentication. Additionally,
  it mentions the availability of a Stripe Bot package for practical implementation
  examples.
social_image_url: /assets/images/solutions/integrations/stripe/plugin/cerb-and-stripe.png
redirect_from:
  - /guides/integrations/stripe/
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

In this guide we'll walk through the process of linking Cerb to Stripe. You'll be able to use Stripe's full API from bots in Cerb to automate whatever you need.

# Get your API keys from the Stripe dashboard

1. Visit the [Stripe API keys](https://dashboard.stripe.com/account/apikeys) settings page.

	<div class="cerb-screenshot">
	<img src="/assets/images/solutions/integrations/stripe/plugin/stripe-api-keys.png" class="screenshot">
	</div>

1. Make a note of your **Publishable Key** and **Secret Key** for the next step.

# Create the Stripe service in Cerb

1. Navigate to **Search >> Connected Services**.

1. Click the **(+)** icon in the top right of the list.

1. Select **Stripe**.

	<div class="cerb-screenshot">
	<img src="/assets/images/guides/common/package-library-connected-services.png" class="screenshot">
	</div>

1. Enter your Publishable Key and Secret Key.

	<div class="cerb-screenshot">
	<img src="/assets/images/solutions/integrations/stripe/package-library-service-stripe.png" class="screenshot">
	</div>

1. Click the **Create** button.

# Use the connected account in automations

You can use the connected account you just created to access [Stripe's API](https://stripe.com/docs/api/curl) from automations in Cerb.  This is typically accomplished using the `http.request` command and selecting the connected account in the `authentication` field.

## Examples
### Create a payment link
{% highlight cerb %}
{% raw %}
start:
  http.request/link:
    output: http_response
    inputs:
      method: POST
      url: https://api.stripe.com/v1/payment_links
      headers:
        Content-Type: application/x-www-form-urlencoded
      authentication: cerb:connected_account:stripe
      body:
        line_items:
          0:
            price: price_1234567890abcdefghijkl
            quantity: 1
    on_success:
      set:
        response_body@json: {{http_response.body}}
      return:
        url: {{response_body.url}}
{% endraw %}
{% endhighlight %}

### Create a subscription

{% highlight cerb %}
{% raw %}
start:
  http.request/subscription:
    output: http_response
    inputs:
      method: POST
      url: https://api.stripe.com/v1/subscriptions
      headers:
        Content-Type: application/x-www-form-urlencoded
      authentication: cerb:connected_account:stripe
      body:
        customer: cus_1234567890abcdefghijkl
        items:
          0:
            price: price_1234567890abcdefghijkl
{% endraw %}
{% endhighlight %}

### Create an invoice

{% highlight cerb %}
{% raw %}
start:
  http.request/invoice:
    output: http_response
    inputs:
      method: POST
      url: https://api.stripe.com/v1/invoices
      headers:
        Content-Type: application/x-www-form-urlencoded
      authentication: cerb:connected_account:stripe
      body:
        customer: cus_1234567890abcdefghijkl
        subscription: sub_1234567890abcdefghijkl
{% endraw %}
{% endhighlight %}

## Bot

You can import the [Stripe Bot](/packages/stripe-bot/) package for a working example.
