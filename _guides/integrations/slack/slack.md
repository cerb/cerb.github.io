---
title: Integrate with Slack
excerpt: A step-by-step guide for integrating Cerb and Slack.
permalink: /guides/integrations/slack/
layout: integration
topic: Integrations
subtopic: Slack
jumbotron:
  title: Cerb + Slack
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
    label: Slack &raquo;
    url: /resources/guides/#slack
---

* TOC
{:toc}

# Introduction

In this guide we'll walk through the process of linking Cerb to Slack. You'll be able to use Slack's full API from bots in Cerb to automate whatever you need.

<div class="cerb-screenshot">
<img src="/assets/images/guides/slack/plugin/cerb-and-slack.png" class="screenshot">
</div>

# Create an app at Slack

Next, you need to create a new app on Slack for Cerb to connect to.

1. Log in to [Slack's developer portal](https://api.slack.com/apps).

1. Click the green **Create New App** button.

1. Enter the following details:
- **App Name:** Cerb
- **Development Slack Team:** (your team name)

	<div class="cerb-screenshot">
	<img src="/assets/images/guides/slack/plugin/slack-new-app.png" class="screenshot">
	</div>

1. Click the **Create App** button.

1. Scroll down to **App Credentials** and make a note of your **Client ID** and **Client Secret** for the next step.

1. Select **OAuth & Permissions** from the left sidebar.

1. Click the **Add Redirect URL** button and enter the base URL to your Cerb install (e.g. `https://YOUR-CERB-HOST/`).

# Create the Slack service in Cerb

1. Navigate to **Setup >> Configure >> Import Package**.

1. Paste the following package:

	<pre style="max-height:29.5em;">
	<code class="language-json">
	{% raw %}
	{
	  "package": {
	    "name": "Slack Connected Service",
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
	      "uid": "service_slack",
	      "_context": "connected_service",
	      "name": "Slack",
	      "extension_id": "cerb.service.provider.oauth2",
	      "params": {
	        "grant_type": "authorization_code",
	        "client_id": "{{{prompt_client_id}}}",
	        "client_secret": "{{{prompt_client_secret}}}",
	        "authorization_url": "https://slack.com/oauth/authorize",
	        "access_token_url": "https://slack.com/api/oauth.access",
	        "resource_owner_url": "",
	        "scope": "channels:read chat:write:bot chat:write:user im:read im:write users:read users.profile:read",
	        "approval_prompt": "auto"
	      }
	    },
	    {
	      "uid": "account_slack",
	      "_context": "connected_account",
	      "name": "Slack",
	      "service_id": "{{{uid.service_slack}}}",
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

1. Enter your client ID and secret from Slack.

1. Click the **Import** button again.

# Link the connected account to Slack in Cerb

1. Click on the **Slack** bubble in the **Connected Accounts** section after importing the above package.

1. Click on the **Edit** button in the card popup.

1. Click the blue **Link to Slack** button.

1. Accept consent on Slack.

    <div class="cerb-screenshot">
    <img src="/assets/images/guides/slack/plugin/oauth-approve.png" class="screenshot">
    </div>

1. Click the **Save Changes** button.

# Use the connected account in bot behaviors

You can use the connected account you just created to access [Slack's API](https://api.slack.com/web) from bot behaviors in Cerb.  This is typically accomplished using the **Execute HTTP Request** action from a bot, and selecting the connected account in the **Authentication:** section.

You can import the [Slack Bot](/packages/slack-bot/) package for a working example.