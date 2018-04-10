---
title: Configure the Dropbox plugin
excerpt: A step-by-step guide for configuring Cerb's Dropbox plugin.
layout: integration
topic: Integrations
subtopic: Dropbox
jumbotron:
  title: Configure the Dropbox plugin
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
    label: Dropbox &raquo;
    url: /resources/guides/#dropbox
---

* TOC
{:toc}

# Introduction

<div class="cerb-screenshot">
<img src="/assets/images/guides/dropbox/cerb-and-dropbox.png" class="screenshot">
</div>

In this guide we'll walk through the process of linking Cerb to Dropbox. You'll be able to use Dropbox's full API from bots in Cerb to automate whatever you need.

# Install the Dropbox plugin

First, you need to install and enable the Dropbox plugin in Cerb.

1. Navigate to **Setup >> Plugins >> Installed Plugins**

1. Search for: `dropbox`

1. Find the **Dropbox Integration** plugin in the worklist and click its **Configure** button.  If the plugin isn't installed, you can download it from the [plugin library](/docs/plugins#library).

1. In the **Status:** field, select _Enabled_.

1. Click the **Save Changes** button.

# Create an app on Dropbox

Next, you need to create a new app on Dropbox for Cerb to connect to.

1. Open <https://www.dropbox.com/developers/apps> and sign in.

1. In the top right, click **Create app**.
    <div class="cerb-screenshot">
    <img src="/assets/images/guides/dropbox/plugin/dropbox-new-app.png" class="screenshot">
    </div>

1. Select **Dropbox API**.

1. Select the folders you want Cerb to be able to access.

1. Name your app (e.g. "Cerb").

1. Agree to the Dropbox API terms and conditions.

1. Click the blue **Create app** button.

1. Configure your **OAuth 2 Redirect URIs**:

  <pre>
  <code class="language-text">
  https://cerb.example/oauth/callback/wgm.dropbox.service.provider
  </code>
  </pre>

Make a note of your **App key** and **App secret** for the next step.

# Configure the Dropbox plugin in Cerb

Add the Dropbox app details to Cerb so you can use it to link your accounts.

1. Navigate to **Setup >> Services >> Dropbox**

1. Paste your Dropbox **App key**.

1. Paste your Dropbox **App secret**.

1. Click the **Save Changes** button.

# Add a connected account in Cerb

Now we can create connected accounts to securely store Dropbox credentials in Cerb.

1. Navigate to **Search >> Connected Accounts**.

1. Click the **(+)** icon above the worklist to add a new account.
    <div class="cerb-screenshot">
    <img src="/assets/images/guides/dropbox/plugin/new-connected-account.png" class="screenshot">
    </div>

1. Click on **Dropbox**.

1. Click on **Link to a Dropbox account**.

    <div class="cerb-screenshot">
    <img src="/assets/images/guides/dropbox/plugin/oauth-approve.png" class="screenshot">
    </div>
    
1. Enter the following details:
- **Name:** Dropbox
- **Owner:** Cerb

1. Click the **Save Changes** button.

If everything was configured properly, you'll see the new connected account in your worklist.

# Use the connected account in bot behaviors

You can use the connected account you just created to access [Dropbox's API](https://www.dropbox.com/developers) from bot behaviors in Cerb.  This is typically accomplished using the **Execute HTTP Request** action from a bot, and selecting the connected account in the **Authentication:** section.

You can import the [Dropbox Bot](/packages/dropbox-bot/) package for a working example.