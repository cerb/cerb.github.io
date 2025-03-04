---
title: Airtable
excerpt: A step-by-step guide for integrating Cerb and Airtable
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

In this guide we'll walk through the process of linking Cerb to Airtable. You'll be able to use Airtable's full API for any automations you wish to make.

# Get a Airtable API Key.

Log in to your [Airtable Account](https://airtable.com/) or sign up if you don't already have one.

Click your user icon in the top right and click **Builder Hub**.

Choose **Personal Access Tokens** from the left menu and click **Create New Token**.

Name the token and select any scopes and access bases that are needed.

Click **Create token** and copy the API key.

# Create the Airtable service in Cerb

1. Navigate to **Search >> Connected Services**.

2. Click the **(+)** icon in the top right of the list.

3. Select **Airtable**.

4. Paste the key you copied earlier in the **API Key** field.

5. Click the **Create** button.


