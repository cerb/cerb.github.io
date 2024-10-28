---
title: Generate Profile Images (Amazon Bedrock)
excerpt: Generate profile images from a text prompt using Amazon Bedrock foundational models.
layout: integration
topic: Workflows
permalink: /workflows/cerb.integrations.aws_bedrock.profile_images/
jumbotron:
  title: Generate Profile Images (Amazon Bedrock)
  tagline: ""
  breadcrumbs:
  -
    label: Resources &raquo;
    url: /resources/
  -
    label: Workflows &raquo;
    url: /resources/workflows/
---

* TOC
{:toc}

# Introduction

This workflow generates profile images from a text prompt using Amazon Bedrock foundational models.

# Installation

### Requirements

You must have an Amazon Web Services (AWS) account to use this workflow.

If you don't have a connected account in Cerb for Amazon Web Services yet, you can [follow these instructions](/guides/integrations/aws/) to create one.

## Amazon Bedrock

Log in to the [AWS Console](https://console.aws.amazon.com/).

At the top of the page, search for **Bedrock** or navigate to **Services >> Machine Learning >> Amazon Bedrock**.

In the left sidebar, navigate to **Bedrock configurations >> Model access**.

In a region of your choice, request access to at least one image generation model:

* Stability AI > Stable Image Core 1.0 **(recommended)**
* Amazon > Titan Image Generator G1 v2

### Test image generation

In the Amazon Bedrock left sidebar, navigate to **Playgrounds >> Image**.

Select one of your enabled image generation models.

At the bottom of the image playground, add an image generation prompt like:

> A close-up profile picture of a female cyberpunk hacker in anime graphic novel style. She wears sleek, futuristic tech gear with digital implants and has a determined expression. Binary code and data streams flow visually into her head, symbolizing knowledge being downloaded directly into her brain. She is set against a high-tech background with holographic screens and computer interfaces. The color scheme features bright neon tones in blue, pink, and purple, capturing the cyberpunk aesthetic.

Click the orange **Run** button to the right of the text prompt at the bottom of the page.

<div class="cerb-screenshot">
<img src="/assets/images/workflows/aws-bedrock-profile-images/bedrock-playground.png" class="screenshot">
</div>

In the top right of the playground, click the triple-dot menu and select **View API Request**.

This is the API request we'll be using from Cerb automations.

## Update your IAM policy

Navigate to IAM from the **Services** menu at the top of the page.

We need to update the policy in your Amazon Web Services (AWS) account to describe the services that your Cerb automations are allowed to use. This is accomplished with the Identity Access Management (IAM) service.

We're going to add access to invoke AWS Bedrock models.

Select **Policies** in the navigation on the left.

Find your existing policy in the list or create a new one. In the earlier [instructions](/guides/integrations/aws/) we created a policy named **CerbAutomationsPolicy**.

Click on the policy and click the **Edit** button in the top right.

Click the **Edit Policy** button.

Select the **JSON** tab.

Add the following block to the `Statement` list:

<pre>
<code class="language-json">
{
  "Sid": "CerbBedrockModels",
  "Effect": "Allow",
  "Action": "bedrock:InvokeModel",
  "Resource": "*"
}
</code>
</pre>

<div class="cerb-box note">
	<p>You can tighten up the <code>Resource</code> policy based on your needs once you confirm the integration is working.</p>
</div>

Click the orange **Next** button in the bottom right.

Click the orange **Save changes** button in the bottom right.

## Cerb

### Import the workflow

Back in Cerb, navigate to **Search >> Workflows >> (+) >> Empty**.

Paste the following KATA into the large text box:

<pre style="max-height: 29.25em;">
<code class="language-cerb">
{% raw %}
workflow:
  name: cerb.integrations.aws_bedrock.profile_images
  version: 2024-10-25T00:00:00Z
  description: Generate profile images from a text prompt using Amazon Bedrock foundational models
  website: https://cerb.ai/workflows/cerb.integrations.aws_bedrock.profile_images/
  requirements:
    cerb_version: >=11.0 <11.1
    cerb_plugins: cerberusweb.core
  config:
    chooser/aws_account_id:
      label: AWS Account
      record_type: connected_account
      record_query: service:(type:aws)
      multiple@bool: no
    text/aws_region:
      label: AWS Region
      default: us-east-1
    picklist/aws_model_id:
      label: Bedrock Model
      default: stability.stable-image-core-v1:0
      options@list:
        stability.stable-image-core-v1:0
        amazon.titan-image-generator-v2:0

records:
  automation/automation_invokeModel:
    fields:
      name: cerb.integrations.aws_bedrock.profile_images.invokeModel
      extension_id: cerb.trigger.automation.function
      description@text:
      script@raw:
        inputs:
          text/prompt:
            required@bool: yes
        
        start:
          set:
            config@json: {{cerb_workflow_config('cerb.integrations.aws_bedrock.profile_images')|json_encode}}
          
          decision/model:
            outcome/stabilityCoreV1:
              if@bool: {{'stability.stable-image-core-v1:0' == config.aws_model_id}}
              then:
                set:
                  invoke_body:
                    prompt: {{inputs.prompt}}
                    mode: text-to-image
                    aspect_ratio: 1:1
                    output_format: png
            outcome/awsTitanV2:
              if@bool: {{'amazon.titan-image-generator-v2:0' == config.aws_model_id}}
              then:
                set:
                  invoke_body:
                    textToImageParams:
                      text: {{inputs.prompt}}
                    taskType: TEXT_IMAGE
                    imageGenerationConfig:
                      cfgScale@int: 8
                      seed@int: 0
                      width@int: 512
                      height@int: 512
                      numberOfImages@int: 1
            outcome/unsupported:
              then:
                return:

          http.request/invoke:
            output: http_response
            inputs:
              method: POST
              url: https://bedrock-runtime.{{config.aws_region}}.amazonaws.com/model/{{config.aws_model_id}}/invoke
              headers:
                Accept: application/json
                Content-Type: application/json
              body@key: invoke_body
              authentication: cerb:connected_account:{{config.aws_account_id}}
              response:
                resource:
                  expires@date: 15 mins
            on_success:
              outcome/ok:
                if@bool: {{200 == http_response.status_code and 'application/vnd.cerb.uri' == http_response.content_type}}
                then:
                  # Extract images from the JSON response
                  file.read:
                    output: json_file
                    inputs:
                      uri: {{http_response.body}}
                      length: 4096000
                    on_success:
                      set:
                        json_data@json: {{json_file.bytes}}
                      file.write:
                        output: image_file
                        inputs:
                          mime_type: image/png
                          expires@date: 2 hours
                          content@text: {{json_data.images|first|base64_decode}}
                        on_success:
                          var.unset:
                            inputs:
                              key@csv: json_data, json_file
                          return:
                            url: {{cerb_url('c=ui&a=image&token=' ~ image_file.uri|split(':')|last)}}

      policy_kata@raw:
        commands:
          http.request:
            deny/url@bool:
              {{inputs.url is not pattern ('https://bedrock-runtime.*.amazonaws.com/model/*/invoke')}}
            allow@bool: yes
          file.read:
            allow@bool: yes
          file.write:
            allow@bool: yes
  
  automation/automation_interaction:
    fields:
      name: cerb.integrations.aws_bedrock.profile_images.interaction
      extension_id: cerb.trigger.interaction.worker
      description@text:
      script@raw:
        start:
          while:
            if@bool: {{'use' != prompt_action}}
            do:
              outcome/hasPrompt:
                if@bool: {{prompt_text}}
                then:
                  function/invoke:
                    uri: cerb:automation:cerb.integrations.aws_bedrock.profile_images.invokeModel
                    output: results
                    inputs:
                      prompt: {{prompt_text}}

              await/prompt:
                form:
                  title: Image Generation
                  elements:
                    sheet/prompt_image_url:
                      hidden@bool: {{results.url is empty}}
                      label: Preview:
                      data:
                        image:
                          url: {{results.url}}
                      limit: 5
                      schema:
                        layout:
                          headings@bool: no
                          paging@bool: no
                          style: grid
                        columns:
                          text/image:
                            params:
                              value_template@raw:
                                &lt;img src="{{url}}" style="width:512px;height:auto;"&gt;
                    textarea/prompt_text:
                      label: Describe the image:
                      default: A profile picture of a tech worker
                      max_length@int: 2048
                      required@bool: yes
                    submit/prompt_action:
                      buttons:
                        continue/generate:
                          label: Generate
                          icon: magic
                        continue/use:
                          label: Use this image
                          hidden@bool: {{results.url is empty}}
                          icon: right-arrow
                          icon_at: end
                          style: secondary
                          value: use
              
          return:
            image:
              url: {{results.url}}
      policy_kata@raw:
        commands:
          function:
            deny/uri@bool: {{uri != 'cerb:automation:cerb.integrations.aws_bedrock.profile_images.invokeModel'}}
            allow@bool: yes

  toolbar_section/toolbar_profile_image:
    fields:
      name: Image Generation (Amazon Bedrock)
      toolbar_name: record.profile.image.editor
      priority: 200
      is_disabled: 0
      toolbar_kata@raw:
        interaction/bedrock:
          label: AI Image Generation
          uri: cerb:automation:cerb.integrations.aws_bedrock.profile_images.interaction
          icon: magic
{% endraw %}
</code>
</pre>

Click the **Continue** button.

# Usage

Use the **Search** menu in the top right to open the editor for any record with profile images: worker, group, organization, contact, bot, etc.

Click the **Edit** button to the right of the profile image.

<div class="cerb-screenshot">
<img src="/assets/images/workflows/aws-bedrock-profile-images/record-editor.png" class="screenshot">
</div>

Click the new **AI Image Generation** button.

<div class="cerb-screenshot">
<img src="/assets/images/workflows/aws-bedrock-profile-images/image-editor-peek.png" class="screenshot">
</div>

Enter an image description like our earlier example:

> A close-up profile picture of a female cyberpunk hacker in anime graphic novel style. She wears sleek, futuristic tech gear with digital implants and has a determined expression. Binary code and data streams flow visually into her head, symbolizing knowledge being downloaded directly into her brain. She is set against a high-tech background with holographic screens and computer interfaces. The color scheme features bright neon tones in blue, pink, and purple, capturing the cyberpunk aesthetic.

<div class="cerb-screenshot">
<img src="/assets/images/workflows/aws-bedrock-profile-images/image-prompt.png" class="screenshot">
</div>

Click the blue **Continue** button.

You'll be shown a preview of the generated image.

<div class="cerb-screenshot">
<img src="/assets/images/workflows/aws-bedrock-profile-images/image-output.png" class="screenshot">
</div>

Click the blue **Use this image** button to keep it, or click **Generate** to generate a new image.