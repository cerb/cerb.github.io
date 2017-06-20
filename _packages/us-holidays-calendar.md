---
title: U.S. Holidays Calendar
excerpt: A preconfigured calendar with recurring events for U.S. holidays.
layout: integration
topic: Packages
permalink: /packages/us-holidays-calendar/
jumbotron:
  title: U.S. Holidays Calendar
  tagline: ""
  breadcrumbs:
  -
    label: Packages &raquo;
    url: /packages/
---

* TOC
{:toc}

# Introduction

This package imports a preconfigured shared calendar with recurring events for U.S. holidays. This can be linked to worker calendars so that office holidays can be managed in a single place.

You can add or change recurring holiday events to meet your needs.

# Importing the package

Navigate to **Setup >> Configure >> Import Package**.

Paste the following package into the large text box:

<pre style="max-height: 29.25em;">
<code class="language-json">
{% raw %}
{
  "package": {
    "name": "U.S. Holidays Calendars Import",
    "cerb_version": "8.0.0",
    "revision": 1,
    "requires": {
      "cerb_version": "8.0.0",
      "plugins": [
      ]
    },
    "configure": {
      "prompts": [
      ],
      "placeholders": [
      ]
    }
  },
  "calendars": [
    {
      "uid": "calendar_001",
      "name": "U.S. Holidays",
      "owner": {
        "context": "cerberusweb.contexts.app",
        "id": "0"
      },
      "params": {
        "manual_disabled": "0",
        "sync_enabled": "0",
        "start_on_mon": "1",
        "hide_start_time": "1",
        "color_available": "#C5DCFA",
        "color_busy": "#C5DCFA"
      },
      "events": [
        {
          "uid": "event_001",
          "name": "New Year's Day",
          "is_available": false,
          "tz": "America/Los_Angeles",
          "event_start": "00:00:00",
          "event_end": "23:59:59",
          "recur_start": "0",
          "recur_end": "0",
          "patterns": [
            "Jan 1"
          ]
        },
        {
          "uid": "event_002",
          "name": "Independence Day",
          "is_available": false,
          "tz": "America/Los_Angeles",
          "event_start": "00:00:00",
          "event_end": "23:59:59",
          "recur_start": "0",
          "recur_end": "0",
          "patterns": [
            "July 4"
          ]
        },
        {
          "uid": "event_003",
          "name": "Labor Day",
          "is_available": false,
          "tz": "America/Los_Angeles",
          "event_start": "00:00:00",
          "event_end": "23:59:59",
          "recur_start": "0",
          "recur_end": "0",
          "patterns": [
            "first Monday of September"
          ]
        },
        {
          "uid": "event_004",
          "name": "Thanksgiving",
          "is_available": false,
          "tz": "America/Los_Angeles",
          "event_start": "00:00:00",
          "event_end": "23:59:59",
          "recur_start": "0",
          "recur_end": "0",
          "patterns": [
            "fourth Thursday of November"
          ]
        },
        {
          "uid": "event_005",
          "name": "Christmas",
          "is_available": false,
          "tz": "America/Los_Angeles",
          "event_start": "00:00:00",
          "event_end": "23:59:59",
          "recur_start": "0",
          "recur_end": "0",
          "patterns": [
            "Dec 25"
          ]
        },
        {
          "uid": "event_006",
          "name": "New Year's Eve",
          "is_available": false,
          "tz": "America/Los_Angeles",
          "event_start": "00:00:00",
          "event_end": "23:59:59",
          "recur_start": "0",
          "recur_end": "0",
          "patterns": [
            "Dec 31"
          ]
        }
      ]
    }
  ]
}
{% endraw %}
</code>
</pre>

Click the **Import** button.

You'll see the following:

<div class="cerb-screenshot">
<img src="/assets/images/packages/us-holidays/imported.png" class="screenshot">
</div>

# Viewing the calendar

Navigate to **Search >> Calendars** and click on the **U.S. Holidays** record.

<div class="cerb-screenshot">
<img src="/assets/images/packages/us-holidays/calendar.png" class="screenshot">
</div>

You can also add the calendar to a workspace or dashboard.

# Linking the holidays calendar to worker calendars

Navigate to **Search >> Calendars** and select a worker calendar.

Type `e` or click on the edit button at the top.

Make sure **Synchronizing events** is **enabled**.

In the **Synchronize** section, set **Events from** to **Calendar** and select **U.S. Holidays**.

Click the **Save Changes** button.

The worker's calendar will now display U.S. holidays as well as their own events.