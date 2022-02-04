---
title: Quick Start
permalink: /docs/getting-started/quick-start/
jumbotron:
  title: Quick Start
  tagline: 
  breadcrumbs:
  -
    label: Docs &raquo;
    url: /docs/home/
---

* TOC
{:toc}

# Configure branding

Let's personalize your copy of Cerb with your team's logo.

Navigate to **Setup >> Configure >> Branding**.

You can upload a light and dark version of your logo. If you only upload the light version, we'll use that image for both themes.

We recommend using the SVG format, but you can alternatively use a PNG, JPEG, or GIF.

You can change the **Browser Title** to set the label shown in browser tabs.

# Configure outbound email

Let's configure outbound email so your team can reply to your audience.

## Configure mail transports

**Mail transports** are used to deliver outgoing email to its destination.

There are many reasons you might want to use multiple transports:

* In development or test environments, you can use a **null** mail transport to prevent sending live email.

* If you manage multiple brands, each can use their own transport and sender reputation.

* You can use an official corporate mail server if required by policy.

* By configuring a backup mail transport, you can continue to serve customers during problems with your primary transport.

If you're using [Cerb Cloud](/cloud/), we've already configured a mail transport for you named **Cerb Cloud SMTP**.

To configure mail transports, navigate to **Setup >> Mail >> Outgoing >> Email Transports**.

## Configure sender addresses

You should configure each email address that you intend to send mail from. Each sender address can be linked to a specific mail transport.

To configure sender addresses, navigate to **Setup >> Mail >> Outgoing >> Sender Addresses**.

You can also use **Search >> Email Addresses** to edit an existing email address. Select the **We send email from this address** option at the bottom of the editor.

## Configure email signatures

You can configure multiple email signatures for outbound mail.

Navigate to **Search >> Email Signatures**.

The owner of an email signature determines who can edit it. Signatures may be owned by Cerb (where only admins can edit it), or a specific group (where its managers can edit it).

Each email signature has a plaintext and HTML version. If you only create a plaintext version, we'll generate the HTML one for you.

Email signatures may contain **placeholders** that are automatically substituted for each outgoing message. For instance, you can use {% raw %}`{{first_name}}`{% endraw %} to display the name of the worker who sent the message, and {% raw %}`{{title}}`{% endraw %} to refer to their job title.

## Configure your default sender address

In situations where a specific sender address isn't configured, the default sender address is used. You can configure this from **Setup >> Mail >> Outgoing >> Settings**.

# Configure inbound email

Now that you can send email, let's configure inbound email so that you can receive it.

## Configure instant delivery in Cerb Cloud

If you're using Cerb Cloud, you can configure instant email delivery by redirecting a copy of your mail to `support@INSTANCE.cerb.email`, where `INSTANCE` is your Cerb Cloud instance name.

You can also change the `support@` mailbox to anything you want.

If you do this, your new mail will show up instantly, and you won't need to configure any mailboxes in the next step.

You can also send email to these addresses directly to test inbound mail. For instance, if your Cerb Cloud instance is named `example`, then send a test message to `support@example.cerb.email`. A new message will show up in Cerb without any configuration required.

## Configure mailboxes

By default, Cerb uses **mailboxes** to receive new email messages. Each account is checked every few minutes.

To configure mailboxes, navigate to **Setup >> Mail >> Incoming >> Mailboxes**.

Unless you're using a service like Gmail that archives messages rather than deleting them, you should always create a separate mailbox for Cerb to download a copy of your mail from. **Messages will be deleted once they are downloaded.**

Cerb supports the standard POP3 and IMAP protocols, with multiple forms of encryption.

We also support the emerging **XOAuth2** standard that major email providers like Gmail and Office365 are migrating to. This replaces vulnerable passwords with rotating, time-limited access tokens. You can refer to the [Authenticate a Gmail mailbox using IMAP and XOAUTH2](/guides/integrations/google/gmail-xoauth/) guide for an example implementation.

## Configure mail routing

New email messages can be delivered to groups of workers with flexible routing rules.

Navigate to **Setup >> Mail >> Incoming >> Mail Routing**.

Mail routing rules are [automations](/docs/automations/) on the [mail.route](/docs/automations/events/mail.route/) event.

If a new message doesn't match any routing rules, it will be delivered to the default group specified at the top of **Setup >> Mail >> Incoming >> Settings**.

{% comment %}
We've provided two 

# Review groups

# Invite team members

# Configure roles

# Create a home workspace

# Add your license

# Enable the scheduler

{% endcomment %}