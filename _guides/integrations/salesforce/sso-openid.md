---
title: Authenticate worker single sign-on (SSO) from Salesforce using OpenID Connect
excerpt: A step-by-step guide for single sign-on authentication using Salesforce accounts
layout: integration
topic: Integrations
subtopic: Salesforce
jumbotron:
  title: Authenticate worker single sign-on (SSO) from Salesforce using OpenID Connect
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
    label: Salesforce &raquo;
    url: /resources/guides/#salesforce
---

* TOC
{:toc}

# Introduction

This guide demonstrates how to enable one-click single sign-on (SSO) for Cerb workers by authenticating against existing Salesforce accounts using the OpenID Connect (OIDC) standard.

<div class="cerb-box note">
<p>The email address for each account in Salesforce will need to be associated with a worker record in Cerb. You can also disable password-based logins for those accounts.</p>
</div>

# Configure Salesforce as an OpenID Connect identity provider

## Configure your identity provider

1. Log in to Salesforce as an administrator.

1. Click **Setup** in the top right.

1. In the left sidebar, navigate to **Administer >> Security Controls >> Identity Provider**.

1. Follow the prompts to configure your identity provider if you haven't already.

1. Make a note of your **Issuer** URL. You'll need it later.

## Create a connected app for Cerb

1. Click **Setup** in the top right.

1. In the left sidebar, navigate to **Build >> Create >> Apps**.

1. In the **Connected Apps** section, click the **New** button.

### Basic Information

* Connected App Name: `Cerb`
* API Name: `cerb`
* Contact Email: (your team's email address)

### API (Enable OAuth Settings)

1. Enter the following details:
	* Enable OAuth Settings: [**x**]
	* Callback URL: `https://YOUR-CERB-HOST/sso/salesforce-oidc`
	* Select OAuth Scopes:
		* Access your basic information (id, profile, email, address, phone)
		* Allow access to your unique identifier (openid)
	* Require Secret for Web Server Flow: [**x**]

1. Click the **Save** button at the bottom of the page.

1. Click the **Continue** button.

### Copy the OAuth credentials

Make a note of the **Consumer Key** (Client ID) and **Consumer Secret** (Consumer Secret) for your new app. You'll need them in Cerb.

At this point you'll have to wait up to 10 minutes to test the integration, so let's work on configuring Cerb.

# Configure Cerb for authentication with Salesforce 

Log in to Cerb as an administrator.

## Create an OpenID service for Salesforce

1. Navigate to **Setup >> Packages >> Import**.

1. Paste the following package:

	<pre style="max-height:29.5em;">
	<code class="language-json">
	{% raw %}
	{
	  "package": {
	    "name": "Salesforce OpenID Connect Provider",
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
	        },
	        {
	          "type": "text",
	          "label": "Issuer URL",
	          "key": "prompt_issuer_url",
	          "params": {
	            "default": "",
	            "placeholder": "(paste your Issuer URL from Salesforce)"
	          }
	        }
	      ]
	    }
	  },
	  "records": [
	    {
	      "uid": "service_salesforce",
	      "_context": "connected_service",
	      "name": "Salesforce",
	      "uri": "salesforce-oidc",
	      "extension_id": "cerb.service.provider.oidc",
	      "params": {
	        "client_id": "{{{prompt_client_id}}}",
	        "client_secret": "{{{prompt_client_secret}}}",
	        "scope": "openid profile",
	        "issuer": "{{{prompt_issuer_url}}}",
	        "authorization_url": "{{{prompt_issuer_url}}}/services/oauth2/authorize",
	        "access_token_url": "{{{prompt_issuer_url}}}/services/oauth2/token",
	        "userinfo_url": "{{{prompt_issuer_url}}}/services/oauth2/userinfo",
	        "jwks_url": "{{{prompt_issuer_url}}}/id/keys"
	      }
	    }
	  ]
	}
	{% endraw %}
	</code>
	</pre>

1. Click the **Import** button.

1. Enter your client ID, client secret, and issuer URL from Salesforce.

1. Click the **Import** button again.

### Configure SSO

1. Navigate to **Setup >> Security >> Authentication**.

1. Check **Salesforce**.

1. Click the **Save Changes** button.

### Log in

1. Visit the login form in Cerb.

1. Click the **Salesforce** button.

1. Log in using your Salesforce ID.

1. Accept consent.

1. You should be logged into Cerb as the worker associated with your Salesforce email address.

