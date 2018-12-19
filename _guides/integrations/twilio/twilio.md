---
title: Integrate with Twilio
excerpt: A step-by-step guide for integrating Cerb and Twilio.
permalink: /guides/integrations/twilio/
layout: integration
topic: Integrations
subtopic: Twilio
jumbotron:
  title: Cerb + Twilio
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
    label: Twilio &raquo;
    url: /resources/guides/#twilio
---

* TOC
{:toc}

# Introduction

In this guide we'll walk through the process of linking Cerb to Twilio. You'll be able to use Twilio's full API from bots in Cerb.

<div class="cerb-screenshot">
<img src="/assets/images/guides/twilio/plugin/cerb-and-twilio.png" class="screenshot">
</div>

# Get your API keys from the Twilio Dashboard

1. Browse to: <https://www.twilio.com/login>

1. In the top right, copy your **Account SID** (username) and **Auth Token** (password).

# Create the Twilio service in Cerb

1. Navigate to **Setup >> Configure >> Import Package**.

1. Paste the following package:

	<pre style="max-height:29.5em;">
	<code class="language-json">
	{% raw %}
	{
	  "package": {
	    "name": "Twilio Connected Service",
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
	          "label": "Account SID",
	          "key": "prompt_account_sid",
	          "params": {
	            "default": "",
	            "placeholder": "(paste your Account SID)"
	          }
	        },
	        {
	          "type": "text",
	          "label": "Auth Token",
	          "key": "prompt_auth_token",
	          "params": {
	            "default": "",
	            "placeholder": "(paste your Auth Token)"
	          }
	        }
	      ]
	    }
	  },
	  "records": [
	    {
	      "uid": "service_twilio",
	      "_context": "connected_service",
	      "name": "Twilio",
	      "extension_id": "cerb.service.provider.http.basic",
	      "params": {
	        "base_url": "https://api.twilio.com/"
	      }
	    },
	    {
	      "uid": "account_twilio",
	      "_context": "connected_account",
	      "name": "Twilio",
	      "service_id": "{{{uid.service_twilio}}}",
	      "owner__context": "cerberusweb.contexts.app",
	      "owner_id": "0",
	      "params": {
	        "username": "{{{prompt_account_sid}}}",
	        "password": "{{{prompt_auth_token}}}"
	      }
	    }
	  ]
	}
	{% endraw %}
	</code>
	</pre>

1. Click the **Import** button.

1. Enter your Account SID and Auth Token from Twilio.

1. Click the **Import** button again.

# Use the connected account in bot behaviors

You can use the connected account you just created to access [Twilio's API](https://www.twilio.com/docs/api/rest) from bot behaviors in Cerb.  This is typically accomplished using the **Execute HTTP Request** action from a bot, and selecting the connected account in the **Authentication:** section.

You can import the [Twilio Bot](/packages/twilio-bot/) package for a working example.
