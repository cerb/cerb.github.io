---
title: Pricing
excerpt: Deploy Cerb in the cloud or host it yourself. Start a free trial.
summary: This page provides detailed information about the pricing and features of
  Cerb subscriptions. It outlines the cost per seat for both yearly and monthly
  billing, and describes the comprehensive services included in Cerb Cloud, such as
  high availability, scalability, security, and performance optimization. The page
  also explains the support options available, including standard and enterprise support,
  and highlights the benefits of using Cerb Cloud, such as automated backups, 24/7
  monitoring, and integrated email services. Additionally, it addresses frequently
  asked questions about trial requirements, discounts for academic institutions and
  non-profits, and the ability to use custom domains and email servers. The page emphasizes
  the ease of transitioning from a Cerb Cloud trial to a self-hosted license.
layout: page
permalink: /pricing/
redirect_from:
- /buy/
- /cloud/
- /demo/
- /download/
- /pricing/cloud/
- /pricing/self-hosted/
- /pricing/site/
- /trial/
- /try/
jumbotron:
  title: Pricing
  tagline: Deploy Cerb self-hosted or in the cloud.
keywords: pricing price cost subscription
---

<b>Seats</b> determine the maximum number of distinct workers who can use Cerb at the same time. Non-overlapping shifts can share seats. There is no cost for retaining the full history of inactive or former workers.

{% include tables/pricing.html %}

{% comment %}
<a href="/signup/" class="cerb-button">Start a free evaluation</a>
{% endcomment %}

{% comment %}
<button type="button" class="cerb-button" data-cerb-bot-interaction="cloud" data-cerb-bot-param-mode="signup">Start a free evaluation</button>
{% endcomment %}

{% comment %}
<button type="button" class="cerb-button" data-cerb-bot-interaction="cloud">Manage your subscription</button>
{% endcomment %}

<div class="grid">
	<div class="whole" style="text-align:center">
		<p>
			<h1 style="font-weight:bold;">Self-host or deploy in Cerb Cloud</h1>
			<a href="/signup/" class="cerb-button">
				Sign up to try Cerb for free
				<br>
				<small style="font-size:0.8em;">(no payment info required)</small>
			</a>
		</p>
	</div>
</div>

<div style="font-size:125%;">
	<b>Add <u>optional</u> enterprise technical support from Cerb's highly experienced developers with no long-term commitments:</b>
</div>

<div class="grid" style="margin-left:15px;">
	<div class="unit half">
			<div style="text-align:left;">
				<h2 style="color:rgb(100,100,100);"><b>Standard Support</b></h2>
				<b>Included with any license:</b>
				<ul>
					<li>
						Support:
						<ul>
							<li>By email</li>
							<li>Same business day responses</li>
							<li>Concept-level guidance</li>
              <li>Covers the latest major version (11.x)</li>
						</ul>
					</li>
					<li>
							Cerb Cloud:
							<ul>
								<li>Mandatory scheduled upgrades to the latest stable version with one week of prior notice</li>
							</ul>
					</li>
				</ul>
			</div>
	</div>
	
	<div class="unit half">
			<div style="text-align:left;">
				<h2 style="color:rgb(165,73,3);"><b>Enterprise Support</b></h2>
				<b>Greater of +$500/month or +$20/month per seat:</b>
				<ul>
					<li>
						Top-priority support, training, and consultation:
						<ul>
							<li>By email or Slack (voice and screen sharing)</li>
              <li>Up to three users in our Slack with a private support channel</li>
							<li>Same business day responses</li>
							<li>Emergency support within 1 hour (including nights, weekends, and holidays)</li>
							<li>Hands-on guidance and review of your specific implementation</li>
							<li>Developer support for automations, API, integration, and plugin development</li>
              <li>Covers the last two major versions (10.x and 11.x)</li>
						</ul>
					</li>
					<li>
						Cerb Cloud:
						<ul>
							<li>Schedule major software updates at your convenience</li>
							<li>Access to early release versions</li>
							<li>Access to a staging environment to test new features prior to upgrading</li>
							<li>Install custom plugins</li>
						</ul>
					</li>
				</ul>
			</div>
	</div>
</div>

<br/>

{% include testimonials.html %}

<br/>

<h1 id="faq" style="font-size:2.5em;margin-bottom:20px;">FAQ</h1>

# General

<div id="seats"></div>

## What are seats?

Seats determine the maximum number of workers who can use Cerb at the same time.

For example, a team of 30 workers who are evenly split into three, non-overlapping shifts (morning, day, night) would only require 10 seats. That's the highest number of workers who would ever be logged in at the same time.

You aren't paying per worker account, so there isn't a penalty for inviting everyone to participate: full-time staff, part-time contributors, busy executives, interns, temps, contractors, partners, and volunteers.

<div id="academic"></div>

## Do you provide academic discounts?

Yes. We offer a 50% discount in support of academic institutions.

To qualify for an academic discount, institutions must be accredited by an agency recognized by the U.S. Department of Education (or their own national equivalent).  All publicly funded K-12 and preschools automatically qualify.

<div id="non-profit"></div>

## Do you offer a discount to charities and non-profits?

Yes! To receive a free Cerb license with more than one seat, a charity or non-profit must have a charter that seeks to improve the public good and be registered as a 501(c)(3) organization (or their own national equivalent).  The organization should be primarily funded through public donations or grants, and such contributions should be tax-deductible by the donors.

<div id="opensource"></div>

## What qualifies an open source project for a free license donation?

To receive a free Cerb license with more than one seat, an open source project must have:

* A website explaining the purpose of the project
* 100% source code available in a public repository like GitHub
* A self-hosted option with an open source or fair-code license

An open source license must only be used for that purpose, and must not be mixed with other commercial activity.

# Cerb Cloud

## What is Cerb Cloud?

__Cerb Cloud__ is a subscription-based service that provides a finely tuned, ready-to-use instance of Cerb in an ideal environment. All you need is a web browser and your team can start putting Cerb's tools to work. We'll handle everything else.

* __Fully managed__: We install Cerb and its dependencies in an ideal environment, apply updates and security patches, monitor and scale the infrastructure, optimize performance, maintain backups, interface with email service providers for deliverability, provide application support and other technical services, and everything else. You can focus on what you do best.

* __Highly available__: Failed components are automatically replaced and redundant capacity allows your service to continue uninterrupted. The Enterprise tier provides a database cluster with near-instant automated failover, and the other tiers recover from database failures automatically within minutes.

* __Scalable__: Your Cerb environment can scale seamlessly from a single worker who sends a couple of messages per day, to hundreds of concurrent workers with a history spanning millions of conversations. Resources can seamlessly "scale up" and "scale out". New resources are automatically provisioned and added to load balancers in response to traffic needs (web servers, cache servers, incoming and outgoing mail servers, etc).

* __High performing__: Cerb is already designed to be fast and efficient. Cerb Cloud further accelerates performance by optimizing the underlying infrastructure and taking advantage of distributed services in the cloud. The database is continuously tuned for your workload. Resource requests (images, scripts, stylesheets, and fonts) are served instantly from a memory cache. Frequently accessed application data is retrieved from a memory-based cache cluster to reduce database latency. Background jobs are managed by an automated scheduler.

* __Secure__: All traffic between you and your Cerb instance is encrypted with SSL. We support "Perfect Forward Secrecy", which is a strategy that protects your past encrypted transmissions even if they are intercepted and recorded (even we can't decrypt them once your session ends). Our resources operate in a "private cloud" with private networks for traffic between components, and firewall rules in front of public components that expose a minimally necessary attack surface. Our own access to those resources requires RSA keys and two-factor authentication.

* __Durable__: We archive a sequence of full daily database backups, as well as the incremental point-in-time changes in between. Long term object storage (like attachments) are redundantly stored in several geographically separate locations. We can also arrange for backups to be routinely transfered to you.

## Do you require a credit card to start a free trial of Cerb Cloud?

No! All we require is a valid email address to contact you. You will <b>never</b> receive an invoice until you request one.

## How many workers can I invite to a Cerb Cloud trial?

By default, your trial allows unlimited worker accounts with __3__ seats. [Contact us](/help/) if you need to test with more seats, and we can raise the limit.

## Do I need my own email server to use Cerb Cloud?

No, we provide a high-volume SMTP service for outgoing mail with SPF and DKIM support.  We also provide a redirect mailbox for instantly delivering incoming mail.

You can easily configure Cerb to use remote mail services if desired.

With Cerb Cloud, we provide you with a subdomain worth of temporary email addresses, like __*@example.cerb.email__. You can send and receive email from any of these addresses (e.g. billing@, support@, sales@), which makes it much easier to practice routing work to the appropriate groups/buckets in Cerb.

We also configure SPF, DKIM, and DMARC records for these temporary email addresses so you can [test our mail deliverability](/docs/guide/admins/quick-start/#send-a-message-to-test-mail-deliverability).

If you switch to a Cerb Cloud subscription, you can even use these email addresses in production, but you'll probably want to use your own domains.  We'll help you configure the SPF, DKIM, and DMARC records on your domains to optimize your mail deliverability from Cerb as well.

<div id="instant-delivery"></div>

## How fast is incoming mail delivered into Cerb Cloud?

When mail is received by your redirect mailbox it will be delivered into Cerb instantly (within seconds).  This enables you to respond more quickly to your customers.

If you choose to use remote mailboxes instead, new mail will generally be downloaded every few minutes.

<div id="custom-urls"></div>

## Can I use my own URL in Cerb Cloud, rather than *.cerb.me?

Yes! We'll always use an `*.cerb.me` domain to identify your Cerb Cloud instance internally, but you can use a DNS _CNAME_ record to access your site with a custom domain like `support.example.com`. You can also use a custom domain for each community portal you deploy.

Keep in mind that you'll need to provide an SSL certificate for each custom domain you use. We provide wildcard SSL certificates for `*.cerb.me` and the generic portal domains like `*.official.support` and `*.user.community`.

## What if I plan to eventually switch from Cerb Cloud to self-hosted?

We still recommend that you start with a Cerb Cloud trial, so your team can immediately get to work learning about Cerb rather than getting bogged down with installation requirements and troubleshooting.

This also allows us to provide the highest level of assistance during your evaluation. We provide temporary email accounts so you can easily test incoming and outgoing messages, we've already installed the prerequisites for every plugin, etc.

All of your Cerb Cloud configuration and data can be exported to a self-hosted instance of Cerb at any time. Once you're confident that Cerb is a good fit for your team, we're happy to help you with that migration.

If you still need to evaluate Cerb in your own environment, you can simply [grab a copy of the project from GitHub](https://github.com/cerb/cerb-release) and follow the [installation instructions](/docs/installation/).

<div id="smtp"></div>

{% comment %}

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

<div id="redirect-mailbox"></div>

## What is a redirect mailbox?

In most Cerb environments, a list of POP3/IMAP remote mailboxes is checked for new messages every few minutes. This works well enough for a couple mailboxes, but it can be very inefficient at scale.

Rather than checking mailboxes for new mail, a Redirect Mailbox allows you to redirect a copy of your incoming email to a special address (like `incoming@example.cerb.email`) that delivers directly into your Cerb Cloud instance. This is the fastest way to receive new email in Cerb Cloud.

Cerb Cloud doesn't require you to modify your own MX records. For instance, you can still deliver your company email to Google Apps like usual, while redirecting mail for certain accounts to Cerb Cloud.

{% endcomment %}

<div id="faq-self-hosted"></div>

# Self-hosted

## How do I install Cerb on my own hardware?

Read the <a href="/docs/installation/">installation instructions</a> to get started.

<div id="renewal"></div>

## Do you provide a renewal discount for existing licenses?

No, but we do offer 2 free months per year when you switch to annual billing.

<div id="academic"></div>

## Can I switch from self-hosted to a Cerb Cloud subscription?

Yes! Your self-hosted Cerb configuration and data can be migrated to a Cerb Cloud subscription at any time.