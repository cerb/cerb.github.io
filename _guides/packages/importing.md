---
title: Import a package
excerpt: Packages can be imported from setup, bots, and the API.
social_image_url: /assets/images/guides/packages/packages.png
layout: integration
topic: Packages
jumbotron:
  title: Importing packages
  tagline: ""
  breadcrumbs:
  -
    label: Resources &raquo;
    url: /resources/
  -
    label: Guides &raquo;
    url: /resources/guides/
  -
    label: Packages &raquo;
    url: /resources/guides/#packages
---

<div class="cerb-screenshot">
<img src="/assets/images/guides/packages/packages.png" class="screenshot">
</div>

* TOC
{:toc}

{% comment %}
* Import from API
* Import from bots
* Import from UI
{% endcomment %}

# What are packages?

{% comment %}
<div class="cerb-screenshot">
<img src="/assets/images/guides/packages/create/cerb-bots-banner.png" class="screenshot">
</div>
{% endcomment %}

**Packages** are a blueprint for importing a related set of pre-configured records into Cerb. A single package can contain workspaces, dashboards, bots, project boards, custom records, custom fieldsets, tasks, tickets, contacts, etc.

You can [build your own packages](/guides/packages/building/) or import them from our [package library](/resources/packages/).

# Importing packages

Packages can be imported from [setup](/docs/setup/), [bots](/docs/bots/), and the [API](/docs/api/).

Here's an example package for testing imports:

<pre style="max-height:29.5em;">
<code class="language-json">
{% raw %}
{
  "package": {
    "name": "Example Package"
  },
  "records": [
    {
      "uid": "task_001",
      "_context": "task",
      "title": "Import your first package",
      "status": "closed"
    }
  ]
}
{% endraw %}
</code>
</pre>

## Setup

Administrators can quickly import packages from their web browser:

1. Copy a package to your clipboard.

1. Navigate to **Setup >> Configure >> Import Package**.

1. Paste the package into the text box.

1. Click the **Import** button.

Depending on the package, you may be prompted for some configuration options.  If so, enter your preferences and click the **Import** button again.

Once a package has been imported, you'll see a summary of all the records that have been created.

<div class="cerb-screenshot">
<img src="/assets/images/guides/packages/importing/setup-imported.png" class="screenshot">
</div>

You can click on the records to open their card popups.

## Bots

Bots can import packages using the **Package Import** action from any behavior.  This is currently only available to app-owned bots.

<div class="cerb-screenshot">
<img src="/assets/images/guides/packages/importing/bot-import-package.png" class="screenshot">
</div>

Paste the package into the **Package:** field.

In **Params:** you can provide the preferred values for any prompted placeholders required by the package. This is a simple JSON object with keys matching the `configure > prompts` section of the package.

In the example above, we're building the JSON object with the [dict_set()](/docs/bots/scripting/functions/#dict_set) function, which automatically handles escaping for us.

The action returns a placeholder named `_results` with details about the created records in the format:

<pre>
<code class="language-json">
{% raw %}
{
  "cerberusweb.contexts.task": {
    "task_001": {
      "id": "258",
      "label": "Import a package from bots"
    }
  }
}
{% endraw %}
</code>
</pre>

The results object is keyed by record type.  Each record type contains an object keyed by `uid`, with an `id` and `label` for each record created.

## API

You can use [/packages/import.json](/docs/api/endpoints/packages/) to import packages using the API.