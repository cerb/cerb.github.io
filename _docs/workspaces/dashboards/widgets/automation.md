---
title: Automation - Dashboard Widgets
excerpt: A dashboard widget that runs an automation and renders whatever it returns.
summary: The Automation dashboard widget runs an automation when the widget renders and displays its output. The automation has full control over the rendered content -- HTML, embedded charts, layouts, or custom UI -- making this the most flexible widget type.
permalink: /docs/dashboards/widgets/automation/
toc:
  title: Automation
  expand: Reference
jumbotron:
  title: Automation
  tagline: ~
  breadcrumbs:
  - label: Docs &raquo;
    url: /docs/home/
  - label: Workspaces &raquo;
    url: /docs/workspaces/
  - label: Dashboards &raquo;
    url: /docs/dashboards/
  - label: Widgets &raquo;
    url: /docs/dashboards/#widgets
---

The **Automation** widget runs an [automation](/docs/automations/) every time the widget renders and displays whatever the automation returns. The automation has complete control over the output, so this widget is the most flexible -- use it when none of the built-in widgets quite fit.

<div class="cerb-screenshot">
<img src="/assets/images/docs/dashboards/widgets/automation.png" class="screenshot">
</div>

Typical uses include custom HTML layouts, embedded third-party data, conditional dashboards that change shape based on a worker's role, or composite views that combine several data sources into a single block.

# Configuration

The configuration is a [KATA](/docs/kata/) event handler for the [ui.widget](/docs/automations/triggers/ui.widget/) render event. Use the toolbar's **Automation** button to insert a new handler. Each handler chooses an automation to run and optionally passes inputs to it.

The selected automation should return content suitable for inline rendering -- typically HTML, but the automation can also drive charts and interactive controls through Cerb's standard rendering helpers.

Because handlers can be conditional, a single widget can pick between automations based on the current worker, [dashboard prompts](/docs/dashboards/#prompts), or any other [placeholder](/docs/scripting/variables/).

See [`ui.widget`](/docs/automations/triggers/ui.widget/#example) for a worked example.
