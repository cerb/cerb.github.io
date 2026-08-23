---
title: 'Setup: Storage Profiles'
excerpt: This page provides information on setting up storage profiles in Cerb.
summary: This page provides information on setting up storage profiles in Cerb. By
  default, Cerb stores objects in the database and the local filesystem, with message
  content in the database and attachments in the filesystem. The page explains how
  to create a new storage profile to store objects in alternative locations, such
  as Amazon Simple Storage Service (S3). Once a storage profile is created, it can
  be applied to a storage schema, allowing for flexible and customizable storage solutions.
permalink: /docs/setup/storage/profiles/
toc:
  title: Profiles
  expand: Admin Guide
jumbotron:
  title: Profiles
  breadcrumbs:
  - label: Docs &raquo;
    url: /docs/home/
  - label: Setup &raquo;
    url: /docs/setup/
  - label: Storage &raquo;
    url: /docs/setup/#storage
---

By default, Cerb stores objects in the database and the local filesystem (in the `storage/` directory).  Message content is stored in the database and attachments are stored in the filesystem.

You can create a new **storage profile** here to store objects in different locations, like Amazon Simple Storage Service (S3).

Once a profile is created here, you can use it on a [storage schema](/docs/setup/storage/overview/).
