---
title: Creating GPG keys for Cerb (on macOS)
excerpt: In this example we will show you how to create your GPG keys and setup Cerb to receive encrypted emails.
layout: integration
topic: Mail
jumbotron:
  title: Creating GPG keys for Cerb (on macOS)
  tagline: ""
  breadcrumbs:
  -
    label: Resources &raquo;
    url: /resources/
  -
    label: Guides &raquo;
    url: /resources/guides/
  -
    label: Mail &raquo;
    url: /resources/guides/#mail
---

* TOC
{:toc}

# Introduction

To automatically decrypt a received encrypted message in Cerb, you need to have the corresponding private key in your keyring. If you receive an encrypted message that can’t be decrypted, Cerb will
leave the encrypted content as an attachment on the message that you can decrypt offline. This is the most secure option, but the content of the message won’t be readable or searchable within Cerb.

If you want automatic decryption of messages, you need to consider the security implications of leaving your private key on the server. At the minimum, we recommend that you create a subkey
following the steps documented here so you won't be storing your master key on the server.

If you are running Linux or Windows, the instructions below can be used with some modifications. We will release platform specific guides for them in the future.

# Installing Software

### Install Homebrew

This guide assumes you use [Homebrew](https://brew.sh) to install packages on your Mac. If that isn't the case, Homebrew is a package manager (similar to RPM or deb on Linux) that makes
it easy to install software on your Mac. Please visit [http://brew.sh](http://brew.sh) and follow the instructions to install it.

### Install GPG

To generate your keys, you need to install GnuPG (aka GPG). GPG is a free software alternative to the closed source commercial PGP. To install GPG with Homebrew, it's as simple as:

$ `brew install gpg pinentry-mac`

<div class="cerb-screenshot">
<img src="/assets/images/guides/mail/gpg/install-gpg.png" class="screenshot">
</div>

### Enable GUI for passphrase entry

You might have noticed we installed two things, GPG and something called pinentry-mac. Pinentry-mac is a tool which prompts with a native dialog box for your GPG key passphrase and also
allows you to store the password in your Mac's Keychain. As Homebrew helpfully prompted after installing pinentry-mac, we now need to enable it.

<div class="cerb-box note">
<p>While pinentry-mac allows you to save your passphrase, in the interest of security you shouldn't.</p>
</div>

To enable it, you first need to run GPG to have it setup its directory structure.

This can be accomplished by simply running `gpg --list-keys` in a terminal window as seen below.

<div class="cerb-screenshot">
<img src="/assets/images/guides/mail/gpg/initial-run.png" class="screenshot">
</div>

You don't have any keys in your keyring yet. Let's fix that in a moment. After getting GPG to create its directory structure, we now need to enable pinentry-mac.
We do this by editing the file `$HOME/.gnupg/gpg-agent.conf`. You can use VIM (or a text editor of your choice) as shown below:

<div class="cerb-screenshot">
<img src="/assets/images/guides/mail/gpg/pinentry-mac-setup.png" class="screenshot">
</div>

Or you can run this: `echo "pinentry-program /usr/local/bin/pinentry-mac" >> $HOME/.gnupg/gpg-agent.conf` and accomplish the same thing.

After setting pinentry-mac up, when GPG prompts you for a passphrase, you'll see something like this:

<div class="cerb-screenshot">
<img src="/assets/images/guides/mail/gpg/pinentry-mac-dialog.png" class="screenshot">
</div>

# Generating GPG keys

Now that you have GPG installed, we need to generate the keys which are used for encrypted email. Following best practices, we will be generating a master key and then a subkey for usage by Cerb.
This way if your subkey is ever compromised, it's a simple process to revoke and replace it. The master key you should protect as you would your bank password.

### Generate master key

<div class="cerb-box note">
<p>We will be removing the Sign and Encrypt capabilities from the master key forcing usage of subkeys for those operations. This limits the damage that can be done if the master key is ever compromised.</p>
</div>

To generate the master key, follow these steps:

1. Run `gpg --expert --full-generate-key` to start the process.
1. When prompted for what kind of key, pick option: `(8) RSA (set your own capabilities)`.
1. Next you want to toggle off the sign and encrypt capabilities from the key.
   * When prompted for capabilities, type `s` and hit enter to toggle off the Sign capability.
   * Next type `e` and hit enter to toggle off the Encrypt capability.
   * Confirm that the current allowed actions only lists `Certify`, then type `q` and hit enter to finish setting capabilities.
1. Now you are prompted for how long the RSA key should be. Type `4096` to set the highest security that GPG currently supports.
1. For expiration, we suggest picking `0` so the key doesn't expire.
1. Now GPG needs to know who this key is for. For the Real Name, we suggest picking the same "friendly name" you use for outgoing email from Cerb.
1. Next provide the email address you want to use for receiving encrypted email.
   * We will reference this email as `YOUR@EMAIL.com` for the remainder of this guide.
1. If you'd like to enter a comment for the key, you can do so next. Otherwise hit enter to skip it.
1. If everything looks good at this point, hit `o` for Okay.
1. You will now be prompted for your master key passphrase. Please ensure this is a _secure password_ that you have not used anywhere else.

If you are unsure about any of the above, the screenshot below shows the entire key creation process.

<div class="cerb-screenshot">
<img src="/assets/images/guides/mail/gpg/generate-master-key.png" class="screenshot">
</div>

### Set secure preferences on key

Now that your master key is created, we want to set the preferences on the key to ensure current best practices.

1. To edit the key, you need to run `gpg --edit-key YOUR@EMAIL.com` in a Terminal.
1. Paste in the following to set the preferences:
   * `setpref SHA512 SHA384 SHA256 SHA224 AES256 AES192 AES CAST5 ZLIB BZIP2 ZIP Uncompressed`
1. Type `y` to confirm.
1. Type `save` to save and exit.

<div class="cerb-screenshot">
<img src="/assets/images/guides/mail/gpg/set-key-preferences.png" class="screenshot">
</div>

### Add GPG subkey for Cerb

Now that you have your master key, we need to create the subkey used for Encrypt and Sign in Cerb. The process for this is similar to what you have already done before.

1. To add the subkey, you need to first run `gpg --expert --edit-key YOUR@EMAIL.com`.
1. At the prompt, type `addkey`.
1. Choose option: `(8) RSA (set your own capabilities)` as before.
1. Unlike before, the capabilities are already set the way we want ("Sign Encrypt"), so type `q` to finish capability selection.
1. Type `4096` as previously done for the keysize.
1. Next, we suggest using `0` for no expiration as before.
1. Confirm `y` at the next two prompts.
1. After entering your passphrase, your subkey is now created.
1. Type `save` to quit and exit.

<div class="cerb-screenshot">
<img src="/assets/images/guides/mail/gpg/add-gpg-subkey.png" class="screenshot">
</div>

### Export keys for safe storage

<div class="cerb-box warning">
<p>This step is critical to the safety of your GPG keys. If you don't do this, your keys could be forever lost or worse.</p>
</div>

To export your private key, run the following replacing `YOUR@EMAIL.com` in both places with your email address used when creating the key.

$ `gpg --export-secret-keys --armor YOUR@EMAIL.com > YOUR@EMAIL.com.private.gpg-key`

We will also export the public key to keep with the private key:

$ `gpg --export --armor YOUR@EMAIL.com > YOUR@EMAIL.com.public.gpg-key`

Next, we will create a revocation certificate for the key in case it is ever compromised:

1. Run: `gpg --output YOUR@EMAIL.com.gpg-revocation-certificate --gen-revoke YOUR@EMAIL.com` to start the process.
1. Follow the prompts to create the revocation certificate. For reason, we suggest `1 = Key has been compromised`.
1. Hit enter on the description line (it's not needed).

Now that we have these three files created, back them up on a USB drive and put in a very safe place (safety deposit box is a common suggestion).
After copying them to a USB drive, we highly recommend deleting the file ending in `.private.gpg-key` and `.gpg-revocation-certificate` immediately.
You do not need to delete the file ending in `.public.gpg-key` as we will use it later.

<div class="cerb-screenshot">
<img src="/assets/images/guides/mail/gpg/backup-keys.png" class="screenshot">
</div>

### Remove passphrase for using with Cerb

Now that the master key is preserved safely, we need to remove the passphrase for using your GPG key with Cerb.
This isn't a standard process, so GPG is persistent in making sure it's what you really want to do.

1. Edit the key as before via:
   * `gpg --edit-key YOUR@EMAIL.com`
1. At the prompt, type `passwd`.
1. You will first be prompted for your existing passphrase.
1. When prompted for a new passphrase, hit enter.
1. When prompted, pick "Yes, protection is not needed".
1. The above two steps repeat multiple times, keep repeating until they stop asking.
1. Type `quit` at the prompt to finish.

The screenshots below illustrate the process and the prompts you must acknowledge.

<div class="cerb-screenshot">
<img src="/assets/images/guides/mail/gpg/remove-passphrase.png" class="screenshot">
</div>

<div class="cerb-screenshot">
<img src="/assets/images/guides/mail/gpg/new-passphrase-dialog.png" class="screenshot">
</div>

<div class="cerb-screenshot">
<img src="/assets/images/guides/mail/gpg/confirm-no-password.png" class="screenshot">
</div>

### Delete master key from local keyring

Now that your GPG keys are backed up and currently not secured by a password, we need to delete the master key locally for security reasons.

1. First we need to get the keygrip for the master key so we know what to delete:
   * `gpg --with-keygrip --list-keys YOUR@EMAIL.com`
   * Take note of the first `Keygrip =` line in the output, consult the below screenshot as needed.
1. Now that you have the key grip, you need to use it to delete the master key locally from your keyring:
   * `rm $HOME/.gnupg/private-keys-v1.d/<YOUR KEY GRIP>.key`
1. Finally we want to make sure it's really gone:
   * `gpg --list-secret-keys`

As shown in the below screenshot, make sure that there is a `#` after `sec` at the beginning of the 3rd line. This indicates that the master key is offline as it should be.

<div class="cerb-screenshot">
<img src="/assets/images/guides/mail/gpg/delete-master-key.png" class="screenshot">
</div>

### Export subkey for using with Cerb

With all that out of the way, we need to export the subkey we created to use it with Cerb. Run this in a Terminal to export the subkey:

$ `gpg --armor --export-secret-subkeys YOUR@EMAIL.com > YOUR@EMAIL.com.subkey.gpg-key`

You will use the contents of this file to enable Cerb to decrypt encrypted email sent to it in the next step.

<div class="cerb-screenshot">
<img src="/assets/images/guides/mail/gpg/export-gpg-subkey.png" class="screenshot">
</div>

# Using your newly created GPG key with Cerb

There are two methods for importing your subkey into Cerb. We recommend importing it via your browser for simplicity.

### Importing via your browser

Cerb 8.1.0 doesn't have a direct way to add GPG private keys, but thankfully GPG treats them the same for purposes of importing.

1. Navigate to **Search » Public Keys**.
1. Add a new record by clicking on the **(+)** above the worklist.

<div class="cerb-screenshot">
<img src="/assets/images/guides/mail/gpg/search-public-keys.png" class="screenshot">
</div>

1. For the name, enter in `YOUR@EMAIL.com private subkey` or similar.
1. Paste in the contents of the exported private subkey as generated previously.

<div class="cerb-screenshot">
<img src="/assets/images/guides/mail/gpg/add-public-key.png" class="screenshot">
</div>

Skip over the next step and jump ahead to [Publishing your public key](#publishing-your-public-key).

### Importing via command line

To import via command line, you first need to connect via SSH to the server where Cerb is hosted. If you are a Cerb Cloud customer,
this isn't possible so you will need to use the above instructions to do it via your browser.

1. Change into the directory where you have Cerb installed.
1. Tell GPG where to find the keystore used by Cerb:
   * `export GNUPGHOME=$(pwd)/storage/.gnupg/`
1. Check to see if you have existing private keys:
   * `gpg --list-secret-keys`
1. Import the subkey you created previously:
   * `gpg --import /path/to/YOUR@EMAIL.com.subkey.gpg-key`
1. Verify the key exists now and that the master key is offline as before:
   * `gpg --list-secret-keys`

<div class="cerb-screenshot">
<img src="/assets/images/guides/mail/gpg/cerb-console-import.png" class="screenshot">
</div>

# Publishing your public key

Now that you have Cerb setup to receive encrypted email, you need to tell the world about your public key so they can encrypt emails to you.
There are a number of different public key servers commonly used, so we recommend submitting to them all for coverage.

You'll need your public key to do this, so if you don't still have it from the [Export keys for safe storage](#export-keys-for-safe-storage) step earlier, you can re-export it now with:

$ `gpg --export --armor YOUR@EMAIL.com > YOUR@EMAIL.com.public.gpg-key`

### Using Keybase

We highly recommend using a service like [Keybase](https://keybase.io/), which not only verifies the email address of a public key, but also allows the key owner
to prove their identity by verifying ownership of domain names, profiles on various services (e.g. Twitter, GitHub), Bitcoin wallets, etc.

As the setup is a bit more involved than the below three options and subject to change, we recommend visiting
[https://keybase.io/](https://keybase.io/download) and following their guide.

You can also import public keys from Keybase right into Cerb.

### Using MIT's public key server

MIT's public key server is accessible at [https://pgp.mit.edu](https://pgp.mit.edu). The screenshot below shows where to submit your public key:

<div class="cerb-screenshot">
<img src="/assets/images/guides/mail/gpg/mit-public-key-server.png" class="screenshot">
</div>

### Using Symantec's public key server

Symantec's public key server is accessible at [https://keyserver.pgp.com](https://keyserver.pgp.com).

To submit a key to them, visit the [Submit Key](https://keyserver.pgp.com/vkd/GetUploadKeyScreen.event) page and upload your key there as shown in the screenshot below.

<div class="cerb-screenshot">
<img src="/assets/images/guides/mail/gpg/symantec-public-key-server.png" class="screenshot">
</div>

### Using Key-server.io's public key server

Key-server.io's public key server is accessible at [http://pgp.key-server.io](http://pgp.key-server.io). The screenshot below shows where to submit your public key:

<div class="cerb-screenshot">
<img src="/assets/images/guides/mail/gpg/key-server-io-public-key-server.png" class="screenshot">
</div>

# Links to further reading:

* [https://alexcabal.com/creating-the-perfect-gpg-keypair/](https://alexcabal.com/creating-the-perfect-gpg-keypair/)
* [https://spin.atomicobject.com/2013/11/24/secure-gpg-keys-guide/](https://spin.atomicobject.com/2013/11/24/secure-gpg-keys-guide/)
* [https://wiki.debian.org/Subkeys](https://wiki.debian.org/Subkeys)

Links on how to setup setup storage of your private key on a popular hardware device:

* [https://medium.com/@ahawkins/securing-my-digital-life-gpg-yubikey-ssh-on-macos-5f115cb01266](https://medium.com/@ahawkins/securing-my-digital-life-gpg-yubikey-ssh-on-macos-5f115cb01266)
* [https://www.yubico.com/support/knowledge-base/categories/articles/use-yubikey-openpgp/](https://www.yubico.com/support/knowledge-base/categories/articles/use-yubikey-openpgp/)
* [https://github.com/drduh/YubiKey-Guide](https://github.com/drduh/YubiKey-Guide)
