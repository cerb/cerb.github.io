---
title: Add watchers to a record
excerpt: Add watchers to any record with automations.
layout: solution
jumbotron:
  breadcrumbs:
  - label: Resources &raquo;
    url: /resources/
  - label: Solutions Hub &raquo;
    url: /solutions/
  - label: Automations &raquo;
    url: /solutions/#automations
---
Watchers are simply workers linked to a record. So you can very easily add watchers to any record using `record.update` and the `links` field.

The `links` field is an array of record tuples formatted as `type:id`. So to add a watcher, use `worker:id`. Append a `-` to the start to remove a watcher.

{% tabs add_watchers %}

{% tab add_watchers automation %}
{% highlight cerb %}
{% raw %}
start:
  record.update/watcher:
    output: updated_ticket
    inputs:
      record_type: ticket
      record_id: 1
      fields:
        links@list:
          worker:1
          worker:2
          -worker:3
{% endraw %}
{% endhighlight %}
{% endtab %}

{% tab add_watchers policy %}
{% highlight cerb %}
{% raw %}
commands:
  record.update:
    deny/type@bool: {{inputs.record_type is not record type ('ticket')}}
    allow@bool: yes
{% endraw %}
{% endhighlight %}
{% endtab %}

{% endtabs %}
