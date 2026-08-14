---
title: Workflows
excerpt: This page provides an overview of Cerb's Workflow KATA, which allows users
  to create and manage workflows as templates with versioned updates.
summary: This page provides an overview of Cerb's Workflow KATA, which allows users
  to create and manage workflows as templates with versioned updates. These workflows help synchronize related records across
  different environments like development, staging, and production. The page includes
  a sample workflow template for creating tasks with configurable names and owners,
  and explains the schema components such as config, extensions, and records. It details
  how to use placeholders and scripting functions like cerb_workflow_config() and
  cerb_workflow_resources() to dynamically manage workflow configurations and resources.
  The page also outlines the deletion and update policies for records within workflows,
  and provides guidance on using automation scripting filters with workflow placeholders.
permalink: /docs/workflows/
jumbotron:
  title: Workflows
  tagline: Evolving blueprints for records and automations
  breadcrumbs:
  - label: Docs &raquo;
    url: /docs/home/
---

<p class="youtube-video-container"><iframe width="1040" height="585" src="https://www.youtube.com/embed/F0p2INrtq1U" title="" frameBorder="0"  allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" allowFullScreen></iframe></p>

**Workflows** are text-based templates that define a set of records and configuration values. They enable anyone to create and share new features in Cerb, and synchronize ongoing changes between multiple environments (e.g. dev, staging, production).

When a workflow is updated, its changes are automatically recorded in a versioned history. For instance, improvements to a workflow can be made by developers and tested on their own machines in a free, clean copy of Cerb. 

A new version of a workflow can be confidently deployed to a staging or production environment and its records will be automatically synchronized. Changes with unexpected consequences can be easily rolled back to the last stable version.

We provide a [library](/resources/workflows/) of pre-built workflows for common requirements; like email auto-replies, capturing user feedback, customer satisfaction surveys, service level agreements, and more.

Here's a simple workflow KATA template that creates a new task using a configurable name and owner.

{% highlight cerb %}
{% raw %}
workflow:
  name: example.newTask
  version@date: 2025-12-31T00:00:00Z
  description: This example workflow manages a task record
  requirements:
    cerb_version: >=11.0 <12.0
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
      owner_id: {{config.taskOwner_id|default(0)}}
      title: {{config.taskName}}
{% endraw %}
{% endhighlight %}

When you make a changes to a workflow template, any records that were previously created by the workflow are automatically updated to match. The workflow manages the mapping between template "keys" and local record IDs.

* TOC
{:toc}

<div class="cerb-box note">
	<p>
		Editing a workflow-managed record from the interface warns you first, since the next
		synchronization may overwrite the change.
		This applies to <code>automation</code>, <code>automation_event_listener</code>,
		<code>custom_field</code>, <code>custom_fieldset</code>, <code>custom_record</code>,
		<code>mail_routing_rule</code>, and <code>toolbar_section</code> records.
	</p>
</div>

# Workflow KATA

## Schema

{% highlight cerb %}
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
      __lang_code__:
records:
  __record_type__:
    deletionPolicy:
    fields:
    updatePolicy:
{% endhighlight %}

### config:

|---
| **chooser:** | An interactive record chooser.
| **picklist:** | A single-selection dropdown or multiple-selection set of checkboxes.
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

Statically replace configuration values in the template with: `{% raw %}{{config.keyName}}{% endraw %}`

If the configuration value is a `chooser:`, you can expand its dictionary keys like: `{% raw %}{{config.keyName__label}}{% endraw %}`

Workflow placeholders also support automation scripting [filters](/docs/scripting/filters/), such as: `{% raw %}{{config.keyName|lower|sha1}}{% endraw %}`

## Next Steps

* [Workflow Library](/resources/workflows/)