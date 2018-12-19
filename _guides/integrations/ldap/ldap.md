---
title: Authenticate worker logins with an LDAP corporate directory
excerpt: A step-by-step guide for configuring Cerb's LDAP plugin
permalink: /guides/integrations/ldap/
layout: integration
topic: Integrations
subtopic: LDAP
jumbotron:
  title: Authenticate worker logins with an LDAP corporate directory
  tagline: ""
  breadcrumbs:
  -
    label: Resources &raquo;
    url: /resources/
  -
    label: Guides &raquo;
    url: /resources/guides/
  -
    label: Integrations &raquo;
    url: /resources/guides/#integrations
  -
    label: LDAP &raquo;
    url: /resources/guides/#ldap
---

* TOC
{:toc}

# Introduction

Enterprises commonly store and share contact information throughout their organization using an open industry standard called **Lightweight Directory Access Protocol (LDAP)**[^ldap]. This can serve as a corporate email and telephone directory; but more importantly, it can also provide a centralized authentication mechanism for various applications and services.

Cerb can use LDAP to authenticate worker logins. This guide will walk through the process of configuring this integration.

<div class="cerb-screenshot">
<img src="/assets/images/guides/ldap/plugin/cerb-and-ldap.png" class="screenshot">
</div>

# Requirements

If you're self-hosting Cerb, make sure the `ldap` PHP extension is enabled in your environment.

If you're on Cerb Cloud, we've already done this for you.

# Create an LDAP service in Cerb

The LDAP integration only needs a [connected service](/docs/connected-services/).

1. Navigate to **Search >> Connected Services**.

1. Click the **(+)** icon above the worklist to add a new service.

1. Enter the following service details:
	* Name: `LDAP`
	* URI: `ldap`
	* Type: **LDAP**

1. Enter your LDAP server details:
	* Host: (your LDAP server host; e.g. ldap.example.com)
	* Port: (your LDAP server port; e.g. 389)
	* Bind DN: (the read-only distinguished name to authenticate as)
	* Bind Password: (the password to use for authentication)
	* Search context: (the distinguished name for searching employee accounts)
	* Email field: (the email field on employee accounts)
	* First name field: (the given name field on employee accounts)
	* Last name field: (the surname field on employee accounts)

	<div class="cerb-screenshot">
	<img src="/assets/images/guides/ldap/plugin/connected-service.png" class="screenshot">
	</div>

1. Click the **Save Changes** button.

# Enable single sign-on with LDAP

1. Navigate to **Setup >> Configure >> Authentication**.

1. Check the box next to your new LDAP service:

	<div class="cerb-screenshot">
	<img src="/assets/images/guides/ldap/plugin/setup-auth.png" class="screenshot">
	</div>

1. Click the **Save Changes** button.

# Log in with LDAP

When LDAP is enabled as a single sign-on identity provider, a button will appear at the top of the login page.

<div class="cerb-screenshot">
<img src="/assets/images/guides/ldap/plugin/login-ldap-sso.png" class="screenshot">
</div>

Clicking this button will prompt for the worker's email address and password from the LDAP directory, rather than from their Cerb account.

If you want workers to only authenticate using SSO, you can disappear their Cerb password by editing their record.

When a worker authenticates using LDAP, one of the email addresses on their Cerb account must match the email address from their LDAP record.

If a worker has [two-factor authentication](/guides/security/two-factor-auth/) enabled, they'll be prompted for their security code after authenticating with their password.

You can use multiple LDAP services to authenticate workers from different corporate directories.

# References

[^ldap]: Wikipedia: Lightweight Directory Access Protocol (LDAP) - <https://en.wikipedia.org/wiki/Lightweight_Directory_Access_Protocol>
