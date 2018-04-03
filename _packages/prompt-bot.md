---
title: Prompt Bot
excerpt: A conversational bot that demonstrates formatting and validation in prompts.
social_image_url: /assets/images/guides/bots/prompts/prompts.png
layout: integration
topic: Packages
permalink: /packages/prompt-bot/
jumbotron:
  title: Prompt Bot
  tagline: ""
  breadcrumbs:
  -
    label: Resources &raquo;
    url: /resources/
  -
    label: Packages &raquo;
    url: /resources/packages/
---

<div class="cerb-screenshot">
<img src="/assets/images/guides/bots/prompts/prompts.png" class="screenshot">
</div>

* TOC
{:toc}

# Introduction

This package creates a preconfigured conversational bot to demonstrate formatting and validation in prompts.

# Installing the package

Navigate to **Setup >> Configure >> Import Package**.

Paste the following package into the large text box:

<pre style="max-height:29.5em;">
<code class="language-json">
{% raw %}
{
  "package": {
    "name": "Prompt Bot",
    "revision": 1,
    "requires": {
      "cerb_version": "8.3.4",
      "plugins": []
    },
    "configure": {
      "prompts": [],
      "placeholders": []
    }
  },
  "bots": [
    {
      "uid": "bot_prompt_",
      "name": "Prompt Bot",
      "owner": {
        "context": "cerberusweb.contexts.app",
        "id": 0
      },
      "is_disabled": false,
      "params": {
        "config": null,
        "events": {
          "mode": "all",
          "items": [

          ]
        },
        "actions": {
          "mode": "all",
          "items": [

          ]
        }
      },
      "image": "data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAGQAAABkCAMAAABHPGVmAAAAnFBMVEUAfL3///8Ce7wIfr7///L///cFfLoJfLcPfrb2//////vv8+7f6OO90tcLfroagbUjhLTf8/u73fCtyc9Xo82DscEehr5dnbk/kLUvibXM6Pen0uyayeV8uNtlqtSewMqPuMczkMMqjMF2qsBpo70TgrxSmLlIk7XQ6PfU6OSIwODQ3d7C3d7N3dpusdVMnck6k8UYg71Ik7c3jLWea0S3AAABKklEQVRo3u3YSVLDQAyFYUngIU5iDIkJJEAG5nm6/90oKou3AO30Fq7Sd4G/Ene71ZaUUkoppZTSH/bSCd2BanFvwoHIr74SBkT2pkcCjMje+EwgPALXpUB0BKa1QHQExt/ECDQ3JTECs5oYgck5MQLNwiSIHatvXUuQ8kp9k06inJ6oq7iL+9fmI3VtKolye6Gu17jXp314qyD20Gkv1dVLnN2D92NMApVvCnCICGFREyJY1MQItCt+xLZLYgR7kxqx9xH7wX+u2EvY5uoojP/SbxaE44ty5u+W6prVpLcvxMxhW+cciZvD2yd1hN0obKS+vmIPd8WXsSfI544+pq4r4sCNIZgWwdYmRPytPcyL6f9be2gfCzbkzx64gfDYYycppZRSSmlAfgBgHg39/R/GDgAAAABJRU5ErkJggg==",
      "behaviors": [
        {
          "uid": "behavior_convo_demo",
          "title": "Convo: Demonstrate prompts",
          "is_disabled": false,
          "is_private": false,
          "priority": 50,
          "event": {
            "key": "event.message.chat.worker",
            "label": "Conversation with worker"
          },
          "nodes": [
            {
              "type": "action",
              "title": "Hi!",
              "status": "live",
              "params": {
                "actions": [
                  {
                    "action": "send_message",
                    "message": "Hi, {{worker_first_name}}!",
                    "format": "",
                    "delay_ms": "1000"
                  }
                ]
              }
            },
            {
              "type": "action",
              "title": "Prompt for text",
              "status": "live",
              "params": {
                "actions": [
                  {
                    "action": "send_message",
                    "message": "Enter some text:",
                    "format": "",
                    "delay_ms": "1000"
                  },
                  {
                    "action": "prompt_text",
                    "placeholder": "(type anything)",
                    "default": "I'm not feeling very creative today.",
                    "mode": "",
                    "var": "prompt_text",
                    "var_format": "{{message}}",
                    "var_validate": "{% if prompt_text is empty %}\r\nC'mon! You can at least type _something_!\r\n{% endif %}"
                  }
                ]
              }
            },
            {
              "type": "action",
              "title": "Prompt for number",
              "status": "live",
              "params": {
                "actions": [
                  {
                    "action": "send_message",
                    "message": "Pick a number between 1 and 100",
                    "format": "",
                    "delay_ms": "1000"
                  },
                  {
                    "action": "prompt_text",
                    "placeholder": "(enter a number between 1 and 100)",
                    "default": "",
                    "mode": "",
                    "var": "prompt_number",
                    "var_format": "{{message|replace({',':''})|number_format(0, '.', '')}}",
                    "var_validate": "{% if message is not numeric %}\r\nPlease enter a valid number.\r\n{% elseif prompt_number < 1 or prompt_number > 100 %}\r\nThe number must be between 1 and 100.\r\n{% endif %}"
                  }
                ]
              }
            },
            {
              "type": "action",
              "title": "Prompt for date",
              "status": "live",
              "params": {
                "actions": [
                  {
                    "action": "send_message",
                    "message": "Please enter a date",
                    "format": "",
                    "delay_ms": "1000"
                  },
                  {
                    "action": "prompt_date",
                    "placeholder": "(enter any future date; e.g. \"tomorrow 8am\")",
                    "default": "",
                    "mode": "",
                    "var": "prompt_date",
                    "var_format": "{{message|date('U')}}",
                    "var_validate": "{% if 0 == prompt_date %}\r\nPlease enter a valid date. For instance, \"Friday noon\".\r\n{% elseif prompt_date < 'now'|date('U') %}\r\nPlease enter a date in the future.\r\n{% endif %}"
                  }
                ]
              }
            },
            {
              "type": "action",
              "title": "Prompt for email",
              "status": "live",
              "params": {
                "actions": [
                  {
                    "action": "send_message",
                    "message": "What's your email address?",
                    "format": "",
                    "delay_ms": "1000"
                  },
                  {
                    "action": "prompt_text",
                    "placeholder": "(you@example.com)",
                    "default": "{{worker_address_address}}",
                    "mode": "",
                    "var": "prompt_email",
                    "var_format": "{{message|parse_emails|first.email}}",
                    "var_validate": "{% set email = message|parse_emails|first %}\r\n{% if prompt_email is empty %}\r\nPlease enter a valid email address.\r\n{% elseif email.host == 'localhost' %}\r\nPlease enter a valid email address.\r\n{% endif %}"
                  }
                ]
              }
            },
            {
              "type": "action",
              "title": "Prompt for yes/no",
              "status": "live",
              "params": {
                "actions": [
                  {
                    "action": "send_message",
                    "message": "Yes or no?",
                    "format": "",
                    "delay_ms": "1000"
                  },
                  {
                    "action": "prompt_buttons",
                    "options": "yes\r\nno",
                    "color_from": "#57970a",
                    "color_mid": "#4795f7",
                    "color_to": "#cf2c1d",
                    "style": "display:inline;width:100px;",
                    "var": "prompt_yesno",
                    "var_format": "{{'yes' == message ? 1 : 0}}",
                    "var_validate": ""
                  }
                ]
              }
            },
            {
              "type": "action",
              "title": "Prompt with chooser",
              "status": "live",
              "params": {
                "actions": [
                  {
                    "action": "send_message",
                    "message": "Choose a worker:",
                    "format": "",
                    "delay_ms": "1000"
                  },
                  {
                    "action": "prompt_chooser",
                    "context": "cerberusweb.contexts.worker",
                    "query": "isDisabled:n",
                    "selection": "single",
                    "autocomplete": "1",
                    "var": "prompt_worker_id"
                  }
                ]
              }
            },
            {
              "type": "action",
              "title": "Prompt with images",
              "status": "live",
              "params": {
                "actions": [
                  {
                    "action": "send_message",
                    "message": "How do you prefer to be notified?",
                    "format": "",
                    "delay_ms": "1000"
                  },
                  {
                    "action": "prompt_images",
                    "images": [
                      "data:image/png;base64,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",
                      "data:image/png;base64,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",
                      "data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAGQAAABkCAMAAABHPGVmAAAB+1BMVEX+rwPgAADjAADfAACrSgG7AAD+rgPoAAD9rATjGBjBAAD+rAfaAAC+AADhBgThCAfgAwPDAADuZDrTAADOAADIAAD8qwPymAO/BQDdAADlIBj6mgziDQv3pAPkAADXAADVAADzdRv1gxX2iBP4kBD8owj8pgf6qgP+pwP1oQPznAPsmgPrjgLagwLnfgLcbwLSUwHNRQHKNgHDIwHBGQC/EgDACQDcAADFAADoOTXtUyDqPx/wYhzoMhzmKRrsSRn0exfiERD7oAz5lAv4qAP5pgPpkALqjALmhQLfcQLYYQLGLAGpGgDADQCjBQDLAACxAADmMzL2jTDlLS3mKCHpNx7vWx3yahrlGxnuVhjjFBTjEw39qQvhCgrulQPhewLWZALHXAK/WgHHNwHDKQG9IwHAHgDRFACnEACqAwDMAAC6AADsV0rzgEXqTEHwZTvtWzbvajXsYjT1iDH0hC7sUC3rSiX2jiTqRyP5myL4lh/xZx/2iR7nbB3ybRz5ohvqPBrtMxn4kxTPJhLkGRLQEhLvWhDkGhDAFgryaQfmMgX5oQPunQPvkgP4jQPObAP3kQLijQLyiwLehwLjcQLQXwKwTwLqAgLRVwG6UgHaUQG6TgHkSAHNSAGyQwHjPAG4NwG0MwG4KAGqKAGgFQDHEwC7CADJAwDQAACt3LItAAAC4ElEQVRo3u3aV1PbQBSG4WMp2cjCMnZsXGJsjME2YGzTMT300HsCBBIgdNJ777333vvPTGZCIu1qJrk5e5FBzx/4rt45kkZgMBj+Ii8PDIa1grTNrNN7eq8AELme9PYr63Uu5QAiKSk7n23QudAMiEiiwi6YWNbzPtSRwnLZpJPeEAZM7nlFFHQjYxHAVDCrVOpGMmslwJS/S7HoRrZnE8DkL1aCupFrmwFVa5HiZEfETTmAKtqp9OlG6nMBlavDk8GO2Op8gEpK9KRM7EhNE6Ai7WV2XfANEcB1p1T2si1ulQCXu0tmQ8ncRgBXQYmcJbAtArL8YtlBj4iXQ4DMXySzNaotYmnp9CwzI/XNgMzVUZFhotU1ATKSKGdHasKAbUtZSqSDr5YAW2Gp3StQLdYSwLajy07XmHkW0LmZGsVG9WRxq1E0q5kg3kbPd4FqMRfQuTornCatYR+gI8mePmpkJAL4dtI12o6rmWDWmKGt0VpNAF97aUp7GydPgQq1Rm2L1MnCvI2aTMZDwIG/WA5qW8wFDqJFHoe2RR9wQKaoGuvCwEOyZ1n7+Ehlgl8jmwlyjdrHR+CicN7u1Tw+AhfuWbkS/2Tp3xvV5M0h4CL6RsliThY+8tyjHuB6H/Ax9dUpiKtGwsBH8vqVUfOqoxHgw33m4L6Nvxw4LQEfREr7TZLA8G8tsUfx+IPbUeDHH3/1qXtxsfvDdJsLOIm9+LykOINZjj7PXAenldjb3hVLIBAQAgFT8Mtj4ME/07v+zydCwbvwEDiId/dr34Iq33FIpWV6if5qa70L6GLv+x30yA1A1/ZxxUKPXAV07XPMR1vbGKjwXrEtzCs2oHOXpOiRxmxA1/ryW1C7IQ5fBHQkseAQNRuT+ycA363XFq+6Yas6CRyQ+zfTrasTonXgcBrwQJobRsfTfy6INvPewTTgRAodqRoYGqraveccAY6ajh0aPDEBBsPaZPyXYfg//QDqa2qZimyTPAAAAABJRU5ErkJggg==",
                      ""
                    ],
                    "labels": [
                      "mobile",
                      "email",
                      "notification",
                      ""
                    ],
                    "var": "prompt_notify",
                    "var_format": "{{message|lower}}",
                    "var_validate": ""
                  }
                ]
              }
            },
            {
              "type": "action",
              "title": "Prompt with file upload",
              "status": "live",
              "params": {
                "actions": [
                  {
                    "action": "send_message",
                    "message": "Send me an image file smaller than 250KB.",
                    "format": "",
                    "delay_ms": "1000"
                  },
                  {
                    "action": "prompt_file",
                    "var": "prompt_file_id",
                    "var_format": "{{message|number_format(0)}}",
                    "var_validate": "{% if prompt_file_size > 250000 %}\r\nThe file must be smaller than 250KB.\r\n{% elseif not (prompt_file_mime_type starts with 'image/') %}\r\nPlease send an image file: PNG, JPEG, GIF.\r\n{% endif %}"
                  }
                ]
              }
            },
            {
              "type": "action",
              "title": "Prompt with wait",
              "status": "live",
              "params": {
                "actions": [
                  {
                    "action": "send_message",
                    "message": "{% set r = [\r\n\"Ok! Let's recap...\",\r\n\"Checking my notes...\",\r\n\"Let's see...\",\r\n] %}\r\n{{random(r)}}",
                    "format": "",
                    "delay_ms": "1000"
                  },
                  {
                    "action": "prompt_wait"
                  }
                ]
              }
            },
            {
              "type": "action",
              "title": "Respond with summary",
              "status": "live",
              "params": {
                "actions": [
                  {
                    "action": "send_message",
                    "message": "You said:\r\n\r\n* Text: {{prompt_text}}\r\n* Number: {{prompt_number|number_format(0, '.', ',')}}\r\n* Date: {{prompt_date|date('F d, Y g:ia')}}\r\n* Email: {{prompt_email}}\r\n* Yes/No: {{prompt_yesno ? 'yes' : 'no'}}\r\n* Worker: {{prompt_worker__label}} (#{{prompt_worker_id}})\r\n* Notify: {{prompt_notify}}\r\n* File: {{prompt_file__label}} (#{{prompt_file_id}})\r\n",
                    "format": "markdown",
                    "delay_ms": "1000"
                  }
                ]
              }
            },
            {
              "type": "action",
              "title": "Bye!",
              "status": "live",
              "params": {
                "actions": [
                  {
                    "action": "prompt_buttons",
                    "options": "Bye!",
                    "color_from": "#4795f7",
                    "color_mid": "#4795f7",
                    "color_to": "#4795f7",
                    "style": "",
                    "var": "",
                    "var_format": "",
                    "var_validate": ""
                  }
                ]
              }
            },
            {
              "type": "action",
              "title": "Close chat",
              "status": "live",
              "params": {
                "actions": [
                  {
                    "action": "window_close"
                  }
                ]
              }
            }
          ]
        },
        {
          "uid": "behavior_get_interactions",
          "title": "Get interactions for worker",
          "is_disabled": false,
          "is_private": false,
          "priority": 50,
          "event": {
            "key": "event.interactions.get.worker",
            "label": "Conversation get interactions for worker",
            "params": {
              "listen_points": "global\r\n"
            }
          },
          "nodes": [
            {
              "type": "switch",
              "title": "Point:",
              "status": "live",
              "nodes": [
                {
                  "type": "outcome",
                  "title": "global",
                  "status": "live",
                  "params": {
                    "groups": [
                      {
                        "any": 0,
                        "conditions": [
                          {
                            "condition": "point",
                            "oper": "is",
                            "value": "global"
                          }
                        ]
                      }
                    ]
                  },
                  "nodes": [
                    {
                      "type": "action",
                      "title": "Return interaction",
                      "status": "live",
                      "params": {
                        "actions": [
                          {
                            "action": "return_interaction",
                            "behavior_id": "{{{uid.behavior_handle_interaction}}}",
                            "name": "Demonstrate prompts",
                            "interaction": "prompts.test",
                            "interaction_params_json": ""
                          }
                        ]
                      }
                    }
                  ]
                }
              ]
            }
          ]
        },
        {
          "uid": "behavior_handle_interaction",
          "title": "Handle interaction with worker",
          "is_disabled": false,
          "is_private": false,
          "priority": 50,
          "event": {
            "key": "event.interaction.chat.worker",
            "label": "Conversation handle interaction with worker"
          },
          "nodes": [
            {
              "type": "switch",
              "title": "Interaction:",
              "status": "live",
              "nodes": [
                {
                  "type": "outcome",
                  "title": "prompts.test",
                  "status": "live",
                  "params": {
                    "groups": [
                      {
                        "any": 0,
                        "conditions": [
                          {
                            "condition": "interaction",
                            "oper": "is",
                            "value": "prompts.test"
                          }
                        ]
                      }
                    ]
                  },
                  "nodes": [
                    {
                      "type": "action",
                      "title": "Start convo",
                      "status": "live",
                      "params": {
                        "actions": [
                          {
                            "action": "switch_behavior",
                            "return": "0",
                            "behavior_id": "{{{uid.behavior_convo_demo}}}",
                            "var": "_behavior"
                          }
                        ]
                      }
                    }
                  ]
                }
              ]
            }
          ]
        }
      ]
    }
  ]
}
{% endraw %}
</code>
</pre>

Click the **Import** button.

You should see the following result:

<div class="cerb-screenshot">
<img src="/assets/images/packages/prompt-bot/imported.png" class="screenshot">
</div>

# Running the interaction

**Prompt Bot** is now available from the global interaction menu in the lower right.

<div class="cerb-screenshot">
<img src="/assets/images/packages/prompt-bot/interaction.png" class="screenshot">
</div>

1. Click on the floating Cerb icon in the lower right. (Refresh the page if you don't see it)

1. Expand **Prompt Bot**.

1. Select the **Demonstrate prompts** interaction.

The bot will begin to demonstrate prompts.

## Prompt for text

The first prompt asks you to **Enter some text:**.

Try responding with a blank answer.

<div class="cerb-screenshot">
<img src="/assets/images/packages/prompt-bot/prompt-text.png" class="screenshot">
</div>

Aside from that, you can type anything to continue.

## Prompt for number

You'll be prompted to **Pick a number between 1 and 100**.

Try entering some numbers outside of that range, or even some non-numbers.

<div class="cerb-screenshot">
<img src="/assets/images/packages/prompt-bot/prompt-number.png" class="screenshot">
</div>

Enter a number between 1 and 100 to continue.

## Prompt for date

You'll be prompted with **Please enter a date**.

You can type an absolute date (`2018-06-15 08:00`) or a relative one (`tomorrow 8am`).

Try entering a date in the past (`yesterday noon`).

<div class="cerb-screenshot">
<img src="/assets/images/packages/prompt-bot/prompt-date.png" class="screenshot">
</div>

Enter a future date to continue.

## Prompt for email address

You'll be asked **What's your email address?**.

Try entering a blank answer, or a phrase that doesn't match the format of an email address.

<div class="cerb-screenshot">
<img src="/assets/images/packages/prompt-bot/prompt-email.png" class="screenshot">
</div>

Enter a valid email address to continue.

## Prompt with buttons

You'll be prompted **Yes or no?**.

You can't really mess this one up.

<div class="cerb-screenshot">
<img src="/assets/images/packages/prompt-bot/prompt-yes-no.png" class="screenshot">
</div>

Select **Yes** or **No** to continue.

## Prompt with chooser

You'll be prompted **Chooser a worker:**.

<div class="cerb-screenshot">
<img src="/assets/images/packages/prompt-bot/prompt-chooser-worker.png" class="screenshot">
</div>

Select a worker to continue.

## Prompt with images

You'll be asked **How do you prefer to be notified?**.

<div class="cerb-screenshot">
<img src="/assets/images/packages/prompt-bot/prompt-images.png" class="screenshot">
</div>

Select the image for **mobile**, **email**, or **notification** to continue.

## Prompt with file upload

You'll be asked **Send me an image file smaller than 250KB**.

<div class="cerb-screenshot">
<img src="/assets/images/packages/prompt-bot/prompt-file.png" class="screenshot">
</div>

Upload an image smaller than 250KB to continue.

## Summary

At the end of the prompts, you'll be shown a summary of your selections.

<div class="cerb-screenshot">
<img src="/assets/images/packages/prompt-bot/prompts-summary.png" class="screenshot">
</div>

This demonstrates how the bot can remember your answers for later use.

# How it works

In **Search >> Bots**, open the card for **Prompt Bot**.

Click the **Behaviors** button and open the card for **Convo: Demonstrate Prompts**.

<div class="cerb-screenshot">
<img src="/assets/images/packages/prompt-bot/behavior.png" class="screenshot">
</div>

Click on **Prompt for number** and select **Edit** from the menu.

Read our guide about [prompts in conversational bots](/guides/bots/prompts/).