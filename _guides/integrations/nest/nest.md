---
title: Integrate with Nest
excerpt: A step-by-step guide for integrating Cerb and Nest.
permalink: /guides/integrations/nest/
social_image_url: /assets/images/guides/nest/cerb-and-nest.png
layout: integration
topic: Integrations
subtopic: Nest
jumbotron:
  title: Cerb + Nest
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
    label: Nest &raquo;
    url: /resources/guides/#nest
---

* TOC
{:toc}

# Introduction

In this guide we'll walk through the process of linking Cerb to Nest. You'll be able to use the full [Nest API](https://developers.nest.com/) from bots in Cerb to automate whatever you need.

<div class="cerb-screenshot">
<img src="{{page.social_image_url}}" class="screenshot">
</div>

# Create an OAuth application at Nest

1. Log in to the [Nest Developer Console](https://console.developers.nest.com/).

1. Click the orange **Create new OAuth client** button.

1. Enter the following details replacing `YOUR-CERB-HOST` with the URL to your Cerb installation:
- **OAuth Client Name:** Cerb
- **Description:** Nest automation from bots in Cerb.
- **Support URL:** `https://YOUR-WEBSITE`
- **Default OAuth Redirect URI:** `https://YOUR-CERB-HOST/oauth/callback`
- **Categories:** Software Provider, Home Automation
- **Users:** (depends on your use case)

1. Copy the **Client ID** and **Client Secret**.

# Create the Nest service in Cerb

1. Log in to Cerb.

1. Navigate to **Search >> Connected Services**.

1. Click the **(+)** icon above the worklist.

1. Select **Nest**.

1. Paste your **Client ID** and **Client Secret**.

1. Click the **Create** button.

# Link the connected account to Nest in Cerb

1. Navigate to **Search >> Connected Accounts**.

1. Click the **(+)** icon in the top right of the list.

1. Select **Nest**.

1. Click the blue **Link to Nest** button.

1. Accept consent on Nest.

1. Click the **Save Changes** button.

# Use the connected account in bot behaviors

You can use the connected account you just created to access [Nest's API](https://developers.nest.com/) from bot behaviors in Cerb.  This is typically accomplished using the **Execute HTTP Request** action from a bot, and selecting the connected account in the **Authentication:** section.