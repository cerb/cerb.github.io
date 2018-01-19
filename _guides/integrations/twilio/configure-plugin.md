---
title: Configure the Twilio plugin
excerpt: A step-by-step guide for configuring Cerb's Twilio plugin.
layout: integration
topic: Integrations
subtopic: Twilio
jumbotron:
  title: Configure the Twilio plugin
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
    label: Twilio &raquo;
    url: /resources/guides/#twilio
---

* TOC
{:toc}

# Introduction

In this guide we'll walk through the process of linking Cerb to Twilio. You'll be able to use Twilio's full API from bots in Cerb.

<div class="cerb-screenshot">
<img src="/assets/images/guides/twilio/plugin/cerb-and-twilio.png" class="screenshot">
</div>

# Install the Twilio plugin

First, you need to install and enable the Twilio plugin in Cerb.

1. Navigate to **Setup >> Plugins >> Installed Plugins**

1. Search for: `twilio`

1. Find the **Twilio Integration** plugin in the worklist and click its **Configure** button.  If the plugin isn't installed, you can download it from the [plugin library](/docs/plugins#library).

1. In the **Status:** field, select _Enabled_.

1. Click the **Save Changes** button.

# Add a connected account in Cerb

Now we can create connected accounts to securely store Twilio credentials in Cerb.

1. Navigate to **Search >> Connected Accounts**.

1. Click the **(+)** icon above the worklist to add a new account.
    <div class="cerb-screenshot">
    <img src="/assets/images/guides/common/new-connected-account.png" class="screenshot">
    </div>

1. Click on **Twilio**.

1. Enter the following details:
- **Name:** Twilio
- **Owner:** Cerb
- **Account SID:** (you'll find this on your Twilio dashboard)
- **Auth Token:** (you'll find this on your Twilio dashboard)
- **Default Caller ID:** (e.g. +15551234567)

    <div class="cerb-screenshot">
    <img src="/assets/images/guides/twilio/plugin/connected-account.png" class="screenshot">
    </div>

1. Click the **Save Changes** button.

If everything was configured properly, you'll see the new connected account in your worklist.

# Use the connected account in bot behaviors

You can use the connected account you just created to access [Twilio's API](https://www.twilio.com/docs/api/rest) from bot behaviors in Cerb.  This is typically accomplished using the **Execute HTTP Request** action from a bot, and selecting the connected account in the **Authentication:** section.

You can import the [Twilio Bot](/packages/twilio-bot/) package for a working example.
