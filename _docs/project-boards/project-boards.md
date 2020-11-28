---
title: Project Boards
excerpt: Project boards visually organize and automate a multi-step process.
permalink: /docs/project-boards/
social_image_url: /assets/images/guides/project-boards/configure/cerb-and-project-boards.png
jumbotron:
  title: Project Boards
  tagline: 
  breadcrumbs:
  -
    label: Docs &raquo;
    url: /docs/home/
  -
    label: Workspaces &raquo;
    url: /docs/workspaces/
---

<div class="cerb-screenshot">
<img src="/assets/images/docs/project-boards/project-board.png" class="screenshot">
</div>

**Project boards** are based on the kanban[^kanban-dev] development process, which itself was derived from improvements to just-in-time production pioneered by Japanese manufacturer Toyota in the 1940s[^kanban].

With kanban, each project has a **board**, and each unit of work in that project is represented by a **card**.  Cards are organized into **columns** on the board based on their stage of completion. Typically, cards move from left to right through the columns of the process.

One of the core principles of kanban is limiting the amount of work in progress.  For instance, while there may be a large number of cards in a leftmost column named **"TODO"**, there is an agreed upon limit of 2-3 cards in the next **"In Progress"** column.  Cerb does not enforce these limits for you, but a useful convention is adding the limit to the end of the column name -- like **"In Progress (3)"**.

One of the most compelling advantages of the kanban process is its simplicity.  It can be implemented with a physical white board that has been divided into columns, with a stack of index cards (or Post-it&reg; notes) for the tasks.

However, Cerb's digital implementation of kanban provides several enhancements:

* The project boards are visible to the entire team from anywhere.

* An activity log provides a full history of changes to the project and its cards.

* [Automations](/docs/automations/) can be [triggered](/docs/automations/triggers/projectBoard.cardAction/) every time a card is moved into a new column. This can automate field changes, comments, notifications, webhooks, or anything else.

* Automations can also [customize the display of cards](/docs/automations/triggers/projectBoard.renderCard/) based on dynamic factors like record type, field values, custom fields, and the current column. Cards always show the most recent information available.

### References

[^kanban]: Wikipedia: Kanban - <https://en.wikipedia.org/wiki/Kanban>

[^kanban-dev]: Wikipedia: Kanban (development) - <https://en.wikipedia.org/wiki/Kanban_(development)>