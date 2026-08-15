---
title: Export Ticket to JSON
excerpt: Export tickets to a downloadable JSON file from their profile page.
summary: This page provides detailed information about the "Export Ticket to JSON"
  workflow in Cerb, which adds a toolbar button to ticket profiles for exporting the
  ticket, its messages, and comments to a downloadable JSON file. It includes sections
  on introduction, installation, usage, and reference. The workflow is compatible with
  Cerb version 11.0 and above. The exported JSON includes ticket metadata, all messages
  with headers and attachments, and all comments. The file is generated as a temporary
  download that expires after 15 minutes.
layout: integration
topic: Workflows
permalink: /workflows/wgm.ticket.export_json/
jumbotron:
  title: Export Ticket to JSON
  tagline: ""
  breadcrumbs:
  - label: Resources &raquo;
    url: /resources/
  - label: Workflows &raquo;
    url: /resources/workflows/
---

* TOC
{:toc}

# Introduction

This workflow adds an **Export (.json)** button to ticket profile toolbars. When clicked, it exports the ticket's details, messages, and comments to a downloadable JSON file.

The exported file includes:

- **Ticket metadata** -- subject, group, bucket, owner, organization, status, and custom fields
- **Messages** -- sender, headers, content (plain text and HTML), and attachments
- **Comments** -- author and attachments

# Installation

Navigate to **Search >> Workflows >> (+) >> Empty**.

Paste the following KATA into the large text box:

{% highlight cerb %}
{% raw %}
workflow:
  name: wgm.ticket.export_json
  description: Export tickets to a downloadable JSON file from their profile page.
  requirements:
    cerb_plugins: cerberusweb.core
    cerb_version: >=11.0 <12.1
  website: https://cerb.ai/
  version: 2026-05-25T20:00:00Z
records:
  automation/automation_ticket_export:
    fields:
      name: wgm.ticket.export.json
      extension_id: cerb.trigger.interaction.worker
      description@text:
      script@raw:
        inputs:
          record/ticket:
            record_type: ticket
            required@bool: yes
            expand: group_,bucket_,owner_,org_,customfields

        start:
          record.search/messages:
            output: messages
            inputs:
              record_type: message
              record_query: ticket.id:${id} sort:id limit:1000
              record_query_params:
                id@int: {{inputs.ticket.id}}
              record_expand: content,content_html,headers,sender_,worker_,attachments

          record.search/comments:
            output: comments
            inputs:
              record_type: comment
              record_query: on.ticket:(id:${id}) sort:id limit:1000
              record_query_params:
                id@int: {{inputs.ticket.id}}
              record_expand: author_,attachments

          set:
            export:
              _meta:
                exported_at: {{'now'|date('c')}}
                exported_by: {{worker__label}}
              ticket@key: inputs:ticket
              messages@key: messages
              comments@key: comments
            json_output: {{export|json_encode|json_pretty}}

          file.write:
            output: download
            inputs:
              content:
                text: {{json_output}}
              name: {{inputs.ticket.mask}}.json
              mime_type: application/json
              expires@date: +15 mins

          await:
            form:
              title: Export Ticket
              elements:
                say/summary:
                  content@text:
                    **Ticket:** [{{inputs.ticket.mask}}] {{inputs.ticket.subject}}
                    **Messages:** {{messages|length}}
                    **Comments:** {{comments|length}}
                fileDownload/file:
                  label: Download:
                  uri: {{download.uri}}
                  filename: {{inputs.ticket.mask}}.json

          return:

      policy_kata@raw:
        commands:
          file.write:
            allow@bool: yes
          record.search:
            allow@bool: yes
  toolbar_section/toolbar_record_profile:
    fields:
      name: Export
      toolbar_name: record.profile
      priority@int: 255
      is_disabled: 0
      toolbar_kata@raw:
        interaction/exportTicketJson:
           uri: cerb:automation:wgm.ticket.export.json
           tooltip: Export ticket to JSON
           icon: download
           label: Export (.json)
           hidden@bool:
             {{record__type is not record type ("ticket")}}
           inputs:
             ticket: {{record_id}}
{% endraw %}
{% endhighlight %}

Click the **Continue** button three times.

# Usage

From any ticket's profile page, click the **Export (.json)** button in the toolbar. The workflow will gather all ticket data, messages, and comments, then present a download link for the JSON file.

The download link expires after 15 minutes.

# Reference

The workflow creates two records:

- **Automation** (`wgm.ticket.export.json`) -- A worker interaction that queries messages and comments, assembles the JSON export, and presents a download form.
- **Toolbar Section** (`Export`) -- Adds the **Export (.json)** button to ticket profile toolbars, visible only on ticket records.

To create a custom version of this workflow, copy the template above and change the workflow `name:` to use your own identifier prefix (e.g. `com.example.ticket.export_json`). Update the automation `name:` and toolbar `uri:` fields to match.
