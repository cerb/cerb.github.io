---
title: Authenticate worker single sign-on (SSO) from Microsoft Azure AD using OpenID
  Connect
excerpt: This page provides a comprehensive guide on setting up single sign-on (SSO)
  for Cerb using Microsoft Azure Active Directory (AD) through the OpenID Connect
  (OIDC) standard.
summary: This page provides a comprehensive guide on setting up single sign-on (SSO)
  for Cerb using Microsoft Azure Active Directory (AD) through the OpenID Connect
  (OIDC) standard. It details the steps to configure Azure AD, including creating
  an OAuth app for Cerb, generating a client secret, and setting up optional claims.
  The guide also covers configuring Cerb to connect with Azure, enabling SSO, and
  the process for logging in using Azure AD credentials. This setup allows Cerb workers
  to authenticate seamlessly with their existing Microsoft accounts, enhancing security
  and user convenience by potentially disabling password-based logins.
social_image_url: /assets/images/solutions/integrations/azure/cerb-and-azure.png
permalink: /guides/sso/azure-openid/
redirect_url:
  - /guides/integrations/azure/sso-openid/
layout: integration
topic: SSO
jumbotron:
  title: Authenticate worker single sign-on (SSO) from Microsoft Azure AD using OpenID
    Connect
  tagline: ""
  breadcrumbs:
    - label: Resources &raquo;
      url: /resources/
    - label: Guides &raquo;
      url: /resources/guides/
    - label: Integrations &raquo;
      url: /resources/guides/#integrations
    - label: Microsoft Azure &raquo;
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

2. Click the **New client secret** button in the **Client secrets** section near the middle of the page.

   |---
   |-|-
   | **Description** | Cerb SSO
   | **Expires** | Never

3. Click the blue **Add** button.

4. Copy the **Value** (not the **Secret ID**).

### Configure optional claims

1. In the new app registration, navigate to **Token configuration**.

1. Click the **Add optional claim** button.

1. Select **ID** for **Token type**.

1. Check the box to the left of the `email` claim.

1. Click the blue **Add** button at the bottom of the claim list.

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

1. Navigate to **Setup >> Security >> Authentication**.

1. Check **Azure AD**.

1. Click the **Save Changes** button.

### Log in

1. Visit the login form in Cerb.

1. Click the **Azure AD** button.

1. Log in using your Microsoft ID.

1. Accept consent.

1. You should be logged into Cerb as the worker associated with your Microsoft email address.

