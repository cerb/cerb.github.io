---
title: Terminology
permalink: /docs/terminology/
jumbotron:
  title: Terminology
  tagline: These are the most common terms used in Cerb.
---

* The representatives that act on behalf of your organization are called **workers**. A worker with unrestricted privileges is an **administrator**.

* Workers with similar skills and responsibilities are organized into **groups**. How members are assigned to a group is completely up to you, but groups generally map to existing departments or teams: Sales, Support, Development, Billing, Corporate.

* Each worker in a group is a **member**. A member with the authority to administer the group is a **manager**. Groups can have any number of managers.

* The units of work assigned to a group are organized into any number of **buckets**, which can be thought of like folders of related messages in a traditional email reader: Leads, Receipts, Newsletters, Refunds, Spam.

* Every group has an **inbox** bucket where new work is delivered by default. This work is then manually or automatically sorted into the appropriate buckets.

* The clients, customers, partners, and other individuals that workers interact with are **contacts**.

* Contacts are grouped together into **organizations**.

* A **ticket** is a specific conversational interaction between workers and contacts, including all of the related messages and other data. Every ticket is automatically assigned a unique reference ID (a non-sequential "**mask**") like `RYS-07092-910`. A contact can provide the first three letters of this reference ID for quick lookups.

* The contacts involved in a conversation are referred to as **participants**.

* A **watcher** is a worker who wants to be notified about all new activity on a specific record. For example, a supervisor may be a watcher on all new tickets to monitor the quality of the messages that workers are sending to contacts.

* **Bots** are programmable agents that can perform most of the same actions as workers. They automate common workflows by responding to **events** with **behaviors** that can be completely built within a web browser -- even by workers with no computer programming experience. For instance, a VA can send an automated response every time a new conversation is started.  Any number of bots may be managed by groups and workers.