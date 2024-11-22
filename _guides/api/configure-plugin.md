---
title: Configure the REST API plugin
excerpt: This page provides a detailed guide on configuring the REST API plugin for
  Cerb.
summary: This page provides a detailed guide on configuring the REST API plugin for
  Cerb. It covers the steps to enable the API plugin, generate an API key-pair, and
  view the key-pair. The guide explains how to navigate the Cerb interface to enable
  the Web Services API plugin, create new API credentials, and manage permissions
  for API requests. It also includes instructions on how to restrict API access to
  specific endpoints. Additionally, the page offers a resource link to a Wikipedia
  article on Representational State Transfer (REST) for further reading.
permalink: /guides/api/configure-plugin/
layout: integration
topic: API
jumbotron:
  title: Configure the REST API plugin
  tagline: ""
  breadcrumbs:
  - label: Resources &raquo;
    url: /resources/
  - label: Guides &raquo;
    url: /resources/guides/
  - label: API &raquo;
    url: /resources/guides/#api
---

* TOC
{:toc}

# Introduction

The REST-based[^rest] [Web API](/docs/api/) provides the ability to remote control Cerb for automation, synchronization, and integration. For example, you can use the API from other applications and services to create tickets, search records, monitor notifications, manage tasks, and run [automations](/docs/automations/).

# Enable the API plugin

First, we need to enable the API plugin:

1. Navigate to **Setup >> Plugins >> Installed Plugins**.

1. Search the plugins list for `API`.

1. In the entry for the **Web Services API** plugin, click the **Configure** button.

	<div class="cerb-screenshot">
	<img src="/assets/images/guides/api/configure-plugin/plugins-api.png" class="screenshot">
	</div>

1. Select **Enabled** and click the **Save Changes** button.

# Generate an API key-pair

The API uses per-application credentials and per-worker permissions to authorize API requests.

1. Click on the **setup** page in top right to reload the search menu.

1. Navigate to **Search >> Api Keys**.

1. Click the **(+)** icon above the worklist to create a new key-pair.

1. Enter the following details:
	* **Name:** API Example
	* **Worker:** (click the **me** button)
	* **Allowed Endpoints:** (keep the `*` default for now)
	
	<div class="cerb-screenshot">
	<img src="/assets/images/guides/api/configure-plugin/keypair-create.png" class="screenshot">
	</div>
	
1. Click the **Save Changes** button.

# View the key-pair

1. Click on **API Example** in the yellow notification above the worklist to open its card:

	<div class="cerb-screenshot">
	<img src="/assets/images/guides/api/configure-plugin/worklist-record-created.png" class="screenshot">
	</div>

1. Click on **(reveal)** to view the secret key.

	<div class="cerb-screenshot">
	<img src="/assets/images/guides/api/configure-plugin/keypair-card.png" class="screenshot">
	</div>

As an administrator, you can repeat this process to create a key-pair for other workers.

By configure the **Allowed Endpoints** option you can restrict a key-pair to only certain endpoints [in the API](/docs/api/).

# Resources

[^rest]: Wikipedia: Representational State Transfer (REST) - <https://en.wikipedia.org/wiki/Representational_state_transfer>