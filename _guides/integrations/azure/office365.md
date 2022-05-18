---
title: Integrate with Office365
excerpt: A step-by-step guide for integrating Cerb and Office365.
permalink: /guides/integrations/azure/office365/
social_image_url: /assets/images/guides/azure/cerb-and-azure.png
layout: integration
topic: Integrations
subtopic: Microsoft Azure
jumbotron:
  title: Cerb + Office365
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
    label: Azure &raquo;
    url: /resources/guides/#azure
---

* TOC
{:toc}

# Introduction

In this guide we'll walk through the process of linking Cerb to Office365. You can use the same process with any [Azure API](https://docs.microsoft.com/en-us/rest/api/azure/) from Cerb bots to automate whatever you need.

<div class="cerb-screenshot">
<img src="{{page.social_image_url}}" class="screenshot" width="500">
</div>

# Configure an Azure app

### Create a new app

1. Log in to: <https://portal.azure.com/>

2. Navigate to **Azure Active Directory** in the top search box.

3. Select **App registrations** in the left sidebar.

4. Click the **+ New registration** button at the top.

5. Enter:

    |-|-
    | Name: | `Cerb`
    | Supported account types: | Accounts in this organizational directory only
    | Redirect URI Platform: | **Web**
    | Redirect URI: | `https://YOUR-CERB-HOST/oauth/callback`

6. Click the blue **Register** button at the bottom.

### Create client secret

1. In the new app registration, navigate to **Certificates & secrets**.

2. Click the **New client secret** button in the **Client secrets** section near the middle of the page.

   |---
   |-|-
   | **Description** | Cerb
   | **Expires** | Never

3. Click the blue **Add** button.

4. Copy the **Value** (not the **Secret ID**).

# Configure Cerb

### Create the connected service

1. Navigate to **Search >> Connected Services**.

2. Click **(+)** button in the right of the gray bar above the worklist.

3. In the **Build** tab, enter:

   |-|-
   | Name: | Office365
   | URI: | o365
   | Type: | OAuth2 Provider
   | Grant Type: | Authorization Code
   | Client ID: | (from above)
   | Client Secret: | (from above)
   | Authorization URL: | `https://login.microsoftonline.com/{DIRECTORY-ID}/oauth2/v2.0/authorize`
   | Access Token URL: | `https://login.microsoftonline.com/{DIRECTORY-ID}/oauth2/v2.0/token`
   | Resource Owner URL: | (blank)
   | Scope: | `email openid offline_access https://outlook.office.com/IMAP.AccessAsUser.All https://outlook.office.com/SMTP.Send`
   | Approval Prompt: | (blank)

   You can find the `{DIRECTORY-ID}` in the Azure portal for your app registration as **Directory (tenant) ID**.

4. Paste your **Client ID** and **Client Secret** from the credentials you copied earlier.

5. Click the **Save Changes** button.

### Create the connected account

1. Navigate to **Search >> Connected Accounts**.

2. Click **(+)** button in the right of the gray bar above the worklist.

3. Select **Office365**.

4. Enter:

    |-|-
    | Name: | `Office365 (you@example.com)` 

5. Click the blue **Link to Office365** button.

6. Log in with your Office365 account.

7. Click **Accept**.

8. Click the **Save Changes** button.

# Next steps

See: [Authenticate an Office365 mailbox using XOAUTH2](/guides/integrations/azure/o365-xoauth/)