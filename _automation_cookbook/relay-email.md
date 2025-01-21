---
title: Relay email messages to workers
excerpt: Relay email messages to workers using an external email client.
summary: 
layout: integration
jumbotron:
  title: Relay email messages to workers

  breadcrumbs:
    -
      label: Resources &raquo;
      url: /resources/
    -
      label: Automation Cookbook &raquo;
      url: /resources/automation-cookbook/
---
With email relay, workers can respond to messages from external email clients rather than always being forces to use Cerb in the web browser.

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

See [Email Relay](/guides/mail/relaying/) for more detailed information.