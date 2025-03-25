---
title: GitHub
excerpt: A step-by-step guide for integrating Cerb and GitHub.
summary: This page provides a comprehensive guide on integrating Cerb with GitHub,
  enabling the use of GitHub's API through Cerb's bots for automation purposes. It
  outlines the steps to create an OAuth application on GitHub, including registering
  a new application and obtaining the necessary Client ID and Client Secret. The guide
  then details how to create a GitHub service within Cerb, link a connected account
  to GitHub, and utilize this connection in bot behaviors. The process involves using
  the "Execute HTTP Request" action in bots and selecting the connected account for
  authentication, with an option to import a GitHub Bot package for practical implementation.
social_image_url: /assets/images/solutions/integrations/github/plugin/cerb-and-github.png
redirect_from:
  - /guides/integrations/github/
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

In this guide we'll walk through the process of linking Cerb to GitHub. You'll be able to use [GitHub's full API](https://docs.github.com/en/rest?apiVersion=2022-11-28) from bots in Cerb to automate whatever you need.

# GitHub Authentication

There are two alternative authentication methods when using the GitHub API.

* **Personal Access Tokens:** A long-lived secret token for a specific GitHub user. Rotating the token must be done manually. This is the simplest option.

* **OAuth2:** A short-lived access token and long-lived refresh token. This allows multiple GitHub users to link their account to Cerb. It requires a more involved OAuth application setup, but is the most secure option since secret rotation is automatic and indefinite.

## Method 1: Personal access token

### Create a personal access token at GitHub

To create a personal access token, log into GitHub.

Click on your profile image in the top right.

Select **Settings** from the menu.

Select **Developer Settings** in the left sidebar.

In the **Personal access tokens** section, click the "Tokens (classic)" button and then **Generate new token**.

Name the token, set an expiration period, and select the necessary scopes for your needs.

Click **Generate token** and copy down the token you are provided.

### Create a connected service in Cerb

In Cerb, navigate to **Search >> Connected Services >> (+)** and select the **Build** tab at the top.

|---
| Field |
|-|-
| **Name:** | `GitHub (Access Token)`
| **Type:** | Token Bearer
| **Token Name:** | `Bearer`

Click the **Save Changes** button.

### Create a connected account in Cerb

In Cerb, navigate to **Search >> Connected Accounts >> (+)**.

Select **GitHub (Access Token)**.

Choose any name (e.g. `GitHub (example-user)`) and URI (e.g. `GitHub-example-user`).

In **Token:** paste the personal access token you generated at GitHub in the first section above.

Click the **Save Changes** button.

[Test](#use-the-connected-account-in-automations) the connected account in automations.

## Method 2: OAuth2

### Create an OAuth application at GitHub

Review the [GitHub OAuth documentation](https://developer.github.com/apps/building-integrations/setting-up-and-registering-oauth-apps/) additionally if needed.

1. Visit the [GitHub OAuth applications](https://github.com/settings/developers) settings page.

1. Click the green **Register a new application** button.

1. Enter the following details replacing `YOUR-CERB-HOST` with the URL to your Cerb installation:
- **App Name:** Cerb
- **Homepage URL:** `https://YOUR-WEBSITE`
- **Application description:** {leave blank}
- **Authorization callback URL:** `https://YOUR-CERB-HOST/oauth/callback`

	<div class="cerb-screenshot">
	<img src="/assets/images/solutions/integrations/github/plugin/github-new-app.png" class="screenshot">
	</div>

1. Click the **Register application** button.

	<div class="cerb-screenshot">
	<img src="/assets/images/solutions/integrations/github/plugin/github-new-app2.png" class="screenshot">
	</div>

1. Make a note of your **Client ID** and **Client Secret** for the next step.

### Create the GitHub service in Cerb

1. Navigate to **Search >> Connected Services**.

1. Click the **(+)** icon in the top right of the list.

1. Select **GitHub**.

	<div class="cerb-screenshot">
	<img src="/assets/images/guides/common/package-library-connected-services.png" class="screenshot">
	</div>

1. Enter your Client ID and Client Secret.

	<div class="cerb-screenshot">
	<img src="/assets/images/solutions/integrations/github/package-library-service-github.png" class="screenshot">
	</div>

1. Click the **Create** button.

### Link the connected account to GitHub in Cerb

1. Navigate to **Search >> Connected Accounts**.

1. Click the **(+)** icon in the top right of the list.

1. Select **GitHub**.

1. Click the blue **Link to GitHub** button.

1. Accept consent on GitHub.

    <div class="cerb-screenshot">
    <img src="/assets/images/solutions/integrations/github/plugin/oauth-approve.png" class="screenshot">
    </div>

1. Click the **Save Changes** button.

# Use the connected account in automations

You can use the connected account you just created to access [GitHub's API](https://developer.github.com/v3/) within automations in Cerb.  This is typically accomplished using the [http.request:](/docs/automations/commands/http.request/) command and using the connected account in the `authentication` field.

## Examples

### Get a list of repositories

{% highlight cerb %}
{% raw %}
start:
  http.request/getrepo:
    output: http_response
    inputs:
      method: GET
      url: https://api.github.com/user/repos
      authentication: cerb:connected_account:github
      headers:
        Content-Type: application/json
        User-Agent: Cerb
    on_success:
      set:
        response@json: {{http_response.body}}
        http_response@json: null
{% endraw %}
{% endhighlight %}

## Create issue

{% highlight cerb %}
{% raw %}
start:
  http.request/createissue:
    output: http_response
    inputs:
      method: POST
      url: https://api.github.com/repos/[repo-path]/issues
      authentication: cerb:connected_account:github
      headers:
        Content-Type: application/json
        User-Agent: Cerb
      body:
        title: Example Issue Title
        body: This is the text of the issue
    on_success:
      set:
        response@json: {{http_response.body}}
        http_response@json: null
{% endraw %}
{% endhighlight %}

## Workflow
Alternatively, you can import the [GitHub Issues](/workflows/wgm.integrations.github/) workflow for a working example.
