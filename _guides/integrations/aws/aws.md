---
title: Integrate with Amazon Web Services
excerpt: A step-by-step guide for integrating Cerb and Amazon Web Services (AWS).
summary: This page provides a comprehensive guide on integrating Cerb with Amazon
  Web Services (AWS). It covers the steps to log into AWS, create a policy, set up
  a new user, and generate programmatic credentials necessary for the integration.
  The guide then explains how to create the AWS service within Cerb and utilize the
  connected account for automations, allowing users to access AWS APIs directly from
  Cerb. Additionally, it references related resources for further enhancing Cerb's
  capabilities with AWS services like Amazon Bedrock, AWS Lambda, and Amazon Polly.
permalink: /guides/integrations/aws/
layout: integration
topic: Integrations
subtopic: Amazon Web Services
jumbotron:
  title: Cerb + Amazon Web Services
  tagline: ""
  breadcrumbs:
  - label: Resources &raquo;
    url: /resources/
  - label: Guides &raquo;
    url: /resources/guides/
  - label: Integrations &raquo;
    url: /resources/guides/#integrations
  - label: Amazon Web Services &raquo;
    url: /resources/guides/#amazon-web-services
---

* TOC
{:toc}

# Introduction

In this guide we'll walk through the process of linking Cerb to Amazon Web Services (AWS). You'll be able to use any AWS API from automations in Cerb.

<div class="cerb-screenshot">
<img src="/assets/images/guides/aws/cerb-and-aws.png" class="screenshot">
</div>

# Log in to Amazon Web Services

We'll start by logging in to the [AWS Management Console](https://console.aws.amazon.com/iam/).

If you don't have an AWS account, you can sign up for free at: <https://aws.amazon.com>

We're going to create the new user account for our Cerb bot to use.

If you haven't already selected the **IAM** service, do so now.

### Create a policy

Select **Policies** in the left navigation.

Click the **Create policy** button at the top.

Select the **JSON** tab.

Paste the following policy:

<pre>
<code class="language-json">
{% raw %}
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Sid": "CerbIam",
      "Effect": "Allow",
      "Action": "iam:GetUser",
      "Resource": "arn:aws:iam::*:user/${aws:username}"
    }
  ]
}
{% endraw %}
</code>
</pre>

You can add new permissions here depending on the services your automation needs to access. This is covered in those specific guides.

Click the **Next** button in the lower right.

Use the policy name: **CerbAutomationsPolicy**

Click the **Create Policy** button in the lower right.

### Create a new user

Select **Users** in the left navigation.

Click the orange **Create user** button in the top right of the page.

Type `CerbAutomations` in **User name**.

<div class="cerb-screenshot">
<img src="/assets/images/guides/aws/common/aws-iam-create-user.png" class="screenshot">
</div>

Click the orange **Next** button in the bottom right.

At the top, select **Attach existing policies directly**.

Select **CerbAutomationsPolicy**.

Click the **Next** button in the lower right.

Click the **Create user** button in the lower right.

### Generate programmatic credentials

Click on **CerbAutomations** in the users list.

Select the **Security credentials** tab.

In the **Access Keys** section, click the **Create access key** button near the middle of the page.

Select **Other** and click the **Next** button in the lower right.

Click the **Create access key** button in the lower right.

Click the **Download .csv** button to save a copy of your new credentials.  You'll need these in a moment when adding a new connected account in Cerb.

Click the **Done** button.

That's everything we need to do in AWS.

# Create the AWS service in Cerb

1. Navigate to **Search >> Connected Services**.

1. Click the **(+)** icon in the top right of the list.

1. Select **Amazon Web Services**.

	<div class="cerb-screenshot">
	<img src="/assets/images/guides/common/package-library-connected-services.png" class="screenshot">
	</div>

1. Enter your Access Key and Secret Key from AWS.

	<div class="cerb-screenshot">
	<img src="/assets/images/guides/aws/package-library-service-aws.png" class="screenshot">
	</div>

1. Click the **Create** button.

# Use the connected account in automations

You can use the connected account you just created to access [AWS APIs](https://aws.amazon.com/) from [automations](/docs/automations/) in Cerb.  This is typically accomplished using the [http.request](/docs/automations/commands/http.request/) command from an automation and referencing this connected account in the **authentication:** option.

# Related resources

* Workflow: [Generate Profile Images (Amazon Bedrock)](/workflows/cerb.integrations.aws_bedrock.profile_images/)
* Guide: [Run AWS Lambda functions from a Cerb bot](/guides/integrations/aws/lambda/)
* Guide: [Give Cerb bots the power of speech with Amazon Polly](/guides/integrations/aws/polly-speech/)
