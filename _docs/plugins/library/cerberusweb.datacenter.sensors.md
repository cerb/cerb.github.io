---
title: "Plugin: Sensors"
permalink: /docs/plugins/cerberusweb.datacenter.sensors/
toc:
  title: "Sensors"
  expand: Plugins
jumbotron:
  title: "Sensors"
  tagline: 
  breadcrumbs:
  -
    label: Docs &raquo;
    url: /docs/home/
  -
    label: Plugins &raquo;
    url: /docs/plugins/
---

|---
|-|-
| **Name:** | Sensors
| **Identifier (ID):** | cerberusweb.datacenter.sensors
| **Author:** | Webgroup Media, LLC.
| **Path:** | storage/plugins/cerberusweb.datacenter.sensors/
| **Image:** | <img src="/assets/images/plugins/cerberusweb.datacenter.sensors.png" class="screenshot">

This plugin adds flexible Sensor objects that can be used for network and server monitoring, operational intelligence, etc.

* TOC
{:toc}

# Extensions

### Bot Event

| Record custom behavior on sensor | `event.macro.sensor`


### Page Section

| Sensor Page Section | `cerberusweb.profiles.sensor`


### Page Type

| Sensors Page | `cerberusweb.datacenter.sensors.page`


### Record Type

| Sensor | `cerberusweb.contexts.datacenter.sensor`


### Rest API Controller

| Sensors | `cerberusweb.datacenter.sensors.rest`


### Scheduled Job

| Network and service monitoring | `cerberusweb.datacenter.sensors.cron`


### Sensor Type

| External | `cerberusweb.datacenter.sensor.external`
| HTTP | `cerberusweb.datacenter.sensor.http`
| Port | `cerberusweb.datacenter.sensor.port`


### Workspace Widget Datasource

| [**Sensor**](/docs/plugins/extensions/cerberusweb.datacenter.sensor.widget.datasource/) | `cerberusweb.datacenter.sensor.widget.datasource`


<div class="section-nav">
	<div class="left">
		<a href="/docs/plugins/#plugins" class="prev">&lt; Plugins</a>
	</div>
	<div class="right align-right">
	</div>
</div>
<div class="clear"></div>