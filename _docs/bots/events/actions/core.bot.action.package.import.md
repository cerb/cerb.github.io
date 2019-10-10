---
title: >-
  Bot Action: Package import
permalink: /docs/bots/events/actions/core.bot.action.package.import/
toc:
  expand: Bots
jumbotron:
  title: >-
    Package import
  tagline: 
  breadcrumbs:
  -
    label: Docs &raquo;
    url: /docs/home/
  -
    label: Bots &raquo;
    url: /docs/bots/
  -
    label: Events &raquo;
    url: /docs/bots/events/
  -
    label: Actions &raquo;
    url: /docs/bots/events/
---

|---
|-|-
| **Identifier (ID):** | core.bot.action.package.import
| **Event:** | (All)

### Params

|---
| Req'd | Key | Type | Notes 
|:-:|-|-|-
| **x** | `package_json` | json | The [package](/docs/packages/) manifest
| **x** | `prompts_json` | json | The prompted input for the package
|  | `run_in_simulator` | bit | Import packages in the simulator: `0`=no, `1`=yes
|  | `object_placeholder` | placeholder | The placeholder to set with the imported package results
