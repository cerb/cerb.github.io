---
title: Configure the LDAP plugin for worker authentication
excerpt: A step-by-step guide for configuring Cerb's LDAP plugin
layout: integration
topic: Integrations
subtopic: LDAP
jumbotron:
  title: Configure the LDAP plugin for worker authentication
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

Enterprises commonly store contact information throughout the their organization using an open industry standard called **Lightweight Directory Access Protocol (LDAP)**[^ldap]. This can serve as a corporate email and telephone directory; but more importantly, it can also provide a centralized authentication mechanism for various applications and services.

Cerb can use LDAP to authenticate worker logins. This guide will walk through the process of configuring this integration.

<div class="cerb-screenshot">
<img src="/assets/images/guides/ldap/plugin/cerb-and-ldap.png" class="screenshot">
</div>

# Install the LDAP plugin

First, you need to install and enable the LDAP plugin in Cerb.

1. Navigate to **Setup >> Plugins >> Installed Plugins**

1. Search for: `ldap`

1. Find the **LDAP Integration** plugin in the worklist and click its **Configure** button.  If the plugin isn't installed, you can download it from the [plugin library](/docs/plugins#library).

1. In the **Status:** field, select _Enabled_.

1. Click the **Save Changes** button.

# Add a connected account in Cerb

Now we can create connected accounts to securely store LDAP credentials in Cerb.

1. Navigate to **Search >> Connected Accounts**.

1. Click the **(+)** icon above the worklist to add a new account.

    <div class="cerb-screenshot">
    <img src="/assets/images/guides/common/new-connected-account.png" class="screenshot">
    </div>

1. Click on **LDAP**.

1. Enter your LDAP **Host** and **Port** as provided by your LDAP administrator.

1. Enter your LDAP **Bind DN** and **Bind Password**.

1. Enter the following details:
- **Name:** LDAP
- **Owner:** Cerb

    <div class="cerb-screenshot">
    <img src="/assets/images/guides/ldap/plugin/connected-account.png" class="screenshot">
    </div>

1. Click the **Save Changes** button.

If everything was configured properly, you'll see the new connected account in your worklist.

# Configure LDAP settings

1. Navigate to **Setup >> Services >> LDAP**.

1. Click the chooser to pick the **Connected Account** you setup in the previous section.

1. Enter the **Search Context** as provided by your LDAP administrator.

1. Enter the LDAP attribute for email addresses (usually `mail`, but consult your LDAP admin to be sure).

1. Click the **Save Changes** button.

    <div class="cerb-screenshot">
    <img src="/assets/images/guides/ldap/plugin/worker-auth-config.png" class="screenshot">
    </div>

# Enable LDAP authentication for workers

LDAP needs to be enabled for each worker.  Keep in mind that workers can have different authentication methods, so LDAP can be enabled for only specific workers if desired.

First, navigate to **Search >> Workers**.

### Enable LDAP for new workers

<div class="cerb-box note">
<p>For security reasons, a worker account with a matching email address must exist within Cerb before that person can log in using LDAP.</p>
</div>

1. Click the **(+)** icon above the worklist to add a new worker.

1. Enter the **First Name** and **Email** of the worker at minimum.

1. In the **Login** section, pick **LDAP** in the **Authentication** dropdown.

1. Click the **Save Changes** button.

    <div class="cerb-screenshot">
    <img src="/assets/images/guides/ldap/plugin/add-worker-ldap.png" class="screenshot">
    </div>

### Enable LDAP for existing workers

1. Open the card for a worker you want to enable LDAP for.

1. Click the **Edit** button.

1. In the **Login** section, pick **LDAP** in the **Authentication** dropdown.

1. Click the **Save Changes** button.

# Logging in as an LDAP user

When an LDAP-enabled worker visits the login page, they'll be prompted for their LDAP password rather than their standard Cerb password.

  <div class="cerb-screenshot">
  <img src="/assets/images/guides/ldap/plugin/ldap-login-password.png" class="screenshot">
  </div>

<div class="cerb-box note">
<p>Currently, workers are always assigned a password within Cerb. When an external login authenticator like LDAP is enabled, this password is ignored. If there is a problem with the LDAP server, an administrator can quickly switch logins back to standard Cerb passwords as a stopgap.</p>
</div>

# References

[^ldap]: Wikipedia: Lightweight Directory Access Protocol (LDAP) - <https://en.wikipedia.org/wiki/Lightweight_Directory_Access_Protocol>
