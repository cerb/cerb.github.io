---
title: Integrate with LinkedIn
excerpt: A step-by-step guide for integrating Cerb and LinkedIn.
permalink: /guides/integrations/linkedin/
layout: integration
topic: Integrations
subtopic: LinkedIn
jumbotron:
  title: Cerb + LinkedIn
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
    label: LinkedIn &raquo;
    url: /resources/guides/#linkedin
---

* TOC
{:toc}

# Introduction

In this guide we'll walk through the process of linking Cerb to LinkedIn. You'll be able to use LinkedIn's full API from bots in Cerb to automate whatever you need.

<div class="cerb-screenshot">
<img src="/assets/images/guides/linkedin/plugin/cerb-and-linkedin.png" class="screenshot">
</div>

# Create an app at LinkedIn

Next, you need to create a new app on LinkedIn for Cerb to connect to.

1. Log in to [LinkedIn's developer portal](https://developer.linkedin.com).

1. Click the green **Create New App** button.

1. Click **My Apps** in the top menu.

1. Click the yellow **Create Application** button.

1. Enter the following details:
- **Company Name:** (your company)
- **Name:** Cerb
- **Description:** Integration with Cerb
- **Application Logo:** [image](/assets/cerb_mascot.png)
- **Application Use:** Sales (CRM), Marketing
- **Website URL:** https://cerb.ai/
- **Business Email:** (your email address)
- **Business Phone:** (your phone number)

	<div class="cerb-screenshot">
	<img src="/assets/images/guides/linkedin/plugin/linkedin-new-app.png" class="screenshot">
	</div>

1. Review the [API Terms of Use](https://developer.linkedin.com/legal/api-terms-of-use) and check **agree**.

1. Click the **Submit** button.

## Configure authentication for your LinkedIn App

1. In the **Authentication** panel, under **Authentication Keys**, copy your **Client ID** and **Client Secret**.  You'll need to input these into Cerb.

1. For **Default Application Permissions**, select everything.

1. Under **OAuth 2.0**, add an **Authorized Redirect URL** with the following format and click the **Add** button:
	`https://YOUR-CERB-HOST/oauth/callback`

1. Scroll down to **App Credentials** and make a note of your **Client ID** and **Client Secret** for the next step.

1. Select **OAuth & Permissions** from the left sidebar.

1. Click the **Add Redirect URL** button and enter the base URL to your Cerb install (e.g. `https://YOUR-CERB-HOST/`).

	<div class="cerb-screenshot">
	<img src="/assets/images/guides/linkedin/plugin/linkedin-app-auth.png" class="screenshot">
	</div>

1. Click the blue **Update** button.

# Create the LinkedIn service in Cerb

1. Navigate to **Setup >> Configure >> Import Package**.

1. Paste the following package:

	<pre style="max-height:29.5em;">
	<code class="language-json">
	{% raw %}
	{
	  "package": {
	    "name": "LinkedIn Connected Service",
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
	      "uid": "service_linkedin",
	      "_context": "connected_service",
	      "name": "LinkedIn",
	      "extension_id": "cerb.service.provider.oauth2",
	      "params": {
	        "grant_type": "authorization_code",
	        "client_id": "{{{prompt_client_id}}}",
	        "client_secret": "{{{prompt_client_secret}}}",
	        "authorization_url": "https://www.linkedin.com/oauth/v2/authorization",
	        "access_token_url": "https://www.linkedin.com/oauth/v2/accessToken",
	        "resource_owner_url": "",
	        "scope": "r_basicprofile r_emailaddress rw_company_admin w_share",
	        "approval_prompt": ""
	      }
	    },
	    {
	      "uid": "account_linkedin",
	      "_context": "connected_account",
	      "name": "LinkedIn",
	      "service_id": "{{{uid.service_linkedin}}}",
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

1. Enter your client ID and secret from LinkedIn.

1. Click the **Import** button again.

# Link the connected account to LinkedIn in Cerb

1. Click on the **LinkedIn** bubble in the **Connected Accounts** section after importing the above package.

1. Click on the **Edit** button in the card popup.

1. Click the blue **Link to LinkedIn** button.

1. Accept consent on LinkedIn.

    <div class="cerb-screenshot">
    <img src="/assets/images/guides/linkedin/plugin/oauth-approve.png" class="screenshot">
    </div>
    
1. Click the **Save Changes** button.

# Use the connected account in bot behaviors

You can use the connected account you just created to access [LinkedIn's REST API](https://developer.linkedin.com/docs/rest-api) from bot behaviors in Cerb.  This is typically accomplished using the **Execute HTTP Request** action from a bot, and selecting the connected account in the **Authentication:** section.

You can import the [LinkedIn Bot](/packages/linkedin-bot/) package for a working example.