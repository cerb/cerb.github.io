---
layout: page
title: "Cerb License"
permalink: /pricing/license
jumbotron:
  title: Standalone Cerb Licenses
  tagline: Deploy Cerb on your own hardware
---

A __standalone Cerb license__ runs on your own hardware. You handle installation, upgrades, backups, monitoring, tuning, scaling, security, troubleshooting, etc. The software requires a web server with PHP 5.3+ and MySQL 5.1+.

* Licensed based on **seats** (the maximum number of workers who can log in at the same time). An **unlimited** number of worker accounts can share the available seats.

* Includes **one year** of priority support and software updates. Your license **never expires** for versions released during your software updates coverage, and there is no ongoing cost to continue using those versions.

* Ideal for sensitive environments (HIPAA, Safe Harbor, etc).

<table class="cerb-pricing-matrix">
	<thead>
		<tr>
			<th></th>
			<th>Evaluation [<a href="#evaluation">?</a>]</th>
			<th>Academic [<a href="#academic">?</a>]</th>
			<th>Commercial/Gov</th>
		</tr>
	</thead>
	
	<tbody class="matrix">
		<tr>
			<td>Base Price:</td>
			<td>$0</td>
			<td>$240</td>
			<td>$300</td>
		</tr>
		
		<tr>
			<td>Total workers:</td>
			<td>unlimited</td>
			<td>unlimited</td>
			<td>unlimited</td>
		</tr>
		
		<tr>
			<td>Included seats [<a href="#seats">?</a>]:</td>
			<td>3</td>
			<td>1</td>
			<td>1</td>
		</tr>

		<tr>
			<td>Extra seats [<a href="#volume-discount">?</a>]:</td>
			<td><span class="no"></span></td>
			<td>+$240</td>
			<td>+$300</td>
		</tr>
		
		<tr>
			<td>Software updates:</td>
			<td><span class="no"></span></td>
			<td>1 year</td>
			<td>1 year</td>
		</tr>

		<tr>
			<td>Priority support:</td>
			<td><span class="no"></span></td>
			<td>1 year</td>
			<td>1 year</td>
		</tr>

		<tr>
			<td></td>
			<td><a href="">purchase</a></td>
			<td><a href="">purchase</a></td>
			<td><a href="/contact/evaluation-license">request</a></td>
		</tr>

	</tbody>
	
</table>
<br>

# Frequently asked questions

<div id="seats"></div>

## What are seats?

Seats determine the maximum number of workers who can use Cerb at the same time.

For example, a team of 30 workers who are evenly split into three, non-overlapping 8-hour shifts (morning, day, night) would only require 10 seats. That's the highest number of workers who would ever be logged in at the same time.

You aren't paying per worker account, so there isn't a penalty for inviting everyone to participate: full-time staff, part-time contributors, busy executives, interns, temps, contractors, partners, and volunteers.

<div id="evaluation"></div>

## What are evaluation licenses?

(( startup, non-profit, charity, open-source ))

(( no expiration, one renewal per year ))

<div id="academic"></div>

## What are academic licenses?

<div id="government"></div>

## What are government licenses?

<div id="non-profit"></div>

## Do you provide discounts to non-profits and charities?

<div id="opensource"></div>

## Do you provide discounts to open-source projects?

<div id="renewal"></div>

## Do you provide a renewal discount?

Yes! We automatically add a 10% _"timely renewal_" discount to your invoice for any existing licenses that have not been expired for more than 30 days.

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

