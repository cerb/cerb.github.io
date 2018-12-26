---
title: Authenticate worker single sign-on (SSO) from G Suite using SAML
excerpt: A step-by-step guide for single sign-on authentication using G Suite accounts
layout: integration
topic: Integrations
subtopic: Google
jumbotron:
  title: Authenticate worker single sign-on (SSO) from G Suite using SAML
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
    label: Google &raquo;
    url: /resources/guides/#google
---

* TOC
{:toc}

# Introduction

This guide demonstrates how to enable one-click single sign-on (SSO) for Cerb workers by authenticating against existing G Suite accounts using the SAML (Security Assertion Markup Language) standard.

<div class="cerb-box note">
<p>The email address for each account in G Suite will need to be associated with a worker record in Cerb. You can also disable password-based logins for those accounts.</p>
</div>

# Configure G Suite for SAML

## Create a SAML app

1. Log in to Google Admin as an administrator: <https://admin.google.com/>

1. Click **Apps**.

1. Click **SAML Apps**.

1. Click the yellow **(+)** in the bottom right.

1. At the bottom of the popup, click **Setup my own custom app**.

### Google IdP Information

1. Copy the **SSO URL**, **Entity ID**, and **Certificate** for use in Cerb. You'll need to download the certificate and open it in a text editor to copy/paste it. Optionally, you can download the IdP metadata file.

1. Click the blue **Next** link in the bottom right of the popup.

### Basic information for your Custom App

1. Enter the following details:
	* Application Name: `Cerb SSO`
	* Upload logo: <https://cerb.ai/assets/cerb_mascot.png>

1. Click the blue **Next** link in the bottom right of the popup.

### Service Provider Details

1. Enter the following details:
	* ACS URL: `https://YOUR-CERB-HOST/sso/gsuite`
	* Entity ID: `https://YOUR-CERB-HOST/sso/gsuite/metadata`
	* Signed Response: [**x**]
	* Name ID: **Basic Information** >> **Primary Email**
	* Name ID Format: **EMAIL**
	
	<div class="cerb-box note">
	<p>Replace <tt>YOUR-CERB-HOST</tt> above with your own hostname (e.g. <tt>cerb.example</tt>).</p>
	</div>
	
1. Click the blue **Next** link in the bottom right of the popup.

### Attribute Mapping

Click the blue **Finish** link in the bottom right of the popup.

### Setting up SSO for Cerb

Click the blue **OK** link in the bottom right of the popup.

## Enabling the service in G Suite

1. Click the **Edit Service** link in the top right of the gray header.

1. Select **ON for everyone**.

1. Click the **Save** button in the bottom right.

# Configure Cerb for authentication with G Suite SAML

## Create a SAML service in Cerb

1. In Cerb, navigate to **Search >> Connected Services**.

1. Click the **(+)** icon above the worklist.

1. Enter the following details:
	* Name: `G Suite`
	* URI: `gsuite`
	* Type: **SAML Identity Provider**
	
1. Enter the SAML details from G Suite above: **SSO URL**, **Entity ID**, and **X.509 Certificate**.

1. Click the **Save Changes** button.

## Configure SSO for worker logins

1. Navigate to **Setup >> Configure >> Authentication**.

1. In the **Single Sign-on (SSO)** section, check the box for **G Suite**.

1. Click the **Save Changes** button.

# Log in to Cerb using G Suite

1. Log out of Cerb.

1. At the top of the login form, in the **Log in with your identity** section, click the **G Suite** button.

1. If you aren't signed in to your G Suite account you'll need to authenticate. Otherwise you shouldn't need to do anything.

1. If everything is configured properly, you'll be signed in to Cerb. As long as you remain logged in to G Suite you can sign in to Cerb in a single click from the login form.