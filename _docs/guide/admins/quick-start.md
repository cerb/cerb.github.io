---
title: Admin Quick Start
permalink: /docs/guide/admins/quick-start/
toc:
  title: Quick Start
  expand: Admin Guide
redirect_from:
  - /docs/quick-start/
jumbotron:
  title: Quick Start
  tagline: Get started quickly with this brief tour through Cerb functionality
  breadcrumbs:
  -
    label: Docs &raquo;
    url: /docs/home/
  -
    label: Admin Guide &raquo;
---

* TOC
{:toc}

<div class="cerb-box note">
<p>
	This guide assumes that you have a fresh instance of Cerb and you're an administrator who is performing the initial configuration.  If Cerb is already configured and you want to learn how to use it, you can <a href="/docs/home/">jump to the worker guide</a>.
</p>
</div>

# Add your logo

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

If you're using **Cerb Cloud**, we've already configured a mail transport for you named **Cerb Cloud SMTP**.

To configure mail transports, navigate to **Setup >> Mail >> Outgoing >> Email Transports**.

## Configure sender addresses

You should configure each email address that you intend to send mail from. Each sender address can be linked to a specific mail transport.

To configure sender addresses, navigate to **Setup >> Mail >> Outgoing >> Sender Addresses**.

You can also use **Search >> Email Addresses** to edit an existing email address. Select the **We send email from this address** option at the bottom of the editor.

To make sure your email isn't marked as spam, configure SPF, DKIM, and DMARC records in DNS for all sender domains. We'll test this a little later.

If you're using **Cerb Cloud**, we set up the SPF, DKIM, and DMARC records for you on the default <code>@&lt;instance&gt;.cerb.email</code> sender domain. You can add <code>include:cerb.email</code> to the SPF records on your own domains. We can permit these domains and generate DKIM keys for you by request.

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

# Review groups

You should set up a few groups to distribute work.

Navigate to **Search** &raquo; **Groups**

Review your [groups](/docs/groups/).

To add a new group, click the **(+)** icon in the blue bar of the worklist.

{% comment %}

# Create a home workspace

# Add your license

# Enable the scheduler

{% endcomment %}

# Send a message to test mail deliverability

Now that you have set up your sender addresses, groups, and signatures, it's time to send a test message to make sure everything is configured properly.

We're going to send a test message from Cerb to the **mail-tester.com** service. Not only will this verify that your message was delivered properly, but it will also generate a deliverability score by testing your mail server configuration: SPF, DKIM, DMARC, reverse DNS (PTR), etc.

1. First, open a web browser to <http://mail-tester.com>

   <div class="cerb-screenshot">
   <img src="/assets/images/docs/quick-start/mail-tester.png" class="screenshot">
   </div>

1. Copy the destination email address that shows up on that page.

1. Open Cerb in another browser window or tab.

1. Navigate to **Search** >> **Tickets**.

1. Click the **(+)** icon in the gray bar above the worklist.

1. Select a group and bucket to send **From:**.

1. Paste the destination email address from **@mail-tester.com** in the **To:** field.

1. In **Subject:**, type: `This is a test of outgoing mail from Cerb`

1. On the first line of the message, type: `This is an outgoing message.`

1. In **Properties**, below the message text, select **Open** for the status of the conversation.

1. Scroll down to the bottom of the popup window and click the **Send Message** button.

   <div class="cerb-screenshot">
   <img src="/assets/images/docs/quick-start/cerb-compose-test.png" class="screenshot">
   </div>

1. Switch back to the browser at **mail-tester.com** and click the blue **Then Check Your Score** button.

1. If everything goes well, you should see something like this:

   <div class="cerb-screenshot">
   <img src="/assets/images/docs/quick-start/mail-tester-success.png" class="screenshot">
   </div>

If you received a less than perfect score, scroll down to see the details.  You can make corrections, send another test message to the same email address, and then reload the results page.

# Grant worker permissions with roles

Before we invite the rest of your team, you should establish the permissions that grant or restrict functionality for each worker.

Navigate to **Search** >> **Roles**

In Cerb, worker permissions are managed using **roles**.  Multiple roles can be assigned to a single worker, and a worker is granted a particular privilege if any of their roles permit it.

The _Default_ role was automatically created for you during installation.  It simply grants all permissions to all workers.  You'll probably want to adjust this depending on your needs. Even if workers are granted all permissions, they still must also be an administrator to enter **Setup** and perform global configuration.

# Invite workers

Now that you've set up your groups and roles, and verified that outgoing mail works, let's invite the rest of your team to use Cerb.

Navigate to **Search** >> **Workers**

Click the **(+)** icon in the blue bar of the worklist to add new workers.  At minimum, provide a first name, personal email address, and group memberships.  If you leave the password field blank, then setup instructions will be sent to the worker's email address.

# Configure incoming email

Let's give these new workers something to do.

Navigate to **Setup >> Mail >> Incoming Mail >> Mailboxes**

This page lists the mailboxes that Cerb checks for new messages.

Review your [mailboxes](/docs/setup/mail/mailboxes/).

<div class="cerb-box note">
<p>If you're using <b>Cerb Cloud</b>, you can alternatively redirect your incoming mail to <code>support@&lt;you&gt;.cerb.email</code> for instant delivery. Replace <code>&lt;you&gt;</code> with the name of your instance. With this delivery method you won't need to set up a mailbox here.</p>
</div>

<div class="cerb-box warning">
<p>Cerb deletes messages from your mailbox after it downloads them (unless the mail server prevents this behavior, like Google Apps). If this is not desirable, you should send a copy of all incoming email to a separate mailbox and add that to Cerb.</p>
</div>

# Routing

Navigate to **Setup >> Mail >> Incoming Mail >> Mail Routing**

Review your [mail routing rules](/docs/setup/mail/routing/).

# Scheduler

Navigate to **Setup** >> **Configure** >> **Scheduler**

Review the instructions for [configuring the scheduler](/docs/setup/configure/scheduler/).

<div class="cerb-box note">
<p>If you're using <b>Cerb Cloud</b>, we handle this for you.</p>
</div>

# Security

Review the [security considerations](/docs/security/).

# Plugins

Navigate to **Setup** >> **Plugins** >> **Installed Plugins**

This is where you'll find the available [plugins](/docs/plugins/) that expand Cerb's functionality.
