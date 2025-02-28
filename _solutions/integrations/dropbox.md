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

Open <https://www.dropbox.com/developers/apps> and sign in.

In the top right, click **Create app**.

<div class="cerb-screenshot">
<img src="/assets/images/solutions/integrations/dropbox/plugin/dropbox-new-app.png" class="screenshot">
</div>

Select **Dropbox API**.

Select the folders you want Cerb to be able to access.

Name your app (e.g. "Cerb").

Agree to the Dropbox API terms and conditions.

Click the blue **Create app** button.

Configure your **OAuth 2 Redirect URIs**:

{% highlight text %}
https://YOUR-CERB-HOST/oauth/callback
{% endhighlight %}

Make a note of your **App key** and **App secret** for the next step.

# Create the Dropbox service in Cerb

Navigate to **Search >> Connected Services**.

Click the **(+)** icon in the top right of the list.

Select **Dropbox**.

<div class="cerb-screenshot">
<img src="/assets/images/guides/common/package-library-connected-services.png" class="screenshot">
</div>

Enter your App Key and App Secret.

<div class="cerb-screenshot">
<img src="/assets/images/solutions/integrations/dropbox/package-library-service-dropbox.png" class="screenshot">
</div>

Click the **Create** button.

# Link the connected account to Dropbox in Cerb

Navigate to **Search >> Connected Accounts**.

Click the **(+)** icon in the top right of the list.

Select **Dropbox**.

Click the blue **Link to Dropbox** button.

Accept consent on Dropbox.

<div class="cerb-screenshot">
<img src="/assets/images/solutions/integrations/dropbox/plugin/oauth-approve.png" class="screenshot">
</div>
    
Click the **Save Changes** button.

# Use the connected account in bot behaviors

You can use the connected account you just created to access [Dropbox's API](https://www.dropbox.com/developers) within automations in Cerb.  This is typically accomplished using the ``http.request`` command and using the connected account in the ``authentication`` field.

You can import the [Dropbox Integration](/workflows/wgm.integrations.dropbox) workflow for a working example.