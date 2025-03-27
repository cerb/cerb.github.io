---
title: Bluesky
excerpt: A step-by-step guide for integrating Cerb and Bluesky.
social_image_url: /assets/images/solutions/integrations/cerb-and-bluesky.png
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

In this guide we'll walk through the process of linking Cerb to Bluesky. You'll be able to use Bluesky's full API in Cerb automations.

# Create a Bluesky App Password.

Log in to your [Bluesky Account](https://bsky.app) or sign up if you don't already have one.

Choose **Settings** in the menu and then click the **Privacy and Security >> App Passwords**.

Click **App App Password**

Name the password (eg. `cerb`) and click **Next**.

Copy the password for use later.

# Create the Bluesky service in Cerb

1. Navigate to **Search >> Connected Services**.

2. Click the **(+)** icon in the top right of the list.

3. Select **Bluesky**.

4. Enter the following information:
   1. Your PDS Entryway URL (eg. `https://bsky.social`).
   2. Your Identifier (eg. `example.bsky.social`).
   3. The app password you copied earlier.
5. Click the **Create** button.

# Examples

## Make a post

<https://docs.bsky.app/docs/advanced-guides/posts>

{% highlight cerb %}
{% raw %}
start:
  http.request/post:
    output: http_response
    inputs:
      method: POST
      url: https://bsky.social/xrpc/com.atproto.repo.createRecord
      headers:
        Content-Type: application/json
      authentication: cerb:connected_account:bluesky
      body:
        repo: example.bsky.social
        collection: app.bsky.feed.post
        record:
          text: Testing, testing, 1,2,3!
          createdAt: {{'now'|date('c')}}
{% endraw %}
{% endhighlight %}