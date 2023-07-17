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

In this guide we'll walk through the process of linking Cerb to Gmail. You can use the same process with any [Google API](https://developers.google.com/apis-explorer/#p/) from Cerb bots to automate whatever you need.

<div class="cerb-screenshot">
<img src="{{page.social_image_url}}" class="screenshot">
</div>

# Configure Google APIs

### Create a new project

1. Log in to: <https://console.cloud.google.com/apis/> as a workspace user.

1. Click **Create Project** in the top right.

1. Enter:

    |-|-
    | Project Name: | `Cerb`
    | Organization: | (your organization)
    | Location: | (your organization)

1. Click the blue **Create** button.

1. Click **Select Project** in the notification in the top right.

### Configure the consent screen

1. Select **OAuth consent screen** in the left sidebar.

1. Enter:

    |-|-
    | User Type: | Internal (only available in workspaces)

1. Click the blue **Create** button.

1. Enter:

    |-|-
    | Application name: | Cerb
    | Scopes for Google APIs: | email, profile, openid
    | Authorized domains: | _(your Cerb base URL; e.g. `cerb.me`)_

1. Click the blue **Save** button.

### Enable Gmail API

1. Click **Library** in the left sidebar.

1. Search for `Gmail` and select **Gmail API**.

1. Click the blue **Enable** button at the top of the page.

### Add credentials

1. Click **Create Credentials** in top right.

1. Enter:

    |-|-
    | Select an API: | Gmail API
    | What data will you be accessing: | User data

1. Click the **Next** button.

1. Click the **Add or Remove Scopes** button.

1. Select `https://mail.google.com/` (Gmail API) from the list.

1. Select `https://www.googleapis.com/auth/userinfo.profile` from the list.

1. Click the **Update** button.

1. Click the **Save and Continue** button.

1. In **Application type** select **Web application**.

1. Enter:

    |-|-
    | Name: | Cerb
    | Authorized redirect URIs: | `https://YOUR-CERB-HOST/oauth/callback`

1. Click the blue **Create** button.

1. Click the **Download** button.

1. Click the **Done** button.

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

1. Click **Allow**.

1. Click the **Save Changes** button.

# Next steps

See: [Authenticate a Gmail mailbox using IMAP and XOAUTH2](/guides/integrations/google/gmail-xoauth/)