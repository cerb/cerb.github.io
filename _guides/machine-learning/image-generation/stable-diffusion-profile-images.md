---
title: Create profile images with Stable Diffusion
excerpt: This webpage provides a comprehensive guide on using Stable Diffusion to
  create profile images within Cerb, requiring version 10.4.2 or later.
summary: This webpage provides a comprehensive guide on using Stable Diffusion to
  create profile images within Cerb, requiring version 10.4.2 or later. It outlines
  the steps to create a Stability.ai account, generate an API key, and set up a connected
  service in Cerb. The guide details importing a package to facilitate the integration
  and modifying the toolbar to include a Stable Diffusion interaction. Users are instructed
  on how to generate profile images by providing text prompts, with the option to
  select from multiple generated images. The page also includes references to Stable
  Diffusion's background and additional resources.
permalink: /guides/machine-learning/image-generation/stable-diffusion-profile-images/
layout: integration
topic: Machine Learning
social_image_url: /assets/images/guides/automations/stable-diffusion-images/ai-profile-editor.png
redirect_from:
- /guides/automations/stable-diffusion-profile-images/
jumbotron:
  title: Create profile images with Stable Diffusion
  tagline: ""
  breadcrumbs:
  - label: Resources &raquo;
    url: /resources/
  - label: Guides &raquo;
    url: /resources/guides/
  - label: Machine Learning &raquo;
    url: /resources/guides/#machine-learning
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

# Connect Stability.ai to Cerb
Follow the [Stability.ai integration guide](/solutions/integrations/stabilityai/) to get an API key and connect it to Cerb.

# Import the workflow

Navigate to **Search >> Workflows >> (+) >> (empty)** and paste the following [KATA](/docs/kata/):

{% highlight cerb %}
{% raw %}
workflow:
  name: example.services.textToImage.stabilityai
  version: 2025-04-06T04:01:50Z
  description: Generate profile images with Stability.ai's models
  website: https://cerb.ai/resources/workflows/
  requirements:
    cerb_version: >=11.0 <11.2
    cerb_plugins: cerberusweb.core, 
  config:
    chooser/account:
      label: Stability.ai Account
      record_type: connected_account
records:
  automation/generateImage:
    fields:
      name: example.services.textToImage.stabilityai
      extension_id: cerb.trigger.automation.function
      description@text:
      script@raw:
        inputs:
          text/text:
            required@bool: yes
            type_options:
              max_length@int: 1000
              truncate@bool: yes
          text/n:
            type: number
            default: 2
        
        # [TODO] `outputs:` interface (for functions)
        
        start:
          set:
            engine_id: stable-diffusion-xl-beta-v2-2-2
            config@json: {{cerb_workflow_config('example.services.textToImage.stabilityai')|json_encode}}
          
          http.request/openai:
            output: http_response
            inputs:
              method: POST
              url: https://api.stability.ai/v1/generation/{{engine_id}}/text-to-image
              authentication: cerb:connected_account:{{config.account}}
              headers:
                Content-Type: application/json
                Accept: application/json
              body:
                text_prompts:
                  0:
                    text@key: inputs:text
                    weight@int: 1
                samples@key,int: inputs:n
                width@int: 320
                height@int: 320
                steps@int: 30
                seed@int: 0
                cfg_scale@int: 7
                #style: 3d-model analog-film anime cinematic comic-book digital-art enhance fantasy-art isometric line-art low-poly modeling-compound neon-punk origami photographic pixel-art tile-texture
            on_success:
              set:
                http_response@key,json: http_response:body
                image_urls@list:
              repeat:
                each@csv: {{http_response.artifacts|keys|join(',')}}
                as: artifact_id
                do:
                  file.write:
                    output: fp_writer
                    inputs:
                      mime_type: image/png
                      expires@date: +1 hour
                      content:
                        text@key,base64: http_response:artifacts:{{artifact_id}}:base64
                    on_success:
                      var.set:
                        inputs:
                          key: image_urls:{{image_urls|length}}
                          value:
                            url: {{cerb_url('c=ui&a=image&token=' ~ fp_writer.uri|split(':')|last)}}
          
          var.unset:
            inputs:
              key@csv: http_response, fp_writer
          
          return:
            images@key: image_urls 
      policy_kata@raw:
        commands:
          http.request:
            deny/url@bool: {{inputs.url is not pattern ('https://api.stability.ai/v1/generation/*/text-to-image')}}
            allow@bool: yes
          file.write:
            allow@bool: yes
  automation/generateInteraction:
    fields:
      name: example.interaction.recordProfileImage.stabilityai
      extension_id: cerb.trigger.interaction.worker
      description@text:
      script@raw:
        start:
          await/prompt:
            form:
              title: AI Image Generator
              elements:
                textarea/prompt_text:
                  label: Prompt:
                  required@bool: yes
                  max_length@int: 1000
                  truncate@bool: yes
                  placeholder: A profile picture of an android tech worker in cyberpunk graphic novel style
          
          function:
            uri: cerb:automation:example.services.textToImage.stabilityai
            output: result
            inputs:
              text@key: prompt_text
              n: 4
          
          await/preview:
            form:
              elements:
                say:
                  content@text:
                    {{prompt_text}}
                    ---------------
                sheet/prompt_image:
                  required@bool: yes
                  data@key: result:images 
                  limit: 5
                  schema:
                    layout:
                      headings@bool: no
                      paging@bool: no
                      filtering@bool: no
                      style: grid
                    columns:
                      selection/__index:
                        params:
                          mode: single
                      text/image:
                        params:
                          value_template@raw:
                            <img src="{{url}}" style="width:256px;height:auto;">
          
          return:
            image:
              url: {{result.images[prompt_image].url}}
      policy_kata@raw:
        commands:
          function:
            deny/uri@bool: {{uri != 'cerb:automation:example.services.textToImage.stabilityai'}}
            allow@bool: yes
  toolbar_section/generateToolbar:
    fields:
      name: Generate Profile
      toolbar_name: record.profile.image.editor
      priority@int: 50
      is_disabled: 0
      toolbar_kata@raw:
        interaction/stability:
          label: Stable Diffusion
          icon: picture
          uri: cerb:automation:example.interaction.recordProfileImage.stabilityai
{% endraw %}
{% endhighlight %}

Click the **Continue** button and select your Stability.ai connected account when prompted.

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

{% highlight text %}
{% raw %}
A profile picture of a humanoid robot in cyberpunk graphic novel style
{% endraw %}
{% endhighlight %}

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