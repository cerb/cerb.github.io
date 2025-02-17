---
title: OAuth2 Token Generator
excerpt: This page explains how to use the OAuth2 Token Generator to create tokens.
summary: This page provides a comprehensive guide on using the OAuth2 
  Token Generator tool for creating OAuth2 access and refresh tokens. 
  It covers how to generate tokens with specific scopes and expiration 
  times, and explains how these tokens can be used for API testing and development.
permalink: /guides/developers/oauth2-token-generator/
layout: integration
topic: Developers
jumbotron:
  title: OAuth2 Token Generator
  tagline: ""
  breadcrumbs:
  - label: Resources &raquo;
    url: /resources/
  - label: Guides &raquo;
    url: /resources/guides/
  - label: Developers &raquo;
    url: /resources/guides/#developers
---

* TOC
{:toc}

# Introduction

The OAuth2 Token Generator allows administrators to create access tokens for API authentication. These tokens provide secure access to Cerb's API with specific worker permissions and scopes. While OAuth2 typically requires implementing a complete authentication flow, the token generator provides a simpler way to create tokens directly.

For detailed information about Cerb's OAuth2 authentication system, see the [API Authentication documentation](/docs/api/authentication/). If you're building custom integrations, you may also want to review:

* [OAuth2 Token Validation example](/solutions/automations/validate-oauth2-token/) - Examples of validating tokens in webhook automations.

* [Custom API guide](/guides/webhooks/custom-api/) - Build and authenticate APIs using webhook portals.

# Prerequisites

To use OAuth tokens you need to create an app in Cerb from **Search >> OAuth Apps >> (+)**.

This will generate a random **Client ID** and **Client Secret** for you. The **Name:** should reflect your integration.

If you want to allow Cerb workers to log in to your integration to generate tokens, the **Callback URL:** must be implemented by your app. If you're using the token generator in Cerb then the callback URL can be any value (e.g. your website).

<div class="cerb-screenshot">
<img src="/assets/images/guides/webhooks/custom-api/create-oauth-app.png" class="screenshot">
</div>

You can add your own scopes. The default provides an `api` scope that allows all endpoints and methods. Your automation will need to validate scopes.

{% highlight yaml %}
"api":
  label: Make any API request on your behalf
  endpoints:
   - "*" #[GET, PATCH, POST, PUT, DELETE]
{% endhighlight %}

The scopes are set when a token is generated. If a worker logs in to Cerb from a third-party app, a confirmation screen will show them the requested scopes before they consent. If you use the token generator, you can pick a token's scope.

# Generating an OAuth2 token

Implementing OAuth2 for **Link to Cerb** in your app is outside the scope of this guide. We'll be using the token generator for a simpler example.

Navigate to **Setup >> Developers >> OAuth2 Token Generator**.

Select the **OAuth App** you created above, a **Worker** linked to the token, **Scopes**, and an **Expires** duration.

You can generate a short-lived token for testing.

A long-lived token is vulnerable to being leaked or intercepted. It must be treated with the sensitivity of a password that you transit with each request. Do not commit it to a source code repository (e.g. use environment variables or a secrets vault). You should manually rotate the token at a reasonable interval.

Click the **Create** button and copy the **Access Token**.

<div class="cerb-screenshot">
<img src="/assets/images/guides/webhooks/custom-api/generate-token.png" class="screenshot">
</div>

# Simulating from the automation editor

You can test a request from **Input:** in the lower left of the automation editor. Set the `Authorization: Bearer` header to your token and click the play button.

{% highlight yaml %}
request_headers:
authorization: Bearer eyJ0eXAiOi[...]
{% endhighlight %}

# Testing from curl

{% highlight bash %}
curl -i -H "Authorization: Bearer eyJ0eXAiOi[...]" "https://cerb.example/portal/custom-api"
{% endhighlight %}

# Implementing in your app

Use an OAuth2 library with the provided **Client ID**, **Client Secret**, and **Refresh Token** to refresh short-lived tokens at an interval (e.g. hourly). This helps protect against replay attacks from leaked or intercepted tokens.

An HTTP response status code of `401` (Unauthorized) is a hint you need to refresh an expired token.

You can find more information in the [OAuth spec](https://www.oauth.com/oauth2-servers/making-authenticated-requests/refreshing-an-access-token/).