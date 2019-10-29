---
title: Authenticate worker single sign-on (SSO) from Microsoft Azure AD using OpenID Connect
excerpt: A step-by-step guide for single sign-on authentication using Microsoft accounts
social_image_url: /assets/images/guides/azure/cerb-and-azure.png
layout: integration
topic: Integrations
subtopic: Microsoft Azure
jumbotron:
  title: Authenticate worker single sign-on (SSO) from Microsoft Azure AD using OpenID Connect
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
    label: Microsoft Azure &raquo;
    url: /resources/guides/#microsoft-azure
---

<div class="cerb-screenshot">
<img src="{{page.social_image_url}}" class="screenshot">
</div>

* TOC
{:toc}

# Introduction

This guide demonstrates how to enable one-click single sign-on (SSO) for Cerb workers by authenticating against existing Microsoft Azure AD (Active Directory) accounts using the OpenID Connect (OIDC) standard.

<div class="cerb-box note">
<p>The email address for each account in Azure AD will need to be associated with a worker record in Cerb. You can also disable password-based logins for those accounts.</p>
</div>

# Configure Azure AD

Log in to the [Azure Portal](https://portal.azure.com/).

### Create OAuth app for Cerb

1. Navigate to **All services >> Azure Active Directory**.

1. Select **App registrations** from the left menu.

1. Click the **New registration** button at the top.

	|---
	|-|-
	| **Name** | Cerb SSO
	| **Supported account types** | (Default Directory)
	| **Redirect URI** | (Web) `https://{CERB-URL}/sso/azure-ad`

1. Click the blue **Register** button at the bottom.

### Create client secret

1. In the new app registration, navigate to **Certificates & secrets**.

1. Click the **New client secret** button in the **Client secrets** section near the middle of the page.

	|---
	|-|-
	| **Description** | Cerb SSO
	| **Expires** | Never
	
1. Click the blue **Add** button.

# Configure Cerb

Log in to Cerb as an administrator.

### Create a connected service for Azure

1. Navigate to **Search >> Connected Services** and click the **(+)** icon above the worklist.

	|---
	|-|-
	| **Name** | Azure AD
	| **URI** | `azure-ad`
	| **Type** | OpenID Connect Identity Provider
	
	| **Client ID** | (from Azure app above)
	| **Client Secret** | (from Azure app above)
	| **Authorize Scope** | `openid email`
	| **Issuer** | `https://login.microsoftonline.com/{DIRECTORY-ID}/v2.0`

	You can find the `{DIRECTORY-ID}` in the Azure portal for your app registration as **Directory (tenant) ID**.

1. Click the **Run Discovery** button.

1. Click the **Save Changes** button.

### Configure SSO

1. Navigate to **Setup >> Configure >> Authentication**.

1. Check **Azure AD**.

1. Click the **Save Changes** button.

### Log in

1. Visit the login form in Cerb.

1. Click the **Azure AD** button.

1. Log in using your Microsoft ID.

1. Accept consent.

1. You should be logged into Cerb as the worker associated with your Microsoft email address.

