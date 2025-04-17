---
title: 'Metrics: Mail Routing Rule Matches'
excerpt: This page provides examples and details on the mail.routing.rule.matches metric
permalink: /docs/metrics/mail.routing.rule.matches/
toc:
  title: mail.routing.rule.matches
jumbotron:
  title: mail.routing.rule.matches
  tagline: ~
  breadcrumbs:
  - label: Docs &raquo;
    url: /docs/home/
  - label: Metrics &raquo;
    url: /docs/metrics/
search_index:
  exclude: true
---

* TOC
{:toc}

# Description

This metric tracks the number of times individual mail routing rules, in addition to subrules, are activated. This metric can help you report on the effectiveness of your routing rules. You might find some that are rarely ever hit and may need broadening or eliminating. You also might find some rules that are activated extensively and may benefit from further splitting up into more specific conditions.

# Dimensions

| Dimension  | Description                                |
|------------|--------------------------------------------|
| ruleset_id | The full ruleset record (multiple rules)   |
| rule_key   | The individual rules (multiple conditions) |
| node_key   | The individual conditions                  |

