---
title: Custom Fields
permalink: /docs/custom-fields/
jumbotron:
  title: Custom Fields
  tagline: Add your own attributes to any record type
  breadcrumbs:
  -
    label: Docs &raquo;
    url: /docs/home/
  -
    label: Records &raquo;
    url: /docs/records/
---

**Custom fields** can be added to any [record](/docs/records/) [type](/docs/records/types/) based on the specific needs of your team.

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
| Latitude/Longitude | Geospatial coordinates for a point on Earth | `52.504043, 13.393236`
| List | A freeform list of text-based options | `trim-leather, color-silver`
| Multiple Checkboxes | Multiple selections from a pre-defined list of options (e.g. phone, email, sms) | `sms`
| Number | A whole number | `8080`
| Picklist | A selection from a pre-defined list of options (e.g. red, green, blue) | `red`
| Record Link | A link to record ID of a specific type. This creates a reciprocal [search filter](/docs/search/) on the target record. | `task:123`
| Record Links | Multiple links to record IDs of a specific type. This creates a reciprocal [search filters](/docs/search/) on the target records. | `task:123,task:456`
| Text: Multiple Lines | Multiple lines of freeform text entry | `Client agrees to the project changes discussed on 11/Aug conference call`
| Text: Single Line | A single line of freeform text entry | `bank transfer`
| URL | A hyperlink URL to a web-based resource | `https://cerb.ai/`
| Worker | A single worker record. This creates a reciprocal [search filter](/docs/search/) on worker records.  | `Kina Halpue`

Custom fields can be added directly an existing record type. They will be visible on every record of that type.

<div class="cerb-screenshot">
<img src="/assets/images/docs/using-cerb/records/custom-fields.png" class="screenshot">
</div>
