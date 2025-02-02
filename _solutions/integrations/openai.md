---
title: OpenAI
excerpt: A step-by-step guide for integrating Cerb and OpenAI.
summary: "This page provides a comprehensive guide on integrating Cerb with OpenAI, enabling the use of OpenAI's API within Cerb automations. It includes detailed instructions on configuring both OpenAI and Cerb. For OpenAI, it covers creating a project and generating an API key. For Cerb, it explains how to connect to OpenAI using the API key. Additionally, the page references related resources, such as a guide on building a question-answering chatbot with Cerb and ChatGPT."
social_image_url: /assets/images/guides/openai/cerb-and-openai.png
redirect_from:
  - /guides/integrations/openai/
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

In this guide we'll walk through the process of linking Cerb to OpenAI. You'll be able to use OpenAI's full API from automations in Cerb.

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