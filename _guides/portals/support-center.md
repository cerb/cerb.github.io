---
title: Create a new Support Center community portal
excerpt: This guide provides step-by-step instructions for creating a new Support Center portal.
layout: integration
topic: Portals
jumbotron:
  title: Create a new Support Center community portal
  tagline: ""
  breadcrumbs:
  -
    label: Resources &raquo;
    url: /resources/
  -
    label: Guides &raquo;
    url: /resources/guides/
  -
    label: Portals &raquo;
    url: /resources/guides/#portals
---

* TOC
{:toc}

# Introduction

The most popular [community portal](/docs/portals/) is the **Support Center**. This provides a place for customers to read recent announcements, search your knowledgebase, fill out contact forms, edit their profile, and review their [ticket](/docs/tickets/) history.

<div class="cerb-screenshot">
<img src="/assets/images/guides/portals/support-center/sc.png" class="screenshot">
</div>

# Install the Support Center plugin

First, make sure that the necessary [plugin](/docs/plugins/) is enabled.

Navigate to **Setup >> Plugins >> Installed**.

Type `support` in the search box and verify that the Support Center plugin is installed. If not, enable it.

# Create a new community portal

Now we're ready to create a new Support Center.

Navigate to **Setup >> Portals >> Search**.

Click the **(+)** icon above the worklist.

Enter the following values:

* **Name:** `Support Center`
* **Type:** `Support Center`

Click the **Save Changes** button.

# Configure the Support Center

### Branding

<div class="cerb-screenshot">
<img src="/assets/images/guides/portals/support-center/branding.png" class="screenshot">
</div>
### Modules

<div class="cerb-screenshot">
<img src="/assets/images/guides/portals/support-center/modules.png" class="screenshot">
</div>

Click the **Save Changes** button.

# Deploy the Support Center

### Cerb Cloud

If you're a [Cerb Cloud](/cloud/) subscriber, we include high-availability community portal hosting. This is already handled for you.

### Nginx (recommended)

See: [Host community portals using Nginx](/guides/portals/nginx-proxy/)

### Cerb's PHP proxy script

Select the **Installation** tab.

You can deploy the `index.php` file in the web path of any web server capable of running PHP scripts (Nginx, Apache, IIS, etc).

