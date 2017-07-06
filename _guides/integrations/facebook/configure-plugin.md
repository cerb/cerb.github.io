---
title: Configure the Facebook plugin
excerpt: A step-by-step guide for configuring Cerb's Facebook plugin to access and manage pages with bots.
layout: integration
topic: Integrations
subtopic: Facebook
jumbotron:
  title: Configure the Facebook plugin
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
    label: Facebook &raquo;
    url: /resources/guides/#facebook
---

* TOC
{:toc}

# Introduction

In this guide we'll walk through the process of linking a Facebook page to Cerb. You'll be able to use Facebook's full API from bots in Cerb to automate whatever you need.

# Install the Facebook plugin

First, you need to install and enable the Facebook plugin in Cerb.

1. Navigate to **Setup >> Plugins >> Installed Plugins**

1. Search for: `facebook`

1. Find the **Facebook Integration** plugin in the worklist and click its **Configure** button.  If the plugin isn't installed, you can download it from the [plugin library](/docs/plugins#library).

1. In the **Status:** field, select _Enabled_.

1. Click the **Save Changes** button.

# Create an app on Facebook

Next, you need to create a new app on Facebook for Cerb to connect to.

1. Open <https://developers.facebook.com> and sign in.

1. In the top right, click **My Apps >> Add a New App**.
    <div class="cerb-screenshot">
    <img src="/assets/images/guides/facebook/plugin/facebook-new-app.png" class="screenshot">
    </div>

1. In the menu on the left, select **Settings**.

1. Under **App Domains**, add the domain where you host Cerb (e.g. `example.cerb.me`).

1. Click the **+ Add Platform** button at the bottom and select **Website**.

1. In **Site URL**, add the URL to your Cerb installation (e.g. `https://example.cerb.me`).

1. Click the blue **Saves Changes** button in the bottom right.

1. Make a note of your **App ID** and **App Secret** for the next step.

# Configure the Facebook plugin in Cerb

Add the Facebook app details to Cerb so you can use it to link your accounts.

1. Navigate to **Setup >> Services >> Facebook**

1. Copy your Facebook **App ID** to **Consumer key**.

1. Copy your Facebook **App Secret** to **Consumer secret**.

1. Click the **Save Changes** button.

# Add a connected account in Cerb

Now we can create connected accounts to securely store Facebook page credentials in Cerb.

1. Navigate to **Search >> Connected Accounts**.

1. Click the **(+)** icon above the worklist to add a new account.
    <div class="cerb-screenshot">
    <img src="/assets/images/guides/facebook/plugin/new-connected-account.png" class="screenshot">
    </div>

1. Click on **Facebook Pages**.

1. Click on **Link to a Facebook page**.

1. This will open a popup that lists the Facebook pages that you're an administrator on.  Select a page and click **Continue**.

1. Enter the following details:
- **Name:** Facebook Page: _(Your Page Name)_
- **Owner:** Cerb

1. Click the **Save Changes** button.

If everything was configured properly, you'll see the new connected account in your worklist.

# Use the connected account in bot behaviors

You can use the connected account you just created to access [Facebook's Graph API](https://developers.facebook.com/docs/graph-api) from bot behaviors in Cerb.  This is typically accomplished using the **Execute HTTP Request** action from a bot, and selecting the connected account in the **Authentication:** section.

You can import the [Facebook Page Bot](/packages/facebook-page-bot/) package for a working example.