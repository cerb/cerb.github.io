---
title: Validate OAuth2 tokens
excerpt: Validate OAuth2 bearer tokens in webhook automations.
summary: "This page demonstrates how to validate OAuth2 bearer tokens in webhook automations using the `cerb.commands.oauth2.token.validate` command. It shows how to extract and validate JWT tokens from authorization headers."
layout: automation-cookbook
jumbotron: []
---

{% comment %}
* OAuth2 token validation
* Bearer token handling
* Authorization header parsing
* Webhook security
{% endcomment %}

## Validate a bearer token

In a webhook automation you can use the [cerb.commands.oauth2.token.validate](https://cerb.ai/docs/automations/commands/api.command/#syntax) action with [api.command:](https://cerb.ai/docs/automations/commands/api.command/) to validate the JWT bearer token given in the request.

Create an example OAuth2 token from **Cerb >> Setup >> Developers >> OAuth2 Token Generator**.

{% tabs example %}

{% tab example automation %}
```cerb
{% raw %}
start:
  set:
    request_headers:
      authorization: Bearer: eyJ0eXAiOiJKV1QiLCJhbGc[...]
  api.command:
    inputs:
      name: cerb.commands.oauth2.token.validate
      params:
        token: {{request_headers.authorization|split(' ')|last}}
    output: results
    on_error:
{% endraw %}
```

The `results` placeholder will contain keys for:
- `app_` (OAuth)
- `token_scopes`
- `token_type`
- `token_expires_at`
- `worker_`

Cerb does not assume a Bearer token follows a specific format. You can:
- Issue custom API keys using `Authorization: Bearer blah-token` header
- Verify webhook secrets sent with POST requests
- Validate HMAC signatures using shared secrets
{% endtab %}

{% tab example policy %}
```cerb
{% raw %}
commands:
  api.command:
    deny/name@bool: {{inputs.name not in ['cerb.commands.oauth2.token.validate']}}
    allow@bool: yes
{% endraw %}
```
{% endtab %}

{% endtabs %}
