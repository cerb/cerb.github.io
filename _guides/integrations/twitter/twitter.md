---
title: Integrate with Twitter
excerpt: A step-by-step guide for integrating Cerb and Twitter.
permalink: /guides/integrations/twitter/
layout: integration
topic: Integrations
subtopic: Twitter
jumbotron:
  title: Cerb + Twitter
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
    label: Twitter &raquo;
    url: /resources/guides/#twitter
---

* TOC
{:toc}

# Introduction

In this guide we'll walk through the process of linking Cerb to Twitter. You'll be able to use Twitter's full API from bots in Cerb to automate whatever you need.

<div class="cerb-screenshot">
<img src="/assets/images/guides/twitter/plugin/cerb-and-twitter.png" class="screenshot">
</div>

# Create an OAuth application at Twitter

Next, you need to create a new OAuth app on Twitter for Cerb to connect to. Review the [Twitter Developer Documentation](https://dev.twitter.com) additionally if needed.

1. Visit the Twitter [Create an application](https://apps.twitter.com/app/new) developer page.

1. Enter the following details replacing the highlighted blocks with your info:
- **Name:** Cerb for `Your Company Name`
- **Description:** Connects your Twitter account with Cerb Helpdesk
- **Website:** `https://example.cerb.me`
- **Callback URL:** `https://YOUR-CERB-HOST/oauth/callback`

	<div class="cerb-screenshot">
	<img src="/assets/images/guides/twitter/plugin/twitter-new-app.png" class="screenshot">
	</div>

1. Click the **Create your Twitter application** button.

	<div class="cerb-screenshot">
	<img src="/assets/images/guides/twitter/plugin/twitter-new-app2.png" class="screenshot">
	</div>

	<div class="cerb-screenshot">
	<img src="/assets/images/guides/twitter/plugin/twitter-new-app3.png" class="screenshot">
	</div>

1. Make a note for the next step of your **Consumer Key** and **Consumer Secret** which can be found in the **Keys and Access Tokens** tab on the following page.

# Create the Twitter service in Cerb

1. Navigate to **Setup >> Configure >> Import Package**.

1. Paste the following package:

	<pre style="max-height:29.5em;">
	<code class="language-json">
	{% raw %}
	{
	  "package": {
	    "name": "Twitter Connected Service",
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
	          "label": "Client ID",
	          "key": "prompt_client_id",
	          "params": {
	            "default": "",
	            "placeholder": "(paste your Client ID)"
	          }
	        },
	        {
	          "type": "text",
	          "label": "Client Secret",
	          "key": "prompt_client_secret",
	          "params": {
	            "default": "",
	            "placeholder": "(paste your Client Secret)"
	          }
	        }
	      ]
	    }
	  },
	  "records": [
	    {
	      "uid": "service_twitter",
	      "_context": "connected_service",
	      "name": "Twitter",
	      "extension_id": "cerb.service.provider.oauth1",
	      "params": {
	        "grant_type": "authorization_code",
	        "client_id": "{{{prompt_client_id}}}",
	        "client_secret": "{{{prompt_client_secret}}}",
	        "request_token_url": "https://api.twitter.com/oauth/request_token",
	        "authentication_url": "https://api.twitter.com/oauth/authenticate",
	        "access_token_url": "https://api.twitter.com/oauth/access_token",
	        "signature_method_": "HMAC-SHA1"
	      }
	    },
	    {
	      "uid": "account_twitter",
	      "_context": "connected_account",
	      "name": "Twitter",
	      "service_id": "{{{uid.service_twitter}}}",
	      "owner__context": "cerberusweb.contexts.app",
	      "owner_id": "0",
	      "params": {}
	    }
	  ]
	}
	{% endraw %}
	</code>
	</pre>

1. Click the **Import** button.

1. Enter your client ID and secret from Twitter.

1. Click the **Import** button again.

# Link the connected account to Twitter in Cerb

1. Click on the **Twitter** bubble in the **Connected Accounts** section after importing the above package.

1. Click on the **Edit** button in the card popup.

1. Click the blue **Link to Twitter** button.

1. Accept consent on Twitter.

    <div class="cerb-screenshot">
    <img src="/assets/images/guides/twitter/plugin/oauth-approve.png" class="screenshot">
    </div>
    
1. Click the **Save Changes** button.

# Use the connected account in bot behaviors

You can use the connected account you just created to access [Twitter's API](https://dev.twitter.com/docs) from bot behaviors in Cerb.  This is typically accomplished using the **Execute HTTP Request** action from a bot, and selecting the connected account in the **Authentication:** section.

You can import the [Twitter Bot](/packages/twitter-bot/) package for a working example.
