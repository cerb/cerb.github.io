---
title: Bots
permalink: /docs/bots/
jumbotron:
  title: Bots
  tagline: Powerful automated behaviors built from your web browser
---

A **bot** is a virtual [worker](/docs/workers) who automatically performs its duties through a collection of predefined **behaviors**.

* TOC
{:toc}

## Events

Each bot behavior is triggered in response to a specific **event**. There are dozens of built-in events, and plugins or [webhooks](/docs/webhooks) can introduce new events for nearly anything.

Events can be grouped into two categories:

- **Autonomous** events occur automatically in response to normal activity within Cerb, even if nobody is logged in: a new message is received, a comment is made, a particular set of fields change on a record, etc.

- **Interactive** events are initiated by an actor (worker, bot, webhook) with an exchange of information between the bot and the actor. This includes conversational behaviors, as well as behaviors that serve as shortcuts for repeating a sequence of actions when directly instructed.

## Behavior

A behavior is described by a **decision tree** made up of **nodes** -- a collection of relatively simple building blocks that can be chained together to do complex things.  There are five kinds of nodes: decisions, outcomes, actions, loops, and subroutines.

### Decisions and Outcomes

A **decision** represents a point where a behavior needs to choose the best **outcome** from any number of possible outcomes.  The first outcome to satisfy all of its _conditions_ is chosen.  For this reason, the order of outcomes within a decision is very important.

Conditions are things like the time of day, day of week, or the comparison of any [record](/docs/records) field against some _value_ using an _operator_ (is, is not, greater/less than, between, contains, matches, starts with, etc).

Here's a simple binary decision:

- Is it Friday?
  - Yes
  - No

The _Yes_ outcome would have a condition that the current day is _Friday_; and, as long as it comes last, the _No_ outcome doesn't need any conditions at all because it would be selected on any day other than Friday.

<div class="cerb-box geek-out">
	<p>This is comparable to an <tt>if...else</tt> conditional statement in computer programming.</p>
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

Similar to the _Yes_ example above, each outcome would compare the current day against a specific target day, and the behavior would continue down the branch of the outcome that matched the current day.

<div class="cerb-box geek-out">
	<p>This is comparable to a <tt>switch</tt> statement in computer programming.</p>
</div>

While the above examples have a single condition for each outcome out of simplicity, an outcome can have any number conditions, optionally grouped into sets with an _any_ or _all_ constraint.  As you would expect, a set of _any_ conditions need only satisfy one of them.  A set of _all_ conditions must satisfy all of them.

Decisions can also be _nested_ within other decisions. Consider the following:

- Schedule:
  - Holiday
  - Weekend
  - Weekday
    - What time of day is it?
      - Before office hours
      - During office hours
      - After office hours

The above decision tree describes five final outcomes within two decisions without repeating the conditions to check if the current day is a weekday.  That same approach can be used to create very complex decisions that are still easy to follow.

### Actions

When activated by a behavior reaching it, an **action** node performs one or more operations in response.  There are actions to allow bots to do almost anything that a normal worker can do.  The available actions depend on the specific event that triggered the behavior.

Cerb comes with many built-in actions: setting a variable, sending an email, closing a ticket, creating a task, making an HTTP request, commenting on a record, loading filtered records from a worklist, notifying a worker, triggering another behavior to run, etc.

Plugins can also add new actions to behaviors: sending an SMS via Twilio, posting to Twitter or Facebook, retrieving customer information from Salesforce or LinkedIn, uploading a file to Amazon S3, and much more.

### Loops

A **loop** node repeats every node inside of it for a certain number of _iterations_.

For instance, assume that you just loaded a list of tweets that @mention your company's Twitter account using an _action_ node.  You now need to look through each tweet to see if the username matches a contact record in your address book (stored in a custom field).  You can use a _loop_ node to iterate through each tweet and run _decisions_, _outcomes_, and _actions_ against them.

You can do the same thing with records loaded from a worklist by an _action_.

It's also possible to just loop a specific number of times without being based on anything.

In conversational bot behaviors, loops are a simple way to validate user input and prompt them to make corrections when necessary.

### Subroutines

**Subroutine** nodes allow you to create reusable _sub-behaviors_ that can be used any number of times by any action node in the behavior. A subroutine will never run on its own.

For instance, consider again the above example of our _"Schedule:"_ decision.  Perhaps in every outcome other than _"During office hours"_, and among other actions that justify splitting the outcomes, we want to send the same "out of office" auto-response to contacts who write in when we're not there.  A single subroutine would contain the _action_ node for sending the email message, and the four outcomes would each use it.  Any changes to that auto-response action would only need to be made in a single place.

Subroutine nodes can also use other subroutine nodes.

## Dictionaries

Every time a bot behavior runs, a **dictionary** is created to provide it with _working memory_.  This allows a bot to remember any kind of information by associating it with a _key_.  For instance, if you tell a conversational bot how you're feeling, it can remember that as _"mood"_.  At any later point it can then refer to your mood and make decisions based on it.

Each event automatically provides potentially hundreds of keys for you to use.  For instance, a ticket-based event includes keys for all the fields of the ticket (e.g. id, mask, subject, status), as well as all the fields of the related records like messages, senders, organizations, groups, buckets, workers, watchers, linked records, etc; and all of their related records.

Dictionaries are efficient because they only load data when a bot actually needs it.  Even though a bot can refer to _"the industry of the organization of the sender of the ticket"_, the dictionary will wait until the bot asks for it.  When similar keys are requested again (another field from that same organization) the data will already be loaded.

Any _action_ node can add new keys to a dictionary, and almost every outcome and action can use dictionary keys in addition to literal text.

<div class="cerb-box geek-out">
	<p>Dictionaries are a hierarchal key/value datastore represented as a flat list of keys delimited with underscores.  Metadata at each level allows for lazy-expansion based on a requested traversed path.  A set of deep keys can also be loaded efficiently across an array of dictionaries.</p>
</div>

## Variables

Similar to dictionaries, behavior **variables** are formally defined by the behavior. This makes it easier for outcomes and actions to refer to them because their existence is known in advance.

When a variable is marked as **public** on an _interactive behavior_, its initial value can be set by the actor who triggers the behavior. For example, if an interactive behavior exists to send SMS messages through Twilio, one public variable can provide the message and a second can provide the mobile phone number to send it to.

A **private** variable is only available to the current behavior.  A common use case would be loading records from worklist and saving them to a _list_ variable, and then scheduling another behavior to run on each of those records in the list using an action.

## Simulator 

Cerb includes a **simulator** to test bot behaviors.  The simulator shows you exactly which nodes will be activated by a particular event against a particular record.  If you use dictionary keys, it will substitute their values into the text so you can make sure everything works as you expect.

## Delegation

As hinted at above, a bot can run and schedule behaviors on other bots.  When a bot provides behaviors as a service to other bots, we call it a **delegate**.  We highly recommend creating delegates for interacting with services (e.g. Twitter, Twilio, Facebook), since you'll only have to build and maintain those behaviors in a single place.

When using a [connected account](/docs/connected-accounts) to authenticate against an API, delegates also protect your credentials and restrict the types of requests that can be made.

## Conversational Behaviors

We've mentioned **conversational behaviors** in a few places already.  They're a special form of _interactive behaviors_ where the current state of a decision tree can be paused and then resumed after new input is received.  The most common use case is when building a chat bot that prompts a user for some information and then waits for a response.

<div class="cerb-box geek-out">
	<p>This may seem fairly straightforward, but it's actually one of the most complex features in Cerb.  Not only does a resumed behavior need to remember its current node and dictionary, but it may also be two levels deep in subroutines and on the tenth iteration of a loop.  Recursion, recursion, recursion.  Since this is a stateless HTTP request, and Cerb typically responds within tens of milliseconds before closing the connection, the entire state of the decision tree needs to be quickly rebuilt and replayed up to that point on the next HTTP request without any duplicate effects.</p>
</div>
