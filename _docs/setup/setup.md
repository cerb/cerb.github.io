---
title: Setup
excerpt: This page provides a comprehensive guide for administrators to configure
  Cerb and its installed plugins through the setup page, accessible from the navigation
  bar.
summary: This page provides a comprehensive guide for administrators to configure
  Cerb and its installed plugins through the setup page, accessible from the navigation
  bar. It is organized into several sections, each offering specific configuration
  options. Key sections include Configure, AI, Security, Team, Mail, Packages,
  Storage, and Developers. Each section contains detailed options such as
  branding, authentication, custom fields, roles, mail settings, storage profiles,
  automation logs, and plugin configuration. This setup page serves as a centralized
  hub for managing various aspects of Cerb's functionality and customization.
permalink: /docs/setup/
jumbotron:
  title: Setup
  tagline: A guide for Administrators
  breadcrumbs:
  - label: Docs &raquo;
    url: /docs/home/
---

The **setup** page in the top right of the navigation bar provides a central location for administrators to configure Cerb and any plugins that have been installed.

<div class="cerb-screenshot">
<img src="/assets/images/docs/setup/setup_nav.png" class="screenshot">
</div>

The page is divided into sections, each with a blue menu designated by a downward-pointing arrow. Hover over a menu to display the configuration options for that section.

<div class="cerb-screenshot">
<img src="/assets/images/docs/setup/setup_menus.png" class="screenshot">
</div>

<span id="plugins"></span><span id="records"></span>

## Configure

- [Subscription](/docs/setup/configure/license/)
- [Branding](/docs/setup/configure/branding/)
- [Cache](/docs/setup/configure/cache/)
- [Localization](/docs/setup/configure/localization/)
- [Plugins](/docs/setup/plugins/installed/)
- [Queues](/docs/setup/configure/queues/)
- [Records](/docs/records/types/) -- a reference for every record type and its fields, API keys, and search filters
- [Scheduler](/docs/setup/configure/scheduler/)

## AI

- Agents
- Models
- Files
- Filesystems
- Tools
- Surfaces
- [Transcripts](/docs/setup/developers/llm-agent-transcripts/)

## Security

- [Configure](/docs/setup/configure/security/)
- [Authentication](/docs/setup/configure/authentication/)
- Service Tokens
- [Active Sessions](/docs/setup/configure/sessions/)

## Team

- [Configure](/docs/setup/team/configure/)
- [Roles](/docs/setup/team/roles/)
- [Groups](/docs/setup/team/groups/)
- [Workers](/docs/setup/team/workers/)

## Mail


### Incoming

- [Settings](/docs/setup/mail/incoming/)
- [Mailboxes](/docs/setup/mail/mailboxes/)
- [Filtering](/docs/setup/mail/filtering/)
- [Routing](/docs/setup/mail/routing/)
- HTML
- [Import](/docs/setup/mail/import/)
- [Failed Messages](/docs/setup/mail/failed/)
- [External Relay](/docs/setup/mail/relay/)
- Log

### Outgoing

- [Email Transports](/docs/setup/mail/transports/)
- [Sender Addresses](/docs/setup/mail/sender-addresses/)
- [Settings](/docs/setup/mail/outgoing/)
- [Automated Email Templates](/docs/setup/mail/templates/)
- [Queue](/docs/setup/mail/queue/)
- Log

## Packages

- [Library](/docs/setup/packages/library/)
- [Import](/docs/setup/packages/import/)

## Storage

- [Overview](/docs/setup/storage/overview/)
- [Profiles](/docs/setup/storage/profiles/)

## Developers

- [Agent Filesystem Terminal](/docs/setup/developers/agent-filesystem-terminal/)
- Automation Events
- [Automation Logs](/docs/setup/developers/automation-logs/)
- [Automation Scripting Tester](/docs/setup/developers/scripting-tester/)
- [Data Query Tester](/docs/setup/developers/data-query-tester/)
- Database Schema
- Export Bots
- [Icon Builder](/docs/setup/developers/icon-builder/)
- OAuth2 Token Generator
- Platform
- Requirements Checker
- [Sheet Builder](/docs/setup/developers/sheet-builder/)
- Toolbars
- [UI Reference](/docs/developers/cerb-ui/)
- [Workflow Builder](/docs/workflows/)

Each menu lists Cerb's own pages first, then any contributed by an installed [plugin](/docs/plugins/) below a divider.

A few menu items are conditional. **Cache** and **Storage &raquo; Profiles** are hidden when the engine is pinned by the [configuration file](/docs/guide/admins/config-file/), and **Export Bots** appears only while the legacy behaviors plugin is enabled.

<p class="youtube-video-container"><iframe width="1280" height="720" src="https://www.youtube.com/embed/oXRxQNJAu6Y" title="A tour of the redesigned Setup pages in Cerb 12.0" frameBorder="0"  allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" allowFullScreen></iframe></p>