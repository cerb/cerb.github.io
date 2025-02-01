---
title: Search records with a query
excerpt: Search records with an arbitrary query and save the results into a variable.
summary: This page provides instructions on using the `record.search` command in Cerb
  to query and load records for automation purposes. It includes examples of how to
  find open tickets and workers who have been active within the past 30 minutes. The
  page also outlines the policies for these queries, specifying conditions under which
  the `record.search` command is allowed or denied based on the type of record being
  queried.
layout: solution
redirect_from:
- /automation/cookbook/search-records/
jumbotron:
  breadcrumbs:
  - label: Resources &raquo;
    url: /resources/
  - label: Solutions Hub &raquo;
    url: /solutions/
  - label: Automations &raquo;
    url: /solutions/#automations
social_image_url: /assets/images/solutions/automations/search-records.png
---

[record.search:](https://cerb.ai/docs/automations/commands/record.search/) can be used to load records and make them available to an automation.

## Find open tickets:

{% tabs search_records %}

{% tab search_records automation %}
```cerb
{% raw %}
start:
  record.search:
    inputs:
      record_type: ticket
      record_query: status:o
    output: results
{% endraw %}
```
{% endtab %}

{% tab search_records policy %}
```cerb
{% raw %}
commands:
  record.search:
    deny/type@bool: {{inputs.record_type is not record type ('ticket')}}
    allow@bool: yes
{% endraw %}
```
{% endtab %}

{% endtabs %}

## Find workers active within the past 30 minutes:

{% tabs search_records %}

{% tab search_records automation %}
```cerb
{% raw %}
start:
  record.search:
    inputs:
      record_type: worker
      record_query: isDisabled:no lastActivity:${when}
      record_query_params:
        when: -30 mins
    output: results
{% endraw %}
```
{% endtab %}

{% tab search_records policy %}
```cerb
{% raw %}
commands:
  record.search:
    deny/type@bool: {{inputs.record_type is not record type ('worker')}}
    allow@bool: yes
{% endraw %}
```
{% endtab %}

{% endtabs %}