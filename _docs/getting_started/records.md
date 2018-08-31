---
title: Records
permalink: /docs/records/
jumbotron:
  title: Records
  tagline: Remember anything about everything
---

At the core of Cerb is a data management system for organizing business data into collections of **records**.

There are two pieces of information that are needed to distinctly identify any record:

1. A **type** (e.g. contact, organization, reminder, task, worker).

1. The numeric **ID** that is unique within that particular type. These are automatically assigned when a new record is created.

Each record type has a set of **fields** to describe the attributes of its records.

Fields also have types: text, number, date, picklist, yes/no, file, record link, etc.

The standard record types include a few _built-in_ fields that are required by Cerb and can't be changed.

Most record types have a human-friendly _name_ and keep track of the _timestamps_ when they were created or last updated.

Some record types have a _status_ (e.g. open, waiting, closed), or an _owner_ who is responsible for them.

Consider a basic _worker_ record:

|---
| Field | Type | Value
|-|-|-
| ID | number | `1`
| First name | text | `Kina`
| Last name | text | `Halpue`
| Job title | text | `Support Manager`
| Email address | record | `kina@cerb.example`
| Mobile number | phone | `+1-555-123-4567`
| Location | text | `Los Angeles, California, USA`
| Gender | text | `female`
| Created at | date | `2002-01-09 04:27:01 UTC`
| Updated at | date | `2018-08-30 10:32:00 UTC`

And compare that to a basic _task_ record:

|---
| Field | Type | Value
|-|-|-
| ID | number | `1`
| Name | text | `Master Cerb's concepts`
| Owner | record | `you`
| Created at | date | `2018-08-30 13:15:00 UTC`
| Updated at | date | `2018-08-30 13:15:00 UTC`
| Due at | date | `2018-09-30 23:59:59 UTC`

You can add [custom fields](/docs/custom-fields/) to any record type for storing your own attributes. Perhaps you have different service level agreement obligations for each client, employee numbers for workers, etc.

You can even [create your own record types](/guides/records/custom-records/) for storing any kind of data:

* You could create records for your products, services, licenses, and subscriptions; and link clients to them. During support, everyone on your team would know exactly what your relationship is with each contact.

* An educational institution could create records for students, instructors, courses, and rooms; and link those to assets (like tablets and projectors) and support requests. If an instructor opened a support request about their projector being broken, you'd know exactly what model it is and where to find it on campus.
