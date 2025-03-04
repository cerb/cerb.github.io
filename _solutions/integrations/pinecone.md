---
title: Pinecone
excerpt: A step-by-step guide for integrating Cerb and Pinecone
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

In this guide we'll walk through the process of linking Cerb to Pinecone. You'll be able to use Pinecone's full API in Cerb automations for LLM embeddings.

# Get a Pinecone API Key.

Log in to your [Pinecone Account](https://app.pinecone.io) or sign up if you don't already have one.

Choose **API keys** in the menu and then click the "Create API Key" button in the top right.

Name the key (eg. `cerb`) and click **Create key**.

Copy the API key for use later.

# Create the Pinecone service in Cerb

1. Navigate to **Search >> Connected Services**.

2. Click the **(+)** icon in the top right of the list.

3. Select **Pinecone**.

4. Paste the key you copied earlier in the **API Key** field.

5. Click the **Create** button.


