---
layout: page
title: "Cerb Cloud"
permalink: /cloud/
redirect_from:
  - /cloud/try/
jumbotron:
  title: Cerb Cloud
  tagline: Deploy a fully-managed Cerb environment in the Cloud
---

{% include forms/signup.html deploy="cloud" %}

__Cerb Cloud__ is a subscription-based service that provides a finely tuned, ready-to-use instance of Cerb in an ideal environment. All you need is a web browser and your team can start putting Cerb's tools to work. We'll handle everything else.

{% include tables/cloud_feature_comparison.html %}

* __Fully managed__: We install Cerb and its dependencies in an ideal environment, apply updates and security patches, monitor and scale the infrastructure, optimize performance, maintain backups, interface with email service providers for deliverability, provide application support and other technical services, and everything else. You can focus on what you do best.

* __Highly available__: Failed components are automatically replaced and redundant capacity allows your service to continue uninterrupted. The Enterprise tier provides a database cluster with near-instant automated failover, and the other tiers recover from database failures automatically within minutes.

* __Scalable__: Your Cerb environment can scale seamlessly from a single worker who sends a couple of messages per day, to hundreds of concurrent workers with a history spanning millions of conversations. Resources can seamlessly "scale up" and "scale out". New resources are automatically provisioned and added to load balancers in response to traffic needs (web servers, cache servers, incoming and outgoing mail servers, etc).

* __High performing__: Cerb is already designed to be fast and efficient. Cerb Cloud further accelerates performance by optimizing the underlying infrastructure and taking advantage of distributed services in the cloud. The database is continuously tuned for your workload. Resource requests (images, scripts, stylesheets, and fonts) are served instantly from a memory cache. Frequently accessed application data is retrieved from a memory-based cache cluster to reduce database latency. Background jobs are managed by an automated scheduler.

* __Secure__: All traffic between you and your Cerb instance is encrypted with SSL. We support "Perfect Forward Secrecy", which is a strategy that protects your past encrypted transmissions even if they are intercepted and recorded (even we can't decrypt them once your session ends). Our resources operate in a "private cloud" with private networks for traffic between components, and firewall rules in front of public components that expose a minimally necessary attack surface. Our own access to those resources requires RSA keys and two-factor authentication.

* __Durable__: We archive a sequence of full daily database backups, as well as the incremental point-in-time changes in between. Long term object storage (like attachments) are redundantly stored in several geographically separate locations. We can also arrange for backups to be routinely transfered to you.

<br/>

# Frequently asked questions:

<div id="seats"></div>

## What are seats?

Seats determine the maximum number of workers who can use Cerb at the same time.

For example, a team of 30 workers who are evenly split into three, non-overlapping 8-hour shifts (morning, day, night) would only require 10 seats. That's the highest number of workers who would ever be logged in at the same time.

You aren't paying per worker account, so there isn't a penalty for inviting everyone to participate: full-time staff, part-time contributors, busy executives, interns, temps, contractors, partners, and volunteers.

<div id="custom-urls"></div>

## Can I use my own URL, rather than *.cerb.me?

Yes! We'll always use an `*.cerb.me` domain to identify your Cerb Cloud instance internally, but you can use a DNS _CNAME_ record to access your site with a custom domain like `support.example.com`. You can also use a custom domain for each community portal you deploy.

Keep in mind that you'll need to provide an SSL certificate for each custom domain you use. We provide wildcard SSL certificates for `*.cerb.me` and the generic portal domains like `*.official.support` and `*.user.community`.

## How many workers can I invite to a Cerb Cloud trial?

All Cerb Cloud trials start in the _Pro_ tier. This provides unlimited worker accounts with __three__ seats (concurrent workers). [Contact us](/contact/) if you need to test with more seats and we can raise the limit.

## Do you require a credit card to start a free trial?

No! All we require is a valid email address to contact you. You will never receive an invoice until you request one.

## What if I plan to eventually host Cerb myself?

We still recommend that you start with a Cerb Cloud trial, so your team can immediately get to work learning about Cerb rather than getting bogged down with installation requirements and troubleshooting.

This also allows us to provide the highest level of assistance during your evaluation. We provide temporary email accounts so you can easily test incoming and outgoing messages, we've already installed the prerequisites for every plugin, etc.

All of your Cerb Cloud configuration and data can be exported to a standalone instance of Cerb at any time. Once you're confident that Cerb is a good fit for your team, we're happy to help you with that migration.

If you still need to evaluate Cerb in your own environment, you can simply [grab a copy of the project from GitHub](https://github.com/wgm/cerb) and follow the [installation instructions](/docs/installation).

## Will a Cerb Cloud trial require me to change how I currently handle email?

Nope! A Cerb evaluation won't impact the way you're currently handling incoming or outgoing email (unless you want it to).

With Cerb Cloud, we provide you with a subdomain worth of temporary email addresses, like __*@example.cerb.email__. You can send and receive email from any of these addresses (e.g. billing@, support@, sales@), which makes it much practice routing work to the appropriate groups/buckets in Cerb.

We also configure SPF, DKIM, and DMARC records for these temporary email addresses so you can [test our mail deliverability](http://cerb.io/docs/quick-start/#send-a-message-to-test-mail-deliverability).

If you switch to a Cerb Cloud subscription, you can even use these email addresses in production, but you'll probably want to use your own domains.  We'll help you configure the SPF, DKIM, and DMARC records on your domains to optimize your mail deliverability from Cerb as well.

<div id="custom-plugins"></div>

## Can I install custom plugins in Cerb Cloud?

Every Cerb Cloud instance can use any of the [plugins](/docs/plugins/) in the official [Plugin Library](/docs/plugins/#library). These plugins have been developed or audited by our development team and they are guaranteed to be safe.

_Enterprise_ subscriptions have the ability to install custom third-party plugins. These plugins must be reviewed and approved by our development team prior to use. You'll be asked to create a [GitHub](https://github.com/) repository for the plugin if you haven't already. If the repository is private, then you will need to grant access to the `cerb` account.

<div id="annual-discount"></div>

## Is there a discount for paying annually?

Yes! We offer a 10% discount for subscriptions that are billed annually rather than monthly.

This reflects the fact that we can better forecast our costs and lock in longer term discounted rates (longer leases, reservations, bulk purchasing). We pass along the cost reduction.

[Contact us](/contact/) to switch your subscription to annual billing and we'll add the discount automatically.

<div id="academic"></div>

## Do you provide academic discounts?

Yes! We offer a 20% discount to qualified academic institutions. Please [contact us](/contact/) for details.

<div id="nonprofit"></div>

## Do you offer a discount to charities and non-profits?

Yes! Please [contact us](/contact/) for details.

<div id="volume-discount"></div>

## Do you provide a volume discount for Cerb Cloud subscriptions?

Yes! Volume discounts are available for subscriptions with __more than 25 seats__.

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

{% endcomment %}

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

<div id="instant-delivery"></div>

## How fast is incoming mail delivered into Cerb?

When mail is received by your redirect mailbox it will be delivered into Cerb instantly (within seconds).  This enables you to respond more quickly to your customers.

If you choose to use remote mailboxes instead, new mail will generally be downloaded every few minutes.

<div id="portals"></div>

{% comment %}
## What is the cost of additional community portals?

Your subscription provides a certain number of community portals. These include SSL certificates.

Additional community portals are $10/month each.

<div id="technical-services"></div>

## What are technical services?

Technical services include:

* Custom development of features and plugins
* Data recovery due to user error
* Importing data from other apps and services
* Web-based team training sessions

Our standard rate for technical services is **$100/hour**, billed in 15 minute increments.

{% endcomment %}

<div id="enterprise-seats"></div>

## Why does the Enterprise subscription require at least 10 seats?

That's the point where it becomes cost effective for us to provide the extra services.

The _Enterprise_ subscriptions can scale up to a pool of resources that are entirely dedicated to a single instance of Cerb. The database cluster for instant failover requires at least twice the resources of a _Pro_ subscription (and more if there are extra read replicas for scaling).

Similarly, the additional _Enterprise_ support commitments require highly experienced developers on call around the clock.

Consider these two extremes: 1 client with 50 seats, and 50 clients with 1 seat each. Both clients result in roughly the same amount of revenue for 50 seats (the single client qualifies for a volume discount), but the 50 clients variation potentially requires 50 times the amount of resources like storage and support (negatively affecting the quality and responsiveness of our services).  The enterprise option is predicated on having our full attention at all times.

{% comment %}
# References

[^mysql-fulltext]: <http://dev.mysql.com/doc/refman/5.7/en/fulltext-search.html>

[^spf]: <https://en.wikipedia.org/wiki/Sender_Policy_Framework>

[^dkim]: <https://en.wikipedia.org/wiki/DomainKeys_Identified_Mail>

[^dns]: <https://en.wikipedia.org/wiki/Domain_Name_System>

[^spoofing]: <https://en.wikipedia.org/wiki/Email_spoofing>

{% endcomment %}

