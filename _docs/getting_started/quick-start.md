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

(( link to 'configuring groups' ))

# Configure your message signatures

Email signatures[^signatures] are an important part of branding in professional correspondence -- sometimes they are even mandatory to comply with local laws. They provide additional contact information (similar to a business card), as well as links to an organization's website, social media profiles, etc.

Many organizations mandate a consistent signature style, and Cerb automatically handles this requirement by default.

Signatures are automatically personalized for each worker using **placeholders** -- special words that are replaced with field values from a target record.  The most common placeholders for worker signatures are {% raw %}`{{first_name}}`, `{{last_name}}`, `{{full_name}}`, and `{{title}}`.{% endraw %}

Conventionally, signatures begin with two dashes, a space, and a new line; allowing them to be consistently detected by email software.

Your first signature template may look something like this:

{% highlight text %}
{% raw %}
-- 
{{full_name}}, {{title}}
Example, Inc. - http://example.com/
{% endraw %}
{% endhighlight %}

When workers are composing a message, their signature is represented by a `#signature` marker. This a special kind of placeholder that serves several purposes.  First, the signature marker declutters the outgoing message by not showing a worker their own signature in every message.  More importantly, it allows the signature to be moved or modified by plugins, HTML templates, and Virtual Attendants.

You may recall that sender addresses provide a default signature for outgoing messages.  That is called a _default_ signature because buckets and HTML templates can provide alternate signatures to be used instead.

Signatures are selected in this order:

1. The signature of the current HTML template (selected on a per-message basis).
1. The signature of the current bucket.
1. The signature of the current bucket's sender address.
1. The signature of the current group inbox.
1. The signature of the current group inbox's sender address.
1. The signature of the default sender address. 

We refer to this as _cascading signatures_.  You don't need to set a signature in all of those places.  If a given signature above is blank (e.g. an HTML template isn't being used, and the current bucket doesn't define a signature) then the next non-blank signature is used as a default.  This process repeats all the way until the signature of the default sender address is used.  If that is blank then no signature is added.

This may seem like a complicated process, but it happens automatically, uniformly, and saves workers from the hassle of having to pick the appropriate signature from a list for every outgoing message.  When conversations move between groups and buckets (e.g. changing brands), the signature automatically changes in response.  When an HTML template is used, the signature of the current message can be moved into the appropriate part of the layout, modified, or ignored entirely. Workers don't have to waste any time thinking about it.

The simplest way to set up a global signature is to add it to your default sender address, and then leave the signature option blank everywhere else.

To set up a different signature per brand, you can set the signature on each group's inbox, and that signature will be used for all the buckets within the group from a single place.

# Send a message to test mail deliverability

Now that you have set up your sender addresses, groups, and signatures, it's time to send a test message to make sure everything is configured properly.

We're going to send a test message from Cerb to the **mail-tester.com** service. Not only will this verify that your message was delivered properly, but it will also generate a deliverability score by testing your mail server configuration: SPF, DKIM, DMARC, reverse DNS (PTR), etc.

1. First, open a web browser to <http://mail-tester.com>

	<div class="cerb-screenshot">
	<img src="/assets/images/docs/quick-start/mail-tester.png" class="screenshot">
	</div>

1. Copy the destination email address that shows up on that page.

1. Open Cerb in another browser window or tab.

1. Navigate to **Search** >> **Ticket**.

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

Navigate to **Setup** >> **Workers &amp; Groups** >> **Roles**.

In Cerb, worker permissions are managed using **roles**.  Multiple roles can be assigned to a single worker, and a worker is granted a particular privilege if any of their roles permit it.

The _Default_ role was automatically created for you during installation.  It simply grants all permissions to all workers.  You'll probably want to adjust this depending on your needs. Even if workers are granted all permissions, they still must also be an administrator to enter **Setup** and perform global configuration.

# Invite workers

Now that you've set up your groups and roles, and verified that outgoing mail works, let's invite the rest of your team to use Cerb.

Navigate to **Setup** >> **Workers &amp; Groups** >> **Workers**.

Click the **(+)** icon in the blue bar of the worklist to add new workers.  At minimum, provide a first name, personal email address, and group memberships.  If you leave the password field blank, then setup instructions will be sent to the worker's email address.

# Configure incoming email

Let's give these new workers something to do.

Navigate to **Setup** >> **Mail** >> **Mailboxes**.

# Routing

Navigate to **Setup** >> **Mail** >> **Routing**.

# Scheduler

For Cerb's scheduled jobs to run in the background (e.g. checking mailboxes every 5 minutes, search indexing, maintenance), you need to configure a program to automatically request a special URL every minute.  On Unix-based systems, this is accomplished with a cronjob[^cronjob].

Navigate to **Setup** >> **Configure** >> **Scheduler**.

(( IP access ))

(( Linux crontab example ))

(( Windows example ))

(( worst case, browser reload ))

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

[^signatures]: <https://en.wikipedia.org/wiki/Signature_block>

[^cronjob]: <https://en.wikipedia.org/wiki/Cron>