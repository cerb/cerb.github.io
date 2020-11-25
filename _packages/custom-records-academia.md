---
title: Custom Records (Academia)
excerpt: "A set of custom records for academic institutions: instructors, courses, rooms, and students."
layout: integration
topic: Packages
permalink: /packages/custom-records-academia/
jumbotron:
  title: Custom Records (Academia)
  tagline: ""
  breadcrumbs:
  -
    label: Resources &raquo;
    url: /resources/
  -
    label: Packages &raquo;
    url: /resources/packages/
---

* TOC
{:toc}

# Introduction

This package imports a set of custom records for academic institutions:

* Courses
  * Name
  * Code
  * Instructor
  * Room
  * Schedule
* Instructors
  * Name
* Rooms
  * Name
* Students
  * Name

You can use this for evaluation and testing, or as the basis for your own workflow.

# Importing the package

Navigate to **Setup >> Packages >> Import**.

Paste the following package into the large text box:

<pre style="max-height: 29.25em;">
<code class="language-json">
{% raw %}
{
  "package": {
    "name": "Custom Records (Academia)",
    "revision": 1,
    "requires": {
      "cerb_version": "10.0.0",
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
  "records": [
    {
      "uid": "custom_record_course",
      "_context": "custom_record",
      "name": "Course",
      "name_plural": "Courses",
      "uri": "course"
    },
    {
      "uid": "custom_record_instructor",
      "_context": "custom_record",
      "name": "Instructor",
      "name_plural": "Instructors",
      "uri": "instructor"
    },
    {
      "uid": "custom_record_room",
      "_context": "custom_record",
      "name": "Room",
      "name_plural": "Rooms",
      "uri": "room"
    },
    {
      "uid": "custom_record_student",
      "_context": "custom_record",
      "name": "Student",
      "name_plural": "Students",
      "uri": "student"
    },
    {
      "uid": "field_course_instructor",
      "_context": "custom_field",
      "context": "course",
      "name": "Instructor",
      "uri": "instructor",
      "type": "L",
      "params": {
        "context": "contexts.custom_record.{{{uid.custom_record_instructor}}}"
      }
    },
    {
      "uid": "field_course_room",
      "_context": "custom_field",
      "context": "course",
      "name": "Room",
      "uri": "room",
      "type": "L",
      "params": {
        "context": "contexts.custom_record.{{{uid.custom_record_room}}}"
      }
    },
    {
      "uid": "field_course_code",
      "_context": "custom_field",
      "context": "course",
      "name": "Code",
      "uri": "code",
      "type": "S"
    },
    {
      "uid": "field_course_schedule",
      "_context": "custom_field",
      "context": "course",
      "name": "Schedule",
      "uri": "schedule",
      "type": "S"
    },
    {
      "uid": "instructor_codd",
      "_context": "instructor",
      "name": "Codd, Ted"
    },
    {
      "uid": "instructor_emell",
      "_context": "instructor",
      "name": "Emell, H.T."
    },
    {
      "uid": "room_berners",
      "_context": "room",
      "name": "Berners-Lee Hall"
    },
    {
      "uid": "room_ibm",
      "_context": "room",
      "name": "IBM Auditorium"
    },
    {
      "uid": "course_cs120",
      "_context": "course",
      "name": "CS120: Introduction to Web Application Development",
      "custom_{{{uid.field_course_code}}}": "CS120",
      "custom_{{{uid.field_course_schedule}}}": "MWF 2:00-4:04p",
      "custom_{{{uid.field_course_instructor}}}": "{{{uid.instructor_emell}}}",
      "custom_{{{uid.field_course_room}}}": "{{{uid.room_berners}}}"
    },
    {
      "uid": "course_cs140",
      "_context": "course",
      "name": "CS140: Introduction to Databases",
      "custom_{{{uid.field_course_code}}}": "CS140",
      "custom_{{{uid.field_course_schedule}}}": "TuTh 7:23-8:03p",
      "custom_{{{uid.field_course_instructor}}}": "{{{uid.instructor_codd}}}",
      "custom_{{{uid.field_course_room}}}": "{{{uid.room_ibm}}}"
    }
  ],
  "settings": {
    "cerberusweb.core": {
      "card:contexts.custom_record.{{{uid.custom_record_course}}}": "[\"custom_{{{uid.field_course_code}}}\",\"custom_{{{uid.field_course_instructor}}}__label\",\"custom_{{{uid.field_course_room}}}__label\",\"custom_{{{uid.field_course_schedule}}}\",\"owner__label\",\"updated_at\"]"
    }
  }
}
{% endraw %}
</code>
</pre>

Click the **Import** button.

You should see the following output:

<div class="cerb-screenshot">
<img src="/assets/images/packages/custom-records-academia/imported.png" class="screenshot">
</div>

# Using custom records

Modify the fields on the custom records from **Search >> Custom Records**.

Add new records from the **Search** menu (e.g. **Search >> Courses**) by clicking on the **(+)** icon above the worklist.

<div class="cerb-screenshot">
<img src="/assets/images/packages/custom-records-academia/custom-records-peek.png" class="screenshot">
</div>
