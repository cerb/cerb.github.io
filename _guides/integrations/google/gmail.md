---
title: Integrate with Gmail
excerpt: A step-by-step guide for integrating Cerb and Gmail.
permalink: /guides/integrations/google/gmail/
redirect_from:
 - /guides/integrations/google/
social_image_url: /assets/images/guides/google/cerb-and-google.png
layout: integration
topic: Integrations
subtopic: Google
jumbotron:
  title: Cerb + Gmail
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
    label: Google &raquo;
    url: /resources/guides/#google
---

* TOC
{:toc}

# Introduction

In this guide we'll walk through the process of linking Cerb to Gmail. You can the same process with any [Google API](https://developers.google.com/apis-explorer/#p/) from Cerb bots to automate whatever you need.

<div class="cerb-screenshot">
<img src="{{page.social_image_url}}" class="screenshot">
</div>

# Configure Google APIs

### Create a new project

1. Log in to: <https://console.developers.google.com/cloud-resource-manager/>

1. Click **Create Project** in the top right.

1. Enter:

    |-|-
    | Project Name: | `Cerb`
    | Organization: | _(none, or your preference)_

1. Click the blue **Create** button.

1. Click **Select Project** in the notification in the top right.

### Configure the consent screen

1. Select **OAuth consent screen** in the left sidebar.

1. Enter:

    |-|-
    | User Type: | Internal (if GSuite), or External

1. Click the blue **Create** button.

1. Enter:

    |-|-
    | Application name: | Cerb
    | Scopes for Google APIs: | email, profile, openid
    | Authorized domains: | _(your Cerb base URL; e.g. `cerb.example.com`)_

1. Click the blue **Save** button.

### Enable Gmail API

1. Click **Library** in the left sidebar.

1. Search for `Gmail` and select **Gmail API**.

1. Click the blue **Enable** button at the top of the page.

### Add credentials

1. Click **Create Credentials** in top right.

1. Enter:

    |-|-
    | Which API: | Gmail API
    | Calling from: | Web server
    | What data will you be accessing: | User data

1. Click the blue **What credentials do I need?** button.

1. Enter:

    |-|-
    | Name: | Cerb
    | Authorized redirect URIs: | `https://YOUR-CERB-HOST/oauth/callback`

1. Click the blue **Create OAuth client ID** button.

1. Click the **Download** button.

1. Click the **Done** button.

### Add Gmail scope

1. Select **OAuth consent screen** in the left sidebar.

1. Click **Edit App** at the top.

1. Click the **Add scope** button.

1. Select: `https://mail.google.com/`

1. Click the blue **ADD** button in the bottom right of the popup.

1. Click the **Save** button at the bottom.

# Configure Cerb

### Create the connected service

1. Navigate to **Search >> Connected Services**.

1. Click **(+)** button in the right of the gray bar above the worklist.

1. In the **Library** tab, select the **Google** package.

1. Paste your **Client ID** and **Client Secret** from the credentials you downloaded earlier.

1. Scope:

    <pre>
    <code class="language-text">
    https://mail.google.com/ https://www.googleapis.com/auth/userinfo.profile
    </code>
    </pre>

1. Click the **Create** button.

### Create the connected account

1. Navigate to **Search >> Connected Accounts**.

1. Click **(+)** button in the right of the gray bar above the worklist.

1. Select **Google**.

1. Enter:

    |-|-
    | Name: | `Gmail (you@example.com)` 

1. Click the blue **Link to Google** button.

1. Log in with your Google account.

1. Until your app is verified, click **Advanced** link at the bottom, then click the **Go to (your Cerb URL)** link.

1. Click **Allow**.
 
1. Make sure both permissions are selected.

1. Click the **Allow** button again.

1. Click the **Save Changes** button.

# Next steps

See: [Authenticate a Gmail mailbox using IMAP and XOAUTH2](/guides/integrations/google/gmail-xoauth/)