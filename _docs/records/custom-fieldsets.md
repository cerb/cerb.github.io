---
title: Custom Fieldsets
permalink: /docs/custom-fieldsets/
jumbotron:
  title: Custom Fieldsets
  tagline: 
  breadcrumbs:
  -
    label: Docs &raquo;
    url: /docs/home/
  -
    label: Records &raquo;
    url: /docs/records/
---

You can group related [custom fields](/docs/custom-fields/) together into a **fieldset**. When a fieldset is optionally added to a record, it includes all of its fields at the same time. 

For instance, you could add this _"SLA"_ (Service Level Agreement) fieldset to [organization](/docs/orgs/) records:

|---
| Field | Type | Value
|-|-|-
| Level | picklist (Standard, Priority, Enterprise) | `Enterprise`
| Expires | date | `2025-12-31 23:59:59 UTC`

Every time a new ticket is opened, a [bot](/docs/bots/) could check the sender's SLA to determine the assignment and due date (but only if that obligation hasn't expired). Bots could also remind a client to renew when their SLA is about to expire.

Fieldsets can be used to further subdivide a broad record type into classifications. For instance, asset records could have custom fieldsets for _"Vehicle"_ and _"Computer"_. You could then create a list of only assets that are vehicles based on their color, mileage, passenger capacity, etc.
