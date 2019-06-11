---
title: Bot Behaviors
permalink: /docs/bots/behaviors/
toc:
  title: Behaviors
jumbotron:
  title: Behaviors
  #tagline: ...
  breadcrumbs:
  -
    label: Docs &raquo;
    url: /docs/home/
  -
    label: Bots &raquo;
    url: /docs/bots/
---

A bot **behavior** automatically makes decisions and performs actions in response to [events](/docs/events/).

A behavior is described by a **decision tree** made up of **nodes** -- a collection of relatively simple building blocks that can be chained together to do complex things.

There are five types of nodes: 

* [Decisions](#decisions)
* [Outcomes](#decisions)
* [Actions](#actions)
* [Loops](#loops)
* [Subroutines](#subroutines)

# Decisions and Outcomes

A **decision** represents a point where a [bot](/docs/bots/) behavior needs to choose the best **outcome** from any number of possible outcomes.

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

# Actions

When activated by a [bot](/docs/bots/) behavior reaching it, an **action** node performs one or more operations in response.  There are actions to allow bots to do almost anything that a normal worker can do.  The available actions depend on the specific event that triggered the behavior.

Cerb comes with many built-in actions: setting a variable, sending an email, closing a ticket, creating a task, making an HTTP request, commenting on a record, loading filtered records from a worklist, notifying a worker, triggering another behavior to run, etc.

Plugins can also add new actions to behaviors: sending an SMS via Twilio, posting to Twitter or Facebook, retrieving customer information from Salesforce or LinkedIn, uploading a file to Amazon S3, and much more.

# Loops

A **loop** node repeats every node inside of it for a certain number of _iterations_.

For instance, assume that you just loaded a list of tweets that @mention your company's Twitter account using an _action_ node.  You now need to scan through each tweet to see if the username matches a contact record in your address book (stored in a custom field).  You can use a _loop_ node to iterate through each tweet and run [decisions](#decisions-and-outcomes), [outcomes](#decisions-and-outcomes), and [actions](#actions) against them.

You can do the same thing with records loaded from a worklist by an _action_.

It's also possible to just loop a specific number of times without being based on anything.

In conversational bot behaviors, loops are a simple way to validate user input and prompt them to make corrections when necessary.

### See also

* [Guide: Break out of a loop in a bot behavior](/guides/bots/break-loop-in-bots/)

# Subroutines

**Subroutine** nodes allow you to create reusable _sub-behaviors_ that can be used any number of times by any action node in the behavior. A subroutine will never run on its own.

For instance, consider again the above example of our _"Schedule:"_ decision.  Perhaps in every outcome other than _"During office hours"_, and among other actions that justify splitting the outcomes, we want to send the same "out of office" auto-response to contacts who write in when we're not there.  A single subroutine would contain the _action_ node for sending the email message, and the four outcomes would each use it.  Any changes to that auto-response action would only need to be made in a single place.

Subroutine nodes can also use other subroutine nodes.