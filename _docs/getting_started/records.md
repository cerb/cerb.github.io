---
title: Records
permalink: /docs/records/
jumbotron:
  title: Records
  tagline: Remember anything about everything
---

At the core of Cerb is a data management system for organizing collections of **records**.  A record is a distinctly identifiable entity: email address, contact, email message, task, etc.  The different types of records are called **contexts**.  Each record within a context is assigned a unique numeric identifier (**ID**).
<div class="cerb-screenshot">
<img src="/assets/images/docs/using-cerb/records/records.png" class="screenshot">
</div>
* TOC
{:toc}

## Fields

Each record contains a set of **fields** to describe its attributes. Some fields are _built-in_, like the name and email address of a contact, or the subject and body of an email message. These fields can't be changed.

## Custom Fields

New **custom fields** can also be added to records based on the needs of a particular organization.

You can add many kinds of custom fields:

- Checkbox
- Currency
- Date
- Decimal
- File
- Files: Multiple
- List
- Multiple Checkboxes
- Number
- Picklist
- Record Link
- Text: Multiple Lines
- Text: Single Line
- URL
- Worker

## Fieldsets

Related custom fields can be grouped together into a **fieldset**. Fieldsets can also be used to classify a record.  For instance, when using the [asset tracking plugin](/docs/plugins/cerberusweb.assets/), you can add fieldsets for _Automobile_ and _Computer_ with appropriate fields and then filter worklists by those types.

## Custom Records

You can also create [custom records](/guides/records/custom-records/) for your own data.

## Cards

A **card** summarizes a particular record in a popup window. This allows information to be retrieved and displayed quickly from anywhere in Cerb without leaving the current page.

<div class="cerb-screenshot">
<img src="/assets/images/docs/using-cerb/records/card.png" class="screenshot">
</div>

Cards also provide shortcuts to common functionality for a given record.  For example, when viewing the card of a contact you'll see their ticket history broken down by status: all, open, waiting, and closed.  When viewing the card of a ticket, you can also open the cards of any participant or message on that ticket.  You can read the entire conversation on a ticket without leaving its card.

If you have permission to modify a record, you'll see an _Edit_ button at the top of its card.

## Profiles

The full page view of a particular record is called its **profile**.  This expands on the information summarized by a card.

## Links

The relationships between records is described by **links**.  For instance, if a task is associated with a particular client organization, those records can be linked together.

When records are linked, they'll be displayed on each other's cards and profiles for quick traversal.

## Comments

**Comments** can be added to records as a form of note-taking.  For instance, as progress is made on a task it can be documented with comments.  This allows workers to quickly share information.  Workers can also be addressed with an @mention to send them a notification about the comment.

<div class="cerb-screenshot">
<img src="/assets/images/docs/using-cerb/records/comments.png" class="screenshot">
</div>

Comments on a record are visible from its card and profile.

## Watchers

A **watcher** is a worker who wants to receive a notification about all new activity on a specific record. For example, a supervisor may be a watcher on all new tickets in a specific group to monitor the quality of the messages being sent to customers.

<div class="cerb-screenshot">
<img src="/assets/images/docs/using-cerb/records/watchers.png" class="screenshot">
</div>

## Activity Log

The **activity log** records a history of events that have affected a record.  For instance, when a task is closed, or a customer responds to an email, these activities are logged.

<div class="cerb-screenshot">
<img src="/assets/images/docs/using-cerb/records/log.png" class="screenshot">
</div>
