---
title: Authentication
excerpt: This page provides information on authentication methods for Cerb, focusing
  on Single Sign-on (SSO) and Multi-Factor Authentication (MFA).
summary: This page provides information on authentication methods for Cerb, focusing
  on Single Sign-on (SSO) and Multi-Factor Authentication (MFA). It explains how connected
  services that support SSO, such as OpenID Connect and SAML, can be used to allow
  workers to log in using their existing identities from platforms like G Suite and
  Salesforce. Additionally, it describes the MFA feature, which enhances security
  by allowing trusted devices to be remembered, thus requiring a security code only
  during new logins after a specified period.
permalink: /docs/setup/configure/authentication/
toc:
  expand: Admin Guide
jumbotron:
  title: Authentication
  breadcrumbs:
  - label: Docs &raquo;
    url: /docs/home/
  - label: Setup &raquo;
    url: /docs/setup/
  - label: Configure &raquo;
    url: /docs/setup/#configure
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