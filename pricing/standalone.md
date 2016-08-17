---
layout: page
title: "Cerb License"
permalink: /pricing/license
jumbotron:
  title: Standalone Cerb Licenses
  tagline: Deploy Cerb on your own hardware
---

A __standalone Cerb license__ runs on your own hardware. The software requires a web server with PHP 5.3+ and MySQL 5.1+. You are responsible for installation, upgrades, backups, monitoring, tuning, scaling, security, troubleshooting, etc.

* Community licenses permit you to use Cerb with some limitations **at no cost** and **without a time limit**.  For a small team, this may be all that is ever needed. For larger teams, this provides a risk-free evaluation to determine if Cerb is a good fit.

* Pro licenses include **one year** of priority support and ongoing software updates. Your license to use the software **never expires** for versions released during your software updates coverage, and there is no cost to continue using those versions indefinitely.

* The cost of a license is based on the number of permitted **seats** -- the maximum number of workers who can log in at the same time. An **unlimited** number of worker accounts can share the available seats. The most idle worker is logged out when a new worker attempts to log in. There is no limit on the number of clients your workers can interact with.

* A standalone license is ideal for sensitive environments (HIPAA, Safe Harbor, Sarbanes-Oxley, etc). Otherwise, a fully managed <a href="/cloud">Cerb Cloud</a> instance may be a better option.

* Read the <a href="/docs/installation">installation instructions</a> to get started.

<br/>

{% include tables/standalone_feature_comparison.html %}

<br/>

# Frequently asked questions:

<br/>

## How do I install Cerb on my own hardware?

Read the <a href="/docs/installation">installation instructions</a> to get started.

<div id="seats"></div>

## What are seats?

Seats determine the maximum number of workers who can use Cerb at the same time.

For example, a team of 30 workers who are evenly split into three, non-overlapping shifts (morning, day, night) would only require 10 seats. That's the highest number of workers who would ever be logged in at the same time.

You aren't paying per worker account, so there isn't a penalty for inviting everyone to participate: full-time staff, part-time contributors, busy executives, interns, temps, contractors, partners, and volunteers.

<div id="community-license"></div>

## What is a community license?

Community licenses are the best way to evaluate if Cerb meets your needs.

A community license provides 3 seats at no cost. The license is valid for the latest version of Cerb at the time it is created. The right to run that version of the software will never expire.

Community licenses don't provide access to priority support or ongoing software updates.  They are eligible for a single "get current" upgrade once per 12 month period.  Aside from that, they have no feature-related limitations.

Registered charities and qualifying open source projects may be eligible for a higher seat limit and ongoing software updates at no cost.

<div id="renewal"></div>

## Do you provide a renewal discount for existing licenses?

Yes! We automatically add a 10% _"timely renewal_" discount to your invoice for any existing Pro licenses that have not been expired for more than 30 days.

<div id="academic"></div>

## Do you provide an academic discount?

Yes. We offer a 20% discount in support of academic institutions.

To qualify for an academic discount, institutions must be accredited by an agency recognized by the U.S. Department of Education (or their own national equivalent).  All publicly funded K-12 and preschools automatically qualify.

<div id="non-profit"></div>

## What qualifies a charity or non-profit organization for a free license?

To receive a free Cerb license with ongoing software updates and more than 3 seats, a charity or non-profit must have a charter that seeks to improve the public good and be registered as a 501(c)(3) organization (or their own national equivalent).  The organization should be primarily funded through public donations or grants, and such contributions should be tax deductible by the donors.

<div id="opensource"></div>

## What qualifies an open source project for a free license?

To receive a free Cerb license with ongoing software updates and more than 3 seats, an open source project must have a website explaining the purpose of the project, all source code available in a public repository like GitHub, and a self-deployed option with no licensing costs.

An open source license should only be used for that purpose, and not mixed with other commercial activity.

<div id="volume-discount"></div>

## Do you provide a volume discount for standalone Cerb licenses?

Yes! Volume discounts are available for _Academic_, _Commercial_, and _Government_ licenses with __more than 25 seats__.

<div class="grid">
<div class="unit half" align="center">
{% include tables/volume_discount_standalone.html caption="Academic Volume Discount" base_cost=240.00 %}
</div>
<div class="unit half" align="center">
{% include tables/volume_discount_standalone.html caption="Commercial/Gov Volume Discount" base_cost=300.00 %}
</div>
</div>

If you have multiple **non-expired** Cerb licenses on your account, the sum of all seats of the same license type determines your volume discount. This is particularly beneficial for large companies with many subsidiaries using independent instances of Cerb, and outsourced support companies who use distinct Cerb environments for each client to provide their services.

