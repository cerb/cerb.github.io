---
title: Storage Profiles
permalink: /docs/setup/storage-profiles/
toc:
  title: Storage Profiles
jumbotron:
  title: Storage Profiles
  breadcrumbs:
  - 
    label: Setup
    url: /docs/setup/
---

Navigate to **Setup** >> **Storage** >> **Profiles**

By default, Cerb stores objects in the database and the local filesystem (in the `storage/` directory).  Message content is stored in the database and attachments are stored in the filesystem.

You can create a new **storage profile** here to store objects in different locations, like Amazon Simple Storage Service (S3).

Once a profile is created here, you can use it on a [storage schema](/docs/setup/storage-overview/).

{% include setup_toc.html %}