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

**interaction.worker.explore** [interactions](/docs/interactions/) use custom logic to return the next record in a dynamic explore set.

Currently, explore mode uses a static point-in-time snapshot of a worklist for the first 1,000 records. This ignores new higher priority records that entered a worklist after explore started, and it includes records that may have been handled recently by other workers.

With dynamic explore mode, a 'next' button can determine the next most important task in real-time (including new records and excluding records that no longer match filters).

The interaction is expected to return `await:explore:` with a title, url, and optional label for the next URL to visit. The interaction receives inputs for `explore_hash:`, `explore_page:` and the current worker.

A custom conditional toolbar can be displayed with each URL. The toolbar interactions can be interactive or headless, and they can return an `explore_page:` for navigating the explore set  (e.g. back/next).

For convenience, named toolbar buttons (e.g. `interaction/next:`) can also be defined without an automation `uri:`, where the name will be treated as the `explore_page:` action.

Custom keyboard shortcuts can be assigned to each toolbar button. This will significantly optimize workflows that involve visiting a set of records/URLs (e.g. dispatch, finding a next assignment, etc).

Explore sets are created with [api.command:](/docs/automations/commands/api.command/) in automations.

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

Interactions in a custom [toolbar](/docs/toolbars/) can use the following `after:` options:

| Key | Type | 
|---
| `explore_page:`    | string | A default for the next page in the explore set when the interaction doesn't return one.
| `refresh_widgets@list:` | array | Refresh widgets if the current page is a record profile.