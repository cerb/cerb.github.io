---
title: Integrate with Salesforce
excerpt: A step-by-step guide for integrating Cerb and Salesforce.
permalink: /guides/integrations/salesforce/
layout: integration
topic: Integrations
subtopic: Salesforce
jumbotron:
  title: Cerb + Salesforce
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

In this guide we'll walk through the process of linking Cerb to Salesforce. You'll be able to use the full Salesforce API from bots in Cerb to automate whatever you need.

<div class="cerb-screenshot">
<img src="/assets/images/guides/salesforce/plugin/cerb-and-salesforce.png" class="screenshot">
</div>

# Create an app at Salesforce

Next, you need to create a new app on Salesforce for Cerb to connect to.

## Configure basic information

1. Log in to [Salesforce](https://login.salesforce.com).

1. Click **Setup** in the top right.

1. In the **Build** menu on the right, expand **Create** and select **Apps**.

1. In the **Connected Apps** section at the bottom, click the **New** button.

1. Enter the following details:

- **Connected App Name:** `Salesforce for Cerb`
- **API Name:** `Salesforce_for_Cerb`
- **Contact Email:** (your email address)
- **Logo URL:** [image](/assets/cerb_mascot.png)

	<div class="cerb-screenshot">
	<img src="/assets/images/guides/salesforce/plugin/new-app-basic.png" class="screenshot">
	</div>

## Configure OAuth

In the **API (Enable OAuth Settings)** section:

- **Enable OAuth Settings:** yes
- **Callback URL:** `https://YOUR-CERB-HOST/oauth/callback`
- **Selected OAuth Scopes:**
	- Perform requests on your behalf at any time (refresh_token, offline_access)
	- Access and manage your data (api)
	- Provide access to your data via the Web (web)

	<div class="cerb-screenshot">
	<img src="/assets/images/guides/salesforce/plugin/new-app-oauth.png" class="screenshot">
	</div>
	
## Copy your OAuth credentials

1. Scroll to the bottom and click the **Save** button.

1. Click the **Continue** button.

1. Make a note of your **Consumer Key** and **Consumer secret**.  You'll need them in the next step.

# Create the Salesforce service in Cerb

1. Navigate to **Search >> Connected Services**.

1. Click the **(+)** icon in the top right of the list.

1. Select **Salesforce**.

	<div class="cerb-screenshot">
	<img src="/assets/images/guides/common/package-library-connected-services.png" class="screenshot">
	</div>

1. Enter your Client ID and Client Secret.

	<div class="cerb-screenshot">
	<img src="/assets/images/guides/salesforce/package-library-service-salesforce.png" class="screenshot">
	</div>

1. Click the **Create** button.

# Link the connected account to Salesforce in Cerb

1. Navigate to **Search >> Connected Accounts**.

1. Click the **(+)** icon in the top right of the list.

1. Select **Salesforce**.

1. Click the blue **Link to Salesforce** button.

1. Accept consent on Salesforce.

	<div class="cerb-screenshot">
	<img src="/assets/images/guides/salesforce/plugin/oauth-approve.png" class="screenshot">
	</div>

1. Click the **Save Changes** button.

<div class="cerb-box note">
	<p>It may take up to 10 minutes for your new app to be available in Salesforce.  If you have trouble with the OAuth authentication step, wait a few minutes and try again.</p>
</div>

# Use the connected account in bot behaviors

You can use the connected account you just created to access the [Saleforce REST API](https://developer.salesforce.com/page/REST_API) from bot behaviors in Cerb.  This is typically accomplished using the **Execute HTTP Request** action from a bot, and selecting the connected account in the **Authentication:** section.

You can import the [Salesforce Bot](/packages/salesforce-bot/) package for a working example.