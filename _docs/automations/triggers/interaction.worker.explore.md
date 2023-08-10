---
title: "interaction.worker.explore"
excerpt: interaction.worker.explore automations use custom logic to return the next record in explore mode. 
#social_image_url: /assets/images/search/kata.png
permalink: /docs/automations/triggers/interaction.worker.explore/
toc:
  title: interaction.worker.explore
  expand: Automations
jumbotron:
  title: interaction.worker.explore
  tagline: 
  breadcrumbs:
  -
    label: Docs &raquo;
    url: /docs/home/
  -
    label: Automations &raquo;
    url: /docs/automations/
  -
    label: Triggers &raquo;
    url: /docs/automations/#triggers
---

**interaction.worker.explore** [automations](/docs/automations/) are worker-based [interactions](/docs/interactions/) that use custom logic to return the next record in explore mode.

For example:

* A custom explore mode could track a specific [worklist](/docs/worklists/) to always display the top unseen record. This would include records that were added to the list after explore mode started.
* An onboarding tour could walk a worker through various pages and explain their functionality.

# Inputs

An interaction automation [dictionary](/docs/automations/#dictionaries) starts with the following input values:

| Key            | Type       | Notes                                                                            |
|----------------|------------|----------------------------------------------------------------------------------|
| `explore_hash` | string     | The unique identifier of the explore set.                                        |
| `explore_page` | string     | The custom page action returned by `await:explore:` (e.g. `next`)                |
| `inputs`       | dictionary | [Custom input](/docs/automations/#inputs) values from the caller.                |
| `worker_*`     | record     | The active [worker](/docs/records/types/worker/) record. Supports key expansion. |

# Outputs

## await:explore:

When suspending in the `await:explore:` state, the interaction displays the next record in an explore set.

<pre>
<code class="language-cerb">
await:
  explore:
    title: The title of the explore set
    url: The URL of the next item
    label: The optional label for the next item
    toolbar:
      interaction/next:
        label: Next
        icon: chevron-right
        icon_at: end
        keyboard: ]
</code>
</pre>