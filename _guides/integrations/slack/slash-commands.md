---
title: Send commands to a Cerb automations using Slack
excerpt: This page provides a detailed guide on integrating Cerb with Slack using
  Slack's slash commands feature.
permalink: /guides/integrations/slack/slash-commands/
layout: integration
topic: Integrations
jumbotron:
  title: Send commands to a Cerb automations using Slack
  tagline: ""
  breadcrumbs:
  - label: Resources &raquo;
    url: /resources/
  - label: Guides &raquo;
    url: /resources/guides/
  - label: Integrations &raquo;
    url: /resources/guides/#integrations
---

# Introduction
{:.no_toc}

Slack makes it very easy to interact with third-party apps and services using their _slash commands_ feature.

To demonstrate this functionality, we'll add a new chat command named **/cerb** and instruct Slack to send those messages to a webhook[^webhook] that triggers automations in Cerb.

* TOC
{:toc}

# Installation

## Requirements

[Create a Slack connected account](/solutions/integrations/slack/) if you haven't already.

## Slack

In the Slack app, enter a channel (e.g. `#testing`) and click on the triple dot menu in the top right.

Select **Edit settings**.

Select the **Integrations** tab.

Click on the **Add an App** button.

Click **Add** to the right of the **Cerb** app.

## Cerb

Click **Search >> Workflows >> (+) >> Empty** and paste the following KATA into the large text box:

{% highlight cerb %}
{% raw %}
workflow:
  name: wgm.integrations.slack.bot
  version: 2025-02-26T02:23:08Z
  description: A demo of integrations with a slack bot
  website: https://cerb.ai/resources/workflows/
  requirements:
    cerb_version: >=11.0 <11.1
    cerb_plugins: cerberusweb.core,
  config:
    chooser/account:
      label: Slack Account
      record_type: connected_account
      multiple@bool: no
records:
  webhook_listener/slack:
    fields:
      name: Slack
      guid: {{random_string(40)}}
      automations_kata@raw:
        automation/slack:
          uri: cerb:automation:wgm.integrations.slack.webhook
          disabled@bool: no
    updatePolicy: name
  automation/router:
    fields:
      name: wgm.integrations.slack.webhook
      extension_id: cerb.trigger.webhook.respond
      description@text:
      script@raw:
        start:
          set/config:
            config@json: {{cerb_workflow_config('wgm.integrations.slack.bot')|json_encode}}
            
          decision/route:
            outcome/help:
               if@bool: {{request_params.text == "help"}}
               then:
                set:
                  message:
                    channel: {{request_params.channel_name}}
                    text@text:
                      You can use the following commands:
                    attachments:
                      0:
                        color: #888888
                        fields:
                          0:
                            title: /cerb help
                            value: This help text.
                            short@bool: yes
                          1:
                            title: /cerb hello
                            value: Say hello!
                            short@bool: yes
                          2:
                            title: /cerb calendar
                            value: Respond with your next calendar event.
            outcome/hello:
               if@bool: {{request_params.text == "hello"}}
               then:
                 set:
                  message:
                    channel: #{{request_params.channel_name}}
                    text@text: 
                      Hello!!
                      How are you today, {{request_params.user_name}}?
            outcome/calendar:
              if@bool: {{request_params.text == "calendar"}}
              then:
                function/calendar:
                  uri: cerb:automation:wgm.integrations.slack.calendar
                  inputs:
                    user: {{request_params.user_name}}
                    channel: {{request_params.channel_name}}
                  output: results
            
          
          http.request:
            output: response
            inputs:
              url: https://slack.com/api/chat.postMessage
              method: POST
              authentication: cerb:connected_account:{{config.account}}
              headers@text:
                Content-Type: application/json; charset=utf8
              body: {{message|json_encode}}
              
                
          
          
      policy_kata@raw:
        commands:
          http.request:
            deny/url@bool: {{inputs.url is not prefixed ('https://slack.com/api/')}}
            deny/method@bool: {{inputs.method not in ['POST']}}
            allow@bool: yes
          function:
            deny/uri@bool: {{uri != 'cerb:automation:wgm.integrations.slack.calendar'}}
            allow@bool: yes
        
  automation/calendar:
    fields:
      name: wgm.integrations.slack.calendar
      extension_id: cerb.trigger.automation.function
      description@text:
      script@raw:
        inputs:
          text/user:
            type: freeform
            required@bool: yes
          text/channel:
            type: freeform
            required@bool: yes
            
        start:
          set/config:
            config@json: {{cerb_workflow_config('wgm.integrations.slack.bot')|json_encode}}
            
          record.search/worker:
            output: results_worker
            inputs:
              record_type: worker
              record_query: slackId: {{inputs.user}}
         
          record.search/event:
            output: results_calendar_event
            inputs:
              record_type: calendar_event
              record_query: calendar:(owner.worker:{{results_worker.id}}) startDate:(since:"now" until:"+7 days") sort:[startDate] limit:1
         
          set/message:
            message:
              channel: #{{inputs.channel}}
              text@text:
                Your next calendar event is:
              attachments:
                0:
                  color: #888888
                  footer: {{results_calendar_event.record_url}}
                  fields:
                    0:
                      title: Event
                      value: {{results_calendar_event._label}}
                      short@bool: yes
                    1:
                      title: Starts
                      value: in {{results_calendar_event.date_start|date_pretty}}
                      short@bool: yes
                    2:
                      title: Ends
                      value: in {{results_calendar_event.date_end|date_pretty}}
                      short@bool: yes
              
          http.request:
            output: response
            inputs:
              url: https://slack.com/api/chat.postMessage
              method: POST
              authentication: cerb:connected_account:{{config.account}}
              headers@text:
                Content-Type: application/json; charset=utf8
              body: {{message|json_encode}}
              
                
          
          
      policy_kata@raw:
        commands:
          record.search:
            deny/type@bool: {{inputs.record_type is not record type ('worker','calendar_event')}}
            allow@bool: yes
          http.request:
            deny/url@bool: {{inputs.url is not prefixed ('https://slack.com/api/')}}
            deny/method@bool: {{inputs.method not in ['POST']}}
            allow@bool: yes
  custom_field/slackname:
    fields:
      name: Slack ID
      context: worker
      uri: slackid
      type: S
      pos@int: 0
{% endraw %}
{% endhighlight %}

### Configure the workflow

|---
| Field |
|-|-
| **Slack Account:** | A Slack [connected account](/solutions/integrations/slack/).

Click the **Continue** button twice.

### Fill the custom field

Click your name in the top right corner and select "my card". Click "Edit" and enter your Slack username in the "Slack ID" box at the bottom.

## Add the new command in Slack

Now that we have our webhook listener and automations in place, we're ready to hook them up in Slack.

Open up your Slack App and select "Slash Commands" in the menu on the left.

<div class="cerb-screenshot">
<img src="/assets/images/guides/slack/slash-commands/slack_slash_commands.png" class="screenshot">
</div>

Click "Add a New Command", name the command **/cerb**, and paste the URL from your webhook in Cerb (Search >> Webhooks) in the "Request URL" field. Then hit the green "Save" button.

<div class="cerb-screenshot">
<img src="/assets/images/guides/slack/slash-commands/create_command.png" class="screenshot">
</div>

## Test the new /cerb command in Slack

Join one of your Slack channels and try out the new **/cerb** command.

**/cerb help** will present you with a list of available commands.

<div class="cerb-screenshot">
<img src="/assets/images/guides/slack/slash-commands/chat_help.png" class="screenshot">
</div>

**/cerb hello** will greet you by name.

<div class="cerb-screenshot">
<img src="/assets/images/guides/slack/slash-commands/chat_hello.png" class="screenshot">
</div>

If you filled in the "Slack ID" custom field on your profile in Cerb, **/cerb calendar** will tell you the next event on your calendar.

<div class="cerb-screenshot">
<img src="/assets/images/guides/slack/slash-commands/chat_calendar.png" class="screenshot">
</div>

## Where to go from here

Your friendly new app doesn't do much yet, but you have a great starting point with endless possibilities.

You could modify the automations we created to do anything that automations are capable of (which is a lot): add events to calendars, create reminders, add tasks, report about Cerb metrics, trigger webhooks in other services, post to social media, etc.

Using that custom field we made, automations can look up a message sender's worker record.  From there, it can perform all sorts of personalized actions using the worker's tasks, calendars, and so on.

You could use our [classifiers](/docs/classifiers/) feature to support natural language in your Slack app.  A classifier can convert freeform text into _"intents"_.  For instance, instead of only supporting the _"hello"_ command, your app could learn the various ways people _intend_ to **say\_hello**: _hi, hello, what's up?, how are you?, hola, allo, yo, hey, etc_.

## References

[^webhook]: <https://en.wikipedia.org/wiki/Webhook>
[^http-post]: <https://en.wikipedia.org/wiki/POST_(HTTP)>