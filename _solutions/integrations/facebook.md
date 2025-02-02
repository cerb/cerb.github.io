---
title: Facebook
excerpt: A step-by-step guide for integrating Cerb and Facebook.
summary: This page provides a comprehensive guide on integrating Facebook with Cerb.
  It outlines the steps to create a Facebook app, set up a Facebook service in Cerb,
  and link a connected account to Facebook. The guide also details how to create connected
  accounts for Facebook Pages and utilize these accounts in bot behaviors within Cerb.
  By following these instructions, users can leverage Facebook's full API to automate
  tasks using Cerb's bot functionalities.
social_image_url: /assets/images/solutions/integrations/facebook/plugin/cerb-and-facebook.png
redirect_from:
  - /guides/integrations/facobook/
layout: solution
jumbotron:
  breadcrumbs:
    - label: Resources &raquo;
      url: /resources/
    - label: Solutions Hub &raquo;
      url: /solutions/
    - label: Integrations &raquo;
      url: /solutions/#integrations
---

* TOC
{:toc}

# Introduction

In this guide we'll walk through the process of linking a Facebook account to Cerb. You'll be able to use Facebook's full API from bots in Cerb to automate whatever you need.

# Create an app at Facebook

Next, you need to create a new app on Facebook for Cerb to connect to.

1. Open <https://developers.facebook.com> and sign in.

1. In the top right, click **My Apps >> Add a New App**.
    <div class="cerb-screenshot">
    <img src="/assets/images/solutions/integrations/facebook/plugin/facebook-new-app.png" class="screenshot">
    </div>

1. In the menu on the left, select **Settings**.

1. Under **App Domains**, add the domain where you host Cerb (e.g. `example.cerb.me`).

1. Click the **+ Add Platform** button at the bottom and select **Website**.

1. In **Site URL**, add the URL to your Cerb installation (e.g. `https://YOUR-CERB-HOST`).

1. Click the blue **Saves Changes** button in the bottom right.

1. Make a note of your **App ID** and **App Secret** for the next step.

# Create the Facebook service in Cerb

1. Navigate to **Search >> Connected Services**.

1. Click the **(+)** icon in the top right of the list.

1. Select **Facebook**.

	<div class="cerb-screenshot">
	<img src="/assets/images/guides/common/package-library-connected-services.png" class="screenshot">
	</div>

1. Enter your App ID and App Secret.

	<div class="cerb-screenshot">
	<img src="/assets/images/solutions/integrations/facebook/package-library-service-facebook.png" class="screenshot">
	</div>

1. Click the **Create** button.

# Link the connected account to Facebook in Cerb

1. Navigate to **Search >> Connected Accounts**.

1. Click the **(+)** icon in the top right of the list.

1. Select **Facebook**.

1. Click the blue **Link to Facebook** button.

1. Accept consent on Facebook.

1. Click the **Save Changes** button.

# Create connected accounts for Facebook Pages

1. Navigate to **Setup >> Connected Accounts**.

1. Click the **(+)** icon above the worklist.

1. Click **Facebook Pages**.
	* Name: `(your page name)`
	* Owner: **Cerb**
	* Facebook Account: (select the Facebook account from above)

1. This will display a list of Facebook pages associated with your account. Select one.

1. Click the **Save Changes** button.

You can repeat the steps in this section for all of your Facebook pages.

# Use the connected account in bot behaviors

You can use the connected account you just created to access [Facebook's Graph API](https://developers.facebook.com/docs/graph-api) from bot behaviors in Cerb.  This is typically accomplished using the **Execute HTTP Request** action from a bot, and selecting the connected account in the **Authentication:** section.

You can import the [Facebook Page Bot](/packages/facebook-page-bot/) package for a working example.