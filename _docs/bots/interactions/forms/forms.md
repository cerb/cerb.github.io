---
title: Bot Form Interactions
excerpt: 
permalink: /docs/bots/interactions/forms/
toc:
  title: Form Interactions
jumbotron:
  title: Form Interactions
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

**Form interactions** build dynamic multi-step web forms that adapt in real-time based on user input. They are similar to [chat interactions](/docs/bots/interactions/chat/), but they display a collection of prompts (e.g. given name, family name, email address, phone number) and responses as a single step.

<div class="cerb-screenshot">
<img src="/assets/images/releases/9.3/form-interactions.gif" class="screenshot">
</div>

Form interactions enhance forms by allowing elements to be added conditionally (within the behavior as actions). They also make validation and multi-step form behaviors trivial to implement. Form interactions automatically save and resume a user's progress between refreshes and page loads.

For instance, you could create a survey or troubleshooter where each page adapts based on the previous inputs. The pages could incorporate info from external APIs. The results can turn into email, custom records, POST to a webhook, etc.

Even more interestingly, multiple form interactions can be attached to a single dashboard/profile widget like shortcuts (like the actions on a ticket profile). Selecting an interaction starts a bot session with the given worker and record in the scope.

On a dashboard, you could have a form interaction for quickly creating records for specific situations, using purpose-specific combinations of custom fields and field defaults. You could have a form interaction widget on ticket profiles for quickly creating tasks linked to the ticket, or for retrieving information (from anywhere) related to it.

Form interactions really make bots feel like the intelligent agents they aspired to be.

* TOC
{:toc}

# Prompts

## CAPTCHA challenge

The "Prompt with CAPTCHA challenge" action generates a random image with a series of semi-obscured characters for the user to type, with the intention of making automated submission of the form difficult for robots and easy for humans. This is particularly useful on public-facing forms.

<div class="cerb-screenshot">
<img src="/assets/images/releases/9.3/form-interaction-prompt-captcha.png" class="screenshot">
</div>

## Multiple choices

The "Prompt with multiple choices" action displays a series of pre-defined options as checkboxes where a user may make multiple selections. The min/max number of selections can be configured with the validation template by checking the length of the array in the resulting placeholder.

<div class="cerb-screenshot">
<img src="/assets/images/releases/9.3/form-interaction-prompt-choices.png" class="screenshot">
</div>

## Single choice

The "Prompt with single choice" action displays a series of radio buttons where the user may only select one. The options can be configured to display vertically or horizontally. When this prompt is the only element on a form, making a selection will automatically continue to the next step.

<div class="cerb-screenshot">
<img src="/assets/images/releases/9.3/form-interaction-prompt-choice.png" class="screenshot">
</div>

## Text

The "Prompt with text" action may be configured to prompt for a single line or multiple lines of text. The validation template enforces the desired input (number, email address, min/max length, etc). A label, default value, and input hint may be provided to assist with data entry.

<div class="cerb-screenshot">
<img src="/assets/images/releases/9.3/form-interaction-prompt-text.png" class="screenshot">
</div>

## Submit

The "Prompt with submit" action displays a new page of the form with any elements that have been added up to the current point. During the submit action, all prompts must pass validation before the user may continue to the next step.

<div class="cerb-screenshot">
<img src="/assets/images/releases/9.3/form-interaction-prompt-submit.png" class="screenshot">
</div>

# Responses

## Text

The "Respond with text" action displays a block of arbitrary text in HTML, Markdown, or plaintext format. It can be used for section titles, instructions, etc.

<div class="cerb-screenshot">
<img src="/assets/images/releases/9.3/form-interaction-respond-text.png" class="screenshot">
</div>

## Sheet

The "Respond with sheet" action takes a data query and sheet schema as input, and displays highly customizable sheet of rows and columns within the form. This makes it very easy to display search results (from records or an API) in the form.

<div class="cerb-screenshot">
<img src="/assets/images/releases/9.3/form-interaction-respond-sheet.png" class="screenshot">
</div>
