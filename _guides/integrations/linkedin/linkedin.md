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

1. Navigate to **Search >> Connected Services**.

1. Click the **(+)** icon in the top right of the list.

1. Select **LinkedIn**.

	<div class="cerb-screenshot">
	<img src="/assets/images/guides/common/package-library-connected-services.png" class="screenshot">
	</div>

1. Enter your Client ID and Client Secret.

	<div class="cerb-screenshot">
	<img src="/assets/images/guides/linkedin/package-library-service-linkedin.png" class="screenshot">
	</div>

1. Click the **Create** button.

# Link the connected account to LinkedIn in Cerb

1. Navigate to **Search >> Connected Accounts**.

1. Click the **(+)** icon in the top right of the list.

1. Select **LinkedIn**.

1. Click the blue **Link to LinkedIn** button.

1. Accept consent on LinkedIn.

    <div class="cerb-screenshot">
    <img src="/assets/images/guides/linkedin/plugin/oauth-approve.png" class="screenshot">
    </div>
    
1. Click the **Save Changes** button.

# Use the connected account in bot behaviors

You can use the connected account you just created to access [LinkedIn's REST API](https://developer.linkedin.com/docs/rest-api) from bot behaviors in Cerb.  This is typically accomplished using the **Execute HTTP Request** action from a bot, and selecting the connected account in the **Authentication:** section.

You can import the [LinkedIn Bot](/packages/linkedin-bot/) package for a working example.