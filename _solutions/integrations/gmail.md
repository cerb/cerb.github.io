---
title: Gmail
excerpt: This page provides a comprehensive guide on integrating Cerb with Gmail by
  configuring Google APIs and setting up Cerb.
summary: This page provides a comprehensive guide on integrating Cerb with Gmail by
  configuring Google APIs and setting up Cerb. It details the steps to create a new
  project in Google Cloud, configure the OAuth consent screen, enable the Gmail API,
  and add necessary credentials. The guide then explains how to configure Cerb by
  creating a connected service and account, using the credentials obtained from Google.
  It concludes with next steps for authenticating a Gmail mailbox using IMAP and XOAUTH2,
  making it a useful resource for automating tasks with Google APIs through Cerb bots.
social_image_url: /assets/images/solutions/integrations/gmail/cerb-and-google.png
redirect_from:
  - /guides/integrations/google/
  - /guides/integrations/google/gmail/
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

In this guide we'll walk through the process of linking Cerb to Gmail. You can use the same process with any [Google API](https://developers.google.com/apis-explorer/#p/) from Cerb bots to automate whatever you need.

# Configure Google APIs

### Create a new project

Log in to: <https://console.cloud.google.com/apis/> as a workspace user.

Click **Create Project** in the top right.

Enter:

|-|-
| Project Name: | `Cerb`
| Organization: | (your organization)
| Location: | (your organization)

Click the blue **Create** button.

Click **Select Project** in the notification in the top right.

### Configure the consent screen

Select **OAuth consent screen** in the left sidebar.

Enter:

|-|-
| User Type: | Internal (only available in workspaces)

Click the blue **Create** button.

Enter:

|-|-
| Application name: | Cerb
| Scopes for Google APIs: | email, profile, openid
| Authorized domains: | _(your Cerb base URL; e.g. `cerb.me`)_

Click the blue **Save** button.

### Enable Gmail API

Click **Library** in the left sidebar.

Search for `Gmail` and select **Gmail API**.

Click the blue **Enable** button at the top of the page.

### Add credentials

Click **Create Credentials** in top right.

Enter:

|-|-
| Select an API: | Gmail API
| What data will you be accessing: | User data

Click the **Next** button.

Click the **Add or Remove Scopes** button.

Select `https://mail.google.com/` (Gmail API) from the list.

Select `https://www.googleapis.com/auth/userinfo.profile` from the list.

Click the **Update** button.

Click the **Save and Continue** button.

In **Application type** select **Web application**.

Enter:

|-|-
| Name: | Cerb
| Authorized redirect URIs: | `https://YOUR-CERB-HOST/oauth/callback`

Click the blue **Create** button.

Click the **Download** button.

Click the **Done** button.

# Configure Cerb

### Create the connected service

Navigate to **Search >> Connected Services**.

Click **(+)** button in the right of the gray bar above the worklist.

In the **Library** tab, select the **Google** package.

Paste your **Client ID** and **Client Secret** from the credentials you downloaded earlier.

Scope:

{% highlight text %}
https://mail.google.com/ https://www.googleapis.com/auth/userinfo.profile
{% endhighlight %}

Click the **Create** button.

### Create the connected account

Navigate to **Search >> Connected Accounts**.

Click **(+)** button in the right of the gray bar above the worklist.

Select **Google**.

Enter:

|-|-
| Name: | `Gmail (you@example.com)` 

Click the blue **Link to Google** button.

Log in with your Google account.

Click **Allow**.

Click the **Save Changes** button.

# Examples
## Search Threads
Scope required (any of the following):

`https://www.googleapis.com/auth/gmail.modify`

`https://www.googleapis.com/auth/gmail.readonly`

`https://www.googleapis.com/auth/gmail.metadata`

{% highlight cerb %}
{% raw %}
start:
  http.request/search:
    output: http_response
    inputs:
      method: GET
      url: https://gmail.googleapis.com/gmail/v1/users/me/threads?q=from:team@cerb.ai
      authentication: cerb:connected_account:gmail
    on_success:
      set:
        response@json: {{http_response.body}}
        http_response@json: null
{% endraw %}
{% endhighlight %}

# Next steps

See: [Authenticate a Gmail mailbox using IMAP and XOAUTH2](/guides/integrations/google/gmail-xoauth/)