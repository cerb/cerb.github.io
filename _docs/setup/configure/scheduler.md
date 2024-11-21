---
title: Scheduler
excerpt: This page provides an overview of the scheduler in Cerb, which is responsible
  for planning and executing automated background tasks known as jobs.
summary: This page provides an overview of the scheduler in Cerb, which is responsible
  for planning and executing automated background tasks known as jobs. These jobs
  include activities like checking mailboxes for new messages, search indexing, performing
  maintenance, and triggering automation timers. The page explains how jobs are scheduled
  at specific intervals and can be disabled if needed. It also describes how jobs
  can run concurrently, with each job being locked during execution to prevent duplicates.
  Users can manually run jobs for troubleshooting, but automation is recommended for
  production environments. The page details the configuration required for automatic
  job execution, such as using a third-party tool to request the `/cron` page every
  minute, with specific instructions for Unix and Windows systems. It also mentions
  security measures like IP address allowlisting for accessing the `/cron` page.
permalink: /docs/setup/configure/scheduler/
toc:
  expand: Admin Guide
jumbotron:
  title: Scheduler
  breadcrumbs:
  - label: Docs &raquo;
    url: /docs/home/
  - label: Setup &raquo;
    url: /docs/setup/
  - label: Configure &raquo;
    url: /docs/setup/#configure
---

<div class="cerb-screenshot">
<img src="/assets/images/docs/setup/scheduler.png" class="screenshot">
</div>

The **scheduler** is responsible for planning and running _jobs_.

A **job** is an automated background task: checking your mailboxes for new messages, search indexing new records, performing nightly maintenance, triggering [automation](/docs/automations/) timers, etc.  There are several built-in jobs, and [plugins](/docs/plugins/) can add new jobs.

Each job is repeated at a specific _interval_ -- a number of minutes, hours, or days. A job can be _disabled_ to prevent it from running.

Different jobs can run at the same time. A job is _locked_ while running to prevent multiple copies of itself from starting.

Each job has a _"run now"_ link that will immediately run the job with logging enabled from inside your web browser. This is useful for troubleshooting and development, but the scheduler should be automated in production environments so that the jobs run without human intervention.

For Cerb's scheduled jobs to automatically run in the background, you need to configure a third-party tool to request the `/cron` page every minute.  On Unix-based systems this is accomplished with a cronjob[^cronjob]. On Windows Server you can add a Scheduled Task[^windows-scheduled-task].

<div class="cerb-box note">
<p>If you're using <b>Cerb Cloud</b>, we handle this for you.</p>
</div>

We recommend using **curl** or **wget** to request your scheduler URL every minute.

The `/cron` page doesn't require a login to use. Instead, it is protected with an IP address[^ip] allowlist. You can authorize additional IPs from the [Security](/docs/setup/security/) section, or from the `AUTHORIZED_IPS_DEFAULTS` setting in the `framework.config.php` file.


# References

[^cronjob]: <https://en.wikipedia.org/wiki/Cron>

[^windows-scheduled-task]: <https://technet.microsoft.com/en-us/library/cc748993.aspx>

[^ip]: <https://en.wikipedia.org/wiki/IP_address>