---
title: Notion
excerpt: A step-by-step guide for integrating Cerb and Notion
summary: 
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

In this guide we'll walk through the process of linking Cerb to Notion, a collaborative notebook and planner. You'll be able to use Notion's full API for any automations you wish to make.

# Get a Notion API Key.

Log in to your [Notion Account](https://www.notion.so) or sign up if you don't already have one.

Go to your [integrations page](https://www.notion.so/profile/integrations) and click **New integration**.

Name the integration and select the associated workspace and type (internal). You can also add a logo if you'd like.

Click **Show* and then **Copy** to the right of the **Internal Integration Secret** box.

# Create the Notion service in Cerb

1. Navigate to **Search >> Connected Services**.

2. Click the **(+)** icon in the top right of the list.

3. Select **Notion**.

4. Paste the key you copied earlier in the **Integration Secret** field.

5. Click the **Create** button.


