---
title: Create a comment
excerpt: Use `record.create:` to create a comment on any record.
summary: "This page explains how to create a comment on any record using the `record.create` command in 
  Cerb. It also provides examples of how to specify the author, target record, and other fields 
  for the comment, as well as an example of how to implement a deny policy for the 
  `record.create` command to only allow comments on records of type `comment`."
layout: automation-cookbook
jumbotron: []
---

You can use [record.create:](https://cerb.ai/docs/automations/commands/record.create/) to create a [comment](/docs/comments/) on any [record](/docs/records/).

## Create a formatted comment as Cerb on a ticket record

{% tabs example %}

{% tab example automation %}
```cerb
{% raw %}
start:
  record.create/comment:
    output: new_comment
    inputs:
      record_type: comment
      fields:
        author__context: app
        author_id@int: 0
        target__context: ticket
        target_id@int: 123
        is_markdown@int: 1
        comment@text:
          This is a **comment** from an automation.
{% endraw %}
```

|---
| Field |
|-|-
| `author__context:` | [record type](/docs/records/types/) of author (`app`, `role`, `group`, `worker`)
| `target__context:` | [record type](/docs/records/types/) to comment on (`ticket`, `message`, `task`, etc.)
{% endtab %}

{% tab example policy %}
```cerb
{% raw %}
commands:
  record.create:
    deny/type@bool: {{inputs.record_type is not record type ('comment')}}
    allow@bool: yes
{% endraw %}
```
{% endtab %}

{% endtabs %}
