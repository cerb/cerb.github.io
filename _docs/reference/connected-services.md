---
title: Connected Services
permalink: /docs/connected-services/
jumbotron:
  title: Connected Services
  tagline: Securely integrate and automate third-party apps and services
---

**Connected services** provide authentication, secure storage, and reuse of user credentials for arbitrary third-party services.

Various methods of authentication are supported:

* Amazon Web Services
* Bearer Tokens
* Facebook Pages
* HTTP Basic Auth
* LDAP
* OAuth 1.0a
* OAuth 2.0
* OpenID Connect Identity Provider
* SAML Identity Provider

Plugins can [implement new service provider types](/docs/plugins/extensions/points/cerb.connected_service.provider/).

Services may provide [single sign-on](/guides/) (SSO) functionality for authenticating worker logins from a corporate directory.

Services may also support the creation of multiple [connected accounts](/docs/connected-accounts/) for use in [automations](/docs/automations/).

