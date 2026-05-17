---
title: 'Automations: simulate.success'
excerpt: This page provides detailed information on the "simulate.success" command
  used in Cerb automations to simulate a successful command outcome during testing.
summary: This page covers the "simulate.success" command, which is used inside an
  "on_simulate" event handler to provide mock output and trigger the "on_success"
  event of the enclosing command during automation simulation. It explains the optional
  output keys, usage examples, and how it relates to the simulation framework in Cerb
  automations.
permalink: /docs/automations/commands/simulate.success/
toc:
  title: simulate.success
  expand: Automations
jumbotron:
  title: simulate.success
  tagline: ~
  breadcrumbs:
  - label: Docs &raquo;
    url: /docs/home/
  - label: Automations &raquo;
    url: /docs/automations/
  - label: Commands &raquo;
    url: /docs/automations/#commands
---

The **simulate.success:** command is used inside an [on_simulate:](/docs/automations/#simulation) event handler to provide mock output and trigger the enclosing command's `on_success:` event during [simulation](/docs/automations/#simulation).

{% highlight cerb %}
{% raw %}
start:
  http.request:
    output: http_response
    inputs:
      method: GET
      url: https://api.example/
    on_simulate:
      simulate.success:
        status_code: 200
        content_type: application/json
        body: '{"result":"ok"}'
    on_success:
      return:
        body@key: http_response:body
{% endraw %}
{% endhighlight %}

* TOC
{:toc}

# Syntax

## output keys:

The optional key/value pairs provided to `simulate.success:` are merged into the `output:` placeholder of the enclosing command, exactly as if the command had run and succeeded. The expected keys depend on the command being simulated (e.g. `status_code:`, `body:` for `http.request:`).

## on_simulate:

`simulate.success:` is itself only valid inside an `on_simulate:` event handler. It cannot be used outside of simulation context.

## on_success:

After `simulate.success:` runs, the enclosing command's `on_success:` event is executed with the simulated output available in the `output:` placeholder.

## on_error:

Not applicable. `simulate.success:` always triggers the `on_success:` path. Use [simulate.error:](/docs/automations/commands/simulate.error/) to trigger the `on_error:` path instead.

# See also

- [Simulation](/docs/automations/#simulation) -- overview of how simulation works in automations
- [simulate.error:](/docs/automations/commands/simulate.error/) -- simulate a failed command outcome
