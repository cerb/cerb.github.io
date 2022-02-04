---
title: Records
permalink: /docs/records/
redirect_from:
  - /docs/records/custom-records/
jumbotron:
  title: Records
  tagline: Remember anything about everything
  breadcrumbs:
  -
    label: Docs &raquo;
    url: /docs/home/
---

<div class="cerb-screenshot">
<img src="/assets/images/guides/records/custom-records/custom-records.png" class="screenshot">
</div>

* TOC
{:toc}

At the core of Cerb is a **record** management system for organizing your team's data. A record is a distinctly identifiable entity.

Two pieces of information are needed to refer to any record:

1. The [**record type**](/docs/records/types/) (e.g. contact, organization, worker).

1. The unique numeric identifier ("**ID**") within that particular record type. IDs are automatically assigned when a new record is created.

# Fields

Each record type has a set of **fields** to describe its attributes. Your `first name` and `age` would be two fields that describe you.

**Fields types** determine what type of data is stored in a field.

|---
| Field Type | Description
|-|-
| [Boolean](/docs/records/fields/types/boolean/) | A *true* or *false* value, represented by `1` or `0` respectively 
| [Context](/docs/records/fields/types/context/) | A [record type](/docs/records/types/)
| [Extension](/docs/records/fields/types/extension/) | A [plugin](/docs/plugins/) extension
| [Float](/docs/records/fields/types/float/) | A floating point number
| [Image](/docs/records/fields/types/images/) | A Base64-encoded images
| [Links](/docs/records/fields/types/links/) | A list of `context:id` pairs representing linked records
| [Number](/docs/records/fields/types/number/) | An integer (whole number)
| [Object](/docs/records/fields/types/object/) | A collection of _keys_ and their associated _values_
| [Text](/docs/records/fields/types/text/) | Free-form text
| [Timestamp](/docs/records/fields/types/timestamp/) | A 64-bit Unix timestamp integer, representing the number of elapsed seconds since January 1, 1970 00:00:00 GMT
| [URL](/docs/records/fields/types/URL/) | A web page URL

Here's what the fields for a basic [worker record](/docs/records/types/worker/) might look like for someone on your team:

|---
| Field | Type | Value
|-|-|-
| ID | Number | `1`
| First name | Text | `Kina`
| Last name | Text | `Halpue`
| Job title | Text | `Support Manager`
| Photo | File | <img src="/assets/images/common/avatars/person2.png" class="screenshot">
| Administrator | Boolean | `yes`
| Email address | Record | `kina@cerb.example`
| Mobile number | Phone | `+1-555-123-4567`
| Location | Text | `Los Angeles, California, USA`
| Gender | Text | `female`
| Created at | Date | `2002-01-09 04:27:01 UTC`
| Updated at | Date | `2018-08-30 10:32:00 UTC`

# Custom Records

While the built-in [record types](/docs/records/types/) cover things that every team has in common, you most likely need to keep track of data that is specific to your team and industry.

In these situations, you can easily [create your own record types](/guides/records/custom-records/).

For instance:

* If you're a transportation company, your conversations may refer to physical trucks, planes, and ships in the real world.

* You can link contacts to records for your products, services, licenses, and subscriptions. During support, everyone on your team will know exactly what your relationship is with each contact.

* An educational institution can create records for students, instructors, courses, and rooms. Those records can then be linked to assets (like tablets and projectors) and support requests. If an instructor opened a support request about their projector being broken, you'd know exactly what model it is and where to find it on campus.

<div class="cerb-screenshot">
<img src="/assets/images/docs/using-cerb/records/custom-records.png" class="screenshot">
</div>

## Related resources

* [Guide: Create custom records](/guides/records/custom-records/)