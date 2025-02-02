---
title: Smartsheet
excerpt: A step-by-step guide for integrating Cerb and Smartsheet.
summary: This page provides a detailed guide on integrating Cerb with Smartsheet,
  enabling the use of Smartsheet's API within Cerb's bot behaviors for automation
  purposes. It outlines the steps to create an OAuth access token in Smartsheet, set
  up the Smartsheet service in Cerb, and utilize the connected account in bot behaviors.
  The guide includes instructions for generating an access token in Smartsheet, configuring
  the Smartsheet service in Cerb (version 9.2.1 or later), and using the connected
  account to execute HTTP requests through Cerb's bots.
social_image_url: /assets/images/solutions/integrations/smartsheet/cerb-and-smartsheet.png
redirect_from:
  - /guides/integrations/smartsheet/
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

In this guide we'll walk through the process of linking Cerb to Smartsheet. You'll be able to use Smartsheet's full API from bots in Cerb to automate whatever you need.

# Create an OAuth access token at Smartsheet

1. Log in to Smartsheet.

1. Click the account silhouette icon in the top right.

1. Select **Personal Settings**.

1. Select **API Access** in the left sidebar of the popup.

1. Click the blue **Generate new access token** button.

1. Name the access token **Cerb**.

1. Copy the access token so it can be used later in this guide.

# Create the Smartsheet service in Cerb

(This requires Cerb [9.2.1](/releases/9.2.1/) or later)

1. Log in to Cerb.

1. Navigate to **Search >> Connected Services**.

1. Click the **(+)** icon above the services worklist.

1. Select **Smartsheet**.

1. Paste your access token from above.

1. Click the **Create** button.

This will create a new connected service and account for you.

# Use the connected account in bot behaviors

You can use the connected account you just created to access [Smartsheet's API](https://smartsheet-platform.github.io/api-docs/) from bot behaviors in Cerb.  This is typically accomplished using the **Execute HTTP Request** action from a bot, and selecting the connected account in the **Authentication:** section.

{% comment %}
You can import the [Smartsheet Bot](/packages/smartsheet-bot/) package for a working example.
{% endcomment %}