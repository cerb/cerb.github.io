---
title: Atlassian
excerpt: A step-by-step guide for integrating Cerb and Atlassian.
social_image_url: /assets/images/solutions/integrations/cerb-and-atlassian.png
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

In this guide we'll walk through the process of linking Cerb to Atlassian. You'll be able to use Atlassian's full API in Cerb automations for issue tracking and more.

# Get a Atlassian API Key.

Log in to your [Atlassian Account](https://id.atlassian.com) or sign up if you don't already have one.

Click your profile icon in the top right and choose **Account settings**.

Click **Security** at the top and then **Create and manage API tokens".

You can create an API token with or without scoped permissions.

## Without scopes
Click **Create API token**.

Name the key (eg. `cerb`), select an expiry date, and click **Create**.

Copy the API key for use later.

## With scopes

Click **Create API token with scopes**.

Name the key (eg. `cerb`), select an expiry date, and click **Next**.

Select the App APIs you want to access (eg. `Jira`) and click **Next**.

Choose the scopes you wish to grant (eg. `read:jira-user` and `write:jira-work`) and click **Next**.

Review you choices and click **Create token**.

Copy the API key for use later.

# Create the Atlassian service in Cerb

1. Navigate to **Search >> Connected Services**.

2. Click the **(+)** icon in the top right of the list.

3. Select **Atlassian**.

4. Enter your subdomain (eg `example` in `https://example.atlassian.net`), username, and API key in the appropriate fields

5. Click the **Create** button.

# Examples

## Get user info

<https://developer.atlassian.com/cloud/jira/platform/rest/v2/api-group-users/#api-rest-api-2-user-get>

{% highlight cerb %}
{% raw %}
start:
 http.request/getUser:
   output: http_response
   inputs:
     method: GET
     url: https://YOUR.SUBDOMAIN.atlassian.net//rest/api/2/user?accountId=123456asdfgh
     authentication: cerb:connected_account:atlassian
  on_success:
    set:
        response@json: {{http_response.body}}
        http_response@json: null
{% endraw %}
{% endhighlight %}

## Create an issue

<https://developer.atlassian.com/cloud/jira/platform/rest/v2/api-group-issues/#api-rest-api-2-issue-post>

{% highlight cerb %}
{% raw %}
start:
 http.request/createIssue:
   output: http_response
   inputs:
     method: POST
     url: https://YOUR.SUBDOMAIN.atlassian.net//rest/api/2/issue
     authentication: cerb:connected_account:atlassian
     headers:
       Content-Type: application/json
     body:
       fields:
         reporter:
           id: 123456asdfgh
         summary: this is a test issue
         description: we are making an example issue
         labels@list: 
           test
         assignee:
           id: 123456asdfgh
         project:
           id: 123456
         issuetype:
           id: 123456
  on_success:
    set:
        response@json: {{http_response.body}}
        http_response@json: null
{% endraw %}
{% endhighlight %}

## Delete an issue

<https://developer.atlassian.com/cloud/jira/platform/rest/v2/api-group-issues/#api-rest-api-2-issue-issueidorkey-delete>

{% highlight cerb %}
{% raw %}
start:
 http.request/deleteIssue:
   output: http_response
   inputs:
     method: DELETE
     url: https://YOUR.SUBDOMAIN.atlassian.net//rest/api/2/issue/123456
     authentication: cerb:connected_account:atlassian
  on_success:
    set:
        response@json: {{http_response.body}}
        http_response@json: null
{% endraw %}
{% endhighlight %}