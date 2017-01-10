---
title: Quick Start
permalink: /docs/quick-start/
jumbotron:
  title: Quick Start
  tagline: Run through this checklist and you're ready for business!
---

<div class="cerb-box note">
<p>
	This guide assumes that you have a fresh instance of Cerb and you're an administrator who is performing the initial configuration.  If Cerb is already configured and you want to learn how to use it, you can <a href="/docs/logging-in">skip ahead</a>.
</p>
</div>

# Add your logo

First, let's start personalizing your new Cerb environment by changing the logo image in the top left.

Navigate to **Setup** >> **Configure** >> **Branding**.

In the **Logo URL** field, enter a link to an image of your logo.  For example: `http://example.com/logo.png`

You can also use the **Favicon URL** from your organization's website.  This is the icon that people see when they add links to their bookmarks.  For example: `http://example.com/favicon.ico`

When finished, click the **Save Changes** button.

# Configure outgoing mail transports

Next, let's make sure you're ready to send outgoing mail.

Navigate to **Setup** >> **Mail** >> **Mail Transports**.

In Cerb, outgoing email messages are sent using **mail transports**.

This page displays your available mail transports.  Your first transport was created during the [installation](/docs/installation/#step-7-outgoing-mail) process.

If you need to add additional transports (e.g. for the distinct mail servers of separate subsidiaries or brands), review the instructions for [configuring mail transports](/docs/setup/mail-transports).

You should also verify that your mail server IPs aren't listed on any Real-time Blackhole Lists (RBL)[^rbl-check].

<div class="cerb-box note">
<p>If you're using <b>Cerb Cloud</b>, you'll notice that we've already configured a default SMTP mail transport for you. If needed, you can still use your own SMTP server by creating a new transport.</p>
</div>

# Configure sender addresses

Navigate to **Setup** >> **Mail** >> **Sender Addresses**.

These are the addresses that you can send email from.

The simplest configuration is to use a single sender address for all outgoing mail. This could be an address like `support@`, `help@`, `contact@`, or `team@`.  In this configuration, you can still receive email from any number of mailboxes.

Alternatively, you may configure distinct sender addresses per department, team, project, subsidiary, or brand. Depending on your mail server, you may be restricted to a list of verified sender addresses. You may need to use a different mail transport per identity.

Each sender address can specify a default [mail transport](/docs/setup/mail-transports), personalized `From:` name, and message signature.

If you need to add additional sender addresses, review the instructions for [configuring sender addresses](/docs/setup/sender-addresses).

For optimal email deliverability, make sure you've configured SPF, DKIM, and DMARC records in DNS for all sender domains. We'll test this a little later.

<div class="cerb-box note">
<p>If you're using <b>Cerb Cloud</b>, we set up the SPF, DKIM, and DMARC records for you on the default <code>@&lt;instance&gt;.cerb.email</code> sender domain. You can add <code>include:cerb.email</code> to the SPF records on your own domains. We can whitelist these domains and generate DKIM keys for you by request.</p>
</div>

# Create groups

Navigate to **Search** >> **Groups**.

<div class="cerb-screenshot">
<img src="/assets/images/docs/quick-start/groups.png" class="screenshot">
</div>

In Cerb, workers with similar skills and responsibilities are organized into **groups**.  How **members** are assigned to a group is completely up to you, but groups generally map to existing departments or teams.

This _abstraction_[^abstraction] provides many conveniences and efficiencies for collaboration.  Work can quickly and effortlessly be assigned to an appropriate group as a whole, without first having to figure out which specific worker is both responsible for it and available to handle it. An inquiry about buying one of your products can be assigned to the Sales group, and an existing customer with a technical question could be assigned to the Support group.

Groups are designed to be _autonomous_[^autonomy]. One or more **managers** can configure the group without requiring an administrator. Aside from work, group members may also collectively share access to resources like bots, snippets, and custom fieldsets.

The units of work assigned to a group are organized into any number of **buckets**, which can be thought of like folders of related messages in a traditional email reader.  Every group has a default **inbox** bucket to collect new assignments.  From there, new work is manually or automatically sorted into the appropriate buckets.

Each member of a group may have a varying level of **responsibility** for each bucket. This allows the list of available work within the group to be prioritized in a personal way for each member; which makes finding the next thing to work on very easy for everyone.

Each group may be designated as **public** or **private**.  The content of a public group is visible to everyone, including non-members. The content of a private group is only visible to its members.

Lastly, you can assign a **profile image** to each group as a visual cue.

To add a new group, click the **(+)** icon in the blue bar of the worklist, and review the instructions for [configuring groups](/docs/setup/groups).

# Configure email signatures

Review the instructions for [configuring email signatures](/docs/mail#signatures).

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

Navigate to **Search** >> **Roles**.

In Cerb, worker permissions are managed using **roles**.  Multiple roles can be assigned to a single worker, and a worker is granted a particular privilege if any of their roles permit it.

The _Default_ role was automatically created for you during installation.  It simply grants all permissions to all workers.  You'll probably want to adjust this depending on your needs. Even if workers are granted all permissions, they still must also be an administrator to enter **Setup** and perform global configuration.

# Invite workers

Now that you've set up your groups and roles, and verified that outgoing mail works, let's invite the rest of your team to use Cerb.

Navigate to **Search** >> **Workers**.

Click the **(+)** icon in the blue bar of the worklist to add new workers.  At minimum, provide a first name, personal email address, and group memberships.  If you leave the password field blank, then setup instructions will be sent to the worker's email address.

# Configure incoming email

Let's give these new workers something to do.

Navigate to **Setup** >> **Mail** >> **Mailboxes**.

This page lists the mailboxes that Cerb checks for new messages.

If you need to add a new mailbox, click the **(+)** icon in the blue bar at the top of the worklist and review the instructions for [configuring incoming mailboxes](/docs/setup/mailboxes).

<div class="cerb-box note">
<p>If you're using <b>Cerb Cloud</b>, you can alternatively redirect your incoming mail to <code>support@&lt;you&gt;.cerb.email</code> for instant delivery. Replace <code>&lt;you&gt;</code> with the name of your instance. With this delivery method you won't need to set up a mailbox here.</p>
</div>

<div class="cerb-box warning">
<p>Cerb deletes messages from your mailbox after it downloads them (unless the mail server prevents this behavior, like Google Apps). If this is not desirable, you should send a copy of all incoming email to a separate mailbox and add that to Cerb.</p>
</div>

# Routing

You can configure rules to automatically route new mail to groups based on message properties.

Navigate to **Setup** >> **Mail** >> **Routing**.

For example, you may want to route messages addressed to `support@*` to the **Support** group, `orders@*` to **Sales**, and `receipts@*` to **Billing**.

As mentioned earlier, these messages will be delivered to the **Inbox** bucket in those groups, and group managers can configure additional sorting from there.

If you want to add a new routing rule, click the **Add** button and review the instructions for <a href="/docs/setup/mail-routing">configuring mail routing</a>.

# Scheduler

Navigate to **Setup** >> **Configure** >> **Scheduler**.

The **scheduler** is responsible for planning and running _jobs_. A **job** is a specific task: checking your mailboxes for new messages, search indexing new records, performing nightly maintenance, triggering scheduled bot behaviors, etc.  There are several built-in jobs, and new jobs can be added using plugins.

For Cerb's scheduled jobs to automatically run in the background, you need to configure a third-party tool to request the `/cron` page every minute.

Review the instructions for <a href="/docs/setup/scheduler">configuring the scheduler</a>.

<div class="cerb-box note">
<p>If you're using <b>Cerb Cloud</b>, we handle this for you.</p>
</div>

# Security

Review the [security considerations](/docs/security).

# Plugins

Navigate to **Setup** >> **Plugins** >> **Installed Plugins**.

This is where you'll find the available plugins that expand Cerb's functionality.

# References

[^rbl-check]: <http://www.anti-abuse.org/multi-rbl-check/>

[^abstraction]: <https://en.wikipedia.org/wiki/Abstraction_(computer_science)>

[^autonomy]: <https://en.wikipedia.org/wiki/Autonomy>
