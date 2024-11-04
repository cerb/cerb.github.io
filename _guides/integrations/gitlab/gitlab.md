---
title: Integrate with GitLab
excerpt: A step-by-step guide for integrating Cerb and GitLab.
permalink: /guides/integrations/gitlab/
social_image_url: /assets/images/guides/gitlab/cerb-and-gitlab.png
date: 2024-10-15 00:00:00 -0700
layout: integration
topic: Integrations
subtopic: GitLab
jumbotron:
  title: Cerb + GitLab
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
    label: GitLab &raquo;
    url: /resources/guides/#gitlab
---

* TOC
{:toc}

# Introduction

In this guide we'll walk through the process of linking Cerb to GitLab. You'll be able to use [GitLab's full API](https://docs.gitlab.com/ee/api/) from automations in Cerb to automate whatever you need.

<div class="cerb-screenshot">
<img src="{{page.social_image_url}}" class="screenshot">
</div>

# GitLab Authentication

There are two alternative authentication methods when using the GitLab API.

* **Personal Access Tokens:** A long-lived secret token for a specific GitLab user. Rotating the token must be done manually. This is the simplest option.

* **OAuth2:** A short-lived access token and long-lived refresh token. This allows multiple GitLab users to link their account to Cerb. It requires a more involved OAuth application setup, but is the most secure option since secret rotation is automatic and indefinite.

## Method 1: Personal access token

### Create a personal access token at GitLab

To create a personal access token, log into GitLab.

Click on your profile image in the top of the left sidebar.

Select **Preferences** from the menu.

Select **Access tokens** in the left sidebar.

In the **Personal access tokens** section, click the **Add new token** button in the top right.

The options for **Select scopes** depend on your needs. For instance: `read_api` and `read_repository`.

### Create a connected service in Cerb

In Cerb, navigate to **Search >> Connected Services >> (+)** and select the **Build** tab at the top.

|---
| Field |
|-|-
| **Name:** | `GitLab (Access Token)`
| **Type:** | Token Bearer
| **Token Name:** | `Bearer`

Click the **Save Changes** button.

### Create a connected account in Cerb

In Cerb, navigate to **Search >> Connected Accounts >> (+)**.

Select **GitLab (Access Token)**.

Choose any name (e.g. `GitLab (example-user)`) and URI (e.g. `gitlab-example-user`).

In **Token:** paste the personal access token you generated at GitLab in the first section above.

Click the **Save Changes** button.

[Test](#use-the-connected-account-in-automations) the connected account in automations.

## Method 2: OAuth2

### Create an OAuth application at GitLab

Log into GitLab. We recommend creating a 'Cerb' user account for automations.

Click on your profile picture in the top left and select **Preferences**.

Select **Applications** in the left sidebar.

Click the **Add new application** button in the top right.

|---
| Field | 
|-|-
| **Name:** | `Cerb`
| **Redirect URI:** | `https://<YOUR-CERB-URL>/oauth/callback`
| **Confidential:** | (checked)
| **Scopes:** | `api`, `read_user`

Click the blue **Save application** button.

Copy the **Application ID** and **Secret** for the next step.

### Create the GitLab service in Cerb

In Cerb, navigate to **Search >> Connected Services >> (+)** and select **GitLab** from the list.

Paste your **Application ID** and **Secret**.

Click the **Create** button.

### Link the connected account to GitLab in Cerb

Navigate to **Search >> Connected Accounts >> (+)** and select **GitLab**.

|---
| Field |
|-|-
| **Name:** | `GitLab`
| **URI:** | `gitlab`
| **Owner:** | (Cerb)

It's a good idea to add a suffix to the **Name** and **URI** if you plan to link multiple GitLab user accounts.

Click the blue **Link to GitLab** button.

Review the consent form and then click **Authorize Cerb**.

Click the **Save Changes** button.

# Use the connected account in Cerb automations

Create an [automation.function](/docs/automations/triggers/automation.function/) automation:

<pre>
<code class="language-text">
{% raw %}
inputs:
  text/repo:
    type: freeform
    required@bool: yes
  text/query:
    type: freeform
    required@bool: yes

start:
  http.request/search:
    output: http_response
    inputs:
      method: GET
      url: https://gitlab.com/api/v4/projects/{{inputs.repo|url_encode}}/search?scope=issues&search={{inputs.query|url_encode}}
      authentication: cerb:connected_account:gitlab
    on_success:
      return:
        search_results@json: {{http_response.body}}
    on_error:
{% endraw %}
</code>
</pre>

From the **Inputs:** section in the lower left of the automation editor, simulate with:

<pre>
<code class="language-text">
{% raw %}
inputs:
  repo: cerb.ai/example-project
  query: tempore
{% endraw %}
</code>
</pre>