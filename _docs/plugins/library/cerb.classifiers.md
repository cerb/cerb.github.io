---
title: 'Plugin: Classifiers'
excerpt: This page documents the Classifiers plugin for Cerb, which provides simple
  Naive Bayes classifiers for use in automations and bot behaviors.
summary: This page documents the Classifiers plugin for Cerb, identified as `cerb.classifiers`.
  The plugin provides simple Naive Bayes classifiers that can be invoked from automations
  and legacy bot behaviors. It contributes record types for classifiers, classifications,
  entities, and examples; a Bot Action for executing classifier predictions; a card
  widget for training; and profile page sections for each record type.
permalink: /docs/plugins/cerb.classifiers/
toc:
  title: Classifiers
  expand: Plugins
jumbotron:
  title: Classifiers
  tagline: ~
  breadcrumbs:
  - label: Docs &raquo;
    url: /docs/home/
  - label: Plugins &raquo;
    url: /docs/plugins/
---

|---
|-|-
| **Name:** | Classifiers
| **Identifier (ID):** | cerb.classifiers
| **Author:** | Webgroup Media, LLC.
| **Path:** | features/cerb.classifiers/
| **Status:** | Deprecated

Simple Naive Bayes classifiers for automations and bot behaviors.

* TOC
{:toc}

# Extensions

### Bot Action

| Classifier Prediction | `core.va.action.classifier_prediction`


### Card Widget Type

| Classifier Trainer | `cerb.card.widget.classifier.trainer`


### Page Section

| Classifier Class Section | `core.page.profiles.classifier_class`
| Classifier Entity Section | `core.page.profiles.classifier_entity`
| Classifier Example Section | `core.page.profiles.classifier.example`
| Classifier Section | `core.page.profiles.classifier`


### Record Type

| Classifier | `cerberusweb.contexts.classifier`
| Classifier Classification | `cerberusweb.contexts.classifier.class`
| Classifier Entity | `cerberusweb.contexts.classifier.entity`
| Classifier Example | `cerberusweb.contexts.classifier.example`


<div class="section-nav">
	<div class="left">
		<a href="/docs/plugins/#plugins" class="prev">&lt; Plugins</a>
	</div>
	<div class="right align-right">
	</div>
</div>
<div class="clear"></div>
