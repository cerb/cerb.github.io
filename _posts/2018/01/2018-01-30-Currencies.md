---
layout: post
title: "Preview: Currencies in Cerb 8.3"
excerpt: In Cerb 8.3, we're introducing support for currencies to improve many sales-related workflows.
author: The Cerb Team
date: 2018-01-30 00:00:00 -0700
tags: cerb sneak-peek
---

<div class="cerb-screenshot">
<img src="/assets/images/blog/2018/01/30/currencies.png" class="screenshot">
</div>

In Cerb 8.3, we're introducing support for currencies to improve many workflows: sales automation, deal tracking, order history, asset valuation, etc.

Currencies are first-class records -- they have worklists, cards, profiles, custom fields, links, etc:

<div class="cerb-screenshot">
<img src="/assets/images/blog/2018/01/30/currencies-list.png" class="screenshot">
</div>

Each currency record has a name in singular and plural forms, as well as a symbol, ISO-4217 currency code, and number of significant decimal places:

<div class="cerb-screenshot">
<img src="/assets/images/blog/2018/01/30/currencies-usd-peek.png" class="screenshot">
</div>

By default, currencies like Dollars and Euros have two significant decimal places, but in industries where more precision is needed (e.g. finance/trading) you could keep track of thousandths (0.001) or ten-thousands (0.0001) of a cent.

This feature is flexible enough to support the burgeoning suite of cryptocurrencies. For instance, Bitcoin is a digital currency with 8 significant decimal places.  The smallest unit is 0.00000001 BTC.

When you install or update Cerb, we create the following default currencies:

* US Dollars
* British Pounds
* Euros
* Bitcoin

To add a new currency, you can navigate to **Search >> Currencies** and click the **(+)** icon above the [worklist](/docs/worklists/).

You can configure a default currency so workers don't have to select their preferred currency every time they create a new record.

Currently, the only built-in record type that uses currencies is opportunities. Previously, the `amount` field in opportunities was abstract and didn't specify a specific currency. You can now track opportunities in multiple currencies at the same time.

<div class="cerb-screenshot">
<img src="/assets/images/blog/2018/01/30/currencies-opps.png" class="screenshot">
</div>

We've also implemented a new currency custom field type, which can be added to any record, including custom records types that you create.

<div class="cerb-screenshot">
<img src="/assets/images/blog/2018/01/30/currencies-custom-field.png" class="screenshot">
</div>

So now if you want to store customer order histories, or a catalog of products and services, you can create custom record types with a currency-based custom field. If you need to store prices in multiple currencies on the same record, you can use multiple fieldsets with a different currency field.

<div class="cerb-screenshot">
<img src="/assets/images/blog/2018/01/30/currencies-custom-records.png" class="screenshot">
</div>

We're eager to see what you build.