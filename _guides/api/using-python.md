---
title: "Get started with the API using the Python"
excerpt: This step-by-step guide demonstrates how to use Python to interact with the Cerb API.
layout: integration
topic: API
jumbotron:
  title: Get started with the API using Python
  tagline: ""
  breadcrumbs:
  -
    label: Resources &raquo;
    url: /resources/
  -
    label: Guides &raquo;
    url: /resources/guides/
  -
    label: API &raquo;
    url: /resources/guides/#api
---

* TOC
{:toc}

# Introduction

This step-by-step guide demonstrates how to use the Cerb API from Python.

We'll be using the [requests-oauthlib](https://github.com/requests/requests-oauthlib) library to handle OAuth2 authentication.

# Create an OAuth app in Cerb

In Cerb, [create an OAuth app](/docs/api/authentication/) to generate client credentials.

As an admin you can do this from **Search >> OAuth Apps >> (+)**.

|---
| Field | Value
|-|-
|**Name:** | (the name of your integration)
|**Client ID:** | (auto-generated)
|**Client Secret:** | (auto-generated)
|**Callback URL:** | (your endpoint for interactive auth, or an arbitrary URL for machine-to-machine auth)
|**Website:** | (your website)
|**Scopes:** | (customize or use defaults)

<div class="cerb-screenshot">
<img src="/assets/images/guides/api/using-python/oauth-new.png" class="screenshot">
</div>

Click the **Save Changes** button.

# Python code

The rest of this guide assumes you have a Python project or Jupyter notebook.

Add the following dependencies using your preferred package manager:

```shell
pip install requests requests-oauthlib
```

## Set OAuth2 variables

```python
redirect_uri = 'http://localhost/'
request_base_url = 'http://localhost/'
auth_url = request_base_url + 'oauth/authorize'
token_url = request_base_url + 'oauth/access_token'
extra = {
    'client_id': '...',
    'client_secret': '...',
}
```

|---
| Variable | Description
|-|-
| `redirect_uri` | This must match the **Callback URL** defined in the OAuth App in Cerb. When using interactive authentication with consent, the user's browser will be redirected here after logging in and approving the link. For local testing this should be your Cerb URL.
| `request_base_url` | The base URL of your Cerb install with a trailing slash (`/`).
| `client_id` | The generated **Client ID** from the OAuth App in Cerb.
| `client_secret` | The generated **Client Secret** from the OAuth App in Cerb.

## Optionally disable SSL

If you're in a test environment (e.g. `localhost`) you can disable the SSL requirement.

Otherwise, skip this step.

```python
import os
os.environ['OAUTHLIB_INSECURE_TRANSPORT'] = '1'
```

## Imports

Import the following:

```python
import json
from requests_oauthlib import OAuth2Session
```

## Handle token persistence

Define a function to persist the generated token. This can store the token object in the filesystem, a database, etc.

```python
def token_saver(token):
    # [TODO] Persist the token somewhere
    pass
```

## Generate a token

There are two options to generate a token. You only need to implement one of them.

### Option 1: Provide a pre-generated token

If you generated a token from **Setup >> Developers >> OAuth2 Token Generator** you can skip interactive authentication.

<div class="cerb-screenshot">
<img src="/assets/images/guides/api/using-python/oauth-token-gen.png" class="screenshot">
</div>

Set `access_token`, `refresh_token`, and `expires_in`.

```python
def token_loader():
    # [TODO] Load the token from somewhere (inverse of token_saver)
    return {
      'token_type': 'Bearer',
      'expires_in': 300,
      'access_token': 'eyJ0...',
      'refresh_token': 'def500...',
    }

oauth = OAuth2Session(client_id=extra['client_id'], token=token_loader(), auto_refresh_url=token_url, auto_refresh_kwargs=extra, token_updater=token_saver)
```

This code is configured to automatically refresh the access token when it expires (by default hourly).

This example sets the `token` variable inline, but in production you would load the token previously saved in `token_saver()`.

### Option 2: Generate tokens from 3-legged interactive web auth

If you prefer to use 3-legged authentication with user consent, these are the steps.

In this example you manually paste the authorization URL in your browser, then copy the browser URL you are redirected to and paste it into your script for processing.

In production, you'd use an HTTP redirect to the `authorization_url` and the **Callback URL** would route back to your app for requesting a token after the worker logs in and consents.

For machine-to-machine scripts, Option 1 above is much simpler.

```python
scopes = ['api']

oauth = OAuth2Session(client_id=extra['client_id'], redirect_uri=redirect_uri, scope=scopes, auto_refresh_url=token_url, auto_refresh_kwargs=extra, token_updater=token_saver)

authorization_url, state = oauth.authorization_url(auth_url, access_type="offline")

print('Visit %s in your browser and authorize access.' % authorization_url)
```

Paste the URL into your browser and log in if required. Click the **Accept** button.

You'll be redirected back to Cerb. Copy the new URL in the browser location bar and paste it into the next step.

```python
authorization_response = input("Paste the callback URL from your browser location bar:")

token = oauth.fetch_token(
    token_url,
    authorization_response=authorization_response,
    client_secret=extra['client_secret']
)
```

## Make a request to the Cerb API

The `oauth` client object will automatically add the bearer token to the `Authorization:` HTTP header.

```python
r = oauth.get(request_base_url + 'rest/workers/me.json')
```

### Display the response

```python
import json
json.loads(r.content)
```

You should see JSON output like:

```json
{
  "__build": 2023091401,
  "__status": "success",
  "__version": "10.4.4",
  "_context": "cerberusweb.contexts.worker",
  "_label": "Jeff Standen",
  "_type": "worker",
  "first_name": "Jeff",
  "full_name": "Jeff Standen",
  "gender": "M",
  "id": 123,
  "is_disabled": 0,
  "is_superuser": 1,
  "language": "en_US",
  "last_name": "Standen",
  "record_url": "https://cerb.example/profiles/worker/1-Jeff-Standen",
  "time_format": "D, d M Y h:i a",
  "timeout_idle_secs": 600,
  "timezone": "America/Los_Angeles",
  "title": "Administrator",
  "updated": 1695067418
}
```

# Next steps

You can refer to the [API documentation](/docs/api/) for a full list of possible requests.