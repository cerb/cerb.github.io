---
title: Prompt for input from conversational bots
excerpt: You can now format, validate, and save a copy of responses within the prompt action itself.
social_image_url: /assets/images/guides/bots/prompts/prompts.png
layout: integration
topic: Bots
subtopic: Conversational Bots
jumbotron:
  title: Prompting for user input
  tagline: ""
  breadcrumbs:
  -
    label: Resources &raquo;
    url: /resources/
  -
    label: Guides &raquo;
    url: /resources/guides/
  -
    label: Bots &raquo;
    url: /resources/guides/#bots
  -
    label: Conversational Bots &raquo;
    url: /resources/guides/#bots-conversational-bots
---

<div class="cerb-screenshot">
<img src="/assets/images/guides/bots/prompts/prompts.png" class="screenshot">
</div>

* TOC
{:toc}

# What are prompts?

A [conversational bot](/resources/guides/#bots-conversational-bots) can use **prompt** actions to ask for user input. The behavior will pause at that point until it receives a response.

The response to a prompt can determine the next step in a bot's behavior.

Prompts were drastically simplified in the [8.3.1](/releases/8.3.1/) update.  You can now format, validate, and save a response within the prompt action itself.  Previously, this functionality had to be implemented by hand.

Here's an example prompt that asks a user to choose a number between 1 and 100:

<div class="cerb-screenshot">
<img src="/assets/images/guides/bots/prompts/behavior-action-prompt.png" class="screenshot">
</div>

This might look a little complicated at first -- it's packing a lot of functionality into a few free-form options.

Let's look at each of these options in detail.

# Prompt types

There are different types of prompts available depending on the information your bot needs to collect.

Rather than always requiring the user to type an answer, alternate prompts make it easier for them to respond in the right format.

<div class="cerb-screenshot">
<img src="/assets/images/guides/bots/prompts/prompt-types.png" class="screenshot">
</div>

## Buttons

When prompting with buttons, the user selects from a pre-defined list of responses.

<div class="cerb-screenshot">
<img src="/assets/images/guides/bots/prompts/prompt-buttons.png" class="screenshot">
</div>

### Configuring a button prompt

In a conversational bot behavior, add the **Prompt With >> Buttons** action.

<div class="cerb-screenshot">
<img src="/assets/images/guides/bots/prompts/prompt-type-buttons.png" class="screenshot">
</div>

* **Options:** A list of pre-defined responses that will be displayed as buttons. One response per line. You can use [scripting](/docs/building-bots/scripting/) to build the list.
* **Colors:** You can configure a color gradient to automatically style the buttons. For instance, a satisfaction survey asking about sentiment could start green (positive) and end red (negative).
* **Custom CSS style:** You can include custom CSS rules to further style the buttons. In the example above, we're configuring a fixed width and allowing the buttons to display _inline_ (i.e. adjacent rather than stacked).
* **Save the response to a placeholder named:** See [Saving placeholders](#saving-placeholders)
* **Format the placeholder with this template:** See [Formatting](#formatting)
* **Validate the placeholder with this template:** See [Validation](#validation)

{% comment %}
### Tips for button prompts

* [Build a button prompt from a picklist custom field](/tips/404/).
{% endcomment %}

## Chooser

When prompting with a chooser, the user selects one or more existing records using a helper popup or autocomplete text box.

Chooser prompts are currently only available when conversing with workers (opposed to portal visitors or mobile users).

<div class="cerb-screenshot">
<img src="/assets/images/guides/bots/prompts/prompt-chooser.png" class="screenshot">
</div>

### Configuring a chooser prompt

In a conversational bot behavior, add the **Prompt With >> Chooser** action.

<div class="cerb-screenshot">
<img src="/assets/images/guides/bots/prompts/prompt-type-chooser.png" class="screenshot">
</div>

* **Type:** The record type to be selected.
* **Query:** The default query to pre-filter records in the chooser popup.
* **Selection:** Is the user able to select multiple records, or just one? If selecting a single record, the popup will automatically close after the first selection.
* **Autocomplete:** Display an autocomplete textbox in addition to the chooser button. This is useful if the user may already know what they want to select, as they can bypass the chooser popup.
* **Save the response to a placeholder named:** See [Saving placeholders](#saving-placeholders)

### Tips for chooser prompts

* If the name your placeholder ends with `_id` then all of the placeholders for the selected record will be available. For instance, a placeholder like `prompt_worker_id` will be able to use `prompt_worker__label` and `prompt_worker_first_name`.

## Date Input

When prompting with a date input, the user can enter an absolute (`2020-12-31 08:00`) or relative date (`tomorrow 8am`). A calendar popup can also be used to select a specific date.

If a relative date is given, it is automatically converted into an absolute date before sending.  This ensures that the bot is always receiving the response to a date prompt in a consistent format.

<div class="cerb-screenshot">
<img src="/assets/images/guides/bots/prompts/prompt-date.png" class="screenshot">
</div>

### Configuring a date prompt

In a conversational bot behavior, add the **Prompt With >> Date Input** action.

<div class="cerb-screenshot">
<img src="/assets/images/guides/bots/prompts/prompt-type-date.png" class="screenshot">
</div>

* **Placeholder:** The instructive text shown in the date prompt before any text is entered.
* **Default:** The default text in the date prompt.
* **Save the response to a placeholder named:** See [Saving placeholders](#saving-placeholders)
* **Format the placeholder with this template:** See [Formatting](#formatting)
* **Validate the placeholder with this template:** See [Validation](#validation)

## File Upload

When prompting with a file upload, the user selects a file from their computer to share with the bot.

File upload prompts are currently only available when conversing with workers (opposed to portal visitors or mobile users).

<div class="cerb-screenshot">
<img src="/assets/images/guides/bots/prompts/prompt-file.png" class="screenshot">
</div>

### Configuring a file upload prompt

In a conversational bot behavior, add the **Prompt With >> File Upload** action.

<div class="cerb-screenshot">
<img src="/assets/images/guides/bots/prompts/prompt-type-file.png" class="screenshot">
</div>

* **Save the response to a placeholder named:** See [Saving placeholders](#saving-placeholders)
* **Format the placeholder with this template:** See [Formatting](#formatting)
* **Validate the placeholder with this template:** See [Validation](#validation)

### Tips for file upload prompts

* If the name your placeholder ends with `_id` then all of the placeholders for the uploaded file will be available. For instance, a placeholder like `prompt_file_id` will be able to use `prompt_file_size` and `prompt_file_mime_type`.

## Images

When prompting with images, the user selects from a pre-defined list of responses represented by images.

<div class="cerb-screenshot">
<img src="/assets/images/guides/bots/prompts/prompt-images.png" class="screenshot">
</div>

### Configuring an image prompt

In a conversational bot behavior, add the **Prompt With >> Images** action.

<div class="cerb-screenshot">
<img src="/assets/images/guides/bots/prompts/prompt-type-images.png" class="screenshot">
</div>

* **Images:** Click the **(+)** icon to add a new image-based response. Each response includes an image and a label.
  * **Image:** Upload or generate an image.
  * **Label:** Add a label for this image. This is the text response that will be sent when this image is selected.
* **Save the response to a placeholder named:** See [Saving placeholders](#saving-placeholders)
* **Format the placeholder with this template:** See [Formatting](#formatting)
* **Validate the placeholder with this template:** See [Validation](#validation)

## Text Input

When prompting with text input, the user is free to type anything.

<div class="cerb-screenshot">
<img src="/assets/images/guides/bots/prompts/prompt-text.png" class="screenshot">
</div>

### Configuring a text prompt

In a conversational bot behavior, add the **Prompt With >> Text Input** action.

<div class="cerb-screenshot">
<img src="/assets/images/guides/bots/prompts/prompt-type-text.png" class="screenshot">
</div>

* **Placeholder:** The instructive text shown in the prompt before any text is entered.
* **Default:** The default text in the prompt.
* **Options:** Whether the text prompt accepts a single line of input, or multiple lines.
* **Save the response to a placeholder named:** See [Saving placeholders](#saving-placeholders)
* **Format the placeholder with this template:** See [Formatting](#formatting)
* **Validate the placeholder with this template:** See [Validation](#validation)

## Wait

The wait prompt is useful when your bot needs to run a potentially long-running action (e.g. remote API call) and you'd like to warn the user first.

Rather than leaving the working watching a loading spinner without an explanation, the bot can say _"Let me check on that for you. This may take a moment..."_, wait, and then run the action.

<div class="cerb-screenshot">
<img src="/assets/images/guides/bots/prompts/prompt-wait.png" class="screenshot">
</div>

### Configuring a wait prompt

In a conversational bot behavior, add the **Prompt With >> Wait** action.

<div class="cerb-screenshot">
<img src="/assets/images/guides/bots/prompts/prompt-type-wait.png" class="screenshot">
</div>

You don't need to configure anything for a wait prompt.  However, you can get creative with the responses that precede it. Using the [random()](/docs/building-bots/scripting/functions/#random) function will add some variety to your bot.

# Saving placeholders

In the **Save the response to a placeholder named:** option, you can name a placeholder where a copy of the user's response will be saved.

You can then later refer to this answer when making decisions or giving responses.

# Formatting

With **Format the placeholder with this template:**, you can format the user's response before validating or saving it.

The formatting template has access to all of Cerb's [scripting](/docs/building-bots/scripting/) functionality.

## Examples

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

# Validation

With **Validate the placeholder with this template:**, you can run multiple tests against the user's response in a single template.

Any output from this template is considered to be an error that will be displayed to the worker.  Cerb will take care of automatically repeating your prompt for you until valid input is given.

When the template returns no output, the response is considered to be valid and Cerb will save it to your placeholder.

The validate template also has access to all of Cerb's [scripting](/docs/building-bots/scripting/) functionality.

## Examples

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

# Next steps

You can import the [Prompt Bot](/packages/prompt-bot/) package for a fully working example.