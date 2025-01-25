---
title: Extract files from a ZIP archive
excerpt: Read a ZIP manifest and extract files from an attachment record.
summary: "This page explains how to read and extract specific files from a ZIP attachment using Cerb's 
  `data.query:` and `file.read:` commands. It provides step-by-step examples of how to read the 
  manifest of a `.zip` attachment record, filter extracted files based on filename patterns, 
  extract a specific file path, and decompress gzip files, as well as implement deny policies 
  for these commands to restrict access."
layout: automation-cookbook
jumbotron: []
---

Using [data.query:](https://cerb.ai/docs/automations/commands/data.query/) and [file.read:](https://cerb.ai/docs/automations/commands/file.read/) you can read and extract specific files from a ZIP attachment.

## Read a ZIP archive manifest 

{% tabs example %}

{% tab example automation %}
```cerb
{% raw %}
start:
  data.query/zip:
    inputs:
      query@text:
        type:attachment.manifest
        id:1234
        filter:*.txt
        format:dictionaries
    output: results
{% endraw %}
```

The optional `filter:` key matches a filename pattern with `*` as wildcards. 
{% endtab %}

{% tab example policy %}
```cerb
{% raw %}
commands:
  data.query:
    deny/type@bool: {{query.type != 'attachment.manifest'}}
    allow@bool: yes
{% endraw %}
```
{% endtab %}

{% endtabs %}

## Extract a specific file path from a ZIP archive

{% tabs example %}

{% tab example automation %}
```cerb
{% raw %}
start:
  file.read:
    output: file_contents
    inputs:
      uri: cerb:attachment:1234
      extract: README.txt
      filters:
        gzip.decompress:
{% endraw %}
```
{% endtab %}

{% tab example policy %}
```cerb
{% raw %}
commands:
  file.read:
    allow@bool: yes
{% endraw %}
```
{% endtab %}

{% endtabs %}
