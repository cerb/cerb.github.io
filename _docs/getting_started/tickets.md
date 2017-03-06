---
title: Tickets
permalink: /docs/tickets/
jumbotron:
  title: Tickets
  tagline: Conversations with your audience
---

A **ticket** is a conversational interaction between [workers](/docs/workers/) and [contacts](/docs/contacts/), including all of the related email **messages** and other data.

Every ticket is automatically assigned a unique, non-sequential reference **mask**, like `RYS-07092-012`. A contact can provide the first three letters of the mask for quick lookups. The term _mask_ refers to the fact that the randomized reference number (opposed to a numeric ID) doesn't disclose information about your total number of tickets or your daily email volume.

The contacts involved in a conversation are referred to as **participants**.  By default, all participants receive a copy of worker replies to the conversation.

The specific worker who is responsible for a ticket is its **owner**.

Related tickets from the same participants can be **merged** together into a single ticket, which combines all of the messages and comments.  Conversely, if a ticket conversation diverges into multiple topics that would be better handled by other groups or workers, one or more messages can be **split** off into new tickets.

* TOC
{:toc}

<div class="cerb-screenshot">
<img src="/assets/images/docs/using-cerb/tickets/ticket.png" class="screenshot">
</div>

### Statuses

The **status** of a ticket is always one of the following:

- **open**: the conversation needs worker attention.
- **waiting for reply**: the conversation is on hold pending client action.
- **closed**: the conversation has concluded.
- **deleted**: the conversation is flagged for deletion during the next maintenance window.

You'll most likely have at least one worklist dedicated to _open_ tickets if you're responsible for responding to inquiries from contacts.

When a ticket is changed to the _waiting_ status you can also schedule a **wait until** date and time, at which point the conversation will automatically return to the _open_ status.  This keeps your inbox free of tickets that you can't work on until a later date.  It's also a great way to schedule followups on sales or marketing messages.

If a contact adds a new message to a ticket that is _waiting_ or _closed_ it will automatically change back to the _open_ status.

By default, when a ticket is _deleted_ you will have 7 days from its last activity to change it to a different status before it's removed permanently.  This is called the _undo window_.

### Drafts

**Drafts** automatically save the current progress of a worker's message before they send it. This allows a composed message to be resumed at a later date, and it provides a _backup_ (e.g. the browser crashes or otherwise unintentionally closes).

Drafts are displayed in a ticket's conversation timeline, which instantly lets _other_ workers know that a response is being sent so they can move on to a different ticket.  This prevents _duplication of effort_.

Similarly, a trainee can ask a supervisor to review their draft before they send a message to a client.

### Snippets

[Workers](/docs/workers/) and [bots](/docs/bots) can use **snippets** to quickly insert predefined text into messages. You can think of snippets as _copying and pasting_ from a giant shared clipboard.

However, unlike the traditional _paste_ action, snippets also support sophisticated scripting functionality with **placeholders** and **conditional logic**.  This means that the content of a snippet can change based on when and where you use it.

In a common use case, an auto-responder message will use placeholders in a snippet like:

{% raw %}
<figure class="highlight">
<pre>
<code class="language-text">Hi <b>{{first_name}}</b>,

Thanks for contacting us!

A new support ticket has been opened in response to your message:

Reference #: <b>{{mask}}</b>
Subject: <b>{{subject}}</b>

We'll be in contact shortly.</code>
</pre>
</figure>
{% endraw %}

The above snippet results in the following text when used by a [bot](/docs/bots/) on a new ticket:

<figure class="highlight">
<pre>
<code class="language-text">Hi <b>Charlotte</b>,

Thanks for contacting us!

A new support ticket has been opened in response to your message:

Reference #: <b>CRB-01092-002</b>
Subject: <b>Do you accept purchase orders?</b>

We'll be in contact shortly.</code>
</pre>
</figure>

### Importance

Ticket priority is determined by the **importance** field. You'll encounter importance as a simple slider where you can nudge it up or down as needed.

The importance field can also be automatically adjusted by [bots](/docs/bots) in response to service level committments, escalations, etc.

### Response times

Cerb records **response time** information in two fields:

- **First response**: the total time elapsed before the first response from a worker. This focuses on the first response so that it isn't skewed by later delays that may be attributed to the client.

- **First resolution**: the total time elapsed before the ticket was first changed to the _closed_ status. This isn't affected by subsequent changes between the _open_ and _closed_ statuses that may occur when you get stuck in a loop of _"Thanks!"_ and _"You're welcome!"_ -- especially because that may occur days after the ticket was actually resolved.

When a worker responds to a specific client message, Cerb also records the response time on the worker's message. This encourages workers to respond quickly, even if it's only to say, _"Let me check on that and get right back to you"._

### Anti-spam

Cerb performs a simple statistical analysis of the contents of the first message on new tickets to predict whether a message is spam or not.  The predicted probability of being spam is stored as a **spam score** on the ticket. By itself, this prediction has no effect on tickets. However, the computed score can be used by bots and workers to filter mail when desirable.

The spam predictions improve and adapt over time through training.  When a worker replies to a client message, Cerb learns to be more approving of similar messages in the future.  When workers click the **Report spam** button on a ticket, Cerb becomes more critical of similar messages in the future.