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

In this guide we'll walk through the process of linking Cerb to LDAP for authenticating worker logins.

<div class="cerb-screenshot">
<img src="/assets/images/guides/ldap/plugin/cerb-and-ldap.png" class="screenshot">
</div>

Enterprises commonly use LDAP to provide a central place to store usernames and passwords. This allows many different applications and services (like Cerb) to connect to the LDAP server to validate users.

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

# Configure LDAP worker authentication settings

1. Navigate to **Setup >> Services >> LDAP**.

1. Click the chooser to pick the **Connected Account** you setup in the previous section.

1. Enter the **Search Context** as provided by your LDAP administrator.

1. Enter the LDAP attribute for email addresses (usually `mail`, but consult your LDAP admin to be sure).

1. Click the **Save Changes** button.

    <div class="cerb-screenshot">
    <img src="/assets/images/guides/ldap/plugin/worker-auth-config.png" class="screenshot">
    </div>

# Add / Configure workers for LDAP authentication

1. Navigate to **Search >> Workers**.

1. Click the **(+)** icon above the worklist to add a new worker.

1. Enter the **First Name** and **Email** of the worker at minimum.

1. In the **Login** section, pick **LDAP** in the **Authentication** dropdown.

1. Click the **Save Changes** button.

    <div class="cerb-screenshot">
    <img src="/assets/images/guides/ldap/plugin/add-worker-ldap.png" class="screenshot">
    </div>

# Logging in as an LDAP user

On the login page, users will login as before, but will be prompted to enter their LDAP password.

  <div class="cerb-screenshot">
  <img src="/assets/images/guides/ldap/plugin/ldap-login-password.png" class="screenshot">
  </div>

If workers's ask what the password they were emailed by Cerb is, that is in case the LDAP server is offline.

