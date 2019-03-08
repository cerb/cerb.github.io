---
title: Authentication
permalink: /docs/setup/configure/authentication/
excerpt: ~
toc:
  expand: Setup
jumbotron:
  title: Authentication
  breadcrumbs:
  - 
    label: Docs &raquo;
    url: /docs/home/
  - 
    label: Setup &raquo;
    url: /docs/setup/
  - 
    label: Configure &raquo;
    url: /docs/setup/configure/
---

<div class="cerb-screenshot">
<img src="/assets/images/docs/setup/authentication.png" class="screenshot">
</div>

# Authentication

## Single Sign-on (SSO)

If you have created [connected services](/docs/connected-services/) that support SSO (e.g. OpenID Connect, SAML), they will be displayed here. You can select those services to allow workers to log in to Cerb using their existing identities.

* [Authenticate worker single sign-on (SSO) from G Suite using SAML](/guides/integrations/google/sso-saml/)
* [Authenticate worker single sign-on (SSO) from Salesforce using OpenID Connect](/guides/integrations/salesforce/sso-openid/)

## Multi-Factor Authentication

When multi-factor authentication (MFA) is enabled for a worker's account, this setting allows their trusted devices to be "remembered" and a security code will only be requested during new logins once per the specified number of days.