---
title: record.changed
excerpt: This page provides information on the "record.changed" automations in Cerb,
  which are triggered when one or more fields of a record are modified.
summary: This page provides information on the "record.changed" automations in Cerb,
  which are triggered when one or more fields of a record are modified. It explains
  that this trigger utilizes event handler KATA, executing the first enabled automation.
  The page details the inputs available in the automation dictionary, including keys
  like `actor_*`, `change_type`, `inputs`, `record_*`, and `was_record_*`, each with
  specific roles and types. There are no outputs specified for this automation.
permalink: /docs/automations/triggers/record.changed/
toc:
  title: record.changed
  expand: Automations
jumbotron:
  title: record.changed
  tagline: ~
  breadcrumbs:
  - label: Docs &raquo;
    url: /docs/home/
  - label: Automations &raquo;
    url: /docs/automations/
  - label: Triggers &raquo;
    url: /docs/automations/#triggers
---

**record.changed** [automations](/docs/automations/) are triggered when one or more record fields change.

This trigger uses [event handler](/docs/automations/#events) KATA, and the first enabled automation is executed.

* TOC
{:toc}

# Inputs

The automation [dictionary](/docs/automations/#dictionaries) starts with the following values:

| Key            | Type       | Notes                                                                         |
|----------------|------------|-------------------------------------------------------------------------------|
| `actor_*`      | record     | The current actor dictionary. Supports key expansion.                         |
| `change_type`  | string     | `created`, `updated`, or `deleted`                                            |
| `inputs`       | dictionary | [Custom input](/docs/automations/#inputs) values from the caller.             |
| `record_*`     | record     | The new [record](/docs/records/types/) dictionary. Supports key expansion.    |
| `was_record_*` | record     | The former [record](/docs/records/types/) dictionary. Supports key expansion. |

# Outputs

(none)
