---
title: 'Automations: record.upsert'
excerpt: This page provides detailed information on the "record.upsert" command in
  Cerb automations, which is used to create or update records with specified fields.
summary: This page provides detailed information on the "record.upsert" command in
  Cerb automations, which is used to create or update records with specified fields.
  It outlines the syntax and parameters required for the command, including inputs
  like `record_type`, `record_query`, and `fields`, as well as options to handle events
  and errors. The page also explains how to manage outputs and simulate commands,
  offering guidance on handling success and error scenarios with specific commands
  and placeholders. This documentation is essential for users looking to automate
  record management in Cerb effectively.
permalink: /docs/automations/commands/record.upsert/
toc:
  title: record.upsert
  expand: Automations
jumbotron:
  title: record.upsert
  tagline: ~
  breadcrumbs:
  - label: Docs &raquo;
    url: /docs/home/
  - label: Automations &raquo;
    url: /docs/automations/
  - label: Commands &raquo;
    url: /docs/automations/#commands
---

The **record.upsert:** command creates or updates a record with the given fields.

{% highlight cerb %}
{% raw %}
start:
  record.upsert:
    output: record
    inputs:
      record_type: task
      record_query: name:"This is a new task" status:open
      # See: https://cerb.ai/docs/records/types/task/#records-api
      fields:
        importance: 75
{% endraw %}
{% endhighlight %}

* TOC
{:toc}

# Syntax

## inputs:

| Key | 
|-|-
| `record_type:` | The [record type](/docs/records/types/) to create.
| `record_query:` | The [search query](/docs/search/) to match. With `0` matches the record is created. With `1` match the existing record is updated. The [on_error:](#on_error) event is triggered otherwise. Use `limit:1` and `sort:` in the `record_query:` to reduce multiple matches into one.
| `record_query_params:` | Query parameters with untrusted user input as keys/values. Reference these as `${param}` in queries.
| `fields:` | The [fields](/docs/records/#fields) to set based on the record type.
| `disable_events@bool:` | Avoid triggering events for created or updated records.

## output:

Save the record dictionary to this placeholder.

## on_simulate:

The [commands](/docs/automations/#commands) to run during simulation instead of updating the record.

If omitted, the record is updated during simulation.

## on_success:

The [commands](/docs/automations/#commands) to run on success.

The `output:` placeholder is a dictionary based on the record type.

## on_error:

The [commands](/docs/automations/#commands) to run on failure. If omitted, the automation exits in the `error` [state](/docs/automations/#exit-states).

The `output:` placeholder receives a dictionary with these keys:

| Key |
|-|-
| `error` | The error message.