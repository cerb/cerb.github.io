---
title: Anthropic
excerpt: A step-by-step guide for integrating Cerb and Anthropic.
social_image_url: /assets/images/solutions/integrations/cerb-and-anthropic.png
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

In this guide we'll walk through the process of linking Cerb to Anthropic. You'll be able to use Anthropic's full API in Cerb automations as a LLM provider.

# Get a Anthropic API Key.

Log in to your [Anthropic Account](https://console.anthropic.com/) or sign up if you don't already have one.

Click the **gear icon** ("Settings") in the bottom left menu. 

Select **API keys** in the left menu.

Click the **Create Key** button.

Name the key (eg. `cerb`) and click **Add**.

Copy the API key for use later.

# Create the Anthropic service in Cerb

1. Navigate to **Search >> Connected Services**.

2. Click the **(+)** icon in the top right of the list.

3. Select **Anthropic**.

4. Paste the key you copied earlier in the **API Key** field.

5. Click the **Create** button.
