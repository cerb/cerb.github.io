---
title: Automation Scripting Tester
excerpt: This page shows how to access and use the Automation Scripting Tester in the developer menu.
summary: "This page provides an overview of the Automation Scripting Tester, a tool used for writing one-off scripts in Cerb. The tester can be accessed by clicking on the \"Setup >> Developers >> Automation Scripting Tester\" link and allows users to write and run multiline scripts directly within the interface. Features include the ability to use the tester for simple transformations, such as text manipulation, and to quickly encode objects as JSON using various filters, including the `json_encode` filter."
permalink: /docs/setup/developers/scripting-tester/
toc:
  expand: Admin Guide
jumbotron:
  title: Automation Scripting Tester
  breadcrumbs:
    - label: Docs &raquo;
      url: /docs/home/
    - label: Setup &raquo;
      url: /docs/setup/
    - label: Developers &raquo;
      url: /docs/setup/#developers
---

The Automation Scripting Tester is perfect for writing one-off scripts that don't warrant an entire automation. 

## Access

The automation scripting tester can be accessed by clicking **Setup >> Developers >> Automation Scripting Tester**. 

## Usage

You can write and run multiline scripts in the tester box. An example is using it for quickly transforming text.

<div class="cerb-screenshot">
<img src="/assets/images/docs/setup/scripting-tester/transform-text.png" class="screenshot">
</div>

You can also use [\|json_encode](/docs/scripting/filters/#json_encode) to quickly encode objects as JSON.

<div class="cerb-screenshot">
<img src="/assets/images/docs/setup/scripting-tester/json-encode.png" class="screenshot">
</div>