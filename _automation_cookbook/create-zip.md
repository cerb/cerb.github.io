---
title: Create a ZIP attachment
excerpt: Use file.write to create a ZIP archive with arbitrary files
summary: 
layout: integration
jumbotron:
  title: Create a ZIP attachment
  breadcrumbs:
    -
      label: Resources &raquo;
      url: /resources/
    -
      label: Automation Cookbook &raquo;
      url: /resources/automation-cookbook/
---
The `file.write:` command can create a ZIP archive with files from arbitrary text, temporary automation resources, or existing file attachments. You can then use `record.create` to create an attachment to link to other records like tickets, messages etc.
<pre>
<code class="language-cerb">
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
</code>
</pre>

Use this policy:
<pre>
<code class="language-cerb">
{% raw %}
commands:
  file.write:
    allow@bool: yes
  record.create:
    deny/type@bool: {{inputs.record_type is not record type ('attachment')}}
    allow@bool: yes
{% endraw %}
</code>
</pre>