---
title: Twilio
excerpt: A step-by-step guide for integrating Cerb and Twilio.
summary: This page provides a step-by-step guide on integrating Cerb with Twilio,
  enabling the use of Twilio's API within Cerb's bot behaviors. It covers obtaining
  API keys from the Twilio Dashboard, setting up a Twilio service in Cerb by entering
  the Account SID and Auth Token, and utilizing the connected account to execute HTTP
  requests through bot behaviors. The guide also mentions the availability of a Twilio
  Bot package for practical implementation examples.
social_image_url: /assets/images/solutions/integrations/twilio/plugin/cerb-and-twilio.png
redirect_from:
  - /guides/integrations/twilio/
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

In this guide we'll walk through the process of linking Cerb to Twilio. You'll be able to use Twilio's full API from bots in Cerb.

# Get your API keys from the Twilio Dashboard

1. Browse to: <https://www.twilio.com/login>

1. In the top right, copy your **Account SID** (username) and **Auth Token** (password).

# Create the Twilio service in Cerb

1. Navigate to **Search >> Connected Services**.

1. Click the **(+)** icon in the top right of the list.

1. Select **Twilio**.

	<div class="cerb-screenshot">
	<img src="/assets/images/guides/common/package-library-connected-services.png" class="screenshot">
	</div>

1. Enter your Account SID and Auth Token.

	<div class="cerb-screenshot">
	<img src="/assets/images/solutions/integrations/twilio/package-library-service-twilio.png" class="screenshot">
	</div>

1. Click the **Create** button.

# Use the connected account in bot behaviors

You can use the connected account you just created to access [Twilio's API](https://www.twilio.com/docs/api/rest) from bot behaviors in Cerb.  This is typically accomplished using the **Execute HTTP Request** action from a bot, and selecting the connected account in the **Authentication:** section.

You can import the [Twilio Bot](/packages/twilio-bot/) package for a working example.
