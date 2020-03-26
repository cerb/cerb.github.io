---
title: Generate a PGP key-pair for encryption
excerpt: ...
permalink: /guides/mail/encryption/pgp-keypair/
layout: integration
topic: Mail
subtopic: Encryption
jumbotron:
  title: Generate a PGP key-pair for encryption
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
  -
    label: Encryption &raquo;
    url: /resources/guides/#mail-encryption
---

* TOC
{:toc}

# Introduction

Cerb no longer requires (or uses) the [GnuPG PHP extension](https://pecl.php.net/package/gnupg) for PGP email encryption, decryption, signing, or verifying. This makes it easier to use Cerb + PGP in more environments, including Windows.

PGP key-pairs can now be generated entirely in the browser. These support variable key lengths and multiple user IDs (UIDs), and follow the best practice of separate signing and encryption subkeys.

This simplifies PGP setup for new users who don’t have an existing private key.

# Generating a new key-pair

1. Navigate to **Search >> show all >> PGP Private Keys**.

1. Click the **(+)** icon in the right of the gray bar above the worklist.

1. Select the **Create** tab.

1. On the **Key Length**, the default of `2048` bits is reasonably strong, faster, and more widely compatible. A `4096` bit key is stronger, a little slower to use, and may not work on some platforms; but it will be effective for a longer duration. You can make a decision based on the sensitivity of the information you'll be encrypting.

1. On **User IDs**, enter the name and email address of each identity you want covered by this key. You can sign and encrypt messages using any key whether it matches the `From:` sender or not, but those that match are generally more trusted.

1. Once done, click the **Create** button.

You now have a private key (decrypt/sign) and a public key (encrypt/verify).

# Sharing your public key

1. Navigate to **Search >> show all > PGP Public Keys**.

1. Open the card for your new public key.

	<div class="cerb-screenshot" style="margin-left:20px;">
	<img src="/assets/images/guides/mail/encryption/generate-key-pair/public-key-popup.png" class="screenshot">
	</div>

1. If you don't have a **Public Key** widget, you can click **Add Widget** at the bottom of the card popup and import this one:

	<pre style="max-height:29.5em;">
	<code class="language-json">
	{% raw %}
	{
	    "widget": {
	        "uid": "card_widget_pgp_ascii",
	        "_context": "cerb.contexts.card.widget",
	        "name": "Public Key",
	        "record_type": "cerberusweb.contexts.gpg_public_key",
	        "extension_id": "cerb.card.widget.sheet",
	        "pos": "4",
	        "width_units": "4",
	        "zone": "content",
	        "extension_params": {
	            "data_query": "type:worklist.records\r\nof:gpg_public_key\r\nquery:(\r\n  id:{{record_id}}\r\n  limit:1\r\n  sort:[id]\r\n)\r\nformat:dictionaries",
	            "cache_secs": "",
	            "placeholder_simulator_yaml": "",
	            "sheet_yaml": "layout:\r\n  style: fieldset\r\n  headings: false\r\n  paging: false\r\ncolumns:\r\n- text:\r\n    key: _label\r\n    label: Label\r\n    params:\r\n      value_template: |\r\n        &lt;pre&gt;\r\n        {{key_text}}\r\n        &lt;/pre&gt;\r\n- "
	        }
	    }
	}
	{% endraw %}
	</code>
	</pre>

1. Copy the public key text and share it with anyone who needs to send you encrypted messages. The public key is not a secret. You can upload it to key exchange servers or post it on your website.