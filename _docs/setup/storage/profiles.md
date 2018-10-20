---
title: "Setup: Storage Profiles"
permalink: /docs/setup/storage/profiles/
toc:
  title: Profiles
  expand: Setup
jumbotron:
  title: Profiles
  breadcrumbs:
  - 
    label: Docs &raquo;
    url: /docs/home/
  - 
    label: Setup &raquo;
    url: /docs/setup/
  - 
    label: Storage &raquo;
    url: /docs/setup/storage/
---

By default, Cerb stores objects in the database and the local filesystem (in the `storage/` directory).  Message content is stored in the database and attachments are stored in the filesystem.

You can create a new **storage profile** here to store objects in different locations, like Amazon Simple Storage Service (S3).

Once a profile is created here, you can use it on a [storage schema](/docs/setup/storage-overview/).
