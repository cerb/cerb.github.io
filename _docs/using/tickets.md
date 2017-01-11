---
title: Tickets
permalink: /docs/tickets/
jumbotron:
  title: Tickets
  #tagline: ...
---

A **ticket** is a specific conversational interaction between workers and contacts, including all of the related email **messages** and other data.

Every ticket is automatically assigned a unique, non-sequential reference **mask**, like `RYS-07092-910`. A contact can provide the first three letters of the mask for quick lookups. The term _mask_ refers to the fact that the randomized reference number (opposed to a numeric ID) doesn't disclose information about your total number of tickets or your daily email volume.

The contacts involved in a conversation are referred to as **participants**.  By default, all participants receive a copy of worker replies to the conversation.

The specific worker who is responsible for a ticket is its **owner**.

Related tickets from the same participants can be **merged** together into a single ticket, which combines all of the messages and comments.  Conversely, if a ticket conversation diverges into multiple topics that would be better handled by other groups or workers, one or more messages can be **split** off into new tickets.

### Status

The **status** of a ticket is always one of the following:

- **open**: the conversation needs worker attention.
- **waiting for reply**: the conversation is on hold pending client action.
- **closed**: the conversation has concluded.
- **deleted**: the conversation is flagged for deletion during the next maintenance window.

You'll most likely have at least one worklist dedicated to _open_ tickets if you're responsible for responding to inquiries from contacts.

When a ticket is changed to the _waiting_ status you can also schedule a **wait until** date and time, at which point the conversation will automatically return to the _open_ status.  This keeps your inbox free of tickets that you can't work on until a later date.  It's also a great way to schedule followups on sales or marketing messages.

If a contact adds a new message to a ticket that is _waiting_ or _closed_ it will automatically change back to the _open_ status.

By default, when a ticket is _deleted_ you will have 7 days from its last activity to change it to a different status before it's removed permanently.  This is called the _undo window_.

### Importance

Tickets also have an **importance** field that determines their priority. It's a numeric range between 0 and 100 where a higher number indicates a higher priority. The default value is 50 (neither important nor unimportant).  When sorting a worklist by importance, all you really need to think about is whether a ticket should be a little more or a little less important.  The importance field can also be adjusted by [bots](/docs/bots) in response to service level committments, escalations, etc.

### Response times

Cerb records **response time** information in two fields:

- **First response**: the total time elapsed before the first response from a worker. This focuses on the first response so that it isn't skewed by later delays that may be attributed to the client.

- **First resolution**: the total time elapsed before the ticket was first changed to the _closed_ status. This isn't affected by subsequent changes between the _open_ and _closed_ statuses that may occur when you get stuck in a loop of _"Thanks!"_ and _"You're welcome!"_ -- especially because that may occur days after the ticket was actually resolved.

When a worker responds to a specific client message, Cerb also records the response time on the worker's message. This encourages workers to respond quickly, even if it's only to say, _"Let me check on that and get right back to you"._

### Anti-spam

Cerb performs a simple statistical analysis of the contents of the first message on new tickets to predict whether a message is spam or not.  The predicted probability of being spam is stored as a **spam score** on the ticket. By itself, this prediction has no effect on tickets. However, the computed score can be used by bots and workers to filter mail when desirable.

The spam predictions improve and adapt over time through training.  When a worker replies to a client message, Cerb learns to be more approving of similar messages in the future.  When workers click the **Report spam** button on a ticket, Cerb becomes more critical of similar messages in the future.