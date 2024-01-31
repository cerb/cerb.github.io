---
title: Scalable automatic ticket assignment without worklists
excerpt: "Use explore mode automations to receive a continuous set of assignments without digging through shared worklists and colliding with other workers. Capture and report on the exact reason a worker can't complete an assignment."
social_image_url: /assets/images/guides/automations/interaction.worker.explore/auto-assignment/explore-next.png
layout: integration
topic: Automations
subtopic: interaction.worker.explore
jumbotron:
  title: Scalable automatic ticket assignment without worklists
  tagline: "Use explore mode automations to receive a continuous set of assignments without digging through shared worklists and colliding with other workers. Capture and report on the exact reason a worker can't complete an assignment."
  breadcrumbs:
  -
    label: Resources &raquo;
    url: /resources/
  -
    label: Guides &raquo;
    url: /resources/guides/
  -
    label: Automations &raquo;
    url: /resources/guides/#automations
---

* TOC
{:toc}

# Introduction

Once you have more than a few simultaneous [workers](/docs/workers/) handling [tickets](/docs/tickets/) in Cerb, it becomes inefficient for those workers to manually select their own next assignments from shared [worklists](/docs/worklists/).

For instance, a worker can choose their next ticket and take a moment to familiar themselves with the issue, only to frustratedly realize once they start replying that another worker has done the same thing.

This also negatively impacts customer satisfaction and service-level agreements, as workers may cherry-pick newer, simpler, or more interesting tickets while other issues frequently languish.

Furthermore, managers lack insight as to why certain issues are being skipped by workers. Are there gaps in workers' knowledge or skills? Are tickets being routed to the wrong groups?

Tickets can be automatically assigned to workers during routing, but this should not happen without user interaction. An overly busy worker blocks other available workers from handling new issues.

A superior alternative is to provide workers with a simple button to start their next assignment. Behind the scenes, Cerb makes sure personalized assignments are consistently triaged using your own business logic (e.g. service-level agreements, importance, oldest first, previous contributions, skill-based). If a worker is unable to complete their assignment issue, the reason is captured before they're allowed to skip the ticket and return it to the assignment pool for another worker.

This workflow can be built with the following Cerb features:

* [Custom records](/docs/records/#custom-records) and [custom fields](/docs/custom-fields/) for capturing **Assignment rejections** and **Assignment rejection reasons**.

* [Automations](/docs/automations/) and [interactions](/docs/interactions/) to power the **Start work** button.

* [Dynamic explore mode](/docs/automations/triggers/interaction.worker.explore/) to continuously step through next assignments without returning to a worklist.

* [Toolbars](/docs/toolbars/) to provide custom actions in explore mode.

# How it works

A new "**work**" [workspace page](/docs/workspaces/) can be added to worker menus. This is intentionally simplified to only show a **Start work** button and the worker's current notifications and assignments.

<div class="cerb-screenshot">
<img src="/assets/images/guides/automations/interaction.worker.explore/auto-assignment/workspace.png" class="screenshot">
</div>

The **Start work** action is also available on any page from the global menu in the lower right.

<div class="cerb-screenshot">
<img src="/assets/images/guides/automations/interaction.worker.explore/auto-assignment/global-menu.png" class="screenshot">
</div>

Clicking on the **Start work** action launches a custom "explore mode" [interaction](/docs/automations/triggers/interaction.worker.explore/). This is responsible for assigning the next ticket to a worker every time they press the **Next** button in the top right.

In this example, tickets are assignable if:

* They are in the **open** status.

* They are unassigned or assigned to the current worker.

* They have not been previously rejected by the current worker.

Assignable tickets are then triaged in the following order:

* Tickets that are already assigned to the worker. These include issues with new customer replies, or where the 'wait until' date has elapsed. For instance, a developer gathering more information on a bug report may choose to leave an issue assigned to them after they reply so that they can handle the follow-up.

* Unassigned tickets with the highest importance. The importance rating can be modified during intake based on service-level agreements, VIPs, etc.

* Tickets that have been open for the longest.

This logic is completely customizable in the `example.getWork.workerExplore` automation.

The worker is automatically taken to the assigned ticket's [profile](/docs/profiles/) page. From here they can perform actions like replying, commenting, rerouting, or changing the status.

Once finished, the worker clicks on the **Next** button in the top right for their next assignment.

<div class="cerb-screenshot">
<img src="/assets/images/guides/automations/interaction.worker.explore/auto-assignment/explore-next.png" class="screenshot">
</div>

If a worker attempts to click on the **Next** button without having worked on the ticket, the following warning is displayed. 

<div class="cerb-screenshot">
<img src="/assets/images/guides/automations/interaction.worker.explore/auto-assignment/unresolved-popup.png" class="screenshot">
</div>

If the worker is unable to resolve the ticket, they can click on **I can't work on it** to select a reason.

<div class="cerb-screenshot">
<img src="/assets/images/guides/automations/interaction.worker.explore/auto-assignment/reasons-popup.png" class="screenshot">
</div>

The possible reasons are configurable from **Search >> Assignment Rejection Reasons**. Click **(+)** in the top right of the worklist to add a new reason.

<div class="cerb-screenshot">
<img src="/assets/images/guides/automations/interaction.worker.explore/auto-assignment/search-rejection-reasons.png" class="screenshot">
</div>

If work was performed, the worker is reminded if they remain the owner. They can remain the ticket owner if they need to handle the follow-up, or they can release the issue so the follow-up can be assigned to someone else.

<div class="cerb-screenshot">
<img src="/assets/images/guides/automations/interaction.worker.explore/auto-assignment/unassign-popup.png" class="screenshot">
</div>

The worker can simply click **Next** to receive assignments for their entire shift without ever returning to a worklist and digging for work.

# Import the pre-built package

This guide includes a pre-built version of this workflow.

In Cerb, navigate to **Setup >> Packages >> Import** and paste the following [package](/docs/packages/):

<pre style="max-height:29.5em;">
<code class="language-json">
{% raw %}
{
  "package": {
    "name": "Automatic Work Assignment",
    "revision": 1,
    "requires": {
      "cerb_version": "10.4"
    }
  },
  "records": [
    {
      "uid": "record_assignment_rejection",
      "_context": "custom_record",
      "uri": "assignment_rejection",
      "name": "Assignment Rejection",
      "name_plural": "Assignment Rejections",
      "params": {
        "owners": {
          "contexts": [
            "cerberusweb.contexts.app"
          ]
        },
        "options": [
          "comments"
        ]
      }
    },
    {
      "uid": "field_assignment_worker",
      "_context": "custom_field",
      "context": "assignment_rejection",
      "name": "Worker",
      "uri": "worker",
      "pos": 1,
      "type": "L",
      "params": {
        "context": "cerberusweb.contexts.worker"
      }
    },
    {
      "uid": "field_assignment_ticket",
      "_context": "custom_field",
      "context": "assignment_rejection",
      "name": "Ticket",
      "uri": "ticket",
      "pos": 2,
      "type": "L",
      "params": {
        "context": "cerberusweb.contexts.ticket"
      }
    },
    {
      "uid": "field_assignment_reason",
      "_context": "custom_field",
      "context": "assignment_rejection",
      "name": "Reason",
      "uri": "reason",
      "pos": 3,
      "type": "L",
      "params": {
        "context": "assignment_rejection_reason"
      }
    },
    {
      "uid": "field_assignment_expires_at",
      "_context": "custom_field",
      "context": "assignment_rejection",
      "name": "Expires At",
      "uri": "expires_at",
      "pos": 4,
      "type": "E"
    },
    {
      "uid": "record_assignment_rejection_reason",
      "_context": "custom_record",
      "uri": "assignment_rejection_reason",
      "name": "Assignment Rejection Reason",
      "name_plural": "Assignment Rejection Reasons",
      "params": {
        "owners": {
          "contexts": [
            "cerberusweb.contexts.app"
          ]
        }
      }
    },
    {
      "uid": "field_assignment_reason_expires_in",
      "_context": "custom_field",
      "context": "assignment_rejection_reason",
      "name": "Expires In",
      "uri": "expires_in",
      "pos": 1,
      "type": "S"
    },
    {
      "uid": "reason_cantResolve",
      "_context": "assignment_rejection_reason",
      "name": "I don't know how to resolve it",
      "owner__context": "app",
      "owner_id": 0,
      "custom_{{{uid.field_assignment_reason_expires_in}}}": "1 day"
    },
    {
      "uid": "reason_otherOwner",
      "_context": "assignment_rejection_reason",
      "name": "Someone else is already working on it",
      "owner__context": "app",
      "owner_id": 0,
      "custom_{{{uid.field_assignment_reason_expires_in}}}": "15 mins"
    },
    {
      "uid": "reason_waitingCustomer",
      "_context": "assignment_rejection_reason",
      "name": "We're waiting on the customer",
      "owner__context": "app",
      "owner_id": 0,
      "custom_{{{uid.field_assignment_reason_expires_in}}}": ""
    },
    {
      "uid": "automation_workerExplore",
      "_context": "automation",
      "name": "example.getWork.workerExplore",
      "extension_id": "cerb.trigger.interaction.worker.explore",
      "description": "Step through next assignments in a worker explore mode",
      "script": "start:\r\n  set:\r\n    isLooping@bool: yes\r\n  \r\n  while:\r\n    if@key,bool: isLooping\r\n    do:\r\n      record.search/find:\r\n        output: next_ticket\r\n        inputs:\r\n          record_type: ticket\r\n          record_query@text:\r\n            status:o\r\n            (owner.id:me OR owner.id:nobody)\r\n            links.assignment_rejection.ticket:!(worker.id:${worker_id})\r\n            sort:-owner.id,-importance,lastOpenedAt\r\n            limit:1\r\n          record_query_params:\r\n            worker_id@key: worker_id\r\n        on_success:\r\n          decision/exists:\r\n            outcome/yes:\r\n              if@bool: {{next_ticket.id}}\r\n              then:\r\n                # If this ticket was unassigned, assign it to the current worker\r\n                outcome/unassigned:\r\n                  if@bool: {{0 == next_ticket.owner_id}}\r\n                  then:\r\n                    record.update:\r\n                      inputs:\r\n                        record_type: ticket\r\n                        record_id: {{next_ticket.id}}\r\n                        fields:\r\n                          owner_id@int: {{worker_id}}\r\n                \r\n                # Display this ticket to the worker\r\n                await/explore:\r\n                  explore:\r\n                    title: {{next_ticket._label}}\r\n                    url: {{next_ticket.record_url}}\r\n                    toolbar:\r\n                      interaction/next:\r\n                        label: Next\r\n                        icon: chevron-right\r\n                        icon_at: end\r\n                        keyboard: ]\r\n                        uri: cerb:automation:example.getWork.toolbarItem.next\r\n                        inputs:\r\n                          ticket: {{next_ticket.id}}\r\n            outcome/empty:\r\n              then:\r\n                await:\r\n                  explore:\r\n                    title: You're all caught up!\r\n                    toolbar:\r\n                      interaction/refresh:\r\n                        label: Refresh\r\n                        icon: refresh",
      "policy_kata": "commands:\r\n  record.search:\r\n    deny/type@bool: {{inputs.record_type is not record type ('ticket')}}\r\n    allow@bool: yes\r\n  record.update:\r\n    deny/type@bool: {{inputs.record_type is not record type ('ticket')}}\r\n    #deny/fields@bool: {{inputs.fields != ['owner_id']}}\r\n    allow@bool: yes    "
    },
    {
      "uid": "automation_toolbarItemExplore",
      "_context": "automation",
      "name": "example.getWork.toolbarItem.explore",
      "extension_id": "cerb.trigger.interaction.worker",
      "description": "Create a dynamic explore set for real-time work assignments",
      "script": "start:\r\n  api.command:\r\n    inputs:\r\n      name: cerb.commands.worklist.explorer.create\r\n      params:\r\n        interaction: cerb:automation:example.getWork.workerExplore\r\n    output: results\r\n    on_success:\r\n      return:\r\n        open_url: {{cerb_url('c=explore&guid=' ~ results.hash)}}",
      "policy_kata": "commands:\r\n  api.command:\r\n    deny/name@bool: {{inputs.name not in ['cerb.commands.worklist.explorer.create']}}\r\n    allow@bool: yes"
    },
    {
      "uid": "automation_65b5c7658fe95",
      "_context": "automation",
      "name": "example.getWork.toolbarItem.next",
      "extension_id": "cerb.trigger.interaction.worker",
      "description": "",
      "script": "inputs:\r\n  record/ticket:\r\n    required@bool: yes\r\n    record_type: ticket\r\n\r\nstart:\r\n  decision:\r\n    # If the ticket is still open, it needs to be formally rejected to skip\r\n    outcome/isOpen:\r\n      if@bool: {{'open' == inputs.ticket.status and inputs.ticket.owner_id in [0,worker_id]}}\r\n      then:\r\n        await/isOpen:\r\n          form:\r\n            title: Unresolved\r\n            elements:\r\n              say:\r\n                content@text:\r\n                  This ticket is still unresolved.\r\n                  ===========\r\n              submit/prompt_menu:\r\n                buttons:\r\n                  continue/accept:\r\n                    label: I'll continue working on it\r\n                    icon: circle-ok\r\n                    icon_at: start\r\n                    value: accept\r\n                  continue/reject:\r\n                    label: I can't work on it\r\n                    icon: ban\r\n                    icon_at: start\r\n                    value: reject\r\n                    style: secondary\r\n        \r\n        outcome/continue:\r\n          if@bool: {{'accept' == prompt_menu}}\r\n          then:\r\n            return:\r\n        \r\n        # Load dynamic rejection reasons\r\n        record.search/reasons:\r\n          output: reasons\r\n          inputs:\r\n            record_type: assignment_rejection_reason\r\n            record_query: sort:name\r\n            record_expand: customfields\r\n        \r\n        await/reason:\r\n          form:\r\n            title: I can't work on this ticket\r\n            elements:\r\n              sheet/prompt_reason:\r\n                label: Reason:\r\n                required@bool: yes\r\n                data@key: reasons\r\n                limit: 10\r\n                schema:\r\n                  layout:\r\n                    headings@bool: no\r\n                    filtering@bool: no\r\n                    paging@bool: no\r\n                    style: grid\r\n                  columns:\r\n                    selection/id:\r\n                      params:\r\n                        mode: single\r\n                    text/name:\r\n                      params:\r\n                        bold@bool: yes\r\n              submit:\r\n                continue@bool: no\r\n                reset@bool: no\r\n        \r\n        # Unassign the ticket\r\n        record.update/unassign:\r\n          output: updated_ticket\r\n          inputs:\r\n            record_type: ticket\r\n            record_id: {{inputs.ticket.id}}\r\n            fields:\r\n              owner_id: 0\r\n        \r\n        # Reason specific behavior\r\n        decision/reasons:\r\n          outcome/waitingOnCustomer:\r\n            if@bool: {{reasons[prompt_reason].name == \"We're waiting on the customer\"}}\r\n            then:\r\n              record.update/ticketWaiting:\r\n                output: updated_ticket\r\n                inputs:\r\n                  record_type: ticket\r\n                  record_id: {{inputs.ticket.id}}\r\n                  fields:\r\n                    status: waiting\r\n                    reopen_date@date: tomorrow 8am\r\n        \r\n        # Create/update the assignment log record\r\n        outcome/logReason:\r\n          if@bool: {{reasons[prompt_reason].expires_in}}\r\n          then:\r\n            record.upsert/assignment_rejection:\r\n              output: record_rejection\r\n              inputs:\r\n                record_type: assignment_rejection\r\n                record_query@text:\r\n                  worker.id:${worker_id} ticket.id:${ticket_id} limit:1 sort:-id\r\n                record_query_params:\r\n                  worker_id@key: worker_id\r\n                  ticket_id: {{inputs.ticket.id}}\r\n                fields:\r\n                  name: {{worker__label}} on {{inputs.ticket._label}}\r\n                  ticket: {{inputs.ticket.id}}\r\n                  worker: {{worker_id}}\r\n                  reason: {{prompt_reason}}\r\n                  expires_at@date: {{reasons[prompt_reason].expires_in}}\r\n                  owner__context: app\r\n                  owner_id: 0\r\n        \r\n        return:\r\n          explore_page: next      \r\n        \r\n    # Check if we need to unassign the current ticket\r\n    outcome/isAssigned:\r\n      if@bool: {{inputs.ticket.owner_id == worker_id}}\r\n      then:\r\n        await:\r\n          form:\r\n            title: Done\r\n            elements:\r\n              say:\r\n                content@text:\r\n                  The ticket is still assigned to you.\r\n                  =====================\r\n              submit/prompt_menu:\r\n                buttons:\r\n                  continue/no:\r\n                    label: Unassign me\r\n                    icon: remove\r\n                    icon_at: start\r\n                    value: unassign\r\n                  continue/yes:\r\n                    label: Keep me assigned\r\n                    icon: circle-ok\r\n                    icon_at: start\r\n                    value: keep\r\n                    style: secondary\r\n        \r\n        outcome/yes:\r\n          if@bool: {{'unassign' == prompt_menu}}\r\n          then:\r\n            record.update:\r\n              inputs:\r\n                record_type: ticket\r\n                record_id: {{inputs.ticket.id}}\r\n                fields:\r\n                  owner_id: 0\r\n        \r\n        return:\r\n          explore_page: next\r\n    \r\n    outcome/else:\r\n      then:\r\n        return:\r\n          explore_page: next",
      "policy_kata": "commands:\r\n  record.create:\r\n    deny/type@bool: {{inputs.record_type is not record type ('assignment_rejection')}}\r\n    allow@bool: yes\r\n  record.search:\r\n    deny/type@bool: {{inputs.record_type is not record type ('assignment_rejection_reason')}}\r\n    allow@bool: yes\r\n  record.update:\r\n    deny/type@bool: {{inputs.record_type is not record type ('assignment_rejection', 'ticket')}}\r\n    allow@bool: yes\r\n  record.upsert:\r\n    deny/type@bool: {{inputs.record_type is not record type ('assignment_rejection')}}\r\n    allow@bool: yes    "
    },
    {
      "uid": "page_work",
      "_context": "workspace_page",
      "extension_id": "core.workspace.page.workspace",
      "name": "Work",
      "owner__context": "app",
      "owner_id": "0"
    },
    {
      "uid": "tab_work_tickets",
      "_context": "workspace_tab",
      "extension_id": "core.workspace.tab.dashboard",
      "name": "Tickets",
      "page_id": "{{{uid.page_work}}}",
      "pos": "1",
      "params": {
        "num_columns": "1"
      }
    },
    {
      "uid": "workspace_widget_actions",
      "_context": "cerberusweb.contexts.workspace.widget",
      "tab_id": "{{{uid.tab_work_tickets}}}",
      "label": "Actions",
      "extension_id": "core.workspace.widget.form_interaction",
      "pos": 1,
      "width_units": 4,
      "zone": "content",
      "params": {
        "interactions_kata": "interaction/startWork:\r\n  label: Start work\r\n  uri: cerb:automation:example.getWork.toolbarItem.explore\r\n  icon: play-button",
        "is_popup": "0"
      }
    },
    {
      "uid": "workspace_widget_my_notifications",
      "_context": "cerberusweb.contexts.workspace.widget",
      "tab_id": "{{{uid.tab_work_tickets}}}",
      "label": "My Unread Notifications",
      "extension_id": "core.workspace.widget.worklist",
      "pos": 2,
      "width_units": 4,
      "zone": "content",
      "params": {
        "context": "cerberusweb.contexts.notification",
        "query_required": "isRead:n worker:me",
        "query": "",
        "render_limit": "15",
        "header_color": "#6a87db",
        "columns": [
          "we_created_date",
          "we_activity_point"
        ]
      }
    },
    {
      "uid": "workspace_widget_my_tickets",
      "_context": "cerberusweb.contexts.workspace.widget",
      "tab_id": "{{{uid.tab_work_tickets}}}",
      "label": "My Open Tickets",
      "extension_id": "core.workspace.widget.worklist",
      "pos": 3,
      "width_units": 4,
      "zone": "content",
      "params": {
        "context": "cerberusweb.contexts.ticket",
        "query_required": "status:o owner:me",
        "query": "",
        "render_limit": "15",
        "header_color": "#6a87db",
        "columns": [
          "t_last_wrote_address_id",
          "t_importance",
          "t_group_id",
          "t_bucket_id",
          "t_owner_id",
          "t_last_opened_at"
        ]
      }
    }
  ],
  "toolbars": [
    {
      "toolbar": "global.menu",
      "kata": "interaction/startWork:\r\n  label: Start Work\r\n  uri: cerb:automation:example.getWork.toolbarItem.explore\r\n  icon: play-button"
    }
  ]
}
{% endraw %}
</code>
</pre>

Click the **Import** button.

<div class="cerb-screenshot">
<img src="/assets/images/guides/automations/interaction.worker.explore/auto-assignment/import_results.png" class="screenshot">
</div>

# Next steps

* Add your own assignment rejection reasons from **Search >> Automation Rejection Reasons**.

* Modify the assignment logic in the `example.getWork.workerExplore` automation.

* Add custom fieldsets to **Automation rejection** records to gather additional information from the rejection interaction. Use this data to improve worker training and internal support resources. The interaction could also include a troubleshooter to attempt to help a worker solve the issue.