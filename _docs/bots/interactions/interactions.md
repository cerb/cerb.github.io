---
title: Conversational Bot Interactions
excerpt: 
permalink: /docs/bots/interactions/
toc:
  title: Interactions
jumbotron:
  title: Interactions
  tagline: 
  breadcrumbs:
  -
    label: Docs &raquo;
    url: /docs/home/
  -
    label: Bots &raquo;
    url: /docs/bots/
---

{% comment %}
- interaction points / params
- sessions
- respond with
- delay
- prompts: types, formats, validation
- proactive interactions

Examples: licensing, demos, lost license, contact, troubleshooters, SLA, etc
{% endcomment %}

<div class="cerb-screenshot">
<img src="/assets/images/guides/bots/conversational-bots/cerb-bots-banner.png" class="screenshot">
</div>

{% comment %}
<div class="cerb-screenshot">
<img src="/assets/images/guides/bots/conversational-bots/cerb-bots-banner.png" class="screenshot">
</div>
{% endcomment %}

{% comment %}
# Chat bots

**Conversational computing** is a shift toward talking with **chat bots** using natural language in order to retrieve information and accomplish tasks, rather than pointing and clicking through complex graphical user interfaces.

You may have already automated many of your business processes using [bot behaviors](/docs/bots/). Let's explore how **conversational behaviors** can save your workers even more time.
{% endcomment %}

# Interactions

A **chat bot**'s primary goal is to determine a human's **intent** (what they want to accomplish) from their _utterances_ in natural language, and then to fulfill those requests in a helpful way.

**Interactions** are short conversations between a chat bot and a human user with a specific intent. They help avoid the challenges introduced by _open-ended_ conversations.

# Interaction points

Interactions are triggered from **interaction points**, which provide context (e.g. who, what, when, where) and establish the initial intent of a conversation.

For instance:

* In Cerb, an interaction could trigger when a [worker](/docs/workers/) clicks "Remind me" on a specific [record](/docs/records/). Through the interaction, the bot would know who the worker is and which record they're looking at, so it could simply ask when and how they would like to be reminded. The bot also has access to the worker's record, so it wouldn't need to ask about contact details like an email address or mobile number.

* On a website, an interaction could trigger when a visitor clicks a "Sign up" link. The bot would guide the visitor through the steps of creating and verifying a new account.

* In an email, a personalized link could start an interaction with survey. The conversation would adapt based on a respondent's answers, and results could be saved to [custom fields](/docs/custom-fields/) or [custom records](/docs/records/custom-records/).

# Interaction lifecycle

There are three events in the lifecycle of an interaction: get interactions, handle interaction, and conversations.

### Get interactions

When a user is near an interaction point, the **Get interactions** event runs on every bot to fetch the list of available interactions for that point. This allows the user to choose an interaction directly, rather than having to precisely answer the open-ended question, _"How can I help?"_.

Because this process is implemented using bot [behaviors](/docs/bots/behaviors/), [decisions](/docs/behaviors/decisions/) can filter the possible interactions situationally based on the current worker, the target record, the time of day, etc.

For instance, certain interactions may only be available for open ticket records in the Sales group.

These options are generally displayed in an interactions menu on a record's [card](/docs/cards/) or [profile](/docs/profiles/).

### Handle interaction

When a specific interaction from the above list is selected, Cerb runs its associated handler.

A single handler behavior can be shared by multiple interactions. The common convention is to have one "Get interactions" and one "Handle interaction" behavior per bot.

The handler takes parameters from the interaction and passes them to a conversational behavior.

If an interaction is being started from a link in email, a signature may be verified to detect tampering, etc.

With customer-facing bots on websites, the _get interactions_ step is skipped and the _handler_ is called directly when a link or button is clicked.

### Conversation

The conversational behavior then starts, with its initial state provided by the interaction.  It prompts the user for input, does something useful, and provides output.  This process may repeat as many times as needed to achieve the desired outcome.

For instance, imagine a troubleshooter that has a user try multiple solutions to uncover a root cause.  In some situations it may find a common issue right away, and in others it may need to ask many follow-up questions to identify an uncommon issue.

Conversational behaviors aren't inherently associated with a specific [record type](/docs/records/types/). That means you can reuse the same conversational behavior for multiple interactions and adapt it to different record types.

Consider a "Remind me" interaction. With interactions, you can register a single "Remind me about this" interaction on every record at the same time (with interaction point `record:*`), which uses the same handler, and the same conversational behavior.

The ability to use wildcards like this is another reason why the _handler_ step exists, rather than directly linking interactions to conversational behaviors.
