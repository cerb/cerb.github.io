---
title: Quick Start
permalink: /docs/quick-start/
jumbotron:
  title: Quick Start
  tagline: Run through this checklist and you're ready for business!
---

* TOC
{:toc}

<div class="cerb-box note">
<p>
	This guide assumes that you have a fresh instance of Cerb and you're an administrator who is performing the initial configuration.  If Cerb is already configured and you want to learn how to use it, you can <a href="/docs/welcome">jump to the worker guide</a>.
</p>
</div>

# Add your logo

Let's personalize your new Cerb environment with your own logo.

Navigate to **Setup** &raquo; **Configure** &raquo; **Branding**

Review the instructions for [adding your own logo](/docs/setup/branding/).

# Configure outgoing mail transports

Next, let's make sure you're ready to send outgoing mail.

Navigate to **Setup >> Mail >> Outgoing Mail >> Email Transports**

Review your [mail transports](/docs/setup/mail-transports/).

<div class="cerb-box note">
<p>If you're using <b>Cerb Cloud</b>, you'll notice that we've already configured a default SMTP mail transport for you. If needed, you can still use your own SMTP server by creating a new transport.</p>
</div>

# Configure sender addresses

Navigate to **Setup >> Mail >> Outgoing Mail >> Sender Addresses**

Review your [sender addresses](/docs/setup/sender-addresses/). These determine the `From:` email address when you send messages.

For optimal email deliverability, make sure you've configured SPF, DKIM, and DMARC records in DNS for all sender domains. We'll test this a little later.

<div class="cerb-box note">
<p>If you're using <b>Cerb Cloud</b>, we set up the SPF, DKIM, and DMARC records for you on the default <code>@&lt;instance&gt;.cerb.email</code> sender domain. You can add <code>include:cerb.email</code> to the SPF records on your own domains. We can whitelist these domains and generate DKIM keys for you by request.</p>
</div>

# Create groups

You should set up a few groups to distribute work.

Navigate to **Search** &raquo; **Groups**

Review your [groups](/docs/groups/).

To add a new group, click the **(+)** icon in the blue bar of the worklist.

# Configure email signatures

Navigate to **Search >> Email Signatures** to manage your email signatures.

You can configure email signatures on groups and buckets.

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

Review your [mailboxes](/docs/setup/mailboxes/).

<div class="cerb-box note">
<p>If you're using <b>Cerb Cloud</b>, you can alternatively redirect your incoming mail to <code>support@&lt;you&gt;.cerb.email</code> for instant delivery. Replace <code>&lt;you&gt;</code> with the name of your instance. With this delivery method you won't need to set up a mailbox here.</p>
</div>

<div class="cerb-box warning">
<p>Cerb deletes messages from your mailbox after it downloads them (unless the mail server prevents this behavior, like Google Apps). If this is not desirable, you should send a copy of all incoming email to a separate mailbox and add that to Cerb.</p>
</div>

# Routing

Navigate to **Setup >> Mail >> Incoming Mail >> Mail Routing**

Review your [mail routing rules](/docs/setup/mail-routing/).

# Scheduler

Navigate to **Setup** >> **Configure** >> **Scheduler**

Review the instructions for [configuring the scheduler](/docs/setup/scheduler/).

<div class="cerb-box note">
<p>If you're using <b>Cerb Cloud</b>, we handle this for you.</p>
</div>

# Security

Review the [security considerations](/docs/security/).

# Plugins

Navigate to **Setup** >> **Plugins** >> **Installed Plugins**

This is where you'll find the available [plugins](/docs/plugins/) that expand Cerb's functionality.

# References

[^abstraction]: <https://en.wikipedia.org/wiki/Abstraction_(computer_science)>

[^autonomy]: <https://en.wikipedia.org/wiki/Autonomy>
