---
title: Configure the Google Authenticator plugin
excerpt: A step-by-step guide for configuring Cerb's Google Authenticator plugin to improve the security of worker accounts.
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
    label: Security &raquo;
    url: /resources/guides/#security
---

* TOC
{:toc}

# Introduction

A common target of cybercrime is authentication details for online accounts -- usernames, email addresses, passwords, answers to account recovery questions, etc.  With this information, a criminal can assume your identity and cause you a lot of lasting damage.

You should already be following the best practices for passwords, including:

* Use high entropy passwords[^xkcd-passwords]. That's a fancy way of saying your password should be something difficult for computers to guess -- even when there are many machines working together for a significant amount of time. Don't use dictionary words, family member names, important dates, etc.
* Don't reuse passwords between accounts. If one is compromised, they all are left unprotected.
* Use an encrypted password manager[^password-manager] that is routinely security audited. This helps you generate strong passwords without having to remember them. You'll have access to your passwords on multiple devices, and through browser plugins.

Even when you follow these guidelines, it is possible for your password to be disclosed if an app or service itself is compromised.

That's where an additional best practice becomes critically important:

* Use **multi-factor authentication (MFA)**[^2fa].

Multi-factor authentication essentially means providing multiple means of authenticating yourself, which increases the difficulty for someone trying to break into your accounts.

A common variant of multi-factor authentication is referred to as **two-factor authentication (2FA)**, which is normally comprised of _"something you know"_ (an intangible secret like your password) and _"something you have"_ (a physical object like your mobile phone, a small hardware device on your keychain, biometrics, etc).

Unlike your password, the second factor is something that should constantly change without your intervention.  In the case of an app on your mobile phone, or a hardware device on your keychain, a new random number of a certain length (e.g. 4-8 digits) is usually generated every 30 seconds.  Your device and the server are synchronized in secret with regards to how this **time-based one-time password (TOTP)** is created.

If someone discovers your password, they most likely won't also have access to your mobile phone. In fact, there's a good chance that the attacker will be on the other side of the world.

Likewise, if someone steals your mobile phone, and somehow manages to unlock or decrypt it, they most likely will not have access to your passwords.

Without both forms of authentication, your accounts remain protected.

<div class="cerb-box note">
<p>It's also possible to have TOTP codes sent to your mobile device through SMS.  This is discouraged, because a thief or other nearby attacker can often view text messages on your phone's lock screen without the password. It's also not unheard of for attackers to reroute a target's mobile phone service to intercept SMS messages.</p>
</div>

We highly recommend securing your online accounts with two-factor authentication wherever possible. This certainly includes Cerb, and we provide a plugin for enabling these additional authentication methods.

One popular mobile app for generating TOTP codes is Google Authenticator[^google-auth]. It's available for both iOS and Android devices.

Our favorite is 1Password[^1password], which we use as a personal password manager, team-based password manager, and TOTP generator.

In this guide, we'll walk through the process of linking Cerb to several different popular TOTP apps to improve the security of worker accounts.

<div class="cerb-screenshot">
<img src="/assets/images/guides/totp/plugin/cerb-and-google-auth.png" class="screenshot">
</div>

# Install the Google Authenticator plugin

First, you need to install and enable the Google Authenticator plugin in Cerb.

<div class="cerb-box note">
<p>While our plugin is called <b>Google Authenticator</b>, it will work with most TOTP generators who follow the standard. This includes <b>1Password</b>, <b>Authy</b>, and <b>Duo</b>.</p>
</div>

1. Navigate to **Setup >> Plugins >> Installed Plugins**

1. Search for: `auth`

1. Find the **Google Authenticator** plugin in the worklist and click its **Configure** button.  If the plugin isn't installed, you can download it from the [plugin library](/docs/plugins#library).

1. In the **Status:** field, select _Enabled_.

1. Click the **Save Changes** button.

# Configure worker authentication to use Google Authenticator

1. Navigate to **Search >> Workers**.

1. Edit an existing worker, or create a new one.

1. In the **Login** section, select **Password + Google Authenticator** in the **Authentication** dropdown.

1. Click the **Save Changes** button.

    <div class="cerb-screenshot">
    <img src="/assets/images/guides/totp/plugin/worker-login-auth.png" class="screenshot">
    </div>

# Complete setup on the next worker login

<div class="cerb-screenshot">
<img src="/assets/images/guides/totp/plugin/cerb-account-setup.png" class="screenshot">
</div>

1. When the worker next logs in, they will be prompted to finish the setup of their account.

1. The worker now has a choice of which app they want to use for creating one-time passwords:
- [Google Authenticator](http://m.google.com/authenticator)
- [1Password](https://1password.com)
- [Authy](https://authy.com/download/)

1. If using **1Password** (our recommendation), jump ahead to the [Setting up 1Password to generate one-time passwords](#setting-up-1password-to-generate-one-time-passwords) section below.

1. For **Google Authenticator** and **Authy**, after installing the respective app on your smartphone, open it and follow the app's instructions to setup a new account by scanning a QR code.

1. Enter the six digit number from the app into **Step 3**.

1. Click **Continue** to finish the setup.

1. The worker can then log in as normal by also entering the code that is currently shown in their app.

    <div class="cerb-screenshot">
    <img src="/assets/images/guides/totp/plugin/totp-login-form.png" class="screenshot">
    </div>

# Configuring 1Password to generate one-time passwords

If you are already a user of 1Password, then you can use it for generating one-time passwords without the need for a separate TOTP app (like Google Authenticator).

1. Create or edit an entry for Cerb in 1Password, and then click on the **(...)** icon.

1. Select the option for **One-Time Password** in the menu:

    <div class="cerb-screenshot">
    <img src="/assets/images/guides/totp/plugin/1password-otp.png" class="screenshot">
    </div>

1. Click the **QR code** icon to bring up the scanner:

    <div class="cerb-screenshot">
    <img src="/assets/images/guides/totp/plugin/1password-qrcode-start.png" class="screenshot">
    </div>

1. Move the scanner window over top of the QR code in your browser. When it turns green, the scan is successful and one-time passwords will be properly configured.

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

1. Click **Continue** to finish the setup.

    <div class="cerb-screenshot">
    <img src="/assets/images/guides/totp/plugin/totp-login-form.png" class="screenshot">
    </div>

The worker can now log in with additional one-time password protection.

# References

[^1password]: 1Password - <https://1password.com>

[^2fa]: Wikipedia: Multi-factor authentication - <https://en.wikipedia.org/wiki/Multi-factor_authentication>

[^google-auth]: Google Authenticator - <http://m.google.com/authenticator>

[^password-manager]: Wikipedia: Password manager - <https://en.wikipedia.org/wiki/Password_manager>

[^xkcd-passwords]: XKCD: Password strength - <https://xkcd.com/936/>
