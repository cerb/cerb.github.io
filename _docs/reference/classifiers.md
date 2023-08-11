---
title: Classifiers
permalink: /docs/classifiers/
jumbotron:
  title: Classifiers
  tagline: Make predictions and extract useful data from text
  breadcrumbs:
  -
    label: Docs &raquo;
    url: /docs/home/
  -
    label: Reference &raquo;
---

**Classifiers** provide a simple implementation of machine learning[^machine-learning] in [automations](/docs/automations/). A classifier takes textual input and statistically predicts a most likely **classification** based on its accumulated learning from human-supervised **training examples**.

Here are some common examples:

- [A 'Yes/No' classifier](/guides/classifiers/yes-no/) can learn to sort affirmative and negative responses in natural language _(e.g. nope, sure, please do, belay that, never mind)_. Any conversational bot behavior can use that classifier to handle confirmation prompts.

- A 'Sentiment Analysis' classifier can learn to sort feedback into positive, neutral, and negative categories _(e.g. amazing, not bad, the worst thing ever)_.

- An 'Intent Detection' classifier can learn to uncover the intent from a spoken command _(e.g. "find my open tickets this year from ACME Widgets", "show Kina's completed tasks", "remind me about the conference call tomorrow at 2pm", "who works at Mutiny?", "What's Cameron Howe's mobile?")_.

Classifiers can also be used for assignment, routing, anti-spam, and many other workflows.

You train a classifier by adding new _"tagged"_ examples. **Tags** teach a classifier how to recognize special **entities** in text: dates, times, durations, numbers, organizations, workers, contacts, contact methods, statuses, record types, and so on.

A major advantage of these predictions being made from within Cerb is the tight integration between entities and your data.

With third-party classification services (e.g. API.ai, Wit.ai, Amazon Lex) the named entity information from workers and clients needs to be integrated and constantly synced. You need to teach those services who your clients are, who your workers are, what record types are available, what statuses are available, and everything else.  When you add or modify a record (organization, contact, worker, plugins), you'd then need to make those changes available to those classification services, rebuild your training model, and perform other tedious steps.

In Cerb we've handled all of that for you.

We've also made training easy.  From a classifier's [card](/docs/records/#cards), a worker can type some text and see the current prediction and extracted entities. The same text can be quickly tagged and converted into a new training example to improve future predictions.

<div class="cerb-box geek-out">
	<p>
    We currently utilize statistical classification using Naive Bayes for its advantages: speed, simplicity, the ability to work well with few training examples, and for "online learning" (which doesn't require the model to be completely rebuilt to incorporate new training data).<br/>
    <br/>
    In the near future, we're also planning to support other statistical classification models like Support Vector Machines (SVM) and neural networks. We'll also be extending classifiers with options like n-gram tokens (to better handle a sentiment like "not bad"), more entities (phone numbers, places, IPs), and much more.
  </p>
</div>

# References

[^machine-learning]: <https://en.wikipedia.org/wiki/Machine_learning>