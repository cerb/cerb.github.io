---
title: Simulate errors
excerpt: Simulate random errors in automation commands with `on_simulate:`.
summary: This page explains how to simulate random errors or successes for HTTP requests
  in Cerb's automation editor, using the `on_simulate` command. This allows you to
  test error handling and functionality without executing the actual request, making
  it a useful tool for testing automation scripts in Cerb's simulator. The `simulate.success:`
  and `simulate.error:` commands can be used to mock successful or failed responses,
  triggering corresponding events in your script, such as `on_success` or `on_error`.
layout: solution
jumbotron:
  breadcrumbs:
  - label: Resources &raquo;
    url: /resources/
  - label: Solutions Hub &raquo;
    url: /solutions/
  - label: Automations &raquo;
    url: /solutions/#automations
social_image_url: /assets/images/solutions/automations/simulate-errors.png
redirect_from:
- /automation/cookbook/simulate-errors/
---

## Simulate random errors

The `on_simulate:` command will only be used by the automation editor's simulator. It can be useful when you want to test a command without actually executing it. You can further use `simulate_success:` and `simulate_error:` to mock their respective outcomes.

In this example, we are randomly simulating both successful and failed HTTP requests.

{% tabs simulate_errors %}

{% tab simulate_errors automation %}
```cerb
{% raw %}
start:
  http.request/get:
    output: http_response
    inputs:
      method: GET
      url: https://cerb.ai/
    on_simulate:
      decision:
        outcome/error500:
          if@bool: {{0 == random(1)}}
          then:
            simulate.error:
              status_code@int: 500
              body: Error!
        outcome/ok200:
          then:
            simulate.success:
              status_code@int: 200
              body: Success!
    on_error:
      log.error: This is an error message
    on_success:
{% endraw %}
```

The `random(1)` function returns a value of 0 or 1 (50% chance of either outcome).

`simulate.success:` mocks the [http.request:](https://cerb.ai/docs/automations/commands/http.request/) response and triggers the `on_success:` event.

`simulate.error:` triggers the `on_error:` event. This way you can test failure modes on command and make sure your error handling works as intended.
{% endtab %}

{% tab simulate_errors policy %}
```cerb
{% raw %}
commands:
  http.request:
    deny/method@bool: {{inputs.method not in ['GET']}}
    allow@bool: yes
{% endraw %}
```
{% endtab %}

{% endtabs %}