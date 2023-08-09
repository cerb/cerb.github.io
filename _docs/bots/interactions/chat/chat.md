---
title: Bot Conversational Interactions
excerpt: 
permalink: /docs/bots/interactions/chat/
toc:
  title: Chat Interactions
jumbotron:
  title: Chat Interactions
  tagline: 
  breadcrumbs:
  -
    label: Docs &raquo;
    url: /docs/home/
  -
    label: Bots &raquo;
    url: /docs/bots/
  -
    label: Interactions &raquo;
    url: /docs/bots/interactions/
---

{% comment %}
- interaction points / params
- sessions
- respond with
- delay
- prompts: types, formats, validation
- proactive interactions

Examples: licensing, demos, lost license, contact, troubleshooters, SLA, etc
{% endcomment %}

<div class="cerb-screenshot">
<img src="/assets/images/guides/bots/prompts/prompts.png" class="screenshot">
</div>

{% comment %}
<div class="cerb-screenshot">
<img src="/assets/images/guides/bots/conversational-bots/cerb-bots-banner.png" class="screenshot">
</div>
{% endcomment %}

{% comment %}
# Chat bots

**Conversational computing** is a shift toward talking with **chat bots** using natural language in order to retrieve information and accomplish tasks, rather than pointing and clicking through complex graphical user interfaces.

You may have already automated many of your business processes using [bot behaviors](/docs/bots/). Let's explore how **conversational behaviors** can save your workers even more time.
{% endcomment %}

The goal of a **chat interaction** is to determine a human's **intent** (what they want to accomplish), from their _utterances_ in natural language, and then to fulfill those requests in a helpful way.

* TOC
{:toc}

# Chat interaction points

Interactions are triggered from **interaction points**, which provide context (e.g. who, what, when, where) and establish the initial intent of a conversation.

For instance:

* In Cerb, an interaction could trigger when a [worker](/docs/workers/) clicks "Remind me" on a specific [record](/docs/records/). Through the interaction, the bot would know who the worker is and which record they're looking at, so it could simply ask when and how they would like to be reminded. The bot also has access to the worker's record, so it wouldn't need to ask about contact details like an email address or mobile number.

* On a website, an interaction could trigger when a visitor clicks a "Sign up" link. The bot would guide the visitor through the steps of creating and verifying a new account.

* In an email, a personalized link could start an interaction with survey. The conversation would adapt based on a respondent's answers, and results could be saved to [custom fields](/docs/custom-fields/) or [custom records](/docs/records/#custom-records).

# Chat interaction lifecycle

There are three events in the lifecycle of an interaction: get interactions, handle interaction, and conversations.

### Get interactions

When a user is near an interaction point, the **Get interactions** event runs on every bot to fetch the list of available interactions for that point. This allows the user to choose an interaction directly, rather than having to precisely answer the open-ended question, _"How can I help?"_.

Because this process is implemented using bot [behaviors](/docs/bots/behaviors/), [decisions](/docs/bots/behaviors/#decisions-and-outcomes) can filter the possible interactions situationally based on the current worker, the target record, the time of day, etc.

For instance, certain interactions may only be available for open ticket records in the Sales group.

These options are generally displayed in an interactions menu on a record's [card](/docs/cards/) or [profile](/docs/profiles/).

### Handle interaction

When a specific interaction from the above list is selected, Cerb runs its associated handler.

A single handler behavior can be shared by multiple interactions. The common convention is to have one "Get interactions" and one "Handle interaction" behavior per bot.

The handler takes parameters from the interaction and passes them to a conversational behavior.

If an interaction is being started from a link in email, a signature may be verified to detect tampering, etc.

With customer-facing bots on websites, the _get interactions_ step is skipped and the _handler_ is called directly when a link or button is clicked.

### Conversation

The conversational behavior then starts, with its initial state provided by the interaction.  It prompts the user for input, does something useful, and provides output.  This process may repeat as many times as needed to achieve the desired outcome.

For instance, imagine a troubleshooter that has a user try multiple solutions to uncover a root cause.  In some situations it may find a common issue right away, and in others it may need to ask many follow-up questions to identify an uncommon issue.

Conversational behaviors aren't inherently associated with a specific [record type](/docs/records/types/). That means you can reuse the same conversational behavior for multiple interactions and adapt it to different record types.

Consider a "Remind me" interaction. With interactions, you can register a single "Remind me about this" interaction on every record at the same time (with interaction point `record:*`), which uses the same handler, and the same conversational behavior.

The ability to use wildcards like this is another reason why the _handler_ step exists, rather than directly linking interactions to conversational behaviors.

{% comment %}
# Sessions
{% endcomment %}

# Responses

In [interactions](/docs/bots/interactions/), bots convey information to users through chat **messages**. Each message can include a **delay** to emulate typing in a human-to-human conversation.

The simplest messages are just text. However, messages can also be richly formatted with Markdown or HTML to include links, styles, colors, lists, images, tables, etc.

Messages can also include scripts with interactive functionality.

<div class="cerb-screenshot">
<img src="/assets/images/packages/chat-bot/cerb-behavior-tree-subroutine-say.png" class="screenshot">
</div>

# Prompts

{% comment %}
- interaction points / params
- sessions
- respond with
- delay
- prompts: types, formats, validation
{% endcomment %}

Chat bots use **prompts** to ask for user input. The conversational [behavior](/docs/bots/behaviors/) will pause at that point until the user responds.

{% comment %}
You can format, validate, and save a response within the prompt action itself.

Here's an example prompt that asks a user to choose a number between 1 and 100:

<div class="cerb-screenshot">
<img src="/assets/images/guides/bots/prompts/behavior-action-prompt.png" class="screenshot">
</div>

This might look a little complicated at first -- it's packing a lot of functionality into a few free-form options.

Let's look at each of these options in detail.
{% endcomment %}

Rather than always requiring the user to type an answer, prompts make it easier for them to respond in the right format.

There are different types of prompts available depending on the information your bot needs to collect:

* [Buttons](#buttons)
* [Chooser](#chooser)
* [Date Input](#date-input)
* [File Upload](#file-upload)
* [Images](#images)
* [Text](#text-input)
* [Wait](#wait)

The response to a prompt can determine the next step in a bot's behavior.

<div class="cerb-screenshot">
<img src="/assets/images/guides/bots/prompts/prompt-types.png" class="screenshot">
</div>

## Formatting

You can **format** a user's response to a [prompt](#prompts) before [validating](#validation) or saving it.

The formatting template has access to all of Cerb's [scripting](/docs/scripting/) functionality.

### Format a number

This formats a number, removing thousands separators and decimal places:

<pre>
<code class="language-twig">
{% raw %}
{{message|replace({',':''})|number_format(0, '.', '')}}
{% endraw %}
</code>
</pre>

### Format a date as a Unix timestamp

<pre>
<code class="language-twig">
{% raw %}
{{message|date('U')}}
{% endraw %}
</code>
</pre>

## Validation

You can **validate** a user's response to a [prompt](#prompts) by running multiple tests using [bot scripting](/docs/scripting/).

Any output from this template is considered to be an error that will be displayed to the user.

Cerb will take care of automatically repeating your prompt for you until valid input is given.

When the template returns no output, the response is considered to be valid and Cerb will save it to your placeholder.

### Validate a date

<pre>
<code class="language-twig">
{% raw %}
{% set ts = message|date('U') %}
{% if 0 == ts %}
Please enter a valid date. For instance, "Friday noon".
{% elseif ts < 'now'|date('U') %}
Please enter a date in the future.
{% endif %}
{% endraw %}
</code>
</pre>

### Validate a number within a range

<pre>
<code class="language-twig">
{% raw %}
{% if message is not numeric %}
Please enter a valid number.
{% elseif message < 1 or message > 100 %}
The number must be between 1 and 100.
{% endif %}
{% endraw %}
</code>
</pre>

### Validate an email address

<pre>
<code class="language-twig">
{% raw %}
{% set email = message|parse_emails|first %}
{% if message is empty %}
Please enter an email address.
{% elseif email.host == 'localhost' %}
Please enter a valid email address.
{% endif %}
{% endraw %}
</code>
</pre>

## Buttons

When prompting with **buttons**, the user selects from a list of pre-defined responses.

<div class="cerb-screenshot">
<img src="/assets/images/guides/bots/prompts/prompt-buttons.png" class="screenshot">
</div>

In a conversational bot behavior, add the **Prompt With >> Buttons** action.

<div class="cerb-screenshot">
<img src="/assets/images/guides/bots/prompts/prompt-type-buttons.png" class="screenshot">
</div>

### Options
{:.no_toc}

A list of pre-defined responses that will be displayed as buttons. One response per line. You can use [scripting](/docs/scripting/) to build the list.

### Colors
{:.no_toc}

You can configure a color gradient to automatically style the buttons.

For instance, a satisfaction survey asking about sentiment could start green (positive) and end red (negative).

### Custom CSS style
{:.no_toc}

You can include custom CSS rules to further style the buttons. In the example above, we're configuring a fixed width and allowing the buttons to display _inline_ (i.e. adjacent rather than stacked).

### Save to a placeholder
{:.no_toc}

Name a [placeholder](/docs/scripting/variables/#placeholders) where a copy of the user's response will be saved. You can then later refer to this answer when making decisions or giving responses.

{% comment %}
## Tips for button prompts

* [Build a button prompt from a picklist custom field](/tips/404/).
{% endcomment %}

## Chooser

When [prompting](#prompts) with a **chooser**, the user selects one or more existing [records](/docs/records/) using a helper popup or autocomplete text box.

Chooser prompts are currently only available on [worker](/docs/workers/)-based chat interactions.

<div class="cerb-screenshot">
<img src="/assets/images/guides/bots/prompts/prompt-chooser.png" class="screenshot">
</div>

In a conversational bot behavior, add the **Prompt With >> Chooser** action.

<div class="cerb-screenshot">
<img src="/assets/images/guides/bots/prompts/prompt-type-chooser.png" class="screenshot">
</div>

### Type
{:.no_toc}

The [record](/docs/records/) type to be selected.

### Query
{:.no_toc}

The default [query](/docs/search/) to pre-filter records in the chooser popup.

### Selection
{:.no_toc}

If selecting a single record, the popup will automatically close after the first selection. Otherwise the user is able to select multiple records.

### Autocomplete
{:.no_toc}

If enabled, an autocomplete textbox will be added to the chooser button. This is useful if the user may already know what they want to select, as they can bypass the chooser popup.

### Save to a placeholder
{:.no_toc}

Name a [placeholder](/docs/scripting/variables/#placeholders) where a copy of the user's response will be saved. You can then later refer to this answer when making decisions or giving responses.

If the name your placeholder ends with `_id` then all of the placeholders for the selected record will be available.

For instance, a placeholder like `prompt_worker_id` will be able to use `prompt_worker__label` and `prompt_worker_first_name`.

## Date Input

When [prompting](#prompts) with a **date input**, the user can enter an absolute (`2020-12-31 08:00`) or relative (`tomorrow 8am`) date. A calendar popup can also be used to select a specific date.

If a relative date is given, it is automatically converted into an absolute date before sending.  This ensures that the bot is always receiving the response to a date prompt in a consistent format.

<div class="cerb-screenshot">
<img src="/assets/images/guides/bots/prompts/prompt-date.png" class="screenshot">
</div>

In a conversational bot behavior, add the **Prompt With >> Date Input** action.

<div class="cerb-screenshot">
<img src="/assets/images/guides/bots/prompts/prompt-type-date.png" class="screenshot">
</div>

### Placeholder
{:.no_toc}

The instructive text shown in the date prompt before any text is entered.

### Default
{:.no_toc}

The default text in the date prompt.

### Save to a placeholder
{:.no_toc}

Name a [placeholder](/docs/scripting/variables/#placeholders) where a copy of the user's response will be saved. You can then later refer to this answer when making decisions or giving responses.

## File Upload

When [prompting](#prompts) with a **file upload**, the user selects a file from their computer to share with the bot.

File upload prompts are currently only available in [worker](/docs/workers/)-based chat interactions.

<div class="cerb-screenshot">
<img src="/assets/images/guides/bots/prompts/prompt-file.png" class="screenshot">
</div>

In a conversational bot behavior, add the **Prompt With >> File Upload** action.

<div class="cerb-screenshot">
<img src="/assets/images/guides/bots/prompts/prompt-type-file.png" class="screenshot">
</div>

### Save to a placeholder
{:.no_toc}

Name a [placeholder](/docs/scripting/variables/#placeholders) where a copy of the user's response will be saved. You can then later refer to this answer when making decisions or giving responses.

If the name your placeholder ends with `_id` then all of the placeholders for the uploaded file will be available.

For instance, a placeholder like `prompt_file_id` will be able to use `prompt_file_size` and `prompt_file_mime_type`.

## Images

When [prompting](#prompts) with **images**, the user selects from a pre-defined list of responses represented by images.

<div class="cerb-screenshot">
<img src="/assets/images/guides/bots/prompts/prompt-images.png" class="screenshot">
</div>

In a conversational bot behavior, add the **Prompt With >> Images** action.

<div class="cerb-screenshot">
<img src="/assets/images/guides/bots/prompts/prompt-type-images.png" class="screenshot">
</div>

### Images
{:.no_toc}

Click the **(+)** icon to add a new image-based response. Each response includes an image and a label.
  * **Image:** Upload or generate an image.
  * **Label:** Add a label for this image. This is the text response that will be sent when this image is selected.

### Save to a placeholder
{:.no_toc}

Name a [placeholder](/docs/scripting/variables/#placeholders) where a copy of the user's response will be saved. You can then later refer to this answer when making decisions or giving responses.

## Text Input

When [prompting](#prompts) with **text input**, the user is free to type anything.

<div class="cerb-screenshot">
<img src="/assets/images/guides/bots/prompts/prompt-text.png" class="screenshot">
</div>

In a conversational bot behavior, add the **Prompt With >> Text Input** action.

<div class="cerb-screenshot">
<img src="/assets/images/guides/bots/prompts/prompt-type-text.png" class="screenshot">
</div>

### Placeholders
{:.no_toc}

The instructive text shown in the prompt before any text is entered.

### Default
{:.no_toc}

The default text in the prompt.

### Options
{:.no_toc}

Whether the text prompt accepts a single line of input, or multiple lines.

### Save to a placeholder
{:.no_toc}

Name a [placeholder](/docs/scripting/variables/#placeholders) where a copy of the user's response will be saved. You can then later refer to this answer when making decisions or giving responses.

## Wait

The **wait** [prompt](#prompts) is useful when your bot needs to run a potentially long-running [action](/docs/bots/behaviors/#actions/) (e.g. remote API call) and you'd like to warn the user first.

Rather than leaving the working watching a loading spinner without an explanation, the bot can say _"Let me check on that for you. This may take a moment..."_, wait, and then run the action.

<div class="cerb-screenshot">
<img src="/assets/images/guides/bots/prompts/prompt-wait.png" class="screenshot">
</div>

In a conversational bot behavior, add the **Prompt With >> Wait** action.

<div class="cerb-screenshot">
<img src="/assets/images/guides/bots/prompts/prompt-type-wait.png" class="screenshot">
</div>

You don't need to configure anything for a wait prompt.

However, you can get creative with the responses that precede it. Using the [random()](/docs/scripting/functions/#random) function will add some variety to your bot.

# Proactive chat interactions

Typically, workers initiate chat interactions. **Proactive interactions** allow a [bot](/docs/bots/) to start an interaction with a [worker](/docs/workers/) instead.

For instance, a bot may need to notify a worker about a monitoring alert, or show the current day’s schedule when a worker first logs in.

When a worker has at least one new proactive notification, an animated red message icon appears on the floating bot interaction button in the lower right of the browser. Opening the interaction menu will always first display any pending interactions.

<div class="cerb-screenshot">
<img src="/assets/images/releases/8.1/proactive-interaction-badge.png" class="screenshot">
</div>

Proactive interactions can be given an expiration date, and if a worker doesn’t start the interaction before that date then it will be dismissed automatically.

You can create proactive interactions with the **Schedule proactive interaction** [action](/docs/bots/behaviors/#actions/) in any bot behavior.

<div class="cerb-screenshot">
<img src="/assets/images/releases/8.1/proactive-interaction.png" class="screenshot">
</div>

# Resources
{:.no_toc}

You can import the [Prompt Bot](/packages/prompt-bot/) package with working examples.