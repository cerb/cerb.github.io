---
title: Custom Records (Academia)
excerpt: 'A set of custom records for academic institutions: instructors, courses,
  rooms, and students.'
summary: This page provides a comprehensive guide on implementing custom records for
  academic institutions using Cerb. It includes an introduction to the package, which
  covers records for courses, instructors, rooms, and students, and details the process
  of importing the workflow. The guide offers step-by-step instructions on how to
  update templates and input workflow KATA for setting up custom records, such as
  course details including name, code, instructor, room, and schedule. Additionally,
  it explains how to modify fields and add new records through the Cerb interface,
  making it a useful resource for evaluating, testing, or developing academic workflows.
layout: integration
topic: Workflows
permalink: /workflows/wgm.example.custom_records.academia/
jumbotron:
  title: Custom Records (Academia)
  tagline: ""
  breadcrumbs:
  - label: Resources &raquo;
    url: /resources/
  - label: Workflows &raquo;
    url: /resources/workflows/
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

# Importing the workflow

Navigate to **Search >> Workflows >> (+) >> Empty**.

Click the **Update Template** button at the top of the popup.

Paste the following workflow KATA into the large text box:

{% highlight cerb %}
{% raw %}
workflow:
  name: wgm.example.custom_records.academia
  description: Demonstrates the use of custom records for use in academia
  website: https://cerb.ai/workflows/wgm.example.custom_records.academia/
  version: 2024-10-10T00:00:00Z
  requirements:
    cerb_version: >=11.0 <11.2
    cerb_plugins: cerberusweb.core

records:
  custom_record/course:
    fields:
      name: Course
      name_plural: Courses
      uri: course
  custom_field/course_code:
    fields:
      name: Code
      context: course
      uri: code
      type: S
  custom_field/course_instructor:
    fields:
      name: Instructor
      context: course
      uri: instructor
      type: L
      params:
        context: instructor
  custom_field/course_room:
    fields:
      name: Room
      context: course
      uri: room
      type: L
      params:
        context: room
  custom_field/course_schedule:
    fields:
      name: Schedule
      context: course
      uri: schedule
      type: S
  custom_record/instructor:
    fields:
      name: Instructor
      name_plural: Instructors
      uri: instructor
  custom_record/room:
    fields:
      name: Room
      name_plural: Rooms
      uri: room
  custom_record/student:
    fields:
      name: Student
      name_plural: Students
      uri: student
  instructor/instructor_codd:
    fields:
      name: Codd, Ted
  instructor/instructor_emell:
    fields:
      name: Emell, H.T.
  room/room_berners:
    fields:
      name: Berners-Lee Hall
  room/room_ibm:
    fields:
      name: IBM Auditorium
  course/course_cs120:
    fields:
      name: CS120: Introduction to Web Application Development
      code: CS120
      schedule: MWF 2:00-4:04p
      instructor: {{records.instructor_emell.id}}
      room: {{records.room_berners.id}}
  course/course_cs140:
    fields:
      name: CS140: Introduction to Databases
      code: CS140
      schedule: TuTh 7:23-8:03p
      instructor: {{records.instructor_codd.id}}
      room: {{records.room_ibm.id}}
  card_widget/course_card_fields:
    fields:
      name: Properties
      record_type: course
      extension_id: cerb.card.widget.fields
      pos: 1
      width_units: 4
      zone: content
      extension_params:
        context: course
        context_id@raw: {{record_id}}
        properties:
          0@list:
            cf_{{records.course_code.id}}
            cf_{{records.course_instructor.id}}
            cf_{{records.course_room.id}}
            cf_{{records.course_schedule.id}}
            updated
{% endraw %}
{% endhighlight %}

Click the **Continue** button three times.

You should see results like the following:

<div class="cerb-screenshot">
<img src="/assets/images/workflows/custom-records-academia/imported.png" class="screenshot">
</div>

# Usage

Modify the fields on the custom records from **Search >> Custom Records**.

Add new records from the **Search** menu (e.g. **Search >> Courses**) by clicking on the **(+)** icon above the worklist.

<div class="cerb-screenshot">
<img src="/assets/images/workflows/custom-records-academia/custom-records-peek.png" class="screenshot">
</div>
