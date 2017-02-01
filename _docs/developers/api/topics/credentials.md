---
title: Credentials
permalink: /docs/api/topics/credentials/
jumbotron:
  title: Credentials
  tagline: ""
  breadcrumbs:
  -
    label: Developers &raquo; API
    url: /docs/api/
---

# Enable the Web API plugin

The Web API functionality is provided through a built-in [plugin](/docs/plugins/). Make sure that the **Web API plugin** is enabled before continuing.

# Generate credentials

To access the Web API, a worker generates a *credentials* key-pair consisting of an *access key* and a *secret key*.  Credentials can be created with restricted access to only specific Cerb features. For example, you can create credentials that can only read notifications.

To generate new API credentials:

* Click on the [worker menu](/docs/navigation/#worker-menu) in the top right of the navigation bar.

* Click **Settings**.

* Click the **API Credentials** tab.

* Click the green **(+)** icon at the top of the **Web API Credentials** worklist.

<div class="cerb-screenshot">
<img src="/assets/images/docs/api/new_credentials_dialog.png" class="screenshot">
</div>

* Enter `Everything` for the **Label**.  Optionally, you can use a more descriptive name that makes it easier to remember where the credentials will be used (e.g. "Campfire Virtual Attendant").

* Enter `*` for the **Allowed paths**.  Optionally, you can restrict this to specific request paths (e.g. `tickets/*`).

* Click the **Save Changes** button.

* Click on the newly created credentials in the worklist, then make a note of your **Access Key** and **Secret Key**.

<div class="cerb-screenshot">
<img src="/assets/images/docs/api/credentials.png" class="screenshot">
</div>

* Click the **Save Changes** button.

{% include api_toc.html %}