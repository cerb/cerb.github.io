---
title: Integrate with GitHub
excerpt: A step-by-step guide for integrating Cerb and GitHub
permalink: /guides/integrations/github/
layout: integration
topic: Integrations
subtopic: GitHub
jumbotron:
  title: Cerb + GitHub
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
    label: GitHub &raquo;
    url: /resources/guides/#github
---

* TOC
{:toc}

# Introduction

In this guide we'll walk through the process of linking Cerb to GitHub. You'll be able to use GitHub's full API from bots in Cerb to automate whatever you need.

<div class="cerb-screenshot">
<img src="/assets/images/guides/github/plugin/cerb-and-github.png" class="screenshot">
</div>

# Create an OAuth application at GitHub

Next, you need to create a new oauth app on GitHub for Cerb to connect to. Review the [GitHub OAuth documentation](https://developer.github.com/apps/building-integrations/setting-up-and-registering-oauth-apps/) additionally if needed.

1. Visit the [GitHub OAuth applications](https://github.com/settings/developers) settings page.

1. Click the green **Register a new application** button.

1. Enter the following details replacing `YOUR-CERB-HOST` with the URL to your Cerb installation:
- **App Name:** Cerb
- **Homepage URL:** `https://YOUR-WEBSITE`
- **Application description:** {leave blank}
- **Authorization callback URL:** `https://YOUR-CERB-HOST/oauth/callback`

	<div class="cerb-screenshot">
	<img src="/assets/images/guides/github/plugin/github-new-app.png" class="screenshot">
	</div>

1. Click the **Register application** button.

	<div class="cerb-screenshot">
	<img src="/assets/images/guides/github/plugin/github-new-app2.png" class="screenshot">
	</div>

1. Make a note of your **Client ID** and **Client Secret** for the next step.

# Create the GitHub service in Cerb

1. Navigate to **Search >> Connected Services**.

1. Click the **(+)** icon in the top right of the list.

1. Select **GitHub**.

	<div class="cerb-screenshot">
	<img src="/assets/images/guides/common/package-library-connected-services.png" class="screenshot">
	</div>

1. Enter your Client ID and Client Secret.

	<div class="cerb-screenshot">
	<img src="/assets/images/guides/github/package-library-service-github.png" class="screenshot">
	</div>

1. Click the **Create** button.

# Link the connected account to GitHub in Cerb

1. Navigate to **Search >> Connected Accounts**.

1. Click the **(+)** icon in the top right of the list.

1. Select **GitHub**.

1. Click the blue **Link to GitHub** button.

1. Accept consent on GitHub.

    <div class="cerb-screenshot">
    <img src="/assets/images/guides/github/plugin/oauth-approve.png" class="screenshot">
    </div>

1. Click the **Save Changes** button.

# Use the connected account in bot behaviors

You can use the connected account you just created to access [GitHub's API](https://developer.github.com/v3/) from bot behaviors in Cerb.  This is typically accomplished using the **Execute HTTP Request** action from a bot, and selecting the connected account in the **Authentication:** section.

You can import the [GitHub Bot](/packages/github-bot/) package for a working example.
