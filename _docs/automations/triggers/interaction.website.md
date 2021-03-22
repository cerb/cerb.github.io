---
title: "interaction.website"
excerpt: interaction.website automations are worker-based interactions that use continuations to pause and resume a multi-step workflow. 
#social_image_url: /assets/images/search/kata.png
permalink: /docs/automations/triggers/interaction.website/
toc:
  title: interaction.website
  expand: Automations
jumbotron:
  title: interaction.website
  tagline: 
  breadcrumbs:
  -
    label: Docs &raquo;
    url: /docs/home/
  -
    label: Automations &raquo;
    url: /docs/automations/
  -
    label: Triggers &raquo;
    url: /docs/automations/#triggers
---

{% include docs/note_preview.html %}

**interaction.website** [automations](/docs/automations/) are [interactions](/docs/interactions/) with visitors on third-party websites that use [continuations](/docs/automations/#continuations) to pause and resume a multi-step workflow.

On websites, this can be used for surveys, sign-up forms, contact forms, troubleshooters, customer service bots, and much more.

* TOC
{:toc}

{% comment %}
<div class="cerb-screenshot">
<img src="/assets/images/docs/automations/triggers/interaction.website/" class="screenshot">
</div>
{% endcomment %}

Website interactions are usually started on any website when a page element is interacted with -- a link, button, image, etc.

A website interaction can also be started with a shared link.

At its conclusion, an interaction returns a [dictionary](/docs/automations/#dictionaries) and [exit state](/docs/automations/#exit-states) to the caller, which is then responsible for acting on the results.

# Inputs

An interaction automation [dictionary](/docs/automations/#dictionaries) starts with the following input values:

| Key | Type | Notes
|-|-|-
| `interaction` | string | The name of the interaction.
| `interaction_params` | dictionary | Arbitrary interaction parameters.
| `inputs` | dictionary | [Custom input](/docs/automations/#inputs) values from the caller.
| `client_browser_name` | string | The client browser name (e.g. Safari).
| `client_browser_platform` | string | The client browser platform (e.g. Macintosh).
| `client_browser_version` | string | The client browser version.
| `client_ip` | string | The client IP address.
| `portal` | record | The community [portal](/docs/records/types/community_portal/).

# Outputs

## await:form:

When suspending in the `await` state, the interaction displays a web form with the desired elements. The form may prompt for user input, validate it, and set dictionary keys (placeholders) with the responses.

<pre>
<code class="language-cerb">
await:
  form:
    title: Your form title
    elements:
      # ...
</code>
</pre>

### title:
{: .no_toc}

The title of this form to be displayed in the interaction popup. This is usually a summary of the current step.

### elements:
{: .no_toc}

Form elements are defined with a key in the format `type/name:`.

The `name` must be unique within the form. When an element prompts for user input, a placeholder with the same name will be created with their response. For instance, `text/prompt_name:` will create a placeholder of `{% raw %}{{prompt_name}}{% endraw %}` with the value of that text element.

A form can be created with any combination of the following element types:

| Element |
|-|-
| [**say:**](/docs/automations/triggers/interaction.website/elements/say/) | Block of text or Markdown
| [**sheet:**](/docs/automations/triggers/interaction.website/elements/sheet/) | [Sheet](/docs/sheets) with row selection
| [**submit:**](/docs/automations/triggers/interaction.website/elements/submit/) | Continue to next step
| [**text:**](/docs/automations/triggers/interaction.website/elements/text/) | Text input with data types
| [**textarea:**](/docs/automations/triggers/interaction.website/elements/textarea/) | Multiple lines of text

When the interaction suspends in the `await` state, a `submit:` element is automatically appended to the form if one doesn't already exist.

<pre>
<code class="language-cerb">
{% raw %}
start:
  await/who:
    form:
      title: Introduction
      elements:
        text/prompt_name:
          label: What is your name?
          required@bool: yes
  
  await/hello:
    form:
      title: Hello!
      elements:
        say/hello:
          content: Hello, {{prompt_name}}!
  
  return:
    user:
      name@key: prompt_name
{% endraw %}
</code>
</pre>

## await:interaction:

When suspending in the `await:interaction:` state, the interaction temporarily hands control to another delegate interaction. The interaction resumes at the current point when the delegate exits.

Delegates can be nested to any depth. For instance, a reusable delegate could handle email or SMS validation, and be shared by many other interactions.

This makes interactions much more modular and reusable.

### uri:
{: .no_toc}

The `uri:` parameter specifies the delegate [automation](/docs/records/types/automation/). This must use the [interaction.website](/docs/automations/triggers/interaction.website/) trigger.

### output:
{: .no_toc}

An `output:` key specifies the placeholder that should receive the results from the delegate.

<pre>
<code class="language-cerb">
{% raw %}
start:
  while:
    if@bool: yes
    do:
      await/menu:
        form:
          title: Menu
          elements:
            say:
              message: How can we help?
            sheet/prompt_menu:
              required@bool: yes
              data:
                0:
                  key: map
                  label: Map
                1:
                  key: echo
                  label: Echo
              schema:
                layout:
                  style: buttons
                  headings@bool: no
                  paging@bool: no
                  title_column: label
                columns:
                  selection/key:
                    params:
                      mode: single
                  text/label:
            submit:
              continue@bool: no
              reset@bool: no
      await/do:
        interaction:
          output: results
          uri@text:
            cerb:automation:{{{
                'map': 'wgm.interaction.locationByIP',
                'echo': 'wgm.interaction.echo',
              }[prompt_menu]}}
{% endraw %}
</code>
</pre>

## return:

When the interaction concludes in the `return` state, it returns any number of key/value pairs to the caller. Keys may be nested to return dictionaries.

# Installation on websites

See: [10.0: NPS surveys with website interactions](https://github.com/cerb/cerb-release/discussions/6)

{% comment %}
* **[Interactions/Website]** Website interactions can be added to any website using this single tag above the `</body>`: `<script id="cerb-interactions" src="https://cerb.example/portal/surveys/assets/cerb.js" type="text/javascript" defer></script>`. A `data-cerb-interaction` attribute can then be added to any DOM element on the website (e.g. links, buttons, images) to start the interaction on click. The value can be any arbitrary interaction name. Additionally, a `data-interaction-params` attribute on the same element can pass arbitrary URL-encoded parameters (e.g `&param1=value1`).

* **[Interactions/Website]** Website interactions can be automatically started on any website page by appending an anchor to the URL in the format: `#/interactionName&param1=value1`, where `interactionName` is any interaction name.

* **[Interactions/Website]** Website interactions use events KATA to start a specific `interaction.website` automation based on the given parameters.

* **[Interactions/Website]** In website interactions, the `<script>` is implemented with plain Javascript. The previous bot portal required the jQuery library.

* **[Interactions/Website/Security]** Implemented Cross-Origin Resource Sharing (CORS) for website interaction portals. Multiple allowed origins can be specified. An entry of `*` allows any origin.
{% endcomment %}