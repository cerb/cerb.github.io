---
title: Integrate with Dropbox
excerpt: A step-by-step guide for integrating Cerb and Dropbox.
permalink: /guides/integrations/dropbox/
social_image_url: /assets/images/guides/dropbox/cerb-and-dropbox.png
layout: integration
topic: Integrations
subtopic: Dropbox
jumbotron:
  title: Cerb + Dropbox
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
    label: Dropbox &raquo;
    url: /resources/guides/#dropbox
---

* TOC
{:toc}

# Introduction

<div class="cerb-screenshot">
<img src="{{page.social_image_url}}" class="screenshot">
</div>

In this guide we'll walk through the process of linking Cerb to Dropbox. You'll be able to use Dropbox's full API from bots in Cerb to automate whatever you need.

# Create an app at Dropbox

First, you need to create a new app on Dropbox for Cerb to connect to.

1. Open <https://www.dropbox.com/developers/apps> and sign in.

1. In the top right, click **Create app**.
    <div class="cerb-screenshot">
    <img src="/assets/images/guides/dropbox/plugin/dropbox-new-app.png" class="screenshot">
    </div>

1. Select **Dropbox API**.

1. Select the folders you want Cerb to be able to access.

1. Name your app (e.g. "Cerb").

1. Agree to the Dropbox API terms and conditions.

1. Click the blue **Create app** button.

1. Configure your **OAuth 2 Redirect URIs**:

  <pre>
  <code class="language-text">
  https://YOUR-CERB-HOST/oauth/callback
  </code>
  </pre>

Make a note of your **App key** and **App secret** for the next step.

# Create the Dropbox service in Cerb

1. Navigate to **Setup >> Configure >> Import Package**.

1. Paste the following package:

	<pre style="max-height:29.5em;">
	<code class="language-json">
	{% raw %}
	{
	  "package": {
	    "name": "Dropbox Connected Service",
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
	      "uid": "service_dropbox",
	      "_context": "connected_service",
	      "name": "Dropbox",
	      "extension_id": "cerb.service.provider.oauth2",
	      "params": {
	        "grant_type": "authorization_code",
	        "client_id": "{{{prompt_client_id}}}",
	        "client_secret": "{{{prompt_client_secret}}}",
	        "authorization_url": "https://www.dropbox.com/oauth2/authorize",
	        "access_token_url": "https://api.dropboxapi.com/oauth2/token",
	        "resource_owner_url": "",
	        "scope": "",
	        "approval_prompt": ""
	      }
	    },
	    {
	      "uid": "account_dropbox",
	      "_context": "connected_account",
	      "name": "Dropbox",
	      "service_id": "{{{uid.service_dropbox}}}",
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

1. Enter your client ID and secret from Dropbox.

1. Click the **Import** button again.

# Link the connected account to Dropbox in Cerb

1. Click on the **Dropbox** bubble in the **Connected Accounts** section after importing the above package.

1. Click on the **Edit** button in the card popup.

1. Click the blue **Link to Dropbox** button.

1. Accept consent on Dropbox.

    <div class="cerb-screenshot">
    <img src="/assets/images/guides/dropbox/plugin/oauth-approve.png" class="screenshot">
    </div>
    
1. Click the **Save Changes** button.

# Use the connected account in bot behaviors

You can use the connected account you just created to access [Dropbox's API](https://www.dropbox.com/developers) from bot behaviors in Cerb.  This is typically accomplished using the **Execute HTTP Request** action from a bot, and selecting the connected account in the **Authentication:** section.

You can import the [Dropbox Bot](/packages/dropbox-bot/) package for a working example.