---
title: Create a ZIP attachment
excerpt: Use `file.write:` to create a ZIP archive with arbitrary files.
summary: This page explains how to create a ZIP attachment using the `file.write`
  command in Cerb. It shows an example of how to write a ZIP archive with two files
  (a README file and a Dockerfile) and then use `record.create` to create an attachment
  that links to the newly created ZIP file.
layout: solution
jumbotron: []
social_image_url: /assets/images/solutions/automations/create-zip.png
redirect_from:
- /automation/cookbook/create-zip/
---

## Create a ZIP attachment using file.write

The [file.write:](https://cerb.ai/docs/automations/commands/file.write/) command can create a ZIP archive with files from arbitrary text, temporary automation resources, or existing file attachments. You can then use [record.create:](https://cerb.ai/docs/automations/commands/record.create/) to create an attachment to link to other records like tickets, messages, etc.

{% tabs create_zip %}

{% tab create_zip automation %}
```cerb
{% raw %}
start:
  file.write:
    output: tmp_file
    inputs:
      mime_type: application/zip
      content:
        zip:
          files:
            file/readme:
              path: README.txt
              bytes@text:
                This is the README file.
            file/docker:
              path: docker/Dockerfile
              bytes@text:
                FROM ubuntu:24.04
  
  record.create/file:
    output: new_file
    inputs:
      record_type: attachment
      fields:
        name: example.zip
        mime_type: application/vnd.cerb.uri
        content: {{tmp_file.uri}}
{% endraw %}
```
{% endtab %}

{% tab create_zip policy %}
```cerb
{% raw %}
commands:
  file.write:
    allow@bool: yes
  record.create:
    deny/type@bool: {{inputs.record_type is not record type ('attachment')}}
    allow@bool: yes
{% endraw %}
```
{% endtab %}

{% endtabs %}