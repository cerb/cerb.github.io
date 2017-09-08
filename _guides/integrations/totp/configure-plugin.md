---
title: Configure the Google Authenticator plugin
excerpt: A step-by-step guide for configuring Cerb's Google Authenticator plugin to secure worker accounts
layout: integration
topic: Integrations
subtopic: Security
jumbotron:
  title: Configure the Google Authenticator plugin
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
    label: Google Authenticator &raquo;
    url: /resources/guides/#totp
---

* TOC
{:toc}

# Introduction

The current best practice for security is to secure your online accounts with Two-Factor Authentication (aka TFA). By having two factors,
something you know (aka `password`) and something you have (aka `mobile device`), it makes it harder for someone to compromise
your account. One of the most common forms of TFA is an algorithm called `Time-based One-Time Password`, or TOTP for short. The most commonly
used app for generating TOTP codes is called [Google Authenticator](http://m.google.com/authenticator), and it's what this plugin was named
after. While Google Authenticator is the most common, it isn't necessarily the best app for it and there's many alternatives, including the very
popular password manager, [1Password](https://1password.com).

In this guide we'll walk through the process of linking Cerb to several different popular TOTP apps for securing worker logins.

<div class="cerb-screenshot">
<img src="/assets/images/guides/totp/plugin/cerb-and-google-auth.png" class="screenshot">
</div>

# Install the Google Authenticator plugin

First, you need to install and enable the Google Authenticator plugin in Cerb.

1. Navigate to **Setup >> Plugins >> Installed Plugins**

1. Search for: `auth`

1. Find the **Google Authenticator** plugin in the worklist and click its **Configure** button.  If the plugin isn't installed, you can download it from the [plugin library](/docs/plugins#library).

1. In the **Status:** field, select _Enabled_.

1. Click the **Save Changes** button.

# Set worker's authentication to use Google Authenticator

1. Navigate to **Search >> Workers**.

1. Click the **(+)** icon above the worklist to add a new worker (or edit an existing user).

1. Enter the **First Name** and **Email** of the worker at minimum.

1. In the **Login** section, pick **Password + Google Authenticator** in the **Authentication** dropdown.

1. Click the **Save Changes** button.

    <div class="cerb-screenshot">
    <img src="/assets/images/guides/totp/plugin/worker-login-auth.png" class="screenshot">
    </div>

# Worker setup on next login

<div class="cerb-screenshot">
<img src="/assets/images/guides/totp/plugin/cerb-account-setup.png" class="screenshot">
</div>

1. When the worker next logs in, they will be prompted to finish the setup of their account.

1. The worker now has a choice of which app they want to use for creating one-time passwords:
- [Google Authenticator](http://m.google.com/authenticator)
- [1Password](https://1password.com)
- [Authy](https://authy.com/download/)

1. If using **1Password** (what we recommend), jump ahead to the [Setting up 1Password to generate one-time passwords](#setting-up-1password-to-generate-one-time-passwords) section below.

1. For **Google Authenticator** and **Authy**, after installing the respective app on your smartphone, open it and follow the app's instructions to setup a new account by scanning a QR code.

1. Enter the six digit number from the app into **Step 3**.

1. Click **Continue** to finish the setup and then the worker can login as normal entering the code that is currently shown in their app at time of login.

    <div class="cerb-screenshot">
    <img src="/assets/images/guides/totp/plugin/totp-login-form.png" class="screenshot">
    </div>

# Setting up 1Password to generate one-time passwords

If you are already a user of 1Password, then you can use it for generating one-time passwords and not need a separate TOTP app like Google Authenticator.

1. Create or Edit a new entry for Cerb in 1Password, and then click the **(...)** icon and select the option `One-Time Password` in the menu as shown below.

    <div class="cerb-screenshot">
    <img src="/assets/images/guides/totp/plugin/1password-otp.png" class="screenshot">
    </div>

1. Click the **QR code** icon as shown below to bring up the scanner.

    <div class="cerb-screenshot">
    <img src="/assets/images/guides/totp/plugin/1password-qrcode-start.png" class="screenshot">
    </div>

1. Move the scanner window over top of the QR code in your browser and when it turns green, it has successfully scanned and setup the needed secrets.

    <div class="cerb-screenshot">
    <img src="/assets/images/guides/totp/plugin/1password-qrcode-scan.png" class="screenshot">
    </div>

    <div class="cerb-screenshot">
    <img src="/assets/images/guides/totp/plugin/1password-qrcode-success.png" class="screenshot">
    </div>

1. Enter the six digit number from 1Password into **Step 3**.

    <div class="cerb-screenshot">
    <img src="/assets/images/guides/totp/plugin/1password-totp-display.png" class="screenshot">
    </div>

1. Click **Continue** to finish the setup and then the worker can now login.

    <div class="cerb-screenshot">
    <img src="/assets/images/guides/totp/plugin/totp-login-form.png" class="screenshot">
    </div>

That's it, hopefully everyone sleeps easier now knowing that their Cerb account is more secure!

