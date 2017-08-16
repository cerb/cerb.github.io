---
title: Configure the Salesforce plugin
excerpt: A step-by-step guide for configuring Cerb's Salesforce plugin
layout: integration
topic: Integrations
subtopic: Salesforce
jumbotron:
  title: Configure the Salesforce plugin
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

# Install the Salesforce plugin

First, you need to install and enable the Salesforce plugin in Cerb.

1. Navigate to **Setup >> Plugins >> Installed Plugins**

1. Search for: `salesforce`

1. Find the **Salesforce Integration** plugin in the worklist and click its **Configure** button.  If the plugin isn't installed, you can download it from the [plugin library](/docs/plugins#library).

1. In the **Status:** field, select _Enabled_.

1. Click the **Save Changes** button.

# Create an app on Salesforce

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
- **Callback URL:** `https://your.cerb.host`/oauth/callback/wgm.salesforce.service.provider
- **Selected OAuth Scopes:**
	- Perform requests on your behalf at any time (refresh_token, offline_access)
	- Access and manage your data (api)

	<div class="cerb-screenshot">
	<img src="/assets/images/guides/salesforce/plugin/new-app-oauth.png" class="screenshot">
	</div>
	
## Copy your OAuth credentials

1. Scroll to the bottom and click the **Save** button.

1. Click the **Continue** button.

1. Make a note of your **Consumer Key** and **Consumer secret**.  You'll need them in the next step.

# Configure the Salesforce plugin in Cerb

Add the Salesforce app details to Cerb so you can use it to link your accounts.

1. Navigate to **Setup >> Services >> Salesforce**

1. Paste your Salesforce **Consumer Key**.

1. Paste your Salesforce **Consumer Secret**.

	<div class="cerb-screenshot">
	<img src="/assets/images/guides/salesforce/plugin/cerb-oauth-setup.png" class="screenshot">
	</div>

1. Click the **Save Changes** button.

# Add a connected account in Cerb

Now we can create connected accounts to securely store Salesforce credentials in Cerb.

1. Navigate to **Search >> Connected Accounts**.

1. Click the **(+)** icon above the worklist to add a new account.
    <div class="cerb-screenshot">
    <img src="/assets/images/guides/common/new-connected-account.png" class="screenshot">
    </div>

1. Click on **Salesforce**.

1. Click on **Link to a Salesforce account**.

1. **Authorize** the OAuth request:

    <div class="cerb-screenshot">
    <img src="/assets/images/guides/salesforce/plugin/oauth-approve.png" class="screenshot">
    </div>

1. Enter the following details:
- **Name:** Salesforce
- **Owner:** Cerb

    <div class="cerb-screenshot">
    <img src="/assets/images/guides/salesforce/plugin/connected-account.png" class="screenshot">
    </div>

1. Click the **Save Changes** button.

If everything was configured properly, you'll see the new connected account in your worklist.

<div class="cerb-box note">
	<p>It may take up to 10 minutes for your new app to be available in Salesforce.  If you have trouble with the OAuth authentication step, wait a few minutes and try again.</p>
</div>

# Use the connected account in bot behaviors

You can use the connected account you just created to access the [Saleforce REST API](https://developer.salesforce.com/page/REST_API) from bot behaviors in Cerb.  This is typically accomplished using the **Execute HTTP Request** action from a bot, and selecting the connected account in the **Authentication:** section.

{% comment %}
You can import the [Salesforce Bot](/packages/salesforce-bot/) package for a working example.
{% endcomment %}