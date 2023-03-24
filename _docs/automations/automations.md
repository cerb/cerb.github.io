---
title: Automations
excerpt: Automations are state machines written in KATA that transform an input dictionary into an output dictionary. The results are used to automate and customize workflows throughout Cerb.
#social_image_url: /assets/images/search/kata.png
permalink: /docs/automations/
toc:
  title: Automations
jumbotron:
  title: Automations
  tagline: 
  breadcrumbs:
  -
    label: Docs &raquo;
    url: /docs/home/
---

{% comment %}
<div class="cerb-screenshot">
<img src="{{page.social_image_url}}" class="screenshot">
</div>
{% endcomment %}

**Automations** are self-contained state machines written in [KATA](/docs/kata/) that transform an input dictionary into an output dictionary. The results are used to automate and customize workflows throughout Cerb.

<div class="cerb-screenshot">
    <img src="/assets/images/docs/automations/editor.png" class="screenshot">
</div>

* TOC
{:toc}

# Syntax

This simple automation, written in [KATA](/docs/kata/):

<pre>
<code class="language-cerb">
{% raw %}
start:
  return:
    answer: {{a * b}}
{% endraw %}
</code>
</pre>

With this input:

<pre>
<code class="language-cerb">
a: 5
b: 4
</code>
</pre>

Returns this output:

<pre>
<code class="language-cerb">
answer: 20
</code>
</pre>

### Dictionaries

A **dictionary** is simply a set of **keys** with corresponding **values**. Keys are a name that ends with a colon (`:`). Values are units of data like text, numbers, arrays (lists), booleans (true/false), or dictionaries.

The input and output above are dictionaries.

The input dictionary has a key `a:` with the value `5`, and a key `b:` with the value `4`.

The output dictionary has a key `answer:` with the value `20`.

In [KATA](/docs/kata/), indenting keys with spaces creates a hierarchy of parent/child relationships. `start:` has a child `return:` which has a child `answer:`.

There is a unique **key path** to any key. In the example above, `start:return:answer:` is the path to the key containing the answer. These paths are used by visualizations and error messages to refer to a specific point in a KATA document.

The purpose of an automation is to transform an input dictionary into an output dictionary. Depending on where an automation is used, there are different expected inputs and outputs.

When an automation executes, it creates a new **working memory** dictionary that starts as a copy of its input. Within this dictionary an automation can store, retrieve, and manipulate data using keys.

### Dialects

There are various **dialects** of KATA: automations, [maps](/docs/maps/), [toolbars](/docs/toolbars/), [events](/docs/automations/#events), etc. The dialects share the same overall [syntax](/docs/kata/), but each has a different **vocabulary** of keys.

In automations, keys describe a _declarative_ set of **commands**. In other words, an automation serves as a natural language outline of logic and actions to be undertaken, rather than a set of detailed computer programming instructions for carrying out each step.

For instance, the command [http.request:](/docs/automations/commands/http.request/) fetches a web page by URL and save its status code, headers, and body to a given key in the dictionary.

### Names

When the same command appears multiple times within the same parent, each instance must have a unique name. Commands are named by appending a forward slash (`/`) and an identifier.

The identifier may contain letters, numbers, and underscores.

For instance, we could "hardcode" the inputs from the first example above as keys:

<pre>
<code class="language-cerb">
{% raw %}
start:
  set/a:
    a: 5
  set/b:
    b: 4
  return:
    answer: {{a * b}}
{% endraw %}
</code>
</pre>

We use the `set:` command twice in the `start:` parent, so we name them `set/a:` and `set/b:`.

Key names are part of a key's path (e.g. `start:set/b:`).

### Scripting

Values can be _dynamically_ generated from the output of **scripting**.

In the previous examples we had this line:

<pre>
<code class="language-cerb">
{% raw %}
answer: {{a * b}}
{% endraw %}
</code>
</pre>

This computes a new value by multiplying the value in placeholder `a` by the value in placeholder `b`.

Scripting occurs within specific tags:

{% raw %}
| Tag |
|:-:|-
| **`{{  }}`** | Output a placeholder or expression
| **`{%  %}`** | Execute a control flow statement (looping, branching)
| **`{#  #}`** | Include a hidden code comment
{% endraw %}

In scripts, you can refer to any key from the working memory dictionary, which are often referred to as **placeholders** to avoid ambiguity with keys in KATA documents.

Scripting provides several [functions](/docs/bots/scripting/functions/) and [filters](/docs/bots/scripting/filters/) for quickly formatting and manipulating data.

Refer to the [**scripting**](/docs/bots/scripting/) documentation for a full list of capabilities.

### Annotations

In KATA, all values that immediately follow a key are assumed to be text by default:

<pre>
<code class="language-cerb">
{% raw %}
a: 5
b: 4
{% endraw %}
</code>
</pre>

In the example above, `5` and `4` are treated as text rather than numbers. However, in certain situations, like mathematical operations, a text value can be automatically **coerced** into a number.

KATA stands for **K**ey **A**nnotated **T**ree of **A**ttributes. Annotations are tags on keys with special instructions for handling their value.

Annotations start with `@` and are appended to a key name.

For example, we can explicitly specify that a key's value is an integer (a non-fractional number) with `@int`:

<pre>
<code class="language-cerb">
{% raw %}
start:
  set:
    a@int: 5
    b@int: 4
  return:
    answer@int: {{a * b}}
{% endraw %}
</code>
</pre>

In the above automation's dictionary, the value for the keys `a:`, `b:`, and `answer:` are now strictly numeric.

Annotations are **not** part of a key's name or path. The key path `start:set/a:a:` points to the value `5`.

Here are some common annotations:

| Annotation | 
|-|-
| **`@base64:`** | Binary data encoded as Base64 text
| **`@bit:`** | `0` (`off`, `false`, `no`, `n`) or `1` (any non-false value)
| **`@bool:`** | `false` (`no`, `n`, `off`, `0`) or `true` (any non-false value) 
| **`@csv:`** | An array encoded as comma-separated text
| **`@date:`** | A human-readable absolute (`Jan 1 2025 08:00`) or relative (`+2 hours`) date
| **`@float:`** | A floating point number
| **`@int:`** | A non-fractional number
| **`@json:`** | A dictionary encoded as JSON text 
| **`@kata:`** | A dictionary encoded as KATA text
| **`@key:`** | A copy of the value from the given key path
| **`@list:`** | An array encoded as a line-delimited text block
| **`@optional:`** | Remove the key if the value is empty
| **`@text:`** | A multiple line text block
| **`@trim:`** | Remove the value's leading and trailing whitespace

Multiple annotations may be joined with commas. They are evaluated from left to right.

For instance:

<pre>
<code class="language-cerb">
{% raw %}
start:
  set:
    a: 5
    b@key,int: a
  return:
    answer@int: {{a * b}}
{% endraw %}
</code>
</pre>

The line `b@key,int: a` is setting the key `b:` to the value of the `a` key, and then converting it to an integer.

### Multiple line values

An annotated key may be followed by an indented block of text to set a multiple-line value:

<pre>
<code class="language-cerb">
{% raw %}
start:
  set:
    countries@json:
      {
        "United States": {
          "pop": 330052960,
          "pop_est": 2020
        },
        "China": {
          "pop": 1441615562,
          "pop_est": 2020
        }
      }
  return:
    output@text:
      {% set diff = countries.China.pop - countries['United States'].pop %}
      There are {{diff|number_format}} more people in China than the USA.
{% endraw %}
</code>
</pre>

<pre>
<code class="language-text">
There are 1,111,562,602 more people in China than the USA.
</code>
</pre>

This approach is particularly useful when you need to create a dictionary with keys that contain characters like spaces, which are not valid in KATA keys.

# Execution

An automation can store, retrieve, and manipulate data using keys in the [working memory dictionary](#dictionaries).

During execution, the dictionary also keeps track of an automation's control flow (conditional branches, call stack, loops, past inputs, etc).

An automation begins execution at the `start:` command.

### Inputs

Automations that support custom input may optionally provide an `inputs:` key to define the possible values that a caller can provide.

Inputs are defined with a `type/name:` key. The `name` must be unique within the inputs.

The `type` must be one of:

| [**array:**](/docs/automations/inputs/array/) | An array of values
| [**record:**](/docs/automations/inputs/record/) | A record ID of a given type (converted to a dictionary)
| [**records:**](/docs/automations/inputs/records/) | Multiple record IDs of a given type (converted to an array of dictionaries)
| [**text:**](/docs/automations/inputs/text/) | Text with an optional data type

The values are available in the `inputs` placeholder.

<pre>
<code class="language-cerb">
{% raw %}
inputs:
  record/ticket:
    record_type: ticket
    required@bool: yes
  text/subject:
    required@bool: yes
 
start:
  return:
    result@text:
      Changed the subject on ticket {{inputs.ticket.mask}} to: {{inputs.subject}}
{% endraw %}
</code>
</pre>

#### Snippet examples

Automations that support custom `inputs:` can provide a `snippet:` key for each input.

This is used when inserting the automation into an editor from an interaction.

<pre>
<code class="language-cerb">
{% raw %}
inputs:
  text/subject:
    type: freeform
    required@bool: yes
    snippet:
      subject: This is an example subject
{% endraw %}
</code>
</pre>

### Exit states

After execution, an automation concludes in one of the following `__exit` states:

| State | 
|-|-
| `return` | The automation completed successfully and provided output in the `__return:` key
| `await` | The automation paused awaiting additional input described by `__return:`
| `error` | The automation failed with an error in `__return:error:`
| `exit` | The automation exited without success or failure (default)

### Error handling

Each [command](#commands) in the automation can result in success or failure.

Commands may provide `on_success:` and `on_error:` events to run any number of commands in response to success or failure.

The `on_error:` event can recover from an error to continue execution.

If the `on_error:` event is omitted, a command error immediately exits the automation in the `error` [state](#exit-states).

This [http.request](/docs/automations/commands/http.request/) command requests an invalid URL:

<pre>
<code class="language-cerb">
{% raw %}
start:
  http.request:
    output: http_response
    inputs:
      method: GET
      url: https://invalid.url.example/
  return:
{% endraw %}
</code>
</pre>

There is no `on_error:` event, so the automation immediately exits in the `error` state. The `return:` command is never reached.

We can add events to handle errors:

<pre>
<code class="language-cerb">
{% raw %}
start:
  http.request:
    output: http_response
    inputs:
      method: GET
      url: https://invalid.url.example/
    on_success:
      # Commands to perform on success
      return:
    on_error:
      # Handle the error or provide a default
      return:
{% endraw %}
</code>
</pre>

The automation now always exits in the `return` state.

### Simulation

During testing and development, it may not be desirable to execute certain actions. An automation's execution can be **simulated** instead.

Each [command](#commands) can provide an `on_simulate:` event that is used during simulation instead of executing. This can run any number of alternative commands. 

These two special commands are available during simulation:

|-|-
| **`simulate.success:`** | Simulate command output and execute the `on_success:` event.
| **`simulate.error:`** | Simulate command output and execute the `on_error:` event.

The following example simulates an `http.request:` command and provides mock output:

<pre>
<code class="language-cerb">
{% raw %}
start:
  http.request:
    output: http_response
    inputs:
      method: GET
      url: https://invalid.url.example/
    on_simulate:
      simulate.success:
        status_code: 200
        content_type: application/json
        body: { "output": "Good job!" }
    on_success:
      return:
        body@key: http_response:body
{% endraw %}
</code>
</pre>

Even though the URL is invalid, the simulated output is:

<pre>
<code class="language-cerb">
{% raw %}
body: { "output": "Good job!" }
{% endraw %}
</code>
</pre>

### Continuations

When an automation exits in the `await:` state, a snapshot of its current dictionary is saved and assigned a long random identifier. This snapshot is called a **continuation**.

The continuation identifier is used to resume the automation from the same point at a future time with additional input.

For instance, here's a basic [interaction](/docs/automations/triggers/interaction.worker/) automation that pauses for user input:

<pre>
<code class="language-cerb">
{% raw %}
start:
  await:
    form:
      elements:
        text/prompt_name:
          label: What is your name?
          required@bool: yes
  return:
    output@text:
      Hello, {{prompt_name}}!
{% endraw %}
</code>
</pre>

At the `await:` command, the automation will send a web form to the user, create a continuation, and wait for any length of time to resume execution.

An automation that supports continuations can exit in the `await:` state any number of times before concluding.

<pre>
<code class="language-cerb">
{% raw %}
start:
  await/intro:
    form:
      elements:
        text/prompt_name:
          label: Name:
          required@bool: yes
        text/prompt_email:
          label: Email:
          required@bool: yes
          type: email
          placeholder: you@example.com
  
  # (Confirmation code is generated, saved, and emailed)
  
  await/confirm:
    form:
      elements:
        say/hello:
          content@text:
            Hello, {{prompt_name}}!
            
            We just sent a confirmation code to {{prompt_email}}
        text/prompt_code:
          label: Confirmation Code:
          required@bool: yes
          type: uri
          max_length: 8
  
  # (Confirmation code is verified)
  
  return:
    output@text:
      Thanks, {{prompt_name}}! 
      Your email address ({{prompt_email}}) been subscribed to our newsletter.
 {% endraw %}
</code>
</pre>

{% comment %}
* They are the successor to Cerb's "bot behaviors" functionality after incorporating more than 10 years
* successor to bot behaviors
* interactive step debugger
* not grouped into bots
* don't need to exist in database as records before use (ad-hoc/reusable)
* abstract syntax tree (AST) / cached performance
{% endcomment %}

### Timers

Automations can use **timers** to run at a future time either once or on a recurring schedule.

<div class="cerb-screenshot">
<img src="/assets/images/docs/automations/automation-timer.png" class="screenshot">
</div>

Timers can be created procedurally by automations and interactions, or manually by workers.

A timer specifies a name, a future datetime, an optional schedule, and a block of [events KATA](#events) to conditionally determine an [automation.timer](/docs/automations/triggers/automation.timer/) to run.

On the first invocation of the timer, an automation is selected. This may optionally provide [inputs](#inputs). 

When the automation concludes:

* If the timer has a recurring schedule, it is rescheduled for the next occurrence.

* Otherwise, a one-shot timer is disabled (or optionally deleted) at conclusion.

If the automation ends in the `await` state, a [continuation](#continuations) is created, and the timer is rescheduled for the given datetime.

The timer stores the continuation ID and the automation pauses at the current point. On the next timer invocation, the automation resumes where it left off rather than starting over.

Schedules are defined in [Unix CRON expression format](https://en.wikipedia.org/wiki/Cron). When multiple expressions are specified, the timer is scheduled for the next most recent occurrence among them. 

# Policies

The permissions of automations are governed by **policies**. A policy is a collection of **rules** which describe the conditions where each action would be permitted or denied.

<div class="cerb-screenshot">
    <img src="/assets/images/docs/automations/editor-policy.png" class="screenshot">
</div>

### Scopes

| Scope | 
|-|-
| `callers:` | Rules that determine **who** can use an interaction, and **where**
| `commands:` | Rules that determine **what** commands are allowed or denied

### Placeholders

Policies can use placeholders based on the command:

|Key||Example
|-|-|-
| `node.id` | The key path of the command | `start:record.create:` 
| `node.type` | The name of the command | `record.create`
| `inputs.*` | The dictionary of inputs | `inputs.record_type`
| `output` | The output placeholder name | `result`

### Rules

#### Callers

Some automation [triggers](/docs/automations/#triggers) support **callers**. A caller contains information about where, and by whom, an automation was started. These details can be used in policy rules.

| Trigger | 
|-|-
| [interaction.worker](/docs/automations/triggers/interaction.worker/#callers)

The following policy allows an [interaction](/docs/interactions/) on [project board](/docs/project-boards/) columns when a worker has write-access on the board, and otherwise denies it:

<pre>
<code class="language-cerb">
{% raw %}
callers:
  cerb.toolbar.projectBoardColumn:
    allow/owners@bool:
      {{
        cerb_record_writeable('project_board', board_id, worker__context, worker_id) 
        ? 'yes'
      }}
    deny: yes
{% endraw %}
</code>
</pre>

When a caller policy denies an interaction it is automatically hidden from [toolbars](/docs/automations/triggers/interaction.worker/#toolbars).

#### Commands

This policy allows all commands:

<pre>
<code class="language-cerb">
{% raw %}
commands:
  all:
    allow: yes
{% endraw %}
</code>
</pre>

The above policy is simple but not secure. Instead, we recommend adhering to the _"principle of least privilege"_[^polp]. This means only allowing the minimal set of commands required to accomplish an automation's purpose.

The following policy only allows:

* HTTP GET requests only to the `https://api.example/` endpoint.
* The creation of new task records.
* The reading of all records.

<pre>
<code class="language-cerb">
{% raw %}
commands:
  http.request:
    allow/ourApi@bool:
      {{inputs.url starts with 'https://api.example/' 
         and inputs.method == 'GET' ? 'yes'}}

  record.create:
    allow/newTasks@bool:
      {{inputs.record_type|context_alias == 'task' ? 'yes'}}
  
  record.get:
    allow: yes
   
  all:
    deny: yes
{% endraw %}
</code>
</pre>

Each command can have multiple `allow:` and `deny:` rules, but they must have a unique `/name` suffix.

A rule with a `no` value is ignored (i.e. a failed "allow" does not mean "deny"). Rules are tested in sequence until an explicit `allow: yes` or `deny: yes` outcome is reached.

If a command matches no rules, the default outcome is `deny: yes`.

The `all:` key matches all commands. This can be used as a final "catch-all" to allow or deny any command that matches no other rules.

It is also possible to be permissive by default with exceptions. This following policy permits all HTTP requests _except_ connections to unencrypted `http://` endpoints: 

<pre>
<code class="language-cerb">
{% raw %}
commands:
  http.request:
    deny/http@bool:
      {{inputs.url starts with 'http://' ? 'yes'}} 
    allow: yes
{% endraw %}
</code>
</pre>

#### Time limit

By default, automations are restricted to a maximum run duration of 25,000 milliseconds (25 seconds).

This can be changed in the policy:

<pre>
<code class="language-cerb">
{% raw %}
settings: 
 time_limit_ms: 30000
{% endraw %}
</code>
</pre>

In most cases, a better approach is to break up long tasks into smaller pieces and use automation timers and queues.

### Testing policy rules

You can test policies from the automation simulator.

You can also test rule logic from **Setup >> Developers >> Bot Scripting Tester**:

<pre>
<code class="language-cerb">
{% raw %}
{% set inputs = {
  url: 'https://api.example/some/path',
  method: 'GET'
} %}
{{inputs.url starts with 'https://api.example/' 
    and inputs.method == 'GET' ? 'yes'}}
{% endraw %}
</code>
</pre>

The test object above returns `yes`.

We can change the inputs to exceed the granted permissions:

<pre>
<code class="language-cerb">
{% raw %}
{% set inputs = {
  url: 'https://danger.example/',
  method: 'POST'
} %}
{{inputs.url starts with 'https://api.example/' 
    and inputs.method == 'GET' ? 'yes'}}
{% endraw %}
</code>
</pre>

The above test object now returns blank, which is interpreted as `no` and ignored. The policy returns the default `deny: yes`.

# Triggers

Automations are automatically **triggered** in response to events within Cerb.

| Trigger | [**Inputs**](#inputs) | [**Await**](#continuations) | 
|-|:-:|:-:|-
| [**automation.function**](/docs/automations/triggers/automation.function/) | √ | | A reusable function with shared functionality called by other automations
| [**automation.timer**](/docs/automations/triggers/automation.timer/) | √ | √ | A scheduled automation with [continuations](#continuations)
| [**data.query**](/docs/automations/triggers/data.query/) | √ | | Return results for custom [data queries](/docs/data-queries/)
| [**interaction.worker**](/docs/automations/triggers/interaction.worker/) | √ | √ | Worker [interactions](/docs/interactions/) on [toolbars](/docs/toolbars/) and widgets
| [**interaction.website**](/docs/automations/triggers/interaction.website/) | √ | √ | Website visitor [interactions](/docs/interactions/)
| [**map.clicked**](/docs/automations/triggers/map.clicked/) | √ | | Handlers for clicks on [map](/docs/maps/) regions and points
| [**projectBoard.cardAction**](/docs/automations/triggers/projectBoard.cardAction/) | √ | | Actions that take place for new cards in a project board column
| [**projectBoard.renderCard**](/docs/automations/triggers/projectBoard.renderCard/) | √ | | Dynamic card layouts on project boards
| [**record.changed**](/docs/automations/triggers/record.changed/) | √ | | Actions that run when [record](/docs/records/types/) fields change
| [**reminder.remind**](/docs/automations/triggers/reminder.remind/) | √ | | Actions that run for [reminder](/docs/reminders/) alerts 
| [**resource.get**](/docs/automations/triggers/resource.get/) | √ | | Dynamic [resource](/docs/resources/) content
| [**scripting.function**](/docs/automations/triggers/scripting.function/) | √ | | Run an [automation](/docs/automations/) from the [cerb_automation()](/docs/bots/scripting/functions/#cerb_automation) function in scripting.
| [**ui.chart.data**](/docs/automations/triggers/ui.chart.data/) | √ | | Data sources for [Chart KATA widgets](/docs/dashboards/)
| [**ui.sheet.data**](/docs/automations/triggers/ui.sheet.data/) | √ | | Data sources for [sheets](/docs/sheets/)
| [**ui.widget**](/docs/automations/triggers/ui.widget/) | √ | | Custom output for [card](/docs/records/types/card_widget/), [profile](/docs/records/types/profile_widget/), or [workspace](/docs/records/types/workspace_widget/) widgets
| [**webhook.respond**](/docs/automations/triggers/webhook.respond/) | √ | | Handlers for [webhook listeners](/docs/webhooks/)

# Events

In functionality that triggers automations (e.g. widgets), event handlers are defined in a [KATA](/docs/kata/) dialect.

For events that expect a single handler (e.g. `interaction.worker`), the first matching (non-disabled) automation is executed and its end state is returned. This can be used to conditionally respond based on the event/caller.

For events that run all handlers (e.g. `projectBoard.cardAction`), all non-disabled automations are executed in order, and their end states are returned.

Global automation events can be edited from **Search >> Automation Events**. This allows event handler KATA to be configured for global events that don't otherwise have a parent record (e.g. mail filtering).

<pre>
<code class="language-cerb">
{% raw %}
automation/onlyTasks:
  uri: cerb:automation:example.cards.task
  disabled@bool:
    {{card_type != 'task' ? 'yes'}}

automation/everythingElse:
  uri: cerb:automation:example.cards.generic
</code>
</pre>
{% endraw %}

There can now be multiple `enabled:` or `disabled:` rules. The first rule to return `true` is used. This allows `deny-allow` and `allow-deny` strategies. By default, all handlers are enabled.

| Event |
|-|-
| [**mail.draft**](/docs/automations/events/mail.draft/) | Modify a new or resumed draft before the editor is opened
| [**mail.draft.validate**](/docs/automations/events/mail.draft.validate) | Validate an email draft before sending
| [**mail.filter**](/docs/automations/events/mail.filter/) | Modify or reject an inbound message based on its properties
| [**mail.received**](/docs/automations/events/mail.received/) | After a new email message is received
| [**mail.route**](/docs/automations/events/mail.route/) | Determine a destination group inbox given properties of an incoming message
| [**mail.send**](/docs/automations/events/mail.send/) | Before a sent message is delivered
| [**mail.sent**](/docs/automations/events/mail.sent/) | After a sent message is delivered
| [**record.changed**](/docs/automations/events/record.changed/) | React to changes in record field values
| [**record.merge**](/docs/automations/events/record.merge/) | Allow or deny record merge requests
| [**reminder.remind**](/docs/automations/events/reminder.remind/) | Send notifications about a reminder

# Commands

### State transitions

|-|-
| [**await:**](/docs/automations/commands/await/) | Pauses the automation in the `await` state with output. Creates a [continuation](#continuations) for resuming.
| [**error:**](/docs/automations/commands/error/) | Unsuccessfully terminates the automation in the `error` state with output.
| [**return:**](/docs/automations/commands/return/) | Successfully terminates the automation in the `return` state with output.

### Flow control

|-|-
| [**decision:**](/docs/automations/commands/decision/) | Conditionally select one of multiple potential outcomes.
| [**outcome:**](/docs/automations/commands/outcome/) | A conditional sequence of commands.
| [**repeat:**](/docs/automations/commands/repeat/) | Iterate an array and repeat a sequence of commands for each value.
| [**while:**](/docs/automations/commands/while/) | Conditionally loop a sequence of commands.

### Logging

|-|-
| [**log:**](/docs/automations/commands/log/) | Log a debug message.
| [**log.warn:**](/docs/automations/commands/log/) | Log a warning message.
| [**log.error:**](/docs/automations/commands/log/) | Log an error message.
| [**log.alert:**](/docs/automations/commands/log/) | Log an alert message.

### Actions

|-|-
| [**data.query:**](/docs/automations/commands/data.query/) | Execute a [data query](/docs/data-queries/) and return the response.
| [**decrypt.pgp:**](/docs/automations/commands/decrypt.pgp/) | Decrypt a PGP encrypted message.
| [**email.parse:**](/docs/automations/commands/email.parse/) | Parse a MIME-encoded email message into a [ticket](/docs/records/types/ticket/).
| [**encrypt.pgp:**](/docs/automations/commands/encrypt.pgp/) | Encrypt a message for one or more PGP public keys.
| [**file.read:**](/docs/automations/commands/file.read/) | Read chunks of bytes from an [attachment](/docs/records/types/attachment/) or [automation resource](/docs/records/types/automation_resource/).
| [**file.write:**](/docs/automations/commands/file.write/) | Write bytes to an [automation resource](/docs/records/types/automation_resource/).
| [**function:**](/docs/automations/commands/function/) | Execute an [automation.function](/docs/automations/triggers/automation.function/) automation and return output.
| [**http.request:**](/docs/automations/commands/http.request/) | Send data to an HTTP endpoint and return the response.
| [**kata.parse:**](/docs/automations/commands/kata.parse/) | Parse an arbitrary [KATA](/docs/kata/) document with placeholders.
| [**metric.increment:**](/docs/automations/commands/metric.increment/) | Add new samples to a [metric](/docs/metrics/).
| [**queue.pop:**](/docs/automations/commands/queue.pop/) | Pop an item from a [queue](/docs/queues/).
| [**queue.push:**](/docs/automations/commands/queue.push/) | Push an item into a [queue](/docs/queues/).
| [**record.create:**](/docs/automations/commands/record.create/) | Create a [record](/docs/records/).
| [**record.delete:**](/docs/automations/commands/record.delete/) | Delete a [record](/docs/records/).
| [**record.get:**](/docs/automations/commands/record.get/) | Retrieve a [record](/docs/records/).
| [**record.search:**](/docs/automations/commands/record.search/) | Search [records](/docs/records/).
| [**record.update:**](/docs/automations/commands/record.update/) | Update a [record](/docs/records/).
| [**record.upsert:**](/docs/automations/commands/record.upsert/) | Create or update a [record](/docs/records/).
| [**set:**](/docs/automations/commands/set/) | Set one or more placeholders.
| [**storage.get:**](/docs/automations/commands/storage.get/) | Retrieve arbitrary data from long-term storage.
| [**storage.set:**](/docs/automations/commands/storage.set/) | Save arbitrary data to long-term storage.
| [**storage.delete:**](/docs/automations/commands/storage.delete/) | Delete data from long-term storage.
| [**var.expand:**](/docs/automations/commands/var.expand/) | Expand paths on keys.
| [**var.push:**](/docs/automations/commands/var.push/) | Add an element to a list placeholder.
| [**var.set:**](/docs/automations/commands/var.set/) | Set a placeholder using a complex key path.
| [**var.unset:**](/docs/automations/commands/var.unset/) | Unset a placeholder.

### Simulation

|-|-
| `simulate.success:` | Simulate command output and execute the `on_success:` event.
| `simulate.error:` | Simulate command output and execute the `on_error:` event.

# Editor

The automation editor includes syntax highlighting, autocompletion for the [KATA](/docs/kata/) syntax, a step-based debugger with full access to the current state, a simulator, and a reference for each trigger event.

A contextual toolbar provides interactions for adding [inputs](#inputs), [commands](#commands), and [exit states](#exit-states).

### Change History

When editing an automation you can review past versions by clicking on the **Change History** button in the editor toolbar.

<div class="cerb-screenshot">
<img src="/assets/images/docs/automations/editor-diff-button.png" class="screenshot">
</div>

This opens a popup that displays the differences between a past version and the current version.

<div class="cerb-screenshot">
<img src="/assets/images/docs/automations/editor-diff.png" class="screenshot">
</div>

The left editor is read-only, but the right editor may be modified. Any changes will update the differences in real-time.

### Export

An automation may be exported by clicking on the **Export** button in the editor toolbar.

<div class="cerb-screenshot">
<img src="/assets/images/docs/automations/editor-export-button.png" class="screenshot">
</div>

This creates a [package](/docs/packages/) that can be imported into another Cerb environment.

### Visualizations

The automation editor has a 'Visualization' tab with a flowchart for the current script.

Clicking on a node highlights the relevant line of code in the editor.

<div class="cerb-screenshot">
    <img src="/assets/images/docs/automations/editor-visualization.png" class="screenshot">
</div>

# References

[^polp]: Wikipedia: Principle of Least Privilege - <https://en.wikipedia.org/wiki/Principle_of_least_privilege>