---
title: Authenticate worker single sign-on (SSO) from Okta using OpenID Connect
excerpt: This page provides a comprehensive guide on setting up single sign-on (SSO)
  for Cerb workers using Okta as an identity provider through the OpenID Connect (OIDC)
  standard.
summary: This page provides a comprehensive guide on setting up single sign-on (SSO)
  for Cerb workers using Okta as an identity provider through the OpenID Connect (OIDC)
  standard. It details the steps to configure Okta as an OpenID Connect identity provider,
  including creating an app integration and obtaining necessary credentials like the
  Client ID, Client Secret, and Issuer URL. The guide also explains how to configure
  Cerb to authenticate with Okta by creating an OpenID service, setting up SSO, and
  logging in. It emphasizes the need to associate Okta email addresses with Cerb worker
  records and offers the option to disable password-based logins for enhanced security.
permalink: /guides/integrations/okta/sso-openid/
social_image_url: /assets/images/guides/okta/cerb-and-okta.png
layout: integration
topic: Integrations
subtopic: Okta
jumbotron:
  title: Authenticate worker single sign-on (SSO) from Okta using OpenID Connect
  tagline: ""
  breadcrumbs:
  - label: Resources &raquo;
    url: /resources/
  - label: Guides &raquo;
    url: /resources/guides/
  - label: Integrations &raquo;
    url: /resources/guides/#integrations
  - label: Okta &raquo;
    url: /resources/guides/#okta
---

<div class="cerb-screenshot">
<img src="{{page.social_image_url}}" class="screenshot">
</div>

* TOC
{:toc}

# Introduction

This guide demonstrates how to enable one-click single sign-on (SSO) for Cerb workers by authenticating against existing Okta accounts using the OpenID Connect (OIDC) standard.

<div class="cerb-box note">
<p>The email address for each account in Okta will need to be associated with a worker record in Cerb. You can also disable password-based logins for those accounts.</p>
</div>

# Configure Okta as an OpenID Connect identity provider

## Configure your identity provider

1. Log in to [Okta](https://okta.com/) as an administrator.

1. Click the **Admin** button in the top menu.

1. Expand the **Applications** menu in the left sidebar.

1. Click **Applications**.

1. Click the blue **Create App Integration** button at the top.

1. Select **OIDC - OpenID Connect**.

1. Select **Web Application**.

1. Click the blue **Next** button in the bottom right.

1. Enter the following details:

	|---
	|-|-
    | **Application name** | Cerb
    | **Application logo** | <https://cerb.ai/assets/images/home/cerby.png>
    | **Grant type** | Authorization Code
    | **Sign-in redirect URIs** | `https://<YOUR-CERB-URL>/sso/okta-oidc`
	  | **Sign-out redirect URIs** | (blank)

1. Click the blue **Save** button.

1. In the application settings screen, scroll down and copy the **Client ID** and **Client Secret**.

1. Make a note of your **Issuer** URL. You'll need it below. This is typically your Okta subdomain (e.g. `https://example.okta.com`).

1. Assign the application to groups or users.

# Configure Cerb for authentication with Okta 

Log in to Cerb as an administrator.

## Create an OpenID service for Okta

1. Navigate to **Setup >> Packages >> Import**.

1. Paste the following package:

	<pre style="max-height:29.5em;">
	<code class="language-json">
	{% raw %}
	{
	  "package": {
	    "name": "Okta OpenID Connect Provider",
	    "revision": 1,
	    "requires": {
	      "cerb_version": "9.5.0",
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
	            "placeholder": "(paste your Issuer URL from Okta)"
	          }
	        }
	      ]
	    }
	  },
	  "records": [
	    {
	      "uid": "service_okta",
	      "_context": "connected_service",
	      "name": "Okta",
	      "uri": "okta-oidc",
	      "extension_id": "cerb.service.provider.oidc",
	      "params": {
	        "client_id": "{{{prompt_client_id}}}",
	        "client_secret": "{{{prompt_client_secret}}}",
	        "scope": "openid email",
	        "issuer": "{{{prompt_issuer_url}}}",
	        "authorization_url": "{{{prompt_issuer_url}}}/oauth2/v1/authorize",
	        "access_token_url": "{{{prompt_issuer_url}}}/oauth2/v1/token",
	        "userinfo_url": "{{{prompt_issuer_url}}}/oauth2/v1/userinfo",
	        "jwks_url": "{{{prompt_issuer_url}}}/oauth2/v1/keys"
	      }
	    }
	  ]
	}
	{% endraw %}
	</code>
	</pre>

1. Click the **Import** button.

1. Enter your client ID, client secret, and issuer URL from Okta.

1. Click the **Import** button again.

### Configure SSO

1. Navigate to **Setup >> Security >> Authentication**.

1. Check **Okta**.

1. Click the **Save Changes** button.

### Log in

1. Visit the login form in Cerb.

1. Click the **Okta** button.

1. Log in using your Okta ID.

1. Accept consent.

1. You should be logged into Cerb as the worker associated with your Okta email address.

