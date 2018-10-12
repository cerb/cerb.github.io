---
title: Record Fields
permalink: /docs/records/fields/
toc:
  title: Fields
jumbotron:
  title: Fields
  tagline: 
  breadcrumbs:
  -
    label: Docs &raquo;
    url: /docs/home/
  -
    label: Records &raquo;
    url: /docs/records/
---

Each record type has a set of **fields** to describe its attributes. Your `first name` and `age` would be two fields that describe you.

Fields have types that determine what type of data they store. For instance: text, number, date, picklist, yes/no, file, record link, etc.

Here's what the fields for a basic [worker](/docs/workers/) record might look like for someone on your team:

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
