---
title: Relay email messages to workers
excerpt: Relay email messages to workers using an external email client.
summary: This page provides an overview of email relay in Cerb, which enables workers
  to respond to messages from external email clients instead of being forced to use
  the web browser.
layout: solution
jumbotron: []
social_image_url: /assets/images/solutions/automations/relay-email.png
redirect_from:
- /automation/cookbook/relay-email/
---

## Using api.command:

With [email relay](/guides/mail/relaying/), workers can respond to messages from external email clients rather than their web browser.

<pre>
<code class="language-cerb">
{% raw %}
start:
  api.command:
    inputs:
      name: cerb.commands.email.relay
      params:
        message_id@int: 1234
        emails@csv: kina@cerb.example, mara@cerb.example
    output: results
{% endraw %}
</code>
</pre>