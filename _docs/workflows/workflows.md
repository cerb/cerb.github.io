---
title: Workflows
excerpt: 
permalink: /docs/workflows/
jumbotron:
  title: Workflows
  tagline: Evolving blueprints for records and automations
  breadcrumbs:
  -
    label: Docs &raquo;
    url: /docs/home/
---

**Workflows** are templates with versioned updates that keep a related set of records in sync between multiple environments (e.g. dev, staging, production).

|---
| **Since version:** | [10.5](/releases/10.5/)
| **Found at:** | Search >> Workflows

Here's a simple workflow KATA template that creates a new task using a configurable name and owner.

```yaml
workflow:
  name: example.newTask
  version@date: 2025-12-31T00:00:00Z
  description: This example workflow manages a task record
  requirements:
    cerb_version: >=10.5 <11.0
    cerb_plugins: cerberusweb.core,
  config:
    text/taskName:
      label: Task name:
      default: New task from a workflow
    chooser/taskOwner:
      label: Task owner:
      multiple@bool: no
      record_type: worker
      record_query: isDisabled:n

records:
  task/newTask:
    deletionPolicy: retain
    fields:
      owner_id: $${config.taskOwner_id|default(0)}
      title: $${config.taskName}
```

When you make a changes to a workflow template, any records that were previously created by the workflow are automatically updated to match. The workflow manages the mapping between template "keys" and local record IDs.

* TOC
{:toc}

# Workflow KATA

## Schema

```text
config:
  chooser:
    default:
    label:
    multiple@bool:
    record_query:
    record_type:
  text:
    default:
    label:
extensions:
  activity:
    id:
    label:
    message:
  permission:
    id:
    label:
  translation:
    id:
    langs:
      {lang_code}:
records:
  {type}:
    deletionPolicy:
    fields:
    updatePolicy:
```

### config:

|---
| **chooser:** | An interactive record chooser.
| **text:** | A text input. 

### extensions:

|---
| **activity:** | Add new activity log events.
| **permission:** | Add new custom role permissions.
| **translation:** | Add new translation phrases.

### records:

Each record is defined with a [record type](/docs/records/types/) and unique key.

For example: `task/newTask:`

|---
| **deletionPolicy:** | If `retain` the record won't be deleted when removed from the workflow template.
| **fields:** | A list of record [fields](/docs/records/#fields) to update.
| **updatePolicy:** | An optional comma-separated list of `fields` to update on subsequent changes after a record is created. If omitted, all fields are set on creation and changes. If included and blank, fields are created but not updated (e.g. persist user-level changes to snippet content).

## Placeholders

To avoid conflicts with the usual `{% raw %}{{placeholder}}{% endraw %}` syntax found in records like automations and snippets, Workflow KATA provides two special scripting functions: [cerb_workflow_config()](/docs/scripting/functions/#cerb_workflow_config) and [cerb_workflow_resources()](/docs/scripting/functions/#cerb_workflow_resources).

From any feature that supports automation scripting (e.g. automations, workflows, snippets) you can use `{% raw %}{{cerb_workflow_config('workflow_name')}}{% endraw %}` to dynamically read workflow configuration values at runtime. For instance, you can create a workflow just for sharing values (e.g. API keys) between multiple workflows.

Read a single key with a default value using: `{% raw %}{{cerb_workflow_config('workflow_name','hashSecret','default')}}{% endraw %}`

The `{% raw %}{{cerb_workflow_resources('workflow_name')}}{% endraw %}` function performs runtime lookups and returns a map of workflow resources and their local record IDs. This is useful from automations, event listeners, and toolbars.

Statically replace configuration values in the template with: `$${config.keyName}`

If the configuration value is a `chooser:`, you can expand its dictionary keys like: `$${config.keyName__label}`

Workflow placeholders also support automation scripting [filters](/docs/scripting/filters/), such as: `$${config.keyName|lower|sha1}`
