---
title: Countdown - Dashboard Widgets
excerpt: Counts the time remaining until (or elapsed since) a target date.
summary: The Countdown dashboard widget displays the time remaining until -- or elapsed since -- a configured target date. Useful for release deadlines, contract renewals, anniversaries, and SLA targets.
permalink: /docs/dashboards/widgets/countdown/
toc:
  title: Countdown
  expand: Reference
jumbotron:
  title: Countdown
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

The **Countdown** widget displays the time remaining until -- or elapsed since -- a configured target date. It's useful for release deadlines, contract renewals, project milestones, anniversaries, and SLA targets.

<div class="cerb-screenshot">
<img src="/assets/images/docs/dashboards/widgets/countdown.png" class="screenshot">
</div>

# Configuration

| Field | Description
|-|-
| Count down to date | The target date. Free-form text is accepted: absolute (`Jan 19 2038`, `2026-12-31`) or relative (`+1 week`, `next Friday`, `first day of next month`).
| Color | A color swatch used as the widget's accent. Common Cerb palette colors are available; any hex code can be entered.

For more control over layout, formatting, dynamic colors, or showing multiple countdowns at once, use the [Sheet](/docs/dashboards/widgets/sheet/) widget instead.
