---
title: Tavily
excerpt: A step-by-step guide for integrating Cerb and Tavily
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

In this guide we'll walk through the process of linking Cerb to Tavily. You'll be able to use Tavily's full API as an LLM tool for when you don't want or need semantic search.

# Get a Tavily API Key.

Log in to your [Tavily Account](https://app.tavily.com/home) or sign up if you don't already have one.

Your API key should be available on your Tavily home page. Click the copy button to copy it to your clipboard.

<div class="cerb-screenshot">
<img src="/assets/images/solutions/integrations/tavily/api-key.png" class="screenshot">
</div>

# Create the Tavily service in Cerb

1. Navigate to **Search >> Connected Services**.

2. Click the **(+)** icon in the top right of the list.

3. Select **Tavily**.

4. Paste the key you copied earlier in the **API Key** field.

	<div class="cerb-screenshot">
	<img src="/assets/images/solutions/integrations/tavily/service-tavily.png" class="screenshot">
	</div>

1. Click the **Create** button.


