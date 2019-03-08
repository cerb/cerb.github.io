---
title: Decisions and outcomes in bot behaviors
permalink: /docs/bots/behaviors/decisions/
toc:
  title: Decisions/Outcomes
jumbotron:
  title: Decisions & Outcomes
  #tagline: Powerful automated behaviors built from your web browser
  breadcrumbs:
  -
    label: Docs &raquo;
    url: /docs/home/
  -
    label: Bots &raquo;
    url: /docs/bots/
  -
    label: Behaviors &raquo;
    url: /docs/bots/behaviors/
---

A **decision** represents a point where a [bot](/docs/bots/) [behavior](/docs/bots/behaviors/) needs to choose the best **outcome** from any number of possible outcomes.

The first outcome to satisfy all of its **conditions** is chosen. For this reason, the order of outcomes within a decision is very important.

Conditions are criteria like the time of day, day of week, or the comparison of any [record](/docs/records) [field](/docs/records/fields/) against some **value** using an **operator** (e.g. is, is not, greater/less than, between, contains, matches, starts with).

Here's a simple _binary_ (two outcome) decision:

- Is it Friday?
  - Yes
  - No

The _"Yes"_ outcome has a single condition that the current day is _"Friday"_.

The _"No"_ outcome, being last, doesn't need any conditions because it would be selected on any day other than Friday. We call this a **default** (or _"catch-all"_) outcome.

<div class="cerb-box geek-out">
	<p>This is comparable to an <b><tt>if...else</tt></b> conditional statement in computer programming.</p>
</div>

A slightly more complex variation is:

- Day of week:
  - Monday
  - Tuesday
  - Wednesday
  - Thursday
  - Friday
  - Saturday
  - Sunday

Similar to the _"Yes"_ example above, each outcome would compare the current day against a specific target day, and the behavior would continue down the path (branch) of the outcome that matched the current day.

<div class="cerb-box geek-out">
	<p>This is comparable to a <b><tt>switch</tt></b> statement in computer programming.</p>
</div>

While the above examples have a single condition for each outcome out of simplicity, an outcome can have any number conditions, optionally grouped into sets with an _any_ or _all_ constraint.

As you would expect, a set of _any_ conditions need only satisfy one of them.  A set of _all_ conditions must satisfy all of them.

Decisions can also be _nested_ within other decisions. Consider the following:

- Schedule:
  - Holiday
  - Weekend
  - Weekday
    - What time of day is it?
      - Before office hours
      - During office hours
      - After office hours

The above decision tree describes five final outcomes within two decisions. It doesn't repeat the conditions to check if the current day is a weekday. The same approach can be used to create very complex decisions that are still easy to follow.
