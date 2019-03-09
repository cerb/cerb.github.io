---
title: Integrate with Stripe
excerpt: A step-by-step guide for integrating Cerb and Stripe.
permalink: /guides/integrations/stripe/
layout: integration
topic: Integrations
subtopic: Stripe
jumbotron:
  title: Cerb + Stripe
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
    label: Stripe &raquo;
    url: /resources/guides/#stripe
---

* TOC
{:toc}

# Introduction

In this guide we'll walk through the process of linking Cerb to Stripe. You'll be able to use Stripe's full API from bots in Cerb to automate whatever you need.

<div class="cerb-screenshot">
<img src="/assets/images/guides/stripe/plugin/cerb-and-stripe.png" class="screenshot">
</div>

# Get your API keys from the Stripe dashboard

1. Visit the [Stripe API keys](https://dashboard.stripe.com/account/apikeys) settings page.

	<div class="cerb-screenshot">
	<img src="/assets/images/guides/stripe/plugin/stripe-api-keys.png" class="screenshot">
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
	<img src="/assets/images/guides/stripe/package-library-service-stripe.png" class="screenshot">
	</div>

1. Click the **Create** button.

# Use the connected account in bot behaviors

You can use the connected account you just created to access [Stripe's API](https://stripe.com/docs/api/curl) from bot behaviors in Cerb.  This is typically accomplished using the **Execute HTTP Request** action from a bot, and selecting the connected account in the **Authentication:** section.

You can import the [Stripe Bot](/packages/stripe-bot/) package for a working example.
