---
title: Integrate with Amazon Web Services
excerpt: A step-by-step guide for integrating Cerb and Amazon Web Services (AWS).
permalink: /guides/integrations/aws/
layout: integration
topic: Integrations
subtopic: Amazon Web Services
jumbotron:
  title: Cerb + Amazon Web Services
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
    label: Amazon Web Services &raquo;
    url: /resources/guides/#amazon-web-services
---

* TOC
{:toc}

# Introduction

In this guide we'll walk through the process of linking Cerb to Amazon Web Services (AWS). You'll be able to use any AWS API from bots in Cerb.

<div class="cerb-screenshot">
<img src="/assets/images/guides/aws/cerb-and-aws.png" class="screenshot">
</div>

# Log in to Amazon Web Services

We'll start by logging in to the [AWS Management Console](https://console.aws.amazon.com/iam/).

If you don't have an AWS account, you can sign up for free at: <https://aws.amazon.com>

## Create a new user

We're going to create the new user account for our Cerb bot to use.

If you haven't already selected the **IAM** service, do so now.

Select **Users** in the left navigation.

Click the blue **Add user** button at the top of the page.

Type `Cerb` in **User name**.

In **Access type**, check _Programmatic access_.

<div class="cerb-screenshot">
<img src="/assets/images/guides/aws/common/aws-iam-create-user.png" class="screenshot">
</div>

Click the blue **Next: Permissions** button in the bottom right.

### Create a policy

At the top, select **Attach existing policies directly**.

Click the **Create policy** button at the top.

Select the **JSON** tab.

Paste the following policy:

<pre>
<code class="language-json">
{% raw %}
{
  "Version": "2018-12-18",
  "Statement": [
    {
      "Sid": "VisualEditor0",
      "Effect": "Allow",
      "Action": "iam:GetUser",
      "Resource": "arn:aws:iam::*:user/${aws:username}"
    }
  ]
}
{% endraw %}
</code>
</pre>

You can add new permissions here depending on the services your bot needs to access. This is covered in those specific guides.

Click the **Review Policy** button in the lower right.

* **Name:** `CerbBot`

Click the **Create Policy** in the lower right.

Select the policy.

Click the blue **Next: Tags** button in the bottom right.

### Finish up

Click the blue **Next: Review** button in the bottom right.

Verify the new user and click the blue **Create user** button in the bottom right.

<div class="cerb-screenshot">
<img src="/assets/images/guides/aws/common/aws-iam-create-confirm.png" class="screenshot">
</div>

Click the **Download .csv** button to save a copy of your new credentials.  You'll need these in a moment when adding a new connected account in Cerb.

That's everything we need to do in AWS. You can close the AWS Management Console.

# Create the AWS service in Cerb

1. Navigate to **Setup >> Configure >> Import Package**.

1. Paste the following package:

	<pre style="max-height:29.5em;">
	<code class="language-json">
	{% raw %}
	{
	  "package": {
	    "name": "Amazon Web Services (AWS) Connected Service",
	    "revision": 1,
	    "requires": {
	      "cerb_version": "9.1.0",
	      "plugins": []
	    },
	    "configure": {
	      "placeholders": [],
	      "prompts": [
	        {
	          "type": "text",
	          "label": "Access Key",
	          "key": "prompt_access_key",
	          "params": {
	            "default": "",
	            "placeholder": "(paste your Access Key)"
	          }
	        },
	        {
	          "type": "text",
	          "label": "Secret Key",
	          "key": "prompt_secret_key",
	          "params": {
	            "default": "",
	            "placeholder": "(paste your Secret Key)"
	          }
	        }
	      ]
	    }
	  },
	  "records": [
	    {
	      "uid": "service_aws",
	      "_context": "connected_service",
	      "name": "Amazon Web Services",
	      "extension_id": "cerb.service.provider.aws",
	      "params": {}
	    },
	    {
	      "uid": "account_aws",
	      "_context": "connected_account",
	      "name": "Amazon Web Services",
	      "service_id": "{{{uid.service_aws}}}",
	      "owner__context": "cerberusweb.contexts.app",
	      "owner_id": "0",
	      "params": {
	        "access_key": "{{{prompt_access_key}}}",
	        "secret_key": "{{{prompt_secret_key}}}"
	      }
	    }
	  ]
	}
	{% endraw %}
	</code>
	</pre>

1. Click the **Import** button.

1. Enter your Access Key and Secret Key from AWS.

1. Click the **Import** button again.

# Use the connected account in bot behaviors

You can use the connected account you just created to access [AWS APIs](https://aws.amazon.com/) from bot behaviors in Cerb.  This is typically accomplished using the **Execute HTTP Request** action from a bot, and selecting the connected account in the **Authentication:** section.

# Related guides

* [Run AWS Lambda functions from a Cerb bot](/guides/integrations/aws/lambda/)
* [Give Cerb bots the power of speech with Amazon Polly](/guides/integrations/aws/polly-speech/)
