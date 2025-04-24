---
title: LLM Transcript - Interaction Form Element
excerpt: This page provides information on the "llmTranscript" interaction form element used
  in Cerb's web forms.
summary: This page provides information on the "llmTranscript" interaction form element used
  in Cerb's web forms.
permalink: /docs/automations/triggers/interaction.worker/elements/llmTranscript/
toc:
  title: LLM Transcript
  expand: Automations
jumbotron:
  title: LLM Transcript
  tagline: ~
  breadcrumbs:
  - label: Docs &raquo;
    url: /docs/home/
  - label: Automations &raquo;
    url: /docs/automations/
  - label: interaction.worker &raquo;
    url: /docs/automations/triggers/interaction.worker/
  - label: Elements &raquo;
    url: /docs/automations/triggers/interaction.worker/#elements
---

In [worker interaction](/docs/automations/triggers/interaction.worker/) web forms, an **llmTranscript** element displays an [llm.agent:](/docs/automations/commands/llm.agent/) chat transcript.

{% highlight cerb %}
{% raw %}
start:
  # ... Run llm.agent:
  await:
    form:
      title: Cerb Docs Q&A
      elements:
        llmTranscript/prompt_transcript:
          session_id: {{results.session_id}}
          hidden@bool: {{prompt_user is empty}}
          tool_labels:
            search_docs@raw: Searching documentation: {{query}}
            fetch_doc@raw: Reading documentation
{% endraw %}
{% endhighlight %}

<div class="cerb-screenshot">
<img src="/assets/images/docs/automations/triggers/interaction.worker/elements/llmTranscript.png" class="screenshot">
</div>

# Syntax

### session_id:

The transcript ID to display. This can be retrieved from [llm.agent:](/docs/automations/commands/llm.agent/) output.

### tool_labels:

A dictionary of tool names and the text to render in the transcript. This may include placeholders for the tool parameters.

{% highlight cerb %}
{% raw %}
tool_labels:
  example_tool@raw: Running tool: {{param_name}}
{% endraw %}
{% endhighlight %}

### hidden:

This form element can be conditionally hidden.

{% highlight cerb %}
{% raw %}
hidden@bool: {{not prompt_user}}
{% endraw %}
{% endhighlight %}