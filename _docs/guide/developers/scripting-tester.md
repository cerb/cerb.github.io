---
title: Automation Scripting Tester
excerpt: This page shows how to access and use the Automation Scripting Tester in the developer menu.
permalink: /docs/guide/developers/scripting-tester/
toc:
  title: Automation Scripting
  expand: Developer Guide
jumbotron:
  title: Automation Scripting Tester
  breadcrumbs:
  - label: Docs &raquo;
    url: /docs/home/
  - label: Developer Guide &raquo;
---

The Automation Scripting Tester is perfect for writing one-off scripts that don't warrant an entire automation. 

## Access

The Data Query Tester can be accessed by clicking **Setup > Developers > Automation Scripting Tester.** 

## Usage

You can write and run multiline scripts in the tester box. An example is using it for quickly transforming text.

<div class="cerb-screenshot">
<img src="/assets/images/guides/scripting-tester/transform-text.png" class="screenshot">
</div>

Or you can use ｀{% set key = 'value' %}`　and `|json_encode` to quickly encode objects as JSON.

<div class="cerb-screenshot">
<img src="/assets/images/guides/scripting-tester/json-encode.png" class="screenshot">
</div>