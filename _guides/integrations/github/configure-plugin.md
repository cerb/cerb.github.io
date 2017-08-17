---
title: Configure the GitHub plugin
excerpt: A step-by-step guide for configuring Cerb's GitHub plugin
layout: integration
topic: Integrations
subtopic: GitHub
jumbotron:
  title: Configure the GitHub plugin
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

# Install the GitHub plugin

First, you need to install and enable the GitHub plugin in Cerb.

1. Navigate to **Setup >> Plugins >> Installed Plugins**

1. Search for: `github`

1. Find the **GitHub Integration** plugin in the worklist and click its **Configure** button.  If the plugin isn't installed, you can download it from the [plugin library](/docs/plugins#library).

1. In the **Status:** field, select _Enabled_.

1. Click the **Save Changes** button.

# Create an OAuth application on GitHub

Next, you need to create a new oauth app on GitHub for Cerb to connect to. Review the [GitHub OAuth documentation](https://developer.github.com/apps/building-integrations/setting-up-and-registering-oauth-apps/) additionally if needed.

1. Visit the [GitHub OAuth applications](https://github.com/settings/developers) settings page.

1. Click the green **Register a new application** button.

1. Enter the following details replacing `https://example.cerb.me` with the URL to your Cerb installation:
- **App Name:** Cerb
- **Homepage URL:** `https://example.cerb.me`
- **Application description:** {leave blank}
- **Authorization callback URL:** `https://example.cerb.me`/oauth/callback/wgm.github.service.provider

	<div class="cerb-screenshot">
	<img src="/assets/images/guides/github/plugin/github-new-app.png" class="screenshot">
	</div>

1. Click the **Register application** button.

	<div class="cerb-screenshot">
	<img src="/assets/images/guides/github/plugin/github-new-app2.png" class="screenshot">
	</div>

1. Make a note of your **Client ID** and **Client Secret** for the next step.

# Configure the GitHub plugin in Cerb

Add the GitHub app details to Cerb so you can use it to link your accounts.

1. Navigate to **Setup >> Services >> GitHub**

1. Paste your GitHub **Client ID**.

1. Paste your GitHub **Client Secret**.

1. Click the **Save Changes** button.

# Add a connected account in Cerb

Now we can create connected accounts to securely store GitHub credentials in Cerb.

1. Navigate to **Search >> Connected Accounts**.

1. Click the **(+)** icon above the worklist to add a new account.
    <div class="cerb-screenshot">
    <img src="/assets/images/guides/common/new-connected-account.png" class="screenshot">
    </div>

1. Click on **GitHub**.

1. Click on **Link to a GitHub account**.

1. **Authorize** the OAuth request:

    <div class="cerb-screenshot">
    <img src="/assets/images/guides/github/plugin/oauth-approve.png" class="screenshot">
    </div>

1. Enter the following details:
- **Name:** GitHub
- **Owner:** Cerb

    <div class="cerb-screenshot">
    <img src="/assets/images/guides/github/plugin/connected-account.png" class="screenshot">
    </div>

1. Click the **Save Changes** button.

If everything was configured properly, you'll see the new connected account in your worklist.

# Use the connected account in bot behaviors

You can use the connected account you just created to access [GitHub's API](https://developer.github.com/v3/) from bot behaviors in Cerb.  This is typically accomplished using the **Execute HTTP Request** action from a bot, and selecting the connected account in the **Authentication:** section.

You can import the [GitHub Bot](/packages/github-bot/) package for a working example.
