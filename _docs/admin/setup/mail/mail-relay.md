---
title: External Relay
permalink: /docs/setup/mail-relay/
toc:
  title: External Relay
jumbotron:
  title: External Relay
  breadcrumbs:
  - 
    label: Setup
    url: /docs/setup/
---

Navigate to **Setup** >> **Mail** >> **External Relay**

The email relay allows workers to respond to messages from external mail applications (e.g. Gmail, mobile phones, Outlook, etc) instead of requiring them to always use Cerb in the web browser.

Relayed responses are received from a worker's personal email address and rewritten so they appear to be from Cerb before being sent to a conversation's recipients. This process protects the privacy of personal worker email addresses, while still providing the benefits of Cerb (e.g. shared history, assignments, etc).

## Authentication

By default, relayed messages are authenticated by checking the mail headers. Copies of mail that are relayed to workers outside of Cerb using Virtual Attendant behavior are "signed" with a secret key in the `Message-Id:` header. According to the RFC-5322 standard, this `Message-Id:` should be referenced in the `In-Reply-To:` header of any reply.

Unfortunately, some email applications _"break the Internet"_ by ignoring these many decade old conventions. Common culprits include Microsoft Exchange and some Android or Blackberry mobile devices.

In the event that the worker relay doesn't function properly in your environment, you may disable the built-in authentication. Be careful when doing this! When authentication is disabled, anyone can forge a message From: one of your workers and have it relayed to arbitrary conversations. It is very important that you set up alternative authentication using [mail filtering](/docs/setup/mail-filtering) behaviors with [bots](/docs/bots/) to approve or deny inbound worker replies through the relay.

<div class="cerb-box note">
	<p>Many mail servers will reject messages sent from "spoofed" senders. You should leave the <tt>From:</tt> setting at the default unless you have verified that your mail server allows for spoofed messages.</p>
</div>

{% include setup_toc.html %}