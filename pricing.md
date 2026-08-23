---
title: Pricing
excerpt: Deploy Cerb in the cloud or host it yourself. Try it free.
summary: "This page explains how Cerb is priced. Self-hosted Cerb is free to run, with unlimited workers and simultaneous logins and no registration or license key. A license uncaps concurrency slots, raises the AI agent turns each slot carries from two to six, allows queue lane configuration, and adds direct support by email, and is priced per seat at $40 per month, where a seat is counted as the number of different workers who signed in during a month, averaged across the year and reported by Cerb itself at Setup -- Configure -- Subscription rather than calculated by hand. Cerb Cloud is priced on both seats and concurrency slots at $40 each per month, with the first three slots included, and we provision and scale the infrastructure. Seats are never enforced, and data is fully portable between self-hosted and Cerb Cloud."
layout: page
permalink: /pricing/
redirect_from:
- /buy/
- /demo/
- /download/
- /pricing/cloud/
- /pricing/self-hosted/
- /pricing/site/
- /signup/
- /trial/
- /try/
jumbotron:
  title: Pricing
  tagline: Deploy Cerb in the cloud or host it yourself. Try it free.
keywords: pricing price cost subscription
---

<b>Self-hosted Cerb is free forever.</b> Unlimited workers, unlimited seats, no registration, and no license key. Every feature of the platform is included, running on three <a href="/docs/queues/#concurrency-slots">concurrency slots</a>.

A <b>license</b> uncaps those slots, raises the AI agent turns each one carries from two to six, lets you configure how they divide between batch work and agent turns, and adds direct support. It's priced per <b>seat</b>: the number of different workers who sign in during a month, averaged across the year. Idle accounts are never counted, and there is no cost for retaining the full history of inactive or former workers.

<b>Cerb Cloud</b> is priced on seats and slots together, with the first three slots included, and we provision and scale the infrastructure for you.

{% include tables/pricing.html %}

<br/>

{% include testimonials.html %}

<br/>

<h1 id="faq" style="font-size:2.5em;margin-bottom:20px;">Frequently asked questions</h1>

<div id="seats"></div>

## What are seats?

Seats are how a subscription is **priced**, on both self-hosted Cerb and Cerb Cloud. A seat isn't a worker account -- it's a person who actually signed in.

**Cerb reports your seat count for you**, on [Setup &raquo; Configure &raquo; Subscription](/docs/setup/configure/license/): the different workers who signed in during each month, averaged across the months it has on record, up to twelve. It isn't something you have to work out on your own.

Idle accounts are never counted, so there's no penalty for inviting everyone who might need to participate: full-time staff, part-time contributors, busy executives, interns, temps, contractors, partners, and volunteers. You pay for the people who used Cerb, in the months they used it, and there's no cost for keeping the full history of inactive or former workers.

Averaging across the year is what keeps this fair to teams whose size changes through it. A school, or an accounting firm through tax season, may run at triple its usual headcount for a few months and go nearly dormant after -- the average lands somewhere reasonable for both of us. One busy month can't dominate it, and a new installation averages over the months it has on record rather than a full twelve.

**Seats are never enforced.** It's an honor system: Cerb doesn't block logins, end sessions, or lock anyone out for going over a seat count. Running above your number is expected, and it will never interrupt anyone's work.

If the number doesn't look right to you, or your situation is an unusual one, tell us and we'll work it out with you.

<div id="free"></div>

## What do I get for free?

Everything, at a lower level of concurrency. The free tier is called **Community**, and it doesn't expire.

Self-hosted Cerb runs every feature of the platform with no license key and no registration, and with no limit on workers, seats, groups, buckets, tickets, automations, or portals. What a license changes is [how much work runs at once](/docs/queues/#concurrency-slots):

<div class="table-scroll" markdown="1">

|                             | Community                          | Licensed                        |
|-----------------------------|------------------------------------|---------------------------------|
| Workers and seats           | Unlimited                          | Unlimited                       |
| Concurrency slots           | 3                                  | Uncapped                        |
| Queue lane configuration    | --                                 | Yes                             |
| AI agent turns per slot     | 2                                  | 6                               |
| Max background jobs at once | 2                                  | 9 with 10 slots                 |
| Max AI agent turns at once  | 4                                  | 54 with 10 slots                |
| Support                     | Self-support and best-effort email | Direct email, same business day |

</div>

Every [lane](/docs/queues/#lanes) keeps at least one slot, so a 10-slot pool can put **nine** slots behind background jobs, or nine behind agent turns -- nine slots at six turns each is 54 running at once. Which way it leans is [yours to set](/docs/setup/configure/queues/), and you can change it without a restart.

<div class="cerb-box geek-out">
	<p>
		An agent turn isn't a fixed unit of time. It's one exchange with a language model, and how
		long it holds its slot depends on the model, how much reasoning it does, and how many tools
		it calls along the way &ndash; seconds for a short reply, several minutes for a long one. That's
		why turns are the number a busy installation feels first.
	</p>
</div>

Self-support means the [documentation](/docs/home/), the [guides](/guides/), the [video channel](https://www.youtube.com/@cerb_ai), and the [discussion forums](https://github.com/cerb/cerb-release/discussions/). We also answer email from Community installations as we're able -- there's no response time attached to it, but we'd rather help than leave you stuck.

**A team that runs Cerb for email, CRM, and project management -- with no support needs and little AI usage -- can use it free forever, at any size.** Three slots comfortably covers scheduled jobs and everyday batch work no matter how many people are logged in.

You'll meet the ceiling when bulk updates, large imports, exports, and search re-indexing start overlapping each other, or when you put AI agents in front of customers.

<div id="concurrency"></div>

## How is concurrency priced?

On self-hosted Cerb, it isn't. A license uncaps your slots entirely and you size the pool yourself on [Setup &raquo; Configure &raquo; Queues](/docs/setup/configure/queues/) -- a field in the interface, not a config file edit or a restart. You're paying for the servers, so how hard you drive them is your decision, not a billing question.

On Cerb Cloud we provision the compute, so slots are part of the price: $40 per slot per month, with the first three included.

<div id="cloud-pricing"></div>

## How is Cerb Cloud priced?

Two dimensions, $40 per month each:

* **Seats** -- the different workers who signed in during a month, averaged across the year.
* **Slots** -- your [concurrency](/docs/queues/#concurrency-slots) pool, with the **first three included** at no charge.

You only pay for the dimension you actually use. A large team doing email, CRM, and project management with little AI usage pays for seats and stays inside the included slots. A small team running customer-facing AI agents pays for slots more than seats. A large team doing both pays for both.

You can divide your slots between batch work and AI agent turns exactly as you would self-hosted. What Cloud doesn't offer is uncapping them -- we're provisioning the compute, so the pool is sized with you.

<div id="lapse"></div>

## What happens if my subscription lapses?

A subscription is **time-based**. Concurrency follows the subscription rather than the version you installed, so it ends when the term does, on whatever version you're running.

Nothing is locked, and none of your data is touched. Your installation reverts to **Community** -- the same free tier above, which doesn't expire. Workers and seats stay unlimited, every feature keeps working, and you return to three concurrency slots at two agent turns each. The same-business-day response ends; self-support and best-effort email don't.

Cerb shows you this rather than letting you find it the hard way -- [Setup &raquo; Configure &raquo; Queues](/docs/setup/configure/queues/) reports your current pool and how much of it you're using.

<div id="academic"></div>

## Do you provide academic discounts?

Yes. We offer a 50% discount in support of academic institutions.

To qualify for an academic discount, institutions must be accredited by an agency recognized by the U.S. Department of Education (or their own national equivalent).  All publicly funded K-12 and preschools automatically qualify.

<div id="non-profit"></div>

## Do you offer a discount to charities and non-profits?

Yes! To receive a free Cerb subscription, a charity or non-profit must have a charter that seeks to improve the public good and be registered as a 501(c)(3) organization (or their own national equivalent).  The organization should be primarily funded through public donations or grants, and such contributions should be tax-deductible by the donors.

<div id="opensource"></div>

## What qualifies an open source project for a free subscription?

To receive a free Cerb subscription, an open source project must have:

* A website explaining the purpose of the project
* 100% source code available in a public repository like GitHub
* A self-hosted option with an open source or fair-code license

An open source license must only be used for that purpose, and must not be mixed with other commercial activity.

<div id="self-hosted-or-cloud"></div>

## Should I self-host or use Cerb Cloud?

It's a question about operations, not price. The software is the same either way.

Cerb runs well on a single server, and a small deployment needs nothing more. As you grow it gets more out of dedicated infrastructure: a [distributed cache](/docs/setup/configure/cache/) on Redis, Valkey, or Memcached to [scale](/docs/scaling/) past one web server, and a [search index](/docs/records/types/search_index/) backed by Elasticsearch, Qdrant, Pinecone, or vector embeddings behind search and AI retrieval. Without them Cerb keeps working -- it just works harder.

**Self-host** if running that infrastructure is something your team already does. If you operate fifty other services, running one more costs you almost nothing, and you keep direct database access and full control of your environment.

**Use Cerb Cloud** if you'd rather not. We provision the compute and run the Redis cache, the containers, the MySQL replicas, point-in-time backups, upgrades, and failover, and we handle scaling and monitoring. Same software, without the operational surface.

## Can I migrate between self-hosted and Cerb Cloud?

Yes! You can migrate your data between self-hosted and Cerb Cloud at any time. They are 100% compatible and the subscriptions are interchangeable.