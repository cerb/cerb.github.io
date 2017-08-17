---
title: Configure the LinkedIn plugin
excerpt: A step-by-step guide for configuring Cerb's LinkedIn plugin
layout: integration
topic: Integrations
subtopic: LinkedIn
jumbotron:
  title: Configure the LinkedIn plugin
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

# Install the LinkedIn plugin

First, you need to install and enable the LinkedIn plugin in Cerb.

1. Navigate to **Setup >> Plugins >> Installed Plugins**

1. Search for: `linkedin`

1. Find the **LinkedIn Integration** plugin in the worklist and click its **Configure** button.  If the plugin isn't installed, you can download it from the [plugin library](/docs/plugins#library).

1. In the **Status:** field, select _Enabled_.

1. Click the **Save Changes** button.

# Create an app on LinkedIn

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
	`https://your.cerb.host`/oauth/callback/wgm.linkedin.service.provider

1. Scroll down to **App Credentials** and make a note of your **Client ID** and **Client Secret** for the next step.

1. Select **OAuth & Permissions** from the left sidebar.

1. Click the **Add Redirect URL** button and enter the base URL to your Cerb install (e.g. `https://example.cerb.me/`).

	<div class="cerb-screenshot">
	<img src="/assets/images/guides/linkedin/plugin/linkedin-app-auth.png" class="screenshot">
	</div>

1. Click the blue **Update** button.

# Configure the LinkedIn plugin in Cerb

Add the LinkedIn app details to Cerb so you can use it to link your accounts.

1. Navigate to **Setup >> Services >> LinkedIn**

1. Paste your LinkedIn **Client ID**.

1. Paste your LinkedIn **Client Secret**.

1. Click the **Save Changes** button.

	<div class="cerb-screenshot">
	<img src="/assets/images/guides/linkedin/plugin/cerb-app-auth.png" class="screenshot">
	</div>

# Add a connected account in Cerb

Now we can create connected accounts to securely store LinkedIn credentials in Cerb.

1. Navigate to **Search >> Connected Accounts**.

1. Click the **(+)** icon above the worklist to add a new account.

    <div class="cerb-screenshot">
    <img src="/assets/images/guides/common/new-connected-account.png" class="screenshot">
    </div>

1. Click on **LinkedIn**.

1. Click on **Link to a LinkedIn account**.

1. **Authorize** the OAuth request:

    <div class="cerb-screenshot">
    <img src="/assets/images/guides/linkedin/plugin/oauth-approve.png" class="screenshot">
    </div>


1. Enter the following details:
- **Name:** LinkedIn
- **Owner:** Cerb

    <div class="cerb-screenshot">
    <img src="/assets/images/guides/linkedin/plugin/connected-account.png" class="screenshot">
    </div>

1. Click the **Save Changes** button.

If everything was configured properly, you'll see the new connected account in your worklist.

# Use the connected account in bot behaviors

You can use the connected account you just created to access [LinkedIn's REST API](https://developer.linkedin.com/docs/rest-api) from bot behaviors in Cerb.  This is typically accomplished using the **Execute HTTP Request** action from a bot, and selecting the connected account in the **Authentication:** section.

You can import the [LinkedIn Bot](/packages/linkedin-bot/) package for a working example.