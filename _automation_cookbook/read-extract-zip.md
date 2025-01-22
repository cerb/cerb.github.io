---
title: Extract files from a ZIP archive
excerpt: Read a ZIP manifest and extract files from an attachment record.
summary: "This page explains how to read and extract specific files from a ZIP attachment using Cerb's 
  `data.query:` and `file.read:` commands. It provides step-by-step examples of how to read the 
  manifest of a `.zip` attachment record, filter extracted files based on filename patterns, 
  extract a specific file path, and decompress gzip files, as well as implement deny policies 
  for these commands to restrict access."
layout: integration
jumbotron:
  title: Read and extract from a ZIP
  breadcrumbs:
    -
      label: Resources &raquo;
      url: /resources/
    -
      label: Automation Cookbook &raquo;
      url: /resources/automation-cookbook/
---
Using [data.query:](https://cerb.ai/docs/automations/commands/data.query/) and [file.read:](https://cerb.ai/docs/automations/commands/file.read/) you can read and extract specific files from a ZIP attachment.

First, read the manifest of a `.zip` attachment record:

<pre>
<code class="language-cerb">
{% raw %}
start:
  data.query/zip:
    inputs:
      query@text:
        type:attachment.manifest
        id:1234
        format:dictionaries
    output: results
{% endraw %}
</code>
</pre>

Then, use `filter:` to look for specific filename patterns:

<pre>
<code class="language-cerb">
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
</code>
</pre>

Then, extract a specific file path from the ZIP:

<pre>
<code class="language-cerb">
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
</code>
</pre>

Use this policy:
<pre>
<code class="language-cerb">
{% raw %}
commands:
  data.query:
    deny/type@bool: {{query.type != 'attachment.manifest'}}
    allow@bool: yes
  file.read:
    allow@bool: yes
{% endraw %}
</code>
</pre>