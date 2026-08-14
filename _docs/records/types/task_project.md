---
title: Task Project Records
excerpt: This page provides detailed information about Task Project records in Cerb, including their structure and usage within the system.
summary: A task project groups related tasks together and shares ownership across them. Tasks gain a project and an active flag, and a project's permissions carry through to the tasks inside it. Task projects also back the Daily Task Board workspace tab, where each project can be given an accent color and ordered. This page documents the Records API fields, search filters including the tasks deep filter, and the Tasks distribution bar column available on task project worklists.
permalink: /docs/records/types/task_project/
toc:
  title: Task Project
  expand: Records
jumbotron:
  title: Task Project
  tagline: ~
  breadcrumbs:
  - label: Docs &raquo;
    url: /docs/home/
  - label: Records &raquo;
    url: /docs/records/
  - label: Types &raquo;
    url: /docs/records/types/
---

|---
|-|-
| **Name (singular):** | Task Project
| **Name (plural):** | Task Projects
| **Alias (uri):** | task_project
| **Identifier (ID):** | cerb.contexts.task.project

* TOC
{:toc}

A **task project** groups related [tasks](/docs/records/types/task/) together and shares ownership across them. A task's permissions derive from its project, so granting someone access to a project grants it for the work inside it.

### Ownership

A project is owned by an actor -- a [worker](/docs/records/types/worker/), [group](/docs/records/types/group/), [role](/docs/records/types/role/), or the application itself -- using the `owner__context` and `owner_id` pair. That ownership is what the tasks inside the project inherit.

### Closing a project

`is_closed` marks a project finished. Closed and unreadable projects are dropped from the [Daily Task Board](/docs/workspaces/#daily-task-board) gracefully, rather than erroring.

### The Tasks column

Task project [worklists](/docs/worklists/) offer a 'Tasks' distribution bar column showing how the project's tasks are split between **done**, **stashed**, **todo**, and **in-progress** -- so a project that has quietly stalled is visible without opening it.

### Daily Task Board

Task projects are what the [Daily Task Board](/docs/workspaces/#daily-task-board) workspace tab organizes work by. Each board picks which projects appear, gives them accent colors, and orders them; every worker then overlays a personal selection and order on top.

### Records API

These fields are available in the [Records API](/docs/api/endpoints/records/) and [packages](/docs/packages/):

|---
| Req'd | Field | Type | Notes
|:-:|-|-|-
|   | `created_at` | [timestamp](/docs/records/fields/types/timestamp/) | The date/time when this record was created
|   | `id` | [number](/docs/records/fields/types/number/) | The ID of this project
|   | `is_closed` | [boolean](/docs/records/fields/types/boolean/) | Is this project closed? (`0` or `1`)
|   | `links` | [links](/docs/records/fields/types/links/) | An array of record `type:id` tuples to link to. Prefix with `-` to unlink.
| **x** | **`name`** | [text](/docs/records/fields/types/text/) | The name of this project
| **x** | **`owner__context`** | [context](/docs/records/fields/types/context/) | The [record type](/docs/records/types/) of the owner
| **x** | **`owner_id`** | [number](/docs/records/fields/types/number/) | The ID of the owner
|   | `updated_at` | [timestamp](/docs/records/fields/types/timestamp/) | The date/time when this record was last modified

### Search Query Fields

These [filters](/docs/search/#filters) are available in task project [search queries](/docs/search/):

|---
| Field | Type | Description
|-|-|-
| `closed` | boolean | Is the project closed?
| `created` | date | When the record was created
| `fieldset` | virtual | Filter by [custom fieldset](/docs/records/types/custom_fieldset/)
| `id` | number | The record ID
| `name` | text | The project name (partial match)
| `owner` | virtual | Filter by the project's owner
| `tasks` | virtual | A [deep search](/docs/search/#deep-search) on the [tasks](/docs/records/types/task/) within the project
| `updated` | date | When the record was last modified
| `watchers` | virtual | Filter by [watchers](/docs/watchers/)

The `tasks:` filter matches any task filter against the project's tasks, so a project can be found by the properties of the work inside it:

{% highlight text %}
tasks:(status:open owner:me)
{% endhighlight %}
