---
title: Agent Filesystem Records
excerpt: This page provides detailed information about Agent Filesystem records in Cerb, including their structure and usage within the system.
summary: An agent filesystem is a named volume of files that AI agents and workers can both read and write. Automations mount volumes for an agent under the mounts key, which enables a single agent_fs tool covering every mounted volume. Workers browse and edit the same volumes from the Setup Agent Filesystem Terminal using the same command set, so the two views can never drift apart. A ZIP archive can be bulk-imported in the background. This page documents the Records API fields and search filters available on agent filesystem records.
permalink: /docs/records/types/agent_filesystem/
toc:
  title: Agent Filesystem
  expand: Records
jumbotron:
  title: Agent Filesystem
  tagline: ~
  breadcrumbs:
  - label: Docs &raquo;
    url: /docs/home/
  - label: Records &raquo;
    url: /docs/records/
  - label: Types &raquo;
    url: /docs/records/types/
---

|---
|-|-
| **Name (singular):** | Agent Filesystem
| **Name (plural):** | Agent Filesystems
| **Alias (uri):** | agent_filesystem
| **Identifier (ID):** | cerb.contexts.agent.filesystem

* TOC
{:toc}

An **agent filesystem** is a named volume of [agent files](/docs/records/types/agent_file/) that [AI agents](/docs/agents/) and [workers](/docs/workers/) can both read and write. Each volume caches its file count and total size.

<p class="youtube-video-container"><iframe width="1280" height="720" src="https://www.youtube.com/embed/LAy--sYJQYk" title="Agent filesystems and virtual terminal in Cerb 11.2+" frameBorder="0"  allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" allowFullScreen></iframe></p>

A volume's `name` must start with a letter, followed by letters, digits, or dashes.

### Mounting a volume

An [automation](/docs/automations/) makes volumes available to an agent by listing them under `mounts:` on [`llm.agent:`](/docs/automations/commands/llm.agent/):

{% highlight cerb %}
{% raw %}
llm.agent:
  inputs:
    agent: @researcher
    mounts:
      handbook:
        mode: read-only
      scratch:
        mode: read-write
        create@bool: yes
{% endraw %}
{% endhighlight %}

| Key            | Notes                                                                                                                  |
|----------------|------------------------------------------------------------------------------------------------------------------------|
| `filesystem:`  | The source volume, when it differs from the mountpoint key. Accepts a name, an ID, or a `cerb:agent_filesystem:<name>` URI |
| `mode:`        | `read-only` (the default) or `read-write`                                                                              |
| `at:`          | An explicit mountpoint path, overriding the key                                                                        |
| `create@bool:` | Provision the volume by name on first mount. Idempotent, and skipped when simulating                                   |

Writing `mounts:` at all is what enables the `agent_fs` tool. Because **one tool covers every mounted volume**, adding or removing a mount doesn't change the tool's schema -- which means it doesn't invalidate the provider's cached prompt prefix.

An empty `mounts:` block is a valid configuration: it mounts no volumes, but the agent still gets a `/tmp` scratch area.

The same volume can be mounted twice using a `<name>@<suffix>` key.

However a session's `mounts:` resolved on the day it ran, its transcript records the result. A **Filesystem Mounts** panel sits directly below Tools, naming each mountpoint, the volume behind it, that volume's file count and size, and the mode the agent had. `/tmp` appears alongside them as per-run scratch, without a linked record or a file count:

<div class="cerb-screenshot">
<img src="/assets/images/docs/agents/agent-transcript-mounts.png" class="screenshot">
</div>

This is worth knowing about because a mount that can't resolve -- a volume since deleted or disabled -- is skipped silently at run time rather than failing the turn. One unresolvable entry never costs the agent the volumes that do resolve, so a session can have had fewer volumes than its automation asked for, and the transcript is the only place that says so.

### Commands

Agents and workers use the same command set. The tool description is generated from the same source as the terminal's `help` output, so what an agent is told and what a worker sees can't drift apart.

|---
| Command | Notes
|-|-
| `ls` | List one directory
| `find` | Recursive search by name, type, extension, or depth
| `cd` | Change directory; supports `..`, absolute paths, and `@filesystem/path`
| `read` | Read a file, optionally by offset and limit
| `search` | Search file contents
| `write` | Write a file (read-write mounts only)
| `append` | Append to a file (read-write mounts only)
| `edit` | Replace an exact snippet, which must match exactly once (read-write mounts only)
| `copy` | Copy one file; `-f` to overwrite
| `rm` | Delete a file (read-write mounts only)
| `pwd` | Print the working directory
| `help` | Usage for all commands, or one command

<div class="cerb-box note">
	<p>
		There is no <code>move</code> command. Copy the file, then <code>rm</code> the source.
	</p>
</div>

Command output can be piped through a Twig filter chain in place of Unix pipes. Output too large to return inline is spooled to `/tmp` and referenced by path.

### The Setup terminal

Workers browse and edit volumes from **Setup &raquo; Developers &raquo; Agent Filesystem Terminal**, which is restricted to administrators.

### Importing a ZIP archive

A ZIP archive can be uploaded to a volume and imported in the background as a [queue job](/docs/records/types/queue_job/). Progress appears on the filesystem record, and the 'Agent Filesystem' card widget shows the volume's file count, total size, and a history of past imports.

### Records API

These fields are available in the [Records API](/docs/api/endpoints/records/) and [packages](/docs/packages/):

|---
| Req'd | Field | Type | Notes
|:-:|-|-|-
|   | `created_at` | [timestamp](/docs/records/fields/types/timestamp/) | The date/time when this record was created
|   | `description` | [text](/docs/records/fields/types/text/) | A description of this volume
|   | `file_count` | [number](/docs/records/fields/types/number/) | The cached number of files in this volume
|   | `id` | [number](/docs/records/fields/types/number/) | The ID of this volume
|   | `is_disabled` | [boolean](/docs/records/fields/types/boolean/) | Is this volume disabled? (`0` or `1`)
|   | `links` | [links](/docs/records/fields/types/links/) | An array of record `type:id` tuples to link to. Prefix with `-` to unlink.
| **x** | **`name`** | [text](/docs/records/fields/types/text/) | The volume name; must start with a letter, then letters, digits, or dashes
|   | `total_bytes` | [number](/docs/records/fields/types/number/) | The cached total size of this volume, in bytes
|   | `type` | [text](/docs/records/fields/types/text/) | The volume type
|   | `updated_at` | [timestamp](/docs/records/fields/types/timestamp/) | The date/time when this record was last modified

### Search Query Fields

These [filters](/docs/search/#filters) are available in agent filesystem [search queries](/docs/search/):

|---
| Field | Type | Description
|-|-|-
| `created` | date | When the record was created
| `fieldset` | virtual | Filter by [custom fieldset](/docs/records/types/custom_fieldset/)
| `id` | number | The record ID
| `name` | text | The volume name (partial match)
| `updated` | date | When the record was last modified
| `watchers` | virtual | Filter by [watchers](/docs/watchers/)
