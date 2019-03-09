---
title: Integrate with Twilio
excerpt: A step-by-step guide for integrating Cerb and Twilio.
permalink: /guides/integrations/twilio/
layout: integration
topic: Integrations
subtopic: Twilio
jumbotron:
  title: Cerb + Twilio
  tagline: ""
  breadcrumbs:
  -
    label: Resources &raquo;
    url: /resources/
  -
    label: Guides &raquo;
    url: /resources/guides/
  -
    label: Integrations &raquo;
    url: /resources/guides/#integrations
  -
    label: Twilio &raquo;
    url: /resources/guides/#twilio
---

* TOC
{:toc}

# Introduction

In this guide we'll walk through the process of linking Cerb to Twilio. You'll be able to use Twilio's full API from bots in Cerb.

<div class="cerb-screenshot">
<img src="/assets/images/guides/twilio/plugin/cerb-and-twilio.png" class="screenshot">
</div>

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
	<img src="/assets/images/guides/twilio/package-library-service-twilio.png" class="screenshot">
	</div>

1. Click the **Create** button.

# Use the connected account in bot behaviors

You can use the connected account you just created to access [Twilio's API](https://www.twilio.com/docs/api/rest) from bot behaviors in Cerb.  This is typically accomplished using the **Execute HTTP Request** action from a bot, and selecting the connected account in the **Authentication:** section.

You can import the [Twilio Bot](/packages/twilio-bot/) package for a working example.
