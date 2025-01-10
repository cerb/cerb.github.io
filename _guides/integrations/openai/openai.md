---
title: Integrate with OpenAI
excerpt: A step-by-step guide for integrating Cerb and OpenAI.
social_image_url: /assets/images/guides/openai/cerb-and-openai.png
permalink: /guides/integrations/openai/
layout: integration
topic: Integrations
subtopic: OpenAI
jumbotron:
  title: Cerb + OpenAI
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
    label: OpenAI &raquo;
    url: /resources/guides/#openai
---

* TOC
{:toc}

# Introduction

In this guide we'll walk through the process of linking Cerb to OpenAI. You'll be able to use OpenAI's full API from automations in Cerb.

<div class="cerb-screenshot">
<img src="/assets/images/guides/openai/cerb-and-openai.png" class="screenshot">
</div>

# Configuration

## OpenAI

Log into OpenAI: <https://platform.openai.com/settings/>

### Create a project

Click on **Projects** in the left sidebar.

Click the green **+Create** button in the top right.

Name your project `Cerb` and click the green **Create** button in the popup.

### Create an API key

Click on **API keys** in the left sidebar.

Click on the green **+Create new secret key** button in the top right.

Name the key `Cerb Automations` and select the **Cerb** project.

Click the **Create secret key** button.

<div class="cerb-screenshot">
<img src="/assets/images/guides/openai/openai-new-api-key.png" class="screenshot">
</div>

Copy the secret key to your clipboard for the next step.

## Cerb

In Cerb, navigate to **Search >> Connected Services >> (+)** and select **OpenAI** from the library.

Paste your API key from above.

Click the **Create** button in the popup.

# Related Resources

* [Guide: Build a question answering chat bot with Cerb and ChatGPT](/guides/machine-learning/question-answering/faq-bot-chatgpt/)