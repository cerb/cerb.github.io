---
title: Dropbox
excerpt: A step-by-step guide for integrating Cerb and Dropbox.
summary: This page provides a comprehensive guide on integrating Cerb with Dropbox.
  It covers the entire process, starting with creating an app on Dropbox to enable
  Cerb to connect and use Dropbox's API. The guide details the steps to create a Dropbox
  service in Cerb, link a connected account to Dropbox, and utilize this connection
  in bot behaviors within Cerb. It includes instructions for setting up OAuth 2 Redirect
  URIs, entering necessary credentials, and using the connected account to automate
  tasks through Dropbox's API using Cerb's bot functionalities.
social_image_url: /assets/images/solutions/integrations/dropbox/cerb-and-dropbox.png
redirect_from:
  - /guides/integrations/dropbox/
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

In this guide we'll walk through the process of linking Cerb to Dropbox. You'll be able to use Dropbox's full API from bots in Cerb to automate whatever you need.

# Create an app at Dropbox

First, you need to create a new app on Dropbox for Cerb to connect to.

1. Open <https://www.dropbox.com/developers/apps> and sign in.

1. In the top right, click **Create app**.
    <div class="cerb-screenshot">
    <img src="/assets/images/solutions/integrations/dropbox/plugin/dropbox-new-app.png" class="screenshot">
    </div>

1. Select **Dropbox API**.

1. Select the folders you want Cerb to be able to access.

1. Name your app (e.g. "Cerb").

1. Agree to the Dropbox API terms and conditions.

1. Click the blue **Create app** button.

1. Configure your **OAuth 2 Redirect URIs**:

  <pre>
  <code class="language-text">
  https://YOUR-CERB-HOST/oauth/callback
  </code>
  </pre>

Make a note of your **App key** and **App secret** for the next step.

# Create the Dropbox service in Cerb

1. Navigate to **Search >> Connected Services**.

1. Click the **(+)** icon in the top right of the list.

1. Select **Dropbox**.

	<div class="cerb-screenshot">
	<img src="/assets/images/guides/common/package-library-connected-services.png" class="screenshot">
	</div>

1. Enter your App Key and App Secret.

	<div class="cerb-screenshot">
	<img src="/assets/images/solutions/integrations/dropbox/package-library-service-dropbox.png" class="screenshot">
	</div>

1. Click the **Create** button.

# Link the connected account to Dropbox in Cerb

1. Navigate to **Search >> Connected Accounts**.

1. Click the **(+)** icon in the top right of the list.

1. Select **Dropbox**.

1. Click the blue **Link to Dropbox** button.

1. Accept consent on Dropbox.

    <div class="cerb-screenshot">
    <img src="/assets/images/solutions/integrations/dropbox/plugin/oauth-approve.png" class="screenshot">
    </div>
    
1. Click the **Save Changes** button.

# Use the connected account in bot behaviors

You can use the connected account you just created to access [Dropbox's API](https://www.dropbox.com/developers) from bot behaviors in Cerb.  This is typically accomplished using the **Execute HTTP Request** action from a bot, and selecting the connected account in the **Authentication:** section.

You can import the [Dropbox Bot](/packages/dropbox-bot/) package for a working example.