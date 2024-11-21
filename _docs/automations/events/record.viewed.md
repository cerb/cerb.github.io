---
title: record.viewed
excerpt: This page provides information about the "record.viewed" automation events
  in Cerb, which are triggered after a worker views a record profile.
summary: This page provides information about the "record.viewed" automation events
  in Cerb, which are triggered after a worker views a record profile. It details the
  placeholders available in the automation event dictionary, including keys for the
  viewed record and the current worker, both of which support key expansion. The page
  notes that there are no outputs associated with this event.
permalink: /docs/automations/events/record.viewed/
toc:
  title: record.viewed
  expand: Automations
jumbotron:
  title: record.viewed
  tagline: ~
  breadcrumbs:
  - label: Docs &raquo;
    url: /docs/home/
  - label: Automations &raquo;
    url: /docs/automations/
  - label: Events &raquo;
    url: /docs/automations/#events
---

**record.viewed** [automation](/docs/automations/) [events](/docs/automations/#events) are invoked after a [worker](/docs/workers/) views a [record](/docs/records/) profile.

# Placeholders

The automation event [dictionary](/docs/automations/#dictionaries) starts with the following values:

| Key        | Type   | Notes                                                                                 |
|------------|--------|---------------------------------------------------------------------------------------|
| `record_*` | record | The viewed [record](/docs/records/) dictionary. Supports key expansion.               |
| `worker_*` | record | The current [worker](/docs/records/types/worker/) dictionary. Supports key expansion. |

# Outputs

(none)