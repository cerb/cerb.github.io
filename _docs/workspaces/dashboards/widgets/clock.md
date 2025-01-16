---
title: Chart KATA - Dashboard Widgets
excerpt: A clock widget with a configurable timezone and format (12/24-hr).
summary: This page provides an overview of the Clock widget, a customizable dashboard component that displays the current time with a selectable timezone and format.
permalink: /docs/dashboards/widgets/clock/
toc:
  title: Clock
  expand: Reference
jumbotron:
  title: Clock
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

The **Clock** widget shows the current time with a configurable timezone and format. This is useful to keep track of the current time in regions around the world.

<div class="cerb-screenshot">
<img src="/assets/images/docs/dashboards/widgets/clock/clock.png" class="screenshot">
</div>

## Configuration

Clock widgets can be configured to select any timezone, as well as either 12-hour or 24-hour formats. They can also be conditionally hidden using a `hidden@bool` statement.

<div class="cerb-screenshot">
<img src="/assets/images/docs/dashboards/widgets/clock/clock-settings.png" class="screenshot">
</div>