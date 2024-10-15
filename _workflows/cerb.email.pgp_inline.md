---
title: PGP Inline Encryption
excerpt: Encrypt messages with PGP and paste them inline in outgoing email
layout: integration
topic: Workflows
permalink: /workflows/cerb.email.pgp_inline/
jumbotron:
  title: PGP Inline Encryption
  tagline: ""
  breadcrumbs:
  -
    label: Resources &raquo;
    url: /resources/
  -
    label: Workflows &raquo;
    url: /resources/workflows/
---

* TOC
{:toc}

# Introduction

This workflow adds inline PGP encryption when composing and replying to email.

# Installation

This workflow is built into Cerb [11.0+](/releases/11.0/). It will automatically update.

You can enable it from **Search >> Workflows >> (+) >> PGP Inline Encryption**.

# Reference

You can build your own PGP Inline Encryption workflow using this template as a reference.

Change occurrences of **cerb.email.pgp_inline** to your own workflow identifier. Use a prefix based on a domain you own (e.g. `com.example.workflow`).

<pre style="max-height: 29.25em;">
<code class="language-cerb">
{% raw %}
workflow:
  name: cerb.email.pgp_inline
  version: 2024-10-14T00:00:00Z
  description: Encrypt messages with PGP and paste them inline in outgoing email
  requirements:
    cerb_version: >=11.0 <11.1
    cerb_plugins: cerberusweb.core

records:
  automation/pgp_encrypt_interaction:
    fields:
      name: cerb.email.pgpInline.interaction
      extension_id: cerb.trigger.interaction.worker
      description: Encrypt messages with PGP and paste them inline in outgoing email
      script@raw:
        start:
          await:
            form:
              title: Encrypt message
              elements:
                textarea/prompt_message:
                  label: Message:
                  required@bool: yes

                sheet/prompt_recipient_keys:
                  label: Recipient public keys:
                  required@bool: yes
                  data:
                    automation:
                      uri: cerb:automation:cerb.data.records
                      inputs:
                        record_type: gpg_public_key
                  limit: 10
                  schema:
                    layout:
                      headings@bool: no
                      paging@bool: yes
                      filtering@bool: yes
                    columns:
                      selection/id:
                        params:
                          mode: multiple
                      card/_label:
                        params:
                          bold@bool: yes

          encrypt.pgp:
            output: encrypted_message
            inputs:
              message@key: prompt_message
              public_keys:
                ids@key: prompt_recipient_keys

          return:
            snippet@key: encrypted_message
      policy_kata@raw:
        commands:
          encrypt.pgp:
            allow: yes

  toolbar_section/reply_pgp:
    fields:
      name: Inline PGP Encryption
      priority: 10
      toolbar_name: mail.reply
      toolbar_kata@raw:
        interaction/encryptWithPGP:
          uri: cerb:automation:cerb.email.pgpInline.interaction
          tooltip: Encrypt with PGP
          icon: message-lock
{% endraw %}
</code>
</pre>