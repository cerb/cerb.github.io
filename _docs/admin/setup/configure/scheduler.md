---
title: Scheduler
permalink: /docs/setup/scheduler/
jumbotron:
  title: Scheduler
  #tagline: ...
---

Navigate to **Setup** >> **Configure** >> **Scheduler**.

The **scheduler** is responsible for planning and running _jobs_. A **job** is a specific task -- checking your mailboxes for new messages, search indexing new records, performing nightly maintenance, triggering Virtual Attendant scheduled behaviors, etc.  There are several built-in jobs, and new jobs can be added using plugins.

Each job is repeated at a specific _interval_ -- a number of minutes, hours, or days. A job can be _disabled_ to temporarily prevent it from running.

Several jobs can run at the same time without preventing workers from continuing to use the system. While running, a job is _locked_ to prevent additional instances from starting.

Each job has a `run now` link to immediately run the job with logging enabled from inside the web browser. This is useful for troubleshooting and development, but the scheduler should be automated in production environments so that the jobs run without human intervention.

For Cerb's scheduled jobs to automatically run in the background, you need to configure a third-party tool to request the `/cron` page every minute.  On Unix-based systems this is accomplished with a cronjob[^cronjob]. On Windows Server you can add a Scheduled Task[^windows-scheduled-task].

<div class="cerb-box note">
<p>If you're using <b>Cerb Cloud</b>, we handle this for you.</p>
</div>

The `/cron` page doesn't require a login to use. Instead, it is protected with an IP address[^ip] whitelist. You can authorize additional IPs from the **Setup** >> **Configure** >> **Security** page, or from the `AUTHORIZED_IPS_DEFAULTS` option in the `framework.config.php` file.

## Configuring the scheduler in Linux

## Configuring the scheduler in Windows


# References

[^cronjob]: <https://en.wikipedia.org/wiki/Cron>

[^windows-scheduled-task]: <https://technet.microsoft.com/en-us/library/cc748993.aspx>

[^ip]: <https://en.wikipedia.org/wiki/IP_address>