---
title: "Load arbitrary records into a behavior variable"
excerpt: You can use behavior variables to load matching records of any type from any event. This guide outlines the steps to loading records into a behavior variable.
layout: integration
topic: Bots
subtopic: Scripting
jumbotron:
  title: Load arbitrary records into a behavior variable
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
---

* TOC
{:toc}

# Introduction

Sometimes your bot behavior needs to act on [records](/docs/records/) that aren't available as placeholders in the current event.

In these situations, you can use behavior variables to load matching records of any kind from any event.

In this guide, we'll create an organization behavior that loads a list of the organization's tickets into a behavior variable.

# Create a bot

Let's create a new bot called **Example Bot**:

1. Navigate to **Search >> Bots**.

1. Click the **(+)** icon above the worklist to create a new bot.

1. Enter the following details:
	* **Name:** `Example Bot`
	* **Owner:** Me

1. Click the **Save Changes** button.

    <div class="cerb-screenshot">
    <img src="/assets/images/guides/bots/load-records/create-bot.png" class="screenshot">
    </div>

# Create a behavior

Now we'll create a behavior on the new bot:

1. Open the card for **Example Bot**. You can click the link in the yellow notification above the worklist.

1. Click the **Behaviors** button.

1. Click the **(+)** icon above the worklist to create a new behavior.

1. Enter the following details:
	* **Event:** Custom behavior on organization
	* **Visibility:** Private
	* **Name:** `Load organization's tickets`
	* **Status:** Enabled

    <div class="cerb-screenshot">
    <img src="/assets/images/guides/bots/load-records/bot-behavior1.png" class="screenshot">
    </div>
	
Now let's add a behavior variable for storing the organization's ticket records.

1. In the **Variables** section, click the **Add** button.

1. Select **List >> Tickets**.

1. In the new **List:Tickets** entry, set it **Private** and name it `Tickets`.

1. Click the **Save Changes** button to save the new behavior.

    <div class="cerb-screenshot">
    <img src="/assets/images/guides/bots/load-records/bot-behavior2.png" class="screenshot">
    </div>

# Load ticket records as an action

Finally, we'll load ticket records into the behavior based on the current organization:

1. Open the card for the **Load organization's tickets** behavior.  You can click the link in the yellow notification above the worklist.

1. At the bottom of the card, click on **Custom behavior on organization** and select **Add Actions** from the menu.

1. Enter the following details:
	* **Title:** `Load ticket records for this organization`
	* **Status:** Live
	
1. In the **Actions** section, click the **Action** button and select **Set >> (Variable) Tickets** from the menu.

1. Check the box for **and filter using quick search** and enter the following query:
	<pre>
	<code class="language-twig">
	{% raw %}
	org.id:{{org_id}}
	{% endraw %}
	</code>
	</pre>
	
1. Click the **Save Changes** button to save the new action.

    <div class="cerb-screenshot">
    <img src="/assets/images/guides/bots/load-records/new-actions1.png" class="screenshot">
    </div>

<div class="cerb-box note">
<p>List variables can currently hold a maximum of 100 records. You can use loops to process more pages.</p>
</div>

# Use the variable's records

The two most common ways to use a variable full of records are:

* Displaying record placeholders in a script
* Running actions on the records

Let's look at an example of each.

## In a script

1. At the bottom of the card, click on **Custom behavior on organization** and select **Add Actions** from the menu.

1. Enter the following details:
	* **Title:** `Comment a summary on the organization`
	* **Status:** Live
	
1. In the **Actions** section, click the **Action** button and select **Create >> Comment** from the menu.

1. In the new **Create comment** action, set **Comment on** to **Organization**.

1. In **Content**, use the following script:

	<pre>
	<code class="language-twig">
	{% raw %}
	Tickets:

	{% for ticket in var_tickets %}
	* [{{ticket.status}}] {{ticket._label}} ({{ticket.created|date_pretty}})
	{% endfor %}
	{% endraw %}
	</code>
	</pre>
	
1. Click the **Save Changes** button to save the action.

    <div class="cerb-screenshot">
    <img src="/assets/images/guides/bots/load-records/new-actions2.png" class="screenshot">
    </div>

## As a target in actions

1. At the bottom of the card, click on **Custom behavior on organization** and select **Add Actions** from the menu.

1. Enter the following details:
	* **Title:** `Comment on each ticket`
	* **Status:** Live
	
1. In the **Actions** section, click the **Action** button and select **Create >> Comment** from the menu.

1. In the new **Create comment** action, set **Comment on** to **(variable) Tickets**.

1. In **Content**, use the following script:

	<pre>
	<code class="language-twig">
	{% raw %}
	This ticket was opened by {{org__label}}
	{% endraw %}
	</code>
	</pre>
	
1. Click the **Save Changes** button to save the action.

    <div class="cerb-screenshot">
    <img src="/assets/images/guides/bots/load-records/new-actions3.png" class="screenshot">
    </div>


<div class="cerb-box note">
<p>You can use the <b>Behavior run</b> or <b>Behavior schedule</b> actions to run a <b>Custom behavior on ticket</b> behavior on each ticket record in the list.</p>
</div>


# Test the behavior

Let's run the behavior in the simulator:

1. Click the **Simulator** button at the top of the behavior's card.

1. Click the magnifying glass button (🔍) at the top of the simulator and select an organization that you know has tickets associated with it.

1. Click the **Simulate** button.

First, you should see a list of tickets being loaded in the **Set (variable) Tickets** section.  The simulator also gives you instructions for iterating the ticket variable and using its placeholders in scripts.

You can click on the green **Set (variable) Tickets** heading to hide it.

Next, you should see a comment being created on the target organization with a summary of its tickets. We used placeholders for the status, mask, subject, and created date.

Finally, you'll see a comment being added on each ticket associated with the organization.

Close the simulator popup.

# Conclusion

You now have the incredibly useful ability to load arbitrary records from any behavior.
