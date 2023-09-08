---
title: "Create profile images with Stable Diffusion"
excerpt: In this guide we'll use the Stable Diffusion API to generate profile images for workers, groups, roles, etc.
layout: integration
topic: Machine Learning
subtopic: Image Generation
redirect_from:
  - /guides/automations/stable-diffusion-profile-images/
jumbotron:
  title: Create profile images with Stable Diffusion
  tagline: ""
  breadcrumbs:
  -
    label: Resources &raquo;
    url: /resources/
  -
    label: Guides &raquo;
    url: /resources/guides/
  -
    label: Machine Learning &raquo;
    url: /resources/guides/#machine-learning
  -
    label: Image Generation &raquo;
    url: /resources/guides/#machine-learning-image-generation
---

* TOC
{:toc}

# Introduction

<div class="cerb-box note"><p>This guide requires Cerb <a href="/releases/10.4.2/">10.4.2</a> or later.</p></div>

**Stable Diffusion**[^stable-diffusion] is a text-to-image model trained on billions of captioned images. It can be used to generate new images from a given text description.

In this guide we'll use the Stable Diffusion API to generate profile images for workers, groups, roles, etc.

<div class="cerb-screenshot">
<img src="/assets/images/guides/automations/stable-diffusion-images/ai-profile-editor.png" class="screenshot">
</div>

# Create a Stability.ai account

The development of Stable Diffusion was funded by Stability.ai, who also provides a simple, low-cost API for using the model. It can also be self-hosted[^self-hosted].

Create a Stability.ai account if you don't have one already from: <https://platform.stability.ai>

Create a new API key from: <https://platform.stability.ai/account/keys>

Copy the API key to your clipboard for use later.

# Create the connected service

In Cerb, navigate to **Search >> Connected Services >> (+)**.

Select **Stability.ai**

Paste your **API Key** from above.

Click the **Create** button.

# Import the package

Navigate to **Setup >> Packages >> Import**.

Paste the following package:

<pre style="max-height:29.5em;">
<code class="language-json">
{% raw %}
{
    "package": {
      "requires": {
          "cerb_version": "10.4.2"
      },
      "configure": {
        "placeholders": [
        ],
        "prompts": [
          {
            "type": "chooser",
            "label": "Stability.ai Account:",
            "key": "prompt_stabilityai_account_id",
            "params": {
              "context": "cerberusweb.contexts.connected_account",
              "query": "stability",
              "single": true
            }
          }
        ]
      }
    },
    "records": [
        {
            "uid": "automation_64f7e4fa1582d",
            "_context": "automation",
            "name": "example.services.textToImage.stabilityai",
            "extension_id": "cerb.trigger.automation.function",
            "description": "",
            "script": "inputs:\r\n  text/text:\r\n    required@bool: yes\r\n    type_options:\r\n      max_length@int: 1000\r\n      truncate@bool: yes\r\n  text/n:\r\n    type: number\r\n    default: 2\r\n\r\n# [TODO] `outputs:` interface (for functions)\r\n\r\nstart:\r\n  set:\r\n    engine_id: stable-diffusion-xl-beta-v2-2-2\r\n  \r\n  http.request/openai:\r\n    output: http_response\r\n    inputs:\r\n      method: POST\r\n      url: https://api.stability.ai/v1/generation/{{engine_id}}/text-to-image\r\n      authentication: cerb:connected_account:{{{prompt_stabilityai_account_uri}}}\r\n      headers:\r\n        Content-Type: application/json\r\n        Accept: application/json\r\n      body:\r\n        text_prompts:\r\n          0:\r\n            text@key: inputs:text\r\n            weight@int: 1\r\n        samples@key,int: inputs:n\r\n        width@int: 320\r\n        height@int: 320\r\n        steps@int: 30\r\n        seed@int: 0\r\n        cfg_scale@int: 7\r\n        #style: 3d-model analog-film anime cinematic comic-book digital-art enhance fantasy-art isometric line-art low-poly modeling-compound neon-punk origami photographic pixel-art tile-texture\r\n    on_success:\r\n      set:\r\n        http_response@key,json: http_response:body\r\n        image_urls@list:\r\n      repeat:\r\n        each@csv: {{http_response.artifacts|keys|join(',')}}\r\n        as: artifact_id\r\n        do:\r\n          file.write:\r\n            output: fp_writer\r\n            inputs:\r\n              mime_type: image/png\r\n              expires@date: +1 hour\r\n              content:\r\n                text@key,base64: http_response:artifacts:{{artifact_id}}:base64\r\n            on_success:\r\n              var.set:\r\n                inputs:\r\n                  key: image_urls:{{image_urls|length}}\r\n                  value:\r\n                    url: {{cerb_url('c=ui&a=image&token=' ~ fp_writer.uri|split(':')|last)}}\r\n  \r\n  var.unset:\r\n    inputs:\r\n      key@csv: http_response, fp_writer\r\n  \r\n  return:\r\n    images@key: image_urls ",
            "policy_kata": "commands:\r\n  http.request:\r\n    deny/url@bool: {{inputs.url is not pattern ('https://api.stability.ai/v1/generation/*/text-to-image')}}\r\n    allow@bool: yes\r\n  file.write:\r\n    allow@bool: yes\r\n    ",
            "created_at": 1693967610,
            "updated_at": 1693967610
        },
        {
            "uid": "automation_64f7e4e7a08cf",
            "_context": "automation",
            "name": "example.interaction.recordProfileImage.stabilityai",
            "extension_id": "cerb.trigger.interaction.worker",
            "description": "",
            "script": "start:\r\n  await/prompt:\r\n    form:\r\n      title: AI Image Generator\r\n      elements:\r\n        textarea/prompt_text:\r\n          label: Prompt:\r\n          required@bool: yes\r\n          max_length@int: 1000\r\n          truncate@bool: yes\r\n          placeholder: A profile picture of an android tech worker in cyberpunk graphic novel style\r\n  \r\n  function:\r\n    uri: cerb:automation:example.services.textToImage.stabilityai\r\n    output: result\r\n    inputs:\r\n      text@key: prompt_text\r\n      n: 4\r\n  \r\n  await/preview:\r\n    form:\r\n      elements:\r\n        say:\r\n          content@text:\r\n            {{prompt_text}}\r\n            ---------------\r\n        sheet/prompt_image:\r\n          required@bool: yes\r\n          data@key: result:images \r\n          limit: 5\r\n          schema:\r\n            layout:\r\n              headings@bool: no\r\n              paging@bool: no\r\n              filtering@bool: no\r\n              style: grid\r\n            columns:\r\n              selection/__index:\r\n                params:\r\n                  mode: single\r\n              text/image:\r\n                params:\r\n                  value_template@raw:\r\n                    <img src=\"{{url}}\" style=\"width:256px;height:auto;\">\r\n  \r\n  return:\r\n    image:\r\n      url: {{result.images[prompt_image].url}}",
            "policy_kata": "commands:\r\n  function:\r\n    deny/uri@bool: {{uri != 'cerb:automation:example.services.textToImage.stabilityai'}}\r\n    allow@bool: yes",
            "created_at": 1693967591,
            "updated_at": 1693967591
        }
    ]
}
{% endraw %}
</code>
</pre>

Select your Stability.ai account.

Click the **Import** button.

# Toolbar

Navigate to **Search >> Toolbars**.

Edit the **record.profile.image.editor** toolbar.

Add the following interaction to the toolbar:

<pre>
<code class="language-cerb">
{% raw %}
interaction/stability:
  label: Stable Diffusion
  icon: picture
  uri: cerb:automation:example.interaction.recordProfileImage.stabilityai
{% endraw %}
</code>
</pre>

Click the **Save Changes** button.

# Generate a profile image

Edit a record (worker, group, role, contact, organization).

For instance:

* Click on your name in the top right, then **Settings**. On the **Profile** tab, click the **Edit** button to the right of **Photo**.
* Edit a group from **Search >> Groups**.

Click the new **Stable Diffusion** button in the **Image generation:** section.

<div class="cerb-screenshot">
<img src="/assets/images/guides/automations/stable-diffusion-images/image-editor.png" class="screenshot">
</div>

Type a description of the image you'd like to generate in the prompt:

<div class="cerb-screenshot">
<img src="/assets/images/guides/automations/stable-diffusion-images/ai-prompt.png" class="screenshot">
</div>

<pre>
<code class="language-text">
{% raw %}
A profile picture of a humanoid robot in cyberpunk graphic novel style
{% endraw %}
</code>
</pre>

Click the blue **Continue** button.

After a few seconds you'll be given four options from your prompt:

<div class="cerb-screenshot">
<img src="/assets/images/guides/automations/stable-diffusion-images/ai-results.png" class="screenshot">
</div>

If you like an image, you can select it and press **Continue**.

Or you can generate a new set of images by clicking **Start over**.

# References

[^stable-diffusion]: Wikipedia - Stable Diffusion <https://en.wikipedia.org/wiki/Stable_Diffusion>

[^self-hosted]: Hugging Face - runwayml/stable-diffusion-v1-5 <https://huggingface.co/runwayml/stable-diffusion-v1-5>