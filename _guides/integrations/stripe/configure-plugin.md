---
title: Configure the Stripe plugin
excerpt: A step-by-step guide for configuring Cerb's Stripe plugin
layout: integration
topic: Integrations
subtopic: Stripe
jumbotron:
  title: Configure the Stripe plugin
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

# Install the Stripe plugin

First, you need to install and enable the Stripe plugin in Cerb.

1. Navigate to **Setup >> Plugins >> Installed Plugins**

1. Search for: `stripe`

1. Find the **Stripe Integration** plugin in the worklist and click its **Configure** button.  If the plugin isn't installed, you can download it from the [plugin library](/docs/plugins#library).

1. In the **Status:** field, select _Enabled_.

1. Click the **Save Changes** button.

# Get your API keys from the Stripe dashboard

1. Visit the [Stripe API keys](https://dashboard.stripe.com/account/apikeys) settings page.

	<div class="cerb-screenshot">
	<img src="/assets/images/guides/stripe/plugin/stripe-api-keys.png" class="screenshot">
	</div>

1. Make a note of your **Publishable Key** and **Secret Key** for the next step.

# Add a connected account in Cerb

Now we can create connected accounts to securely store Stripe credentials in Cerb.

1. Navigate to **Search >> Connected Accounts**.

1. Click the **(+)** icon above the worklist to add a new account.
    <div class="cerb-screenshot">
    <img src="/assets/images/guides/common/new-connected-account.png" class="screenshot">
    </div>

1. Click on **Stripe**.

1. Paste your Stripe **Publishable Key**.

1. Paste your Stripe **Secret Key**.

1. Enter the following details:
- **Name:** Stripe
- **Owner:** Cerb

    <div class="cerb-screenshot">
    <img src="/assets/images/guides/stripe/plugin/connected-account.png" class="screenshot">
    </div>

1. Click the **Save Changes** button.

If everything was configured properly, you'll see the new connected account in your worklist.

# Use the connected account in bot behaviors

You can use the connected account you just created to access [Stripe's API](https://stripe.com/docs/api/curl) from bot behaviors in Cerb.  This is typically accomplished using the **Execute HTTP Request** action from a bot, and selecting the connected account in the **Authentication:** section.

You can import the [Stripe Bot](/packages/stripe-bot/) package for a working example.
