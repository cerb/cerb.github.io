---
title: Records
permalink: /docs/records/
jumbotron:
  title: Records
  tagline: Remember anything about everything
---

<div class="cerb-screenshot">
<img src="/assets/images/guides/records/custom-records/custom-records.png" class="screenshot">
</div>

At the core of Cerb is a **record** management system for organizing your team's data.

A record is a distinctly identifiable entity. When multiple records refer to the same kind of entity, we say that they are of the same **record type**.

Two pieces of information are needed to refer to any record:

1. The record type (e.g. contact, organization, reminder, task, worker).

1. The unique numeric identifier ("**ID**") within that particular record type. IDs are automatically assigned when a new record is created.

Each record type has a set of **fields** to describe its attributes. Your `first name` and `age` would be two fields that describe you.

Fields also have types: text, number, date, picklist, yes/no, file, record link, etc. You can also extend any record type with your own [custom fields](/docs/custom-fields/).

Here's what a basic _"worker"_ record might look like for someone on your team:

|---
| Field | Type | Value
|-|-|-
| ID | number | `1`
| First name | text | `Kina`
| Last name | text | `Halpue`
| Job title | text | `Support Manager`
| Photo | file | <img src="/assets/images/common/avatars/person2.png" class="screenshot">
| Administrator | yes/no | `yes`
| Email address | record | `kina@cerb.example`
| Mobile number | phone | `+1-555-123-4567`
| Location | text | `Los Angeles, California, USA`
| Gender | picklist | `female`
| Created at | date | `2002-01-09 04:27:01 UTC`
| Updated at | date | `2018-08-30 10:32:00 UTC`

In Cerb, we include a set of built-in record types to help you get started. For instance:

* You and your fellow team members are **worker** records.
* When you add a new customer they become a **contact** record.
* An **organization** record links together multiple contacts.
* Contacts write to you from **email address** records.
* New email **messages** create records.
* Multiple related email messages form a conversation on a **ticket** record.

While the built-in record types cover things that every team has in common, you most likely needs to keep track of data that's specific to your team and industry. In these situations, you can easily [create your own record types](/guides/records/custom-records/).

For instance:

* If you're a transportation company, your conversations may refer to physical trucks, planes, and ships in the real world.

* You can link contacts to records for your products, services, licenses, and subscriptions. During support, everyone on your team will know exactly what your relationship is with each contact.

* An educational institution can create records for students, instructors, courses, and rooms. Those records can then be linked to assets (like tablets and projectors) and support requests. If an instructor opened a support request about their projector being broken, you'd know exactly what model it is and where to find it on campus.
