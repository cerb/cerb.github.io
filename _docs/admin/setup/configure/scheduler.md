---
title: Scheduler
permalink: /docs/setup/scheduler/
jumbotron:
  title: Scheduler
  breadcrumbs:
  - 
    label: Setup
    url: /docs/setup/
---

Navigate to **Setup** >> **Configure** >> **Scheduler**

<div class="cerb-screenshot">
<img src="/assets/images/docs/setup/scheduler.png" class="screenshot">
</div>

The **scheduler** is responsible for planning and running _jobs_.

A **job** is an automated background task: checking your mailboxes for new messages, search indexing new records, performing nightly maintenance, triggering [bot](/docs/bots/) scheduled behaviors, etc.  There are several built-in jobs, and [plugins](/docs/plugins/) can add new jobs.

Each job is repeated at a specific _interval_ -- a number of minutes, hours, or days. A job can be _disabled_ to prevent it from running.

Different jobs can run at the same time. A job is _locked_ while running to prevent multiple copies of itself from starting.

Each job has a _"run now"_ link that will immediately run the job with logging enabled from inside your web browser. This is useful for troubleshooting and development, but the scheduler should be automated in production environments so that the jobs run without human intervention.

For Cerb's scheduled jobs to automatically run in the background, you need to configure a third-party tool to request the `/cron` page every minute.  On Unix-based systems this is accomplished with a cronjob[^cronjob]. On Windows Server you can add a Scheduled Task[^windows-scheduled-task].

<div class="cerb-box note">
<p>If you're using <b>Cerb Cloud</b>, we handle this for you.</p>
</div>

We recommend using **curl** or **wget** to request your scheduler URL every minute.

The `/cron` page doesn't require a login to use. Instead, it is protected with an IP address[^ip] whitelist. You can authorize additional IPs from the [Security](/docs/setup/security/) section, or from the `AUTHORIZED_IPS_DEFAULTS` setting in the `framework.config.php` file.

{% include setup_toc.html %}

# References

[^cronjob]: <https://en.wikipedia.org/wiki/Cron>

[^windows-scheduled-task]: <https://technet.microsoft.com/en-us/library/cc748993.aspx>

[^ip]: <https://en.wikipedia.org/wiki/IP_address>