---
title: Salesforce
excerpt: Integrate Cerb with Salesforce's API
layout: integration
topic: Workflows
permalink: /workflows/wgm.integrations.salesforce/
redirect_from:
  - /packages/salesforce-bot/
jumbotron:
  title: Salesforce
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

This workflow contains multiple automations for demonstrating integration between Cerb and [Salesforce API](https://developer.salesforce.com/docs/atlas.en-us.api_rest.meta/api_rest/).

<div class="cerb-screenshot">
<img src="/assets/images/solutions/integrations/salesforce/cerb-and-salesforce.png" class="screenshot">
</div>

# Configure the Salesforce service

If you haven't already, follow [these instructions](/solutions/integrations/salesforce/) to configure the Salesforce service and add your first connected account.

# Installation

Click on **Search >> Workflows >> (+) >> (empty)** and paste the following [KATA](/docs/kata/):

{% highlight cerb %}
{% raw %}
workflow:
  name: wgm.integrations.salesforce
  version: 2025-04-15T01:10:55Z
  description: Sample integrations for Salesforce
  website: https://cerb.ai/workflows/wgm.integrations.salesforce
  requirements:
    cerb_version: >=11.0 <11.1
    cerb_plugins: cerberusweb.core, 
  config:
    chooser/account:
      label: Salesforce Account
      record_type: connected_account
    text/domain:
      label: Your Salesforce domain
    text/version:
      label: API Version
      default: v63.0
records:
  automation/versions:
    fields:
      name: wgm.integrations.salesforce.listVersions
      extension_id: cerb.trigger.automation.function
      description: List available API versions
      script@raw:
        start:
          set/config:
            config@json: {{cerb_workflow_config('wgm.integrations.salesforce')|json_encode}}
          
          http.request/version:
            output: http_response
            inputs:
              method: GET
              url: https://{{config.domain}}.my.salesforce.com/services/data/
              authentication: cerb:connected_account:{{config.account}}
            on_success:
              set:
                response@json: {{http_response.body}}
                http_response@json: null
        
      policy_kata@raw:
        commands:
          http.request:
            deny/method@bool: {{inputs.method not in ['GET']}}
            deny/url@bool: {{inputs.url is not prefixed ('https://'~ cerb_workflow_config('wgm.integrations.salesforce','domain') ~ '.my.salesforce.com/services/data')}}
            allow@bool: yes
  automation/createAccount:
    fields:
      name: wgm.integrations.salesforce.account.create
      extension_id: cerb.trigger.automation.function
      description: Create a new Account record
      script@raw:
        start:
          set/config:
            config@json: {{cerb_workflow_config('wgm.integrations.salesforce')|json_encode}}
          
          http.request/createAccount:
            output: http_response
            inputs:
              method: POST
              url: https://{{config.domain}}.my.salesforce.com/services/data/{{config.version}}/sobjects/Account/
              headers:
                Content-Type: application/json
              authentication: cerb:connected_account:{{config.account}}
              body:
                Name: Testerson LLC
                NumberOfEmployees: 5
                Industry: Testing
            on_success:
              set:
                response@json: {{http_response.body}}
                http_response@json: null
        
      policy_kata@raw:
        commands:
          http.request:
            deny/method@bool: {{inputs.method not in ['POST']}}
            deny/url@bool: {{inputs.url is not prefixed ('https://'~ cerb_workflow_config('wgm.integrations.salesforce','domain') ~ '.my.salesforce.com/services/data/'~ cerb_workflow_config('wgm.integrations.salesforce','version') ~ '/sobjects/Account/')}}
            allow@bool: yes
  automation/updateAccount:
    fields:
      name: wgm.integrations.salesforce.account.update
      extension_id: cerb.trigger.automation.function
      description: Update an existing Account record
      script@raw:
        inputs:
          text/accountid:
            type: freeform
            required@bool: yes
        
        start:
          set/config:
            config@json: {{cerb_workflow_config('wgm.integrations.salesforce')|json_encode}}
          
          http.request/createAccount:
            output: http_response
            inputs:
              method: PATCH
              url: https://{{config.domain}}.my.salesforce.com/services/data/{{config.version}}/sobjects/Account/{{inputs.accountid}}
              headers:
                Content-Type: application/json
              authentication: cerb:connected_account:{{config.account}}
              body:
                BillingCity: Testerville
        
      policy_kata@raw:
        commands:
          http.request:
            deny/method@bool: {{inputs.method not in ['PATCH']}}
            deny/url@bool: {{inputs.url is not prefixed ('https://'~ cerb_workflow_config('wgm.integrations.salesforce','domain') ~ '.my.salesforce.com/services/data/'~ cerb_workflow_config('wgm.integrations.salesforce','version') ~ '/sobjects/Account/')}}
            allow@bool: yes
  automation/getAccount:
    fields:
      name: wgm.integrations.salesforce.account.get
      extension_id: cerb.trigger.automation.function
      description: Get info on an existing Account record
      script@raw:
        inputs:
          text/accountid:
            type: freeform
            required@bool: yes
          text/fields:
            type: freeform
            required@bool: yes
            
            
        start:
          set/config:
            config@json: {{cerb_workflow_config('wgm.integrations.salesforce')|json_encode}}
          
          http.request/createAccount:
            output: http_response
            inputs:
              method: GET
              url: https://{{config.domain}}.my.salesforce.com/services/data/{{config.version}}/sobjects/Account/{{inputs.accountid}}?fields={{inputs.fields}}
              authentication: cerb:connected_account:{{config.account}}
           on_success:
             set:
               body@json: {{http_response.body}}
             return:
               body: {{body|json_encode|json_pretty}}
               status_code: {{http_response.status_code}}
      policy_kata@raw:
        commands:
          http.request:
            deny/method@bool: {{inputs.method not in ['GET']}}
            deny/url@bool: {{inputs.url is not prefixed ('https://'~ cerb_workflow_config('wgm.integrations.salesforce','domain') ~ '.my.salesforce.com/services/data/'~ cerb_workflow_config('wgm.integrations.salesforce','version') ~ '/sobjects/Account/')}}
            allow@bool: yes
  automation/query:
    fields:
      name: wgm.integrations.salesforce.query
      extension_id: cerb.trigger.automation.function
      description: Make a query for the name of all available accounts in your organization
      script@raw:
        start:
          set/config:
            config@json: {{cerb_workflow_config('wgm.integrations.salesforce')|json_encode}}
          
          http.request/createAccount:
            output: http_response
            inputs:
              method: GET
              url: https://{{config.domain}}.my.salesforce.com/services/data/{{config.version}}/query/?q=SELECT+name,id+from+Account
              authentication: cerb:connected_account:{{config.account}}
           on_success:
             set:
               response@json: {{http_response.body}}
               http_response@json: null
      policy_kata@raw:
        commands:
          http.request:
            deny/method@bool: {{inputs.method not in ['GET']}}
            deny/url@bool: {{inputs.url is not prefixed ('https://'~ cerb_workflow_config('wgm.integrations.salesforce','domain') ~ '.my.salesforce.com/services/data/'~ cerb_workflow_config('wgm.integrations.salesforce','version') ~ '/query/')}}
            allow@bool: yes
  automation/listResources:
    fields:
      name: wgm.integrations.salesforce.resources
      extension_id: cerb.trigger.automation.function
      description: List all available API endpoints for your version
      script@raw:
        start:
          set/config:
            config@json: {{cerb_workflow_config('wgm.integrations.salesforce')|json_encode}}
          
          http.request/createAccount:
            output: http_response
            inputs:
              method: GET
              url: https://{{config.domain}}.my.salesforce.com/services/data/{{config.version}}/
              authentication: cerb:connected_account:{{config.account}}
           on_success:
             set:
               response@json: {{http_response.body}}
               http_response@json: null
      policy_kata@raw:
        commands:
          http.request:
            deny/method@bool: {{inputs.method not in ['GET']}}
            deny/url@bool: {{inputs.url is not prefixed ('https://'~ cerb_workflow_config('wgm.integrations.salesforce','domain') ~ '.my.salesforce.com/services/data/'~ cerb_workflow_config('wgm.integrations.salesforce','version') ~ '')}}
            allow@bool: yes
  automation/getAccountInteraction:
    fields:
      name: wgm.integrations.salesforce.account.get.interaction
      extension_id: cerb.trigger.interaction.worker
      description: Worker interaction for grabbing account record details
      script@raw:
        start:
         await:
           form:
             title: Get Account Record
             elements:
               text/prompt_id:
                 label: Account ID
                 required@bool: yes
                 type: freeform
               text/prompt_fields:
                label: Account fields to retrieve (comma-separated)
                default: Name,NumberOfEmployees,Industry
                required@bool: yes
                type: freeform
        
         function/getAccount:
           uri: cerb:automation:wgm.integrations.salesforce.account.get
           inputs:
             accountid: {{prompt_id}}
             fields: {{prompt_fields}}
               
           output: results
           
         outcome/success:
           if@bool: {{200 == results.status_code}}
           then:
             await:
               form:
                 title: Account Details
                 elements:
                   say/details:
                     content@text:
                       {{results.body}}
                  submit:
                    buttons:
                      continue/yes:
                        label: Exit
                        icon: circle-ok
                        icon_at: start
                        value: yes
                      reset:
                        label: Make Another Query
                        icon: refresh
                        icon_at: start
                      
                   
             
      policy_kata@raw:
        commands:
          function:
            deny/uri@bool: {{uri != 'cerb:automation:wgm.integrations.salesforce.account.get'}}
            allow@bool: yes
  toolbar_section/accountInteractionToolbar:
    fields:
      name: Get Account Info
      toolbar_name: global.menu
      priority@int: 50
      is_disabled: 0
      toolbar_kata@raw:
        interaction/getAccount:
          label: Get Account Info
          uri: cerb:automation:wgm.integrations.salesforce.account.get.interaction
{% endraw %}
{% endhighlight %}

# Configuration

|---
| Field | 
|-|-
| **Salesforce Account:** | A Salesforce [connected account](/solutions/integrations/salesforce/).
| **Your Salesforce Domain:** | The domain of your Salesforce instance (the part before `my.salesforce.com`).
| **API Version:** | Your desired API version. Defaults to `v63.0`

<div class="cerb-screenshot">
<img src="/assets/images/workflows/integrations-salesforce/workflow-config.png" class="screenshot">
</div>

You can update the configuration at any time by opening the workflow profile and clicking "Edit Configuration".

# Test the integration

## Create an Account record
The workflow contains six example automation functions and a worker interaction for accomplishing various tasks. Let's try creating a new `Account` record. 

Click on `wgm.integrations.salesforce.account.create` to bring up its card and click **Edit**. From there you can click the play button on the simulator. This should create a new `Account` record called `Testerson LLC`. The automation output will also present you with the ID of the new record.

## Retrieve record fields
The workflow adds a "Get Account Info" interaction to the global menu. Click the Cerb icon in the bottom right corner of the screen and click **Get Account Info**.

<div class="cerb-screenshot">
<img src="/assets/images/workflows/integrations-salesforce/global-menu.png" class="screenshot">
</div>

Enter the Account ID you want to retrieve (you can use the `Testerson LLC` account we created earlier) and a comma-separated list of the account fields you want to retrieve, or use the defaults.

<div class="cerb-screenshot">
<img src="/assets/images/workflows/integrations-salesforce/interaction.png" class="screenshot">
</div>

You will be presented with the account fields you entered and their respective values.

You can test the other automations in their simulators as well.

# Next steps

At this point you can modify the automations to meet your needs.  You can use the responses from the [Salesforce API](https://developer.salesforce.com/docs/atlas.en-us.api_rest.meta/api_rest) in your automations.