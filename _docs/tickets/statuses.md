---
title: Ticket Statuses
permalink: /docs/tickets/statuses/
toc:
  title: Statuses
jumbotron:
  title: Statuses
  tagline: 
  breadcrumbs:
  -
    label: Docs &raquo;
    url: /docs/home/
  -
    label: Tickets &raquo;
    url: /docs/tickets/
---

The **status** of a [ticket](/docs/tickets/) is always one of the following:

- **open**: the conversation needs worker attention.
- **waiting for reply**: the conversation is on hold pending client action.
- **closed**: the conversation has concluded.
- **deleted**: the conversation is flagged for deletion during the next maintenance window.

You'll most likely have at least one worklist dedicated to _open_ tickets if you're responsible for responding to inquiries from contacts.

When a ticket is changed to the _waiting_ status you can also schedule a **wait until** date and time, at which point the conversation will automatically return to the _open_ status.  This keeps your inbox free of tickets that you can't work on until a later date.  It's also a great way to schedule followups on sales or marketing messages.

If a contact adds a new message to a ticket that is _waiting_ or _closed_ it will automatically change back to the _open_ status.

By default, when a ticket is deleted you will have 7 days from its last activity to change it to a different status before it's removed permanently.  This is called the _"undo window"_.
