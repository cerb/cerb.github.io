---
title: Azure
excerpt: This page provides a detailed guide on integrating Cerb with Office365 by
  configuring a Microsoft Entra app and setting up Cerb.
summary: This page provides a detailed guide on integrating Cerb with Office365 by
  configuring a Microsoft Entra app and setting up Cerb. It includes step-by-step
  instructions for creating a new app and client secret in Azure, as well as creating
  a connected service and account in Cerb. The guide is designed to help users automate
  tasks using Azure APIs with Cerb bots. It concludes with a reference to further steps
  for authenticating an Office365 mailbox using XOAUTH2.
social_image_url: /assets/images/solutions/integrations/azure/cerb-and-azure.png
redirect_from:
  - /guides/integrations/azure/office365/
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

In this guide we'll walk through the process of linking Cerb to Office365. You can use the same process with any [Azure API](https://docs.microsoft.com/en-us/rest/api/azure/) from Cerb bots to automate whatever you need.

# Configure an Entra app

### Create a new app

1. Log in to: <https://entra.microsoft.com/>

2. Select **Applications >> App registrations** in the left sidebar.

3. Click the **+ New registration** button at the top.

4. Enter:

    |-|-
    | Name: | `Cerb`
    | Supported account types: | Accounts in this organizational directory only
    | Redirect URI Platform: | **Web**
    | Redirect URI: | `https://YOUR-CERB-HOST/oauth/callback`

5. Click the blue **Register** button at the bottom.

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

<div class="cerb-box note">
  <p>
    The <code>offline_access</code> scope is required for Cerb to automatically renew the access token every hour.
  </p>
</div>

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

# Troubleshooting

## When linking the connected account I get an "invalid_client" error

* Verify that the "Callback URL" in Entra matches exactly. If you have `/index.php` in your Cerb URLs, then the endpoint should be: `https://{HOST}/index.php/oauth/callback`

* Verify there is no trailing slash (`/`) in the Entra callback URL (e.g. `/oauth/callback`).

## The access token stops working after an hour and isn't refreshed

* Verify `offline_access` is included in the connected service's "Scope" field. This allows Cerb to refresh the access token every hour.

* Verify that the scheduled task that pings the `/cron` endpoint is using the same hostname you configured in the callback URL. It should always use `https://`.

## The connected account stops working after several months

* Entra app secrets expire in 6 months by default. Establish a regular process for rotating secrets before then. Update the connected service in Cerb with the new secret. Edit and save your mailboxes to clear the failure count.

# Next steps

See: [Authenticate an Office365 mailbox using XOAUTH2](/guides/integrations/azure/o365-xoauth/)