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

1. Navigate to **Setup >> Configure >> Import Package**.

1. Paste the following package:

	<pre style="max-height:29.5em;">
	<code class="language-json">
	{% raw %}
	{
	  "package": {
	    "name": "Stripe Connected Service",
	    "revision": 1,
	    "requires": {
	      "cerb_version": "9.1.0",
	      "plugins": []
	    },
	    "configure": {
	      "placeholders": [],
	      "prompts": [
	        {
	          "type": "text",
	          "label": "Publishable Key",
	          "key": "prompt_publishable_key",
	          "params": {
	            "default": "",
	            "placeholder": "(paste your Publishable Key)"
	          }
	        },
	        {
	          "type": "text",
	          "label": "Secret Key",
	          "key": "prompt_secret_key",
	          "params": {
	            "default": "",
	            "placeholder": "(paste your Secret Key)"
	          }
	        }
	      ]
	    }
	  },
	  "records": [
	    {
	      "uid": "service_stripe",
	      "_context": "connected_service",
	      "name": "Stripe",
	      "extension_id": "cerb.service.provider.http.basic",
	      "params": {
	        "base_url": "https://api.stripe.com/"
	      }
	    },
	    {
	      "uid": "account_stripe",
	      "_context": "connected_account",
	      "name": "Stripe",
	      "service_id": "{{{uid.service_stripe}}}",
	      "owner__context": "cerberusweb.contexts.app",
	      "owner_id": "0",
	      "params": {
	        "username": "{{{prompt_publishable_key}}}",
	        "password": "{{{prompt_secret_key}}}"
	      }
	    }
	  ]
	}
	{% endraw %}
	</code>
	</pre>

1. Click the **Import** button.

1. Enter your publishable and secret keys from Stripe.

1. Click the **Import** button again.

# Use the connected account in bot behaviors

You can use the connected account you just created to access [Stripe's API](https://stripe.com/docs/api/curl) from bot behaviors in Cerb.  This is typically accomplished using the **Execute HTTP Request** action from a bot, and selecting the connected account in the **Authentication:** section.

You can import the [Stripe Bot](/packages/stripe-bot/) package for a working example.
