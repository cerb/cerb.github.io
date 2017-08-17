---
title: Configure the Twitter plugin
excerpt: A step-by-step guide for configuring Cerb's Twitter plugin
layout: integration
topic: Integrations
subtopic: Twitter
jumbotron:
  title: Configure the Twitter plugin
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
    label: Twitter &raquo;
    url: /resources/guides/#twitter
---

* TOC
{:toc}

# Introduction

In this guide we'll walk through the process of linking Cerb to Twitter. You'll be able to use Twitter's full API from bots in Cerb to automate whatever you need.

<div class="cerb-screenshot">
<img src="/assets/images/guides/twitter/plugin/cerb-and-twitter.png" class="screenshot">
</div>

# Install the Twitter plugin

First, you need to install and enable the Twitter plugin in Cerb.

1. Navigate to **Setup >> Plugins >> Installed Plugins**

1. Search for: `twitter`

1. Find the **Twitter Integration** plugin in the worklist and click its **Configure** button.  If the plugin isn't installed, you can download it from the [plugin library](/docs/plugins#library).

1. In the **Status:** field, select _Enabled_.

1. Click the **Save Changes** button.

# Create an OAuth application on Twitter

Next, you need to create a new oauth app on Twitter for Cerb to connect to. Review the [Twitter Developer Documentation](https://dev.twitter.com) additionally if needed.

1. Visit the Twitter [Create an application](https://apps.twitter.com/app/new) developer page.

1. Enter the following details replacing the highlighted blocks with your info:
- **Name:** Cerb for `Your Company Name`
- **Description:** Connects your Twitter account with Cerb Helpdesk
- **Website:** `https://example.cerb.me`
- **Callback URL:** `https://example.cerb.me`

	<div class="cerb-screenshot">
	<img src="/assets/images/guides/twitter/plugin/twitter-new-app.png" class="screenshot">
	</div>

1. Click the **Create your Twitter application** button.

	<div class="cerb-screenshot">
	<img src="/assets/images/guides/twitter/plugin/twitter-new-app2.png" class="screenshot">
	</div>

	<div class="cerb-screenshot">
	<img src="/assets/images/guides/twitter/plugin/twitter-new-app3.png" class="screenshot">
	</div>

1. Make a note for the next step of your **Consumer Key** and **Consumer Secret** which can be found in the **Keys and Access Tokens** tab on the following page.

# Configure the Twitter plugin in Cerb

Add the Twitter app details to Cerb so you can use it to link your accounts.

1. Navigate to **Setup >> Services >> Twitter**

1. Paste your Twitter **Consumer Key**.

1. Paste your Twitter **Consumer Secret**.

1. Click the **Save Changes** button.

# Add a connected account in Cerb

Now we can create connected accounts to securely store Twitter credentials in Cerb.

1. Navigate to **Search >> Connected Accounts**.

1. Click the **(+)** icon above the worklist to add a new account.
    <div class="cerb-screenshot">
    <img src="/assets/images/guides/common/new-connected-account.png" class="screenshot">
    </div>

1. Click on **Twitter**.

1. Click on **Link to a Twitter account**.

1. **Authorize** the OAuth request:

    <div class="cerb-screenshot">
    <img src="/assets/images/guides/twitter/plugin/oauth-approve.png" class="screenshot">
    </div>

1. Enter the following details:
- **Name:** Twitter
- **Owner:** Cerb

    <div class="cerb-screenshot">
    <img src="/assets/images/guides/twitter/plugin/connected-account.png" class="screenshot">
    </div>

1. Click the **Save Changes** button.

If everything was configured properly, you'll see the new connected account in your worklist.

# Use the connected account in bot behaviors

You can use the connected account you just created to access [Twitter's API](https://dev.twitter.com/docs) from bot behaviors in Cerb.  This is typically accomplished using the **Execute HTTP Request** action from a bot, and selecting the connected account in the **Authentication:** section.

{% comment %}
You can import the [Twitter Bot](/packages/twitter-bot/) package for a working example.
{% endcomment %}
