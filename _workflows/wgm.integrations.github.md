---
title: GitHub Issues
excerpt: Integrate Cerb with GitHub's API
layout: integration
topic: Workflows
permalink: /workflows/wgm.integrations.github/
redirect_from:
  - /packages/github-bot/
jumbotron:
  title: GitHub Issues
  tagline: ""
  breadcrumbs:
    - label: Resources &raquo;
      url: /resources/
    - label: Workflows &raquo;
      url: /resources/workflows/
---

* TOC
{:toc}

# Introduction

This workflow contains multiple automations for demonstrating integration between Cerb and [GitHub's API](https://developer.github.com/v3/).

<div class="cerb-screenshot">
<img src="/assets/images/solutions/integrations/github/plugin/cerb-and-github.png" class="screenshot">
</div>

# Configure the GitHub service

If you haven't already, follow [these instructions](/solutions/integrations/github/) to configure the GitHub service and add your first connected account.

# Installation

Click on **Search >> Workflows >> (+) >> (empty)** and paste the following [KATA](/docs/kata/):

{% highlight cerb %}
{% raw %}
workflow:
  name: wgm.integrations.github
  version: 2025-02-22T02:46:06Z
  description: Integrate Cerb with Github
  website: https://cerb.ai/resources/workflows/
  requirements:
    cerb_version: >=11.0 <11.1
    cerb_plugins: cerberusweb.core, 
  config:
    chooser/account:
      label: Connected Account:
      record_type: connected_account
records:
  automation/getrepo:
    fields:
      name: wgm.github.getrepos
      extension_id: cerb.trigger.automation.function
      description: Get a list of user repositories
      script@raw:
        start:
          set:
            config@json: {{cerb_workflow_config('wgm.integrations.github')|json_encode}}
          http.request/getrepo:
            output: http_response
            inputs:
              method: GET
              url: https://api.github.com/user/repos
              headers:
                Content-Type: application/json
                User-Agent: Cerb
              authentication: cerb:connected_account:{{config.account}}
            on_success:
              set:
                response_body@json: {{http_response.body}}
              return:
                body: {{response_body}}
      policy_kata@raw:
        commands:
          http.request:
            deny/method@bool: {{inputs.method not in ['GET']}}
            deny/url@bool: {{inputs.url is not prefixed ('https://api.github.com')}}
            allow@bool: yes
  automation/postissue:
    fields:
      name: wgm.github.issue.create
      extension_id: cerb.trigger.automation.function
      description: Create a GitHub issue
      script@raw:
        inputs:
          text/repo:
            type: freeform
            required@bool: yes
          text/body:
            type: freeform
            required@bool: no
          text/title:
            type: freeform
            required@bool: yes
          
        start:
          set:
            config@json: {{cerb_workflow_config('wgm.integrations.github')|json_encode}}
          http.request/createissue:
            output: http_response
            inputs:
              method: POST
              url: https://api.github.com/repos/{{inputs.repo}}/issues
              headers:
                Content-Type: application/json
                User-Agent: Cerb
              body:
                title: {{inputs.title}}
                body: {{inputs.body}}
              authentication: cerb:connected_account:{{config.account}}
            on_success:
              set:
                response_body@json: {{http_response.body}}
              return:
                status_code: {{http_response.status_code}}
                url: {{response_body.html_url}}
            on_error:
          
      policy_kata@raw:
        commands:
          http.request:
            deny/method@bool: {{inputs.method not in ['POST']}}
            deny/url@bool: {{inputs.url is not prefixed ('https://api.github.com/repos')}}
            allow@bool: yes
          
  automation/issueinteraction:
    fields:
      name: wgm.github.issue.interaction
      extension_id: cerb.trigger.interaction.worker
      description: worker interaction for creating a new GitHub issue
      script@raw:
        start:
         await:
           form:
             title: Create GitHub Issue
             elements:
               text/prompt_repo:
                 label: Repository
                 required@bool: yes
                 type: freeform
               text/prompt_title:
                label: Issue Title
                required@bool: yes
                type: freeform
              textarea/prompt_body:
                label: Issue content
        
         function/create:
           uri: cerb:automation:wgm.github.issue.create
           inputs:
             repo: {{prompt_repo}}
             body: {{prompt_body}}
             title: {{prompt_title}}
           output: results
           
         outcome/success:
           if@bool: {{201 == results.status_code}}
           then:
             await:
               form:
                 title: Success!
                 elements:
                   say/success:
                     content@text:
                       Issue created! Issue URL is {{results.url}}.
                  submit:
                    buttons:
                      continue/yes:
                        label: Exit
                        icon: circle-ok
                        icon_at: start
                        value: yes
                      reset:
                        label: Create Another Issue
                        icon: refresh
                        icon_at: start
                      
                   
             
      policy_kata@raw:
        commands:
         function:
           deny/uri@bool: {{uri != 'cerb:automation:wgm.github.issue.create'}}
           allow@bool: yes
          
  toolbar_section/createissue:
    fields:
      name: Github Issue
      toolbar_name: global.menu
      priority@int: 50
      is_disabled: 0
      toolbar_kata@raw:
        interaction/createissue:
          label: Create a Github Issue
          uri: cerb:automation:wgm.github.issue.interaction
{% endraw %}
{% endhighlight %}

# Configuration

You'll be prompted to select the GitHub connected account you created earlier.

<div class="cerb-screenshot">
<img src="/assets/images/workflows/integrations-github/workflow-config.png" class="screenshot">
</div>

You can update the configuration at any time by opening the workflow profile and clicking "Edit Configuration".

<div class="cerb-screenshot">
<img src="/assets/images/workflows/integrations-github/workflow-config-button.png" class="screenshot">
</div>

# Test the integration

The workflow adds two automation functions and a worker interaction. Click on `wgm.github.getrepos` to bring up its card and click edit. From there you can click the play button on the simulator and you should get a response with all the repositories linked to your GitHub account.

<div class="cerb-screenshot">
<img src="/assets/images/workflows/integrations-github/simulator.png" class="screenshot">
</div>

The workflow also added a "Create a GitHub Issue" interaction to the global menu. You can access it from the Cerb icon in the bottom right corner of any page.

<div class="cerb-screenshot">
<img src="/assets/images/workflows/integrations-github/global-menu.png" class="screenshot">
</div>

Enter the repository address, issue title, and body and click continue. You will be presented with a success message and a link to your new issue.

<div class="cerb-screenshot">
<img src="/assets/images/workflows/integrations-github/interaction.png" class="screenshot">
</div>

# Next steps

At this point you can modify the automations to meet your needs or create new ones.  You can use the responses from [GitHub's API](https://developer.github.com/v3/) in your automations.
