---
title: Quick Start
permalink: /docs/quick-start/
jumbotron:
  title: Quick Start
  tagline: Run through this checklist and you're ready for business!
---

<div class="cerb-box note">
<p>
	This guide assumes that you have a fresh instance of Cerb and you're an administrator who is performing the initial configuration.  If Cerb is already configured and you want to learn how to use it, you can <a href="/docs/ui">skip ahead to Using Cerb</a>.
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

Your first mail transport was created during the [installation](/docs/installation/#step-7-outgoing-mail) process.

If you need to add additional transports (e.g. for the distinct mail servers of separate subsidiaries or brands), review the instructions for [configuring mail transports](/docs/mail-transports).

You should also verify that your mail server IPs aren't listed on any Real-time Blackhole Lists (RBL)[^rbl-check].

<div class="cerb-box note">
<p>If you're using <b>Cerb Cloud</b>, you'll notice that we've already configured a default SMTP mail transport for you. You can still use your own SMTP server by creating a new transport.</p>
</div>

# Configure sender addresses

Navigate to **Setup** >> **Mail** >> **Sender Addresses**.

These are the sender addresses that you can send email from.

The simplest configuration is to use a single sender address for all outgoing mail. This could be an address like `support@`, `help@`, `contact@`, or `team@`.  In this configuration, you can still receive email in any number of mailboxes.

Alternatively, you may configure distinct sender addresses per department, team, project, subsidiary, or brand. Keep in mind that, depending on your mail server, you may be restricted to a list of verified sender addresses. You may need to use a different mail transport per identity.

Each sender address can specify a default [mail transport](/docs/mail-transports), personalized `From:` name, and message signature.

If you need to add additional sender addresses, review the instructions for [configuring sender addresses](/docs/sender-addresses).

For optimal email deliverability, make sure you've configured SPF, DKIM, and DMARC records in DNS for all sender domains. We'll test this a little later.

<div class="cerb-box note">
<p>If you're using <b>Cerb Cloud</b>, we set up the SPF, DKIM, and DMARC records for you on the default <code>@&lt;instance&gt;.cerb.email</code> sender domain. You can add <code>include:cerb.email</code> to the SPF records on your own domains. We can whitelist these domains and generate DKIM keys for you by request.</p>
</div>

# Create groups

Navigate to **Setup** >> **Workers &amp; Groups** >> **Groups**.

<div class="cerb-screenshot">
<img src="/assets/images/docs/quick-start/groups.png" class="screenshot">
</div>

In Cerb, workers with similar skills and responsibilities are organized into **groups**.  How **members** are assigned to a group is completely up to you, but groups generally map to existing departments or teams.

This _abstraction_[^abstraction] provides many conveniences and efficiencies for collaboration.  Work can quickly and effortlessly be assigned to an appropriate group as a whole, without first having to figure out which specific worker is both responsible for it and available to handle it. An inquiry about buying one of your products can be assigned to the Sales group, and an existing customer with a technical question could be assigned to the Support group.

Groups are designed to be _autonomous_[^autonomy]. One or more **managers** can configure the group without requiring an administrator. Aside from work, group members may also collectively share access to resources like Virtual Attendants, snippets, and custom fieldsets.

The units of work assigned to a group are organized into any number of **buckets**, which can be thought of like folders of related messages in a traditional email reader.  Every group has a default **inbox** bucket to collect new assignments.  From there, new work is manually or automatically sorted into the appropriate buckets.

Each member of a group may have a varying level of **responsibility** for each bucket. This allows the list of available work within the group to be prioritized in a personal way for each member; which makes finding the next thing to work on very easy for everyone.

Each group may be designated as **public** or **private**.  The content of a public group is visible to everyone, including non-members. The content of a private group is only visible to its members.

Lastly, you can assign a **profile image** to each group as a visual cue.

# Invite workers

Navigate to **Setup** >> **Workers &amp; Groups** >> **Workers**.

(( link to 'configuring workers' ))

# Roles

Navigate to **Setup** >> **Workers &amp; Groups** >> **Roles**.

(( permissions ))

# Signatures

(( placeholders ))

(( #signature ))

(( cascades ))

# Send a message to test mail deliverability



# Configure incoming email

Navigate to **Setup** >> **Mail** >> **Mailboxes**.

# Routing

Navigate to **Setup** >> **Mail** >> **Routing**.

# Scheduler

Navigate to **Setup** >> **Configure** >> **Scheduler**.

# Security

(( storage/etc filesystem access permissions ))

(( php functions ))

(( <http://cerb.book/admin_guide/security/index.html> ))

(( IP access for upgrades/scheduler ))

(( proxies, X-Forwarded-For ))

(( two-factor ))

(( admin vs worker account usage ))

(( XSS/CSRF ))

# Plugins

Navigate to **Setup** >> **Plugins** >> **Installed Plugins**.

# References

[^rbl-check]: <http://www.anti-abuse.org/multi-rbl-check/>

[^abstraction]: <https://en.wikipedia.org/wiki/Abstraction_(computer_science)>

[^autonomy]: <https://en.wikipedia.org/wiki/Autonomy>