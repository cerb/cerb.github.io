---
title: 'Setup: Storage Overview'
excerpt: This page provides an overview of the active storage schemas in Cerb, detailing
  the total number of objects and the total size for each schema.
summary: This page provides an overview of the active storage schemas in Cerb, detailing
  the total number of objects and the total size for each schema. It also offers the
  option to configure storage settings by clicking the edit link for each schema,
  allowing users to manage how content is stored and archived.
permalink: /docs/setup/storage/overview/
toc:
  title: Overview
  expand: Admin Guide
jumbotron:
  title: Overview
  breadcrumbs:
  - label: Docs &raquo;
    url: /docs/home/
  - label: Setup &raquo;
    url: /docs/setup/
  - label: Storage &raquo;
    url: /docs/setup/#storage
---

This page makes storage lifecycles easy to read: the **active** and **archive** profile for each storage schema are clearly marked, and a distribution bar compares the number or size of objects held by each profile.

### Migrating objects between profiles

A button on this page starts a migration of objects from one storage profile to another.

Migration isn't limited to the active-to-archive direction driven by the `cron.storage` scheduler job. Storage that has become fragmented across profiles can be consolidated, and long-term storage such as S3 can be brought back to local disk.

Migrations run as parallel background [queue jobs](/docs/records/types/queue_job/), so a large migration continues after you navigate away.

This page displays the active _storage schemas_, with the total number of objects and total size for each schema.

Click the **(edit)** link for a schema to configure how its content is stored and archived.
