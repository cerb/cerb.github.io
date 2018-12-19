---
title: Integrate with Facebook
excerpt: A step-by-step guide for integrating Cerb and Facebook.
permalink: /guides/integrations/facebook/
layout: integration
topic: Integrations
subtopic: Facebook
jumbotron:
  title: Cerb + Facebook
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
    label: Facebook &raquo;
    url: /resources/guides/#facebook
---

* TOC
{:toc}

# Introduction

<div class="cerb-screenshot">
<img src="/assets/images/guides/facebook/plugin/cerb-and-facebook.png" class="screenshot">
</div>

In this guide we'll walk through the process of linking a Facebook account to Cerb. You'll be able to use Facebook's full API from bots in Cerb to automate whatever you need.

# Create an app at Facebook

Next, you need to create a new app on Facebook for Cerb to connect to.

1. Open <https://developers.facebook.com> and sign in.

1. In the top right, click **My Apps >> Add a New App**.
    <div class="cerb-screenshot">
    <img src="/assets/images/guides/facebook/plugin/facebook-new-app.png" class="screenshot">
    </div>

1. In the menu on the left, select **Settings**.

1. Under **App Domains**, add the domain where you host Cerb (e.g. `example.cerb.me`).

1. Click the **+ Add Platform** button at the bottom and select **Website**.

1. In **Site URL**, add the URL to your Cerb installation (e.g. `https://YOUR-CERB-HOST`).

1. Click the blue **Saves Changes** button in the bottom right.

1. Make a note of your **App ID** and **App Secret** for the next step.

# Create the Facebook service in Cerb

1. Navigate to **Setup >> Configure >> Import Package**.

2. Paste the following package:

	<pre style="max-height:29.5em;">
	<code class="language-json">
	{% raw %}
	{
	  "package": {
	    "name": "Facebook Connected Service",
	    "revision": 1,
	    "requires": {
	      "cerb_version": "9.1.0",
	      "plugins": [

	      ]
	    },
	    "configure": {
	      "placeholders": [

	      ],
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
	      "uid": "service_facebook",
	      "_context": "connected_service",
	      "name": "Facebook",
	      "extension_id": "cerb.service.provider.oauth2",
	      "params": {
	        "grant_type": "authorization_code",
	        "client_id": "{{{prompt_client_id}}}",
	        "client_secret": "{{{prompt_client_secret}}}",
	        "authorization_url": "https://graph.facebook.com/oauth/authorize",
	        "access_token_url": "https://graph.facebook.com/oauth/access_token",
	        "resource_owner_url": "",
	        "scope": "public_profile,read_page_mailboxes,manage_pages,publish_pages",
	        "approval_prompt": "auto"
	      }
	    },
	    {
	      "uid": "account_facebook",
	      "_context": "connected_account",
	      "name": "Facebook",
	      "service_id": "{{{uid.service_facebook}}}",
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

1. Enter your client ID and secret from Facebook.

1. Click the **Import** button again.

# Link the connected account to Facebook in Cerb

1. Click on the **Facebook** bubble in the **Connected Accounts** section after importing the above package.

1. Click on the **Edit** button in the card popup.

1. Click the blue **Link to Facebook** button.

1. Accept consent on Facebook.

1. Click the **Save Changes** button.

# Create connected accounts for Facebook Pages

1. Navigate to **Setup >> Connected Accounts**.

1. Click the **(+)** icon above the worklist.

1. Click **Facebook Pages**.
	* Name: `(your page name)`
	* Owner: **Cerb**
	* Facebook Account: (select the Facebook account from above)

1. This will display a list of Facebook pages associated with your account. Select one.

1. Click the **Save Changes** button.

You can repeat the steps in this section for all of your Facebook pages.

# Use the connected account in bot behaviors

You can use the connected account you just created to access [Facebook's Graph API](https://developers.facebook.com/docs/graph-api) from bot behaviors in Cerb.  This is typically accomplished using the **Execute HTTP Request** action from a bot, and selecting the connected account in the **Authentication:** section.

You can import the [Facebook Page Bot](/packages/facebook-page-bot/) package for a working example.