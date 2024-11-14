---
title: Integrate with Slack
excerpt: A step-by-step guide for integrating Cerb and Slack.
permalink: /guides/integrations/slack/
layout: integration
topic: Integrations
subtopic: Slack
jumbotron:
  title: Cerb + Slack
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

In this guide we'll walk through the process of linking Cerb to Slack. You'll be able to use Slack's full API from automations in Cerb.

<div class="cerb-screenshot">
<img src="/assets/images/guides/slack/plugin/cerb-and-slack.png" class="screenshot">
</div>

# Create a new app at Slack

First, you need to create a new app on Slack for Cerb to connect to.

Log in to [Slack's developer portal](https://api.slack.com/apps).

Click the green **Create New App** button.

Select **From scratch**.

Enter the following details:

|---
|-|-
| **App Name:** | Cerb
| **Development Slack Team:** | (your team name)

<div class="cerb-screenshot">
<img src="/assets/images/guides/slack/plugin/slack-new-app.png" class="screenshot">
</div>

Click the **Create App** button.

## Configure Slack authentication

You can choose to authenticate with either **bot tokens** or **OAuth2**.

### Option 1: Bot Tokens (Recommended)

This is the simplest authentication method. It uses a single OAuth2 token for the bot and doesn't link Slack user accounts.

Select **OAuth & Permissions** from the left sidebar.

Scroll down to **Scopes**.

In **Bot Token Scopes** click the **Add an OAuth Scope** button.

Add the `chat:write` scope.

Scroll up to **OAuth Tokens** and click the **Install** button.

Click **Allow** on the consent screen.

Copy the **Bot User OAuth Token**.

### Option 2: OAuth2

This authentication method links individual Slack users to Cerb connected accounts. Use this if you need to automate a user's account.

Select **Basic Information** in the left sidebar.

Scroll down to **App Credentials** and make a note of your **Client ID** and **Client Secret** for the next step.

Select **OAuth & Permissions** from the left sidebar.

Scroll down to **Redirect URLs**.

Click the **Add Redirect URL** button and enter the base URL to your Cerb install (e.g. `https://YOUR-CERB-HOST/`).

# Create the Slack connected account in Cerb

In Cerb, navigate to **Search >> Connected Services**.

Click the **(+)** icon in the top right of the list.

Select **Slack**.

Enter either the **[Bot Tokens]** or **[OAuth2]** fields depending on your authentication option above. 

Click the **Create** button at the bottom of the popup.

<div class="cerb-screenshot">
<img src="/assets/images/guides/slack/package-library-service-slack.png" class="screenshot">
</div>

### Bot Tokens

You're done!

### OAuth2

If you're using OAuth2 authentication, you need to link Slack user accounts to Cerb.

Navigate to **Search >> Connected Accounts**.

Click the **(+)** icon in the top right of the list.

Select **Slack**.

Click the blue **Link to Slack** button.

Accept consent on Slack.

<div class="cerb-screenshot">
<img src="/assets/images/guides/slack/plugin/oauth-approve.png" class="screenshot">
</div>

Click the **Save Changes** button.

# Related Resources

* Workflow: [Slack Notifications](/workflows/cerb.integrations.slack.notifications/)