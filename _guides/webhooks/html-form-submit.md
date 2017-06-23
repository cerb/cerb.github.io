---
title: Submit web forms directly to bots in Cerb
layout: integration
topic: Webhooks
jumbotron:
  title: Submit web forms directly to bots in Cerb
  tagline: ""
  breadcrumbs:
  -
    label: Resources &raquo;
    url: /resources/
  -
    label: Guides &raquo;
    url: /resources/guides/
  -
    label: Webhooks &raquo;
    url: /resources/guides/#webhooks
---

# Introduction
{:.no_toc}

Let's assume that you have a static[^static-site] website for your company and you need to add a contact form to it.  You're using something like Jekyll[^jekyll] to generate the site because you want it to be simple to maintain, fast to serve, secure to host, and effortless to scale. You don't want to implement form processing with a dynamic[^dynamic-site] programming language on the backend[^backend] server because it will sacrifice those benefits.

Cerb has you covered.  You can submit arbitrary web forms directly to bot behaviors in Cerb by using a custom webhook[^webhook] URL. The bot can validate the form fields, handle CORS[^cors] access control, verify a CAPTCHA challenge, and then do almost anything with the data.

You can create a ticket in Cerb from a contact form, but you're not limited to that common use case.  You can implement forms to collect leads on a landing page that directly populate opportunity records and custom fields. You can collect email addresses for an announcement mailing list.  You can power signup forms for your products and services which create contact records and automate a series of sales followups.  You can create a "request a call" form that uses Twilio[^twilio] to automatically connect a salesperson with a prospect.

You can do all of this with Cerb bot behaviors that you build entirely from your browser, with a little Javascript on your website, and without sacrificing any of the benefits of a static site on your server.

In this article, we'll build a simple contact form on a static site.  When the form is submitted, we'll POST to a webhook that runs a bot behavior in Cerb.  The bot will validate the form and handle CORS access control (submitting a form to a different host than your website). The bot will communicate any issues back to the browser in real-time.

You can use these fundamental concepts to respond to any kind of web requests with bots in Cerb.

* TOC
{:toc}

# Enable the Webhooks plugin in Cerb

If the webhooks plugin isn't already enabled, install it from the [Plugin Library](/docs/plugins/#library).

# Create the bot behavior in Cerb

Once the Webhooks plugin is enabled, you'll be able to create new bot behaviors on the **Webhook received** event.

Let's create a new bot to keep things organized.

Navigate to **Search** &raquo; **Bots** and click the **(+)** icon in the toolbar above the worklist to add a new record:

<div class="cerb-screenshot">
<img src="/assets/images/guides/common/worklist-add.png" class="screenshot">
</div>

Enter the following details:

<div class="cerb-screenshot">
<img src="/assets/images/guides/webhooks/html-form-submit/create-va.png" class="screenshot">
</div>

Click the **Save Changes** button.  Then click your the name of your new bot in the yellow notification bubble above the worklist to open its [card](/docs/records/#cards).

On the popup, click the **Behaviors** button:

<div class="cerb-screenshot">
<img src="/assets/images/guides/webhooks/html-form-submit/popup-behaviors-button.png" class="screenshot">
</div>

Click the **(+)** icon above the behaviors worklist to add a new behavior:

<div class="cerb-screenshot">
<img src="/assets/images/guides/common/worklist-add.png" class="screenshot">
</div>

Copy the following behavior script to your clipboard:

<pre style="max-height:29.25em;">
<code class="language-json">
{% raw %}
{
  "behavior":{
    "title":"Bot powered contact form",
    "is_disabled":false,
    "is_private":false,
    "event":{
      "key":"event.webhook.received",
      "label":"Webhook received"
    },
    "nodes":[
      {
        "type":"action",
        "title":"Set CORS headers",
        "params":{
          "actions":[
            {
              "action":"set_http_header",
              "name":"Access-Control-Allow-Origin",
              "value":"*"
            },
            {
              "action":"set_http_header",
              "name":"Access-Control-Allow-Headers",
              "value":"User-Agent, Content-Type"
            },
            {
              "action":"set_http_header",
              "name":"Access-Control-Allow-Methods",
              "value":"OPTION,POST"
            }
          ]
        }
      },
      {
        "type":"switch",
        "title":"Method:",
        "nodes":[
          {
            "type":"outcome",
            "title":"OPTIONS",
            "params":{
              "groups":[
                {
                  "any":0,
                  "conditions":[
                    {
                      "condition":"http_verb",
                      "oper":"is",
                      "value":"OPTIONS"
                    }
                  ]
                }
              ]
            }
          },
          {
            "type":"outcome",
            "title":"POST",
            "params":{
              "groups":[
                {
                  "any":0,
                  "conditions":[
                    {
                      "condition":"http_verb",
                      "oper":"is",
                      "value":"POST"
                    }
                  ]
                }
              ]
            },
            "nodes":[
              {
                "type":"switch",
                "title":"Valid?",
                "nodes":[
                  {
                    "type":"outcome",
                    "title":"No, email is blank",
                    "params":{
                      "groups":[
                        {
                          "any":0,
                          "conditions":[
                            {
                              "condition":"http_param",
                              "name":"email",
                              "oper":"is",
                              "value":""
                            }
                          ]
                        }
                      ]
                    },
                    "nodes":[
                      {
                        "type":"action",
                        "title":"Return error",
                        "params":{
                          "actions":[
                            {
                              "action":"set_http_body",
                              "value":"{% set json = {} %}\r\n{% set json = dict_set(json, 'error', \"The 'Email Address' field is required.\") %}\r\n{{ json | json_encode | json_pretty }}"
                            }
                          ]
                        }
                      }
                    ]
                  },
                  {
                    "type":"outcome",
                    "title":"No, message is blank",
                    "params":{
                      "groups":[
                        {
                          "any":0,
                          "conditions":[
                            {
                              "condition":"http_param",
                              "name":"message",
                              "oper":"is",
                              "value":""
                            }
                          ]
                        }
                      ]
                    },
                    "nodes":[
                      {
                        "type":"action",
                        "title":"Return error",
                        "params":{
                          "actions":[
                            {
                              "action":"set_http_body",
                              "value":"{% set json = {} %}\r\n{% set json = dict_set(json, 'error', \"The 'Message' field is required.\") %}\r\n{{ json | json_encode | json_pretty }}"
                            }
                          ]
                        }
                      }
                    ]
                  },
                  {
                    "type":"outcome",
                    "title":"Yes",
                    "params":{
                      "groups":[
                        {
                          "any":0,
                          "conditions":[
                            
                          ]
                        }
                      ]
                    },
                    "nodes":[
                      {
                        "type":"action",
                        "title":"Return success",
                        "params":{
                          "actions":[
                            {
                              "action":"set_http_body",
                              "value":"{% set json = {} %}\r\n{% set json = dict_set(json, 'success', \"Thanks! We've received your message.\") %}\r\n{{ json | json_encode | json_pretty }}"
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
}
{% endraw %}
</code>
</pre>

Select **Import** at the top of the popup and paste the copied behavior.

Click the **Save Changes** button.

<div class="cerb-box note">
	<p>
		If you see a <tt>"Invalid event in the provided behavior"</tt> error, that usually means that the Webhooks plugin isn't enabled.
	</p>
</div>

Open the card for your new behavior.  You should now see the following:

<div class="cerb-screenshot">
<img src="/assets/images/guides/webhooks/html-form-submit/va-behavior.png" class="screenshot">
</div>

Now we're ready to create the webhook that triggers this behavior.

# Create the new webhook in Cerb

Navigate to **Setup** &raquo; **Configure** &raquo; **Webhooks**.

Click the **(+)** icon in the blue bar of the worklist to create a new webhook.

Enter the following details:

<div class="cerb-screenshot">
<img src="/assets/images/guides/webhooks/html-form-submit/create-webhook.png" class="screenshot">
</div>

Click the **Save Changes** button.

A new webhook will be added to the worklist.  You can copy the **URL** to your clipboard, since we'll be using it in the next step.

# Open the example form in jsFiddle

Use the live demo below, or [open the example form in jsFiddle](https://jsfiddle.net/cerb/omut2vr0/10/).

Switch to the **Result** tab below. Paste your webhook URL into the first text box, where it says <code>&lt;paste your webhook URL here&gt;</code>.

<script async src="https://jsfiddle.net/cerb/omut2vr0/10/embed/"></script>

## Test form validation warnings

It's a good idea to verify all the tests in your form validation.  Without typing an email address or message in the form, click the **Submit** button.

You should see a warning:

<div class="cerb-screenshot">
<img src="/assets/images/guides/webhooks/html-form-submit/form_warning.png" class="screenshot">
</div>

This warning message is coming directly from your bot behavior through the webhook.  Currently, the example behavior is just verifying that the field isn't blank; but you can extend the behavior to perform any kind of validation you need.  You can even add and validate a reCAPTCHA to foil non-human submissions of your form.

## Test form success

Now let's test a successful outcome.  Enter an email address and a message, then click the **Submit** button.

You should see a success message:

<div class="cerb-screenshot">
<img src="/assets/images/guides/webhooks/html-form-submit/form_success.png" class="screenshot">
</div>

# Restrict access to your webhook URL

By default, the bot will allow any website to POST to your webhook URL.  In CORS parlance, it's using <code>Access-Control-Allow-Origin: *</code>.

You can instruct web browsers to only allow POSTs to your webhook from your own domain.  Simply click on the **Set CORS headers** node in the bot behavior and select **Edit** from the menu.  In the first **Set HTTP response header** action, change **Value** from <code>*</code> to <code>https://example.com</code> (using your own domain name).

Keep in mind that CORS only restricts standard web browsers from misbehaving.  Someone who views the source of your web site can still send requests directly to your webhook URL from anywhere.  This is necessary, because client web browsers communicate directly with your webhook from their browser without routing through a backend server.

You can add a challenge like reCAPTCHA to your form o help prevent abuse.  This displays a test that only a human should be capable of solving.  Your bot behavior can be modified to verify the user's CAPTCHA input.

You can also optionally hide your webhook URL behind a proxy, which protects the location of your Cerb installation, and gives you an additional layer of audit logging.  For instance, you can forward POST requests for <code>/contact/submit</code> on your webserver to your webhook URL.

# References

[^backend]: <https://en.wikipedia.org/wiki/Front_and_back_ends>
[^cors]: <https://en.wikipedia.org/wiki/Cross-origin_resource_sharing>
[^dynamic-site]: <https://en.wikipedia.org/wiki/Dynamic_web_page>
[^jekyll]: <https://jekyllrb.com>
[^static-site]: <https://en.wikipedia.org/wiki/Static_web_page>
[^twilio]: <https://www.twilio.com>
[^webhook]: <https://en.wikipedia.org/wiki/Webhook>
