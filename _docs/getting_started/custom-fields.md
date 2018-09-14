---
title: Custom Fields
permalink: /docs/custom-fields/
jumbotron:
  title: Custom Fields
  tagline: Add your own attributes to any record type
---

**Custom fields** can be added to any [record type](/docs/records/) based on the specific needs of your team.

There are many different **types** of fields:

|---
| Type | Description | Example
|-|-
| Checkbox | `yes` or `no` | `yes`
| Currency | An amount of a specific currency | `$1234.56 USD`
| Date | A specific date and time in UTC with seconds precision | `2002-01-09 04:27:01 UTC`
| Decimal | A floating point number | `3.1415`
| File | A link to a single file record | `logo.png`
| Files | Links to multiple file records | `invoice.pdf, contract.pdf`
| List | A freeform list of text-based options | `trim-leather, color-silver`
| Multiple Checkboxes | Multiple selections from a pre-defined list of options (e.g. phone, email, sms) | `sms`
| Number | A whole number | `8080`
| Picklist | A selection from a pre-defined list of options (e.g. red, green, blue) | `red`
| Record Link | A link to record ID of a specific type | `task:123`
| Text: Multiple Lines | Multiple lines of freeform text entry | `Client agrees to the project changes discussed on 11/Aug conference call`
| Text: Single Line | A single line of freeform text entry | `bank transfer`
| URL | A hyperlink URL to a web-based resource | `https://cerb.ai/`
| Worker | A single worker record | `Kina Halpue`

Custom fields can be added directly an existing record type and they will be visible on every record of that type.

You can also group related custom fields together into a **fieldset**. When a fieldset is optionally added to a record, it includes all of its fields at the same time. 

For instance, you could add this _"SLA"_ (Service Level Agreement) fieldset to [organization](/docs/orgs/) records:

|---
| Field | Type | Value
|-|-|-
| Level | picklist (Standard, Priority, Enterprise) | `Enterprise`
| Expires | date | `2025-12-31 23:59:59 UTC`

Every time a new ticket is opened, a [bot](/docs/bots/) could check the sender's SLA to determine the assignment and due date; but only if that obligation hasn't expired. Bots could also remind a client when their SLA is about to expire.

Fieldsets can also be used to further subdivide a broad record type into classifications. For instance, asset records could have custom fieldsets for _"Vehicle"_ and _"Computer"_. You could then create a list of only assets that are vehicles based on their color, mileage, passenger capacity, etc.
