---
title: "Data Queries: PGP Key Info"
excerpt: 
permalink: /docs/data-queries/gpg/keyinfo/
social_image_url: /assets/images/docs/data-queries/data-queries.png
toc:
  title: PGP Key Info
jumbotron:
  title: PGP Key Info
  tagline: 
  breadcrumbs:
  -
    label: Docs &raquo;
    url: /docs/home/
  -
    label: Data Queries &raquo;
    url: /docs/data-queries/
---

# gpg.keyinfo

`gpg.keyinfo` data queries return details about a PGP Public Key.

### Inputs
{: .no_toc}

|-|-
| `fingerprint:` | The public key fingerprint to look up
| `filter:` | `uids`, `subkeys`, or omit for both

### Response Formats
{: .no_toc}

* **dictionaries** (default) returns a table-based format suitable for [sheets](/docs/sheets/) and API results.

### Examples
{: .no_toc}

#### Query: 

<pre>
<code class="language-cerb">
{% raw %}
type:gpg.keyinfo
fingerprint:EB53CF5B6712E70F
format:dictionaries
{% endraw %}
</code>
</pre>

#### Response:

<pre>
<code class="language-json">
{
  "data": {
    "disabled": false,
    "expired": false,
    "revoked": false,
    "is_secret": false,
    "can_sign": true,
    "can_encrypt": true,
    "uids": [
      {
        "name": "Webgroup Media LLC",
        "comment": null,
        "email": "support@webgroupmedia.com",
        "uid": "Webgroup Media LLC <support@webgroupmedia.com>",
        "revoked": false,
        "invalid": false
      }
    ],
    "subkeys": [
      {
        "fingerprint": "7DCA2B1D4FFE23739C46F49CEB53CF5B6712E70F",
        "keyid": "6712E70F",
        "timestamp": 1481832779,
        "expires": 0,
        "is_secret": false,
        "invalid": false,
        "can_encrypt": false,
        "can_sign": true,
        "disabled": false,
        "expired": false,
        "revoked": false
      },
      {
        "fingerprint": "28D08C9FE340C7C274329D768BAB1F9A7D9BBCCC",
        "keyid": "7D9BBCCC",
        "timestamp": 1481832779,
        "expires": 1734120779,
        "is_secret": false,
        "invalid": false,
        "can_encrypt": true,
        "can_sign": false,
        "disabled": false,
        "expired": false,
        "revoked": false
      },
      {
        "fingerprint": "94EC3D18B2C869B97540A15975332EBEBE387ABF",
        "keyid": "BE387ABF",
        "timestamp": 1481832779,
        "expires": 1734120779,
        "is_secret": false,
        "invalid": false,
        "can_encrypt": false,
        "can_sign": true,
        "disabled": false,
        "expired": false,
        "revoked": false
      }
    ]
  },
  "_": {
    "type": "gpg.keyinfo",
    "format": "dictionaries"
  }
}
</code>
</pre>