---
layout: page
title: "Cerb Cloud"
permalink: /cloud/
redirect_from: /pricing/cloud
jumbotron:
  title: Cerb Cloud Subscriptions
  tagline: Deploy a reliable, fine-tuned, fully-managed Cerb environment in the Cloud
---

__Cerb Cloud__ is a subscription-based service that provides a finely tuned, ready-to-use instance of Cerb in an ideal environment. All you need is a web browser and your team can start putting Cerb's tools to work. We'll handle everything else.

* __Fully managed__: We install Cerb and its dependencies in an ideal environment, apply updates and security patches, monitor and scale the infrastructure, optimize performance, maintain backups, interface with email service providers for deliverability, provide application support and other technical services, and more. You can focus on what you do best.

* __High performing__: Cerb is already designed to be fast and efficient. Cerb Cloud further accelerates performance by optimizing the underlying infrastructure and taking advantage of distributed services in the cloud. The database is continuously tuned for your workload. Resource requests (images, scripts, stylesheets, and fonts) are served instantly from a memory cache. Frequently accessed application data is retrieved from a memory-based cache cluster to reduce database latency. Background jobs are managed by an automatic scheduler.

* __Scalable__: Your Cerb environment can scale seamlessly from a single worker who sends a couple of messages per day, to hundreds of concurrent workers with a history spanning millions of conversations. Resources can seamlessly "scale up" and "scale out". New resources are automatically provisioned and added to load balancers in response to traffic needs (web servers, cache servers, incoming and outgoing mail servers, etc).

* __Secure__: All traffic between you and your Cerb instance is encrypted with SSL. We support "Perfect Forward Secrecy", which is a strategy that protects your past encrypted transmissions even if they are intercepted and recorded (even we can't decrypt them once your session ends). Our resources operate in a "private cloud" with private networks for traffic between components, and firewall rules in front of public components that expose a minimally necessary attack surface. Our own access to those resources requires RSA keys and two-factor authentication.

* __Highly available__: Failed components are automatically replaced, and redundant capacity allows your service to continue uninterrupted. The Enterprise tier provides a database cluster with near-instant automated failover, and the other tiers recover from database failures automatically within minutes.

* __Durable__: We archive a sequence of full daily database backups, as well as the incremental point-in-time changes in between. Long term object storage (like attachments) are redundantly stored in several geographically separate locations. We can also arrange for backups to be routinely transfered to you.

{% include tables/cloud_feature_comparison.html %}

<table class="cerb-pricing-matrix">
	<thead>
		<tr>
			<th></th>
			<th>Startup</th>
			<th>Pro</th>
			<th>Enterprise</th>
		</tr>
	</thead>
	
	<tbody class="matrix">
		<tr>
			<td>Monthly base price:</td>
			<td>$20/seat</td>
			<td>$40/seat</td>
			<td>$60/seat</td>
		</tr>
		
		<tr>
			<td>Minimum seats [<a href="#seats">?</a>]:</td>
			<td><span class="no"></span></td>
			<td><span class="no"></span></td>
			<td>10</td>
		</tr>

		<tr>
			<td>Volume discounts [<a href="#volume-discount">?</a>]:</td>
			<td><span class="no"></span></td>
			<td><span class="yes"></span></td>
			<td><span class="yes"></span></td>
		</tr>
		
	</tbody>

	<tbody class="section">
		<tr>
			<td colspan="4">Infrastructure</td>
		</tr>
	</tbody>

	<tbody class="matrix">
		<tr>
			<td>High availability:</td>
			<td><span class="yes"></span></td>
			<td><span class="yes"></span></td>
			<td><span class="yes"></span></td>
		</tr>
	
		<tr>
			<td>Automated scaling:</td>
			<td><span class="yes"></span></td>
			<td><span class="yes"></span></td>
			<td><span class="yes"></span></td>
		</tr>

		<tr>
			<td>Automated backups:</td>
			<td><span class="yes"></span></td>
			<td><span class="yes"></span></td>
			<td><span class="yes"></span></td>
		</tr>
		
		<tr>
			<td>SSL encryption:</td>
			<td><span class="yes"></span></td>
			<td><span class="yes"></span></td>
			<td><span class="yes"></span></td>
		</tr>
		
		<tr>
			<td>Custom URL w/ SSL [<a href="#custom-urls">?</a>]:</td>
			<td><span class="no"></span></td>
			<td><span class="yes"></span></td>
			<td><span class="yes"></span></td>
		</tr>
	</tbody>
	
	<tbody class="section">
		<tr>
			<td colspan="4">Database</td>
		</tr>
	</tbody>

	<tbody class="matrix">
		<tr>
			<td>Read Replicas:</td>
			<td><span class="no"></span></td>
			<td><span class="no"></span></td>
			<td><span class="yes"></span></td>
		</tr>

		<tr>
			<td>Instant Cluster Failover:</td>
			<td><span class="no"></span></td>
			<td><span class="no"></span></td>
			<td><span class="yes"></span></td>
		</tr>
	</tbody>
	
	<tbody class="section">
		<tr>
			<td colspan="4">Incoming Mail</td>
		</tr>
	</tbody>

	<tbody class="matrix">
		<tr>
			<td>Instant Delivery Mailbox [<a href="#redirect-mailbox">?</a>]:</td>
			<td><span class="yes"></span></td>
			<td><span class="yes"></span></td>
			<td><span class="yes"></span></td>
		</tr>

		<tr>
			<td>Remote Mailboxes [<a href="#mailbox-checks">?</a>]:</td>
			<td>1 check every 5 mins</td>
			<td>5 checks every 1 min</td>
			<td>10 checks every 1 min</td>
		</tr>

	</tbody>

	<tbody class="section">
		<tr>
			<td colspan="4">Outgoing Mail</td>
		</tr>
	</tbody>
	
	<tbody class="matrix">
		<tr>
			<td>Cerb Cloud SMTP w/ SPF [<a href="#spf">?</a>]:</td>
			<td><span class="yes"></span></td>
			<td><span class="yes"></span></td>
			<td><span class="yes"></span></td>
		</tr>	
		
		<tr>
			<td>DKIM domain signatures [<a href="#dkim">?</a>]:</td>
			<td>1</td>
			<td>10</td>
			<td>25</td>
		</tr>

		<tr>
			<td>Remote SMTP:</td>
			<td><span class="yes"></span></td>
			<td><span class="yes"></span></td>
			<td><span class="yes"></span></td>
		</tr>	

	</tbody>

	<tbody class="section">
		<tr>
			<td colspan="4">Community Portal Hosting</td>
		</tr>
	</tbody>

	<tbody class="matrix">
		<tr>
			<td>Included portals [<a href="#portals">?</a>]:</td>
			<td>1</td>
			<td>5</td>
			<td>10</td>
		</tr>

		<tr>
			<td>Custom URL:</td>
			<td><span class="yes"></span></td>
			<td><span class="yes"></span></td>
			<td><span class="yes"></span></td>
		</tr>

		<tr>
			<td>SSL certificate:</td>
			<td><span class="yes"></span></td>
			<td><span class="yes"></span></td>
			<td><span class="yes"></span></td>
		</tr>

	</tbody>

	<tbody class="section">
		<tr>
			<td colspan="4">Integration</td>
		</tr>
	</tbody>

	<tbody class="matrix">
		<tr>
			<td>Bots:</td>
			<td><span class="yes"></span></td>
			<td><span class="yes"></span></td>
			<td><span class="yes"></span></td>
		</tr>	

		<tr>
			<td>Plugin Library:</td>
			<td><span class="yes"></span></td>
			<td><span class="yes"></span></td>
			<td><span class="yes"></span></td>
		</tr>	
	
		<tr>
			<td>Webhooks:</td>
			<td><span class="no"></span></td>
			<td><span class="yes"></span></td>
			<td><span class="yes"></span></td>
		</tr>
	
		<tr>
			<td>API:</td>
			<td><span class="no"></span></td>
			<td><span class="yes"></span></td>
			<td><span class="yes"></span></td>
		</tr>
	
		<!--
		<tr>
			<td>Elasticsearch [<a href="#elasticsearch">?</a>]:</td>
			<td><span class="no"></span></td>
			<td><span class="no"></span></td>
			<td><span class="yes"></span></td>
		</tr>
		-->
		
		<tr>
			<td>Third-party plugins [<a href="#custom-plugins">?</a>]:</td>
			<td><span class="no"></span></td>
			<td><span class="no"></span></td>
			<td><span class="yes"></span></td>
		</tr>
	</tbody>
	
	<tbody class="section">
		<tr>
			<td colspan="4">Support/SLA</td>
		</tr>
	</tbody>
	
	<tbody class="matrix">
		<tr>
			<td>Weekdays:</td>
			<td>next day</td>
			<td>same day</td>
			<td>same day</td>
		</tr>
	
		<tr>
			<td>Weekends:</td>
			<td><span class="no"></span></td>
			<td>next day</td>
			<td>same day</td>
		</tr>
	
		<tr>
			<td>Holidays:</td>
			<td><span class="no"></span></td>
			<td>next day</td>
			<td>same day</td>
		</tr>
	
		<tr>
			<td>Phone support:</td>
			<td><span class="no"></span></td>
			<td><span class="no"></span></td>
			<td><span class="yes"></span></td>
		</tr>

		<tr>
			<td>Developer live chat:</td>
			<td><span class="no"></span></td>
			<td><span class="no"></span></td>
			<td><span class="yes"></span></td>
		</tr>
	
		<tr>
			<td>Technical service discounts [<a href="#technical-services">?</a>]:</td>
			<td><span class="no"></span></td>
			<td><span class="no"></span></td>
			<td><span class="yes"></span></td>
		</tr>
	</tbody>
	
</table>

<br/>

# Frequently asked questions:

<br/>

## Do you offer a free trial of Cerb Cloud?

Yes! You can <a href="/cloud/try#pro">sign up here</a> for a 30-day free trial. There's no obligation and we don't need any payment information on file.

<div id="seats"></div>

## What are seats?

Seats determine the maximum number of workers who can use Cerb at the same time.

For example, a team of 30 workers who are evenly split into three, non-overlapping 8-hour shifts (morning, day, night) would only require 10 seats. That's the highest number of workers who would ever be logged in at the same time.

You aren't paying per worker account, so there isn't a penalty for inviting everyone to participate: full-time staff, part-time contributors, busy executives, interns, temps, contractors, partners, and volunteers.

<div id="custom-urls"></div>

## Can I use my own URL, rather than *.cerb.me?

Yes, with a _Pro_ or _Enterprise_ subscription.

We'll always use an `*.cerb.me` domain to identify your Cerb Cloud instance internally, but you can use a DNS _CNAME_ record to access your site with a custom domain like `support.example.com`. You can also use a custom domain for each community portal you deploy.

Keep in mind that you'll need to provide an SSL certificate for each custom domain you use. We provide wildcard SSL certificates for `*.cerb.me` and the generic portal domains like `*.official.support` and `*.user.community`.

<div id="custom-plugins"></div>

## Can I install custom plugins in Cerb Cloud?

Every Cerb Cloud instance can use any of the plugins in the official Plugin Library. These plugins have been developed or audited by our development team and they are guaranteed to be safe.

_Enterprise_ subscriptions have the ability to install custom third-party plugins, but these must be reviewed and approved by our development team prior to use. You'll be asked to create a [GitHub](https://github.com/) repository for the plugin if you haven't already. If the repository is private, then you will need to grant access to the `cerb` account.

<div id="annual-discount"></div>

## Is there a discount for paying annually?

Yes! We offer a 10% discount for subscriptions that are billed annually rather than monthly.

This reflects the fact that we can better forecast our costs and lock in longer term discounted rates (longer leases, reservations, bulk purchasing). We pass along the cost reduction.

Contact us to switch your subscription to annual billing and we'll add the discount automatically.

<div id="academic"></div>

## Do you provide academic discounts?

Yes! We offer a 20% discount to qualified academic institutions. Please contact us for details.

<div id="nonprofit"></div>

## Do you offer a discount to charities and non-profits?

Yes! Please contact us for details.

<div id="volume-discount"></div>

## Do you provide a volume discount for Cerb Cloud subscriptions?

Yes! Volume discounts are available for _Pro_ and _Enterprise_ subscriptions with __more than 25 seats__.

<div class="grid">
<div class="unit half" align="center">
{% include tables/volume_discount_cloud.html caption="Pro Volume Pricing" base_cost=40.00 %}
</div>
<div class="unit half" align="center">
{% include tables/volume_discount_cloud.html caption="Enterprise Volume Pricing" base_cost=60.00 %}
</div>
</div>

If you have multiple Cerb Cloud subscriptions on your account, the sum of all seats of the same subscription type determines your volume discount. This is particularly beneficial for large companies with many subsidiaries using independent instances of Cerb, and outsourced support companies who use distinct Cerb environments for each client to provide their services.

<div id="smtp"></div>

## Do I need my own email server to use Cerb Cloud?

No, we provide a cloud-based SMTP service for outgoing mail with SPF and DKIM support.  We also provide a redirect mailbox for delivering incoming mail.

You can easily configure Cerb to use remote mail services if desired.

<div id="spf"></div>

## What does SPF mean with respect to outgoing mail?

Sender Policy Framework[^spf] (**SPF**) defines the format of a simple text record that you add to the DNS[^dns] for each domain you send email from. This record lists a series of network addresses that are permitted to send email on your behalf.  For instance, if you specify that only your organization's own SMTP server is permitted to send email for your domain, then other mail servers will be far more suspicious of messages that purport to be from you but originate elsewhere. This helps combat _spoofing_[^spoofing], where malicious senders attempt to trick recipients into believing a message was sent by you.

<div id="dkim"></div>

## What are DKIM signatures?

DomainKeys Identified Mail[^dkim] (**DKIM**) attempts to detect spoofing and tampering by cryptographically signing an email message using a secret key (which should only be known by authorized senders). Any mail server can verify this digital signature by retrieving the corresponding public key from the DNS for a given sender domain. When a DKIM signature is successfully validated, a mail server can be confident that a message originated from a source that was authorized by the owner of the sender's domain name. This confidence score is generally highest when the domain of the DKIM signature matches that of the envelope sender and the `From:` header.

## What is the cost of additional DKIM sender domains?

Your subscription provides a certain number of DKIM domain signatures.  Additional sender domains are $1/month each.

This only applies when you use Cerb Cloud SMTP for outgoing mail.  If you're using another email provider, their own rate structure will apply.

<div id="mailbox-checks"></div>

## What are remote mailbox checks?

Cerb Cloud can download new mail from POP3 or IMAP mailboxes at any mail provider who provides external access.

There is no limit to the number of remote mailboxes you can configure, but your subscription level determines how many mailboxes we'll check for new mail at a time, and how often.  Each time the scheduler runs, we'll start with the least recently checked mailbox.

Checking many mailboxes can be very inefficient.  Mail delivery is never instantaneous and mailboxes may have to wait in a queue before being checked.  Some mail servers are also slow to send responses, which can add 20+ seconds to each mailbox check.

You can redirect mail for multiple accounts into a single "dropbox" account to make remote mailbox checks more efficient.  This is also how the redirect mailbox works in our instant delivery service, which we highly recommend using instead of remote mailbox checks.

## What is the cost of additional mailbox checks?

Your subscription provides a certain number of mailbox checks at a specific interval (e.g. 5 checks every 1 minute). Additional mailbox checks at the same interval are $2/month each.

<div id="redirect-mailbox"></div>

## What is a redirect mailbox?

In most Cerb environments, a list of POP3/IMAP remote mailboxes is checked for new messages every few minutes. This works well enough for a couple mailboxes, but it can be very inefficient at scale.

Rather than checking mailboxes for new mail, a Redirect Mailbox allows you to redirect a copy of your incoming email to a special address (like `incoming@example.cerb.email`) that delivers directly into your Cerb Cloud instance. This is the fastest way to receive new email in Cerb Cloud.

Cerb Cloud doesn't require you to modify your own MX records. For instance, you can still deliver your company email to Google Apps like usual, while redirecting mail for certain accounts to Cerb Cloud.

<div id="instant-delivery"></div>

## How fast is incoming mail delivered into Cerb?

When mail is received by your redirect mailbox it will be delivered into Cerb instantly (within seconds).  This enables you to respond more quickly to your customers.

If you choose to use remote mailboxes instead, new mail will generally be downloaded every few minutes.

<div id="portals"></div>

## What is the cost of additional community portals?

Your subscription provides a certain number of community portals. These include SSL certificates.

Additional community portals are $10/month each.

<div id="elasticsearch"></div>

## What is Elasticsearch?

By default, full-text searching in Cerb is handled by MySQL Fulltext[^mysql-fulltext]. This provides a working solution _"out of the box"_, but it is neither full-featured nor efficient.  It works best when matching a few distinct terms against thousands of documents.

In contrast, Elasticsearch[^elasticsearch] is a distributed, scalable, high-performance search engine with powerful full-text search features. It can search against millions of documents in milliseconds using terms, compound queries, phrases, etc.

<div id="technical-services"></div>

## What are technical services?

Technical services include:

* Custom development of features and plugins
* Data recovery due to user error
* Importing data from other apps and services
* Web-based team training sessions

Our standard rate for technical services is **$120/hour**, billed in 15 minute increments.

Enterprise subscriptions receive a discounted rate of **$100/hour** on technical services, billed in 15 minute increments.

<div id="urgent-escalations"></div>

## What are urgent escalations?

An __urgent escalation__ will move one incident of your choice to the front of our priority support queue and summon a highly experienced member of our development team at any time (early hours, overnight, weekends, holidays).

You will receive a response within one hour. Urgent escalations include one hour of hands-on assistance at no extra cost. If you approve any additional required time, the standard hourly rate for technical services will apply.

Urgent escalations are not required for Cerb Cloud infrastructure issues, as that is covered by standard support for all subscriptions. Instead, they may be used when workflow is severely impacted by other issues like accidental deletion of data, configuration issues, problems with external mail providers, etc. For standalone licenses, an urgent escalation may be used to call in help for issues like server failures, database corruption, scaling, etc.

<div id="enterprise-seats"></div>

## Why does the Enterprise subscription require at least 10 seats?

That's the point where it becomes cost effective for us to provide the extra services.

The _Enterprise_ subscriptions can scale up to a pool of resources that are entirely dedicated to a single instance of Cerb. The database cluster for instant failover requires at least twice the resources of a _Startup_ or _Pro_ subscription (and more if there are extra read replicas for scaling).

Similarly, the additional _Enterprise_ support commitments require highly experienced developers on call around the clock.

Consider these two extremes: 1 client with 50 seats, and 50 clients with 1 seat each. Both clients result in roughly the same amount of revenue for 50 seats (the single client qualifies for a volume discount), but the 50 clients variation potentially requires 50 times the amount of resources like storage and support (negatively affecting the quality and responsiveness of our services).  The enterprise option is predicated on having our full attention at all times.

# References

[^mysql-fulltext]: <http://dev.mysql.com/doc/refman/5.7/en/fulltext-search.html>

[^elasticsearch]: <https://www.elastic.co/products/elasticsearch>

[^spf]: <https://en.wikipedia.org/wiki/Sender_Policy_Framework>

[^dkim]: <https://en.wikipedia.org/wiki/DomainKeys_Identified_Mail>

[^dns]: <https://en.wikipedia.org/wiki/Domain_Name_System>

[^spoofing]: <https://en.wikipedia.org/wiki/Email_spoofing>

