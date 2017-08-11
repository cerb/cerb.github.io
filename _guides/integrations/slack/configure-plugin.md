---
title: Configure the Slack plugin
excerpt: A step-by-step guide for configuring Cerb's Slack plugin
layout: integration
topic: Integrations
subtopic: Slack
jumbotron:
  title: Configure the Slack plugin
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
    label: Slack &raquo;
    url: /resources/guides/#slack
---

* TOC
{:toc}

# Introduction

In this guide we'll walk through the process of linking Cerb to Slack. You'll be able to use Slack's full API from bots in Cerb to automate whatever you need.

<div class="cerb-screenshot">
<img src="/assets/images/guides/slack/plugin/cerb-and-slack.png" class="screenshot">
</div>

# Install the Slack plugin

First, you need to install and enable the Slack plugin in Cerb.

1. Navigate to **Setup >> Plugins >> Installed Plugins**

1. Search for: `slack`

1. Find the **Slack Integration** plugin in the worklist and click its **Configure** button.  If the plugin isn't installed, you can download it from the [plugin library](/docs/plugins#library).

1. In the **Status:** field, select _Enabled_.

1. Click the **Save Changes** button.

# Create an app on Slack

Next, you need to create a new app on Slack for Cerb to connect to.

1. Log in to [Slack's developer portal](https://api.slack.com/apps).

1. Click the green **Create New App** button.

1. Enter the following details:
- **App Name:** Cerb
- **Development Slack Team:** (your team name)

	<div class="cerb-screenshot">
	<img src="/assets/images/guides/slack/plugin/slack-new-app.png" class="screenshot">
	</div>

1. Click the **Create App** button.

1. Scroll down to **App Credentials** and make a note of your **Client ID** and **Client Secret** for the next step.

1. Select **OAuth & Permissions** from the left sidebar.

1. Click the **Add Redirect URL** button and enter the base URL to your Cerb install (e.g. `https://example.cerb.me/`).

# Configure the Slack plugin in Cerb

Add the Slack app details to Cerb so you can use it to link your accounts.

1. Navigate to **Setup >> Services >> Slack**

1. Paste your Slack **Client ID**.

1. Paste your Slack **Client Secret**.

1. Click the **Save Changes** button.

# Add a connected account in Cerb

Now we can create connected accounts to securely store Slack credentials in Cerb.

1. Navigate to **Search >> Connected Accounts**.

1. Click the **(+)** icon above the worklist to add a new account.
    <div class="cerb-screenshot">
    <img src="/assets/images/guides/common/new-connected-account.png" class="screenshot">
    </div>

1. Click on **Slack**.

1. Click on **Link to a Slack account**.

1. **Authorize** the OAuth request:

    <div class="cerb-screenshot">
    <img src="/assets/images/guides/slack/plugin/oauth-approve.png" class="screenshot">
    </div>

1. Enter the following details:
- **Name:** Slack
- **Owner:** Cerb

    <div class="cerb-screenshot">
    <img src="/assets/images/guides/slack/plugin/connected-account.png" class="screenshot">
    </div>

1. Click the **Save Changes** button.

If everything was configured properly, you'll see the new connected account in your worklist.

# Use the connected account in bot behaviors

You can use the connected account you just created to access [Slack's API](https://api.slack.com/web) from bot behaviors in Cerb.  This is typically accomplished using the **Execute HTTP Request** action from a bot, and selecting the connected account in the **Authentication:** section.

You can import the [Slack Bot](/packages/slack-bot/) package for a working example.