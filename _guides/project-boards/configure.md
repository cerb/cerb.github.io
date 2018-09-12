---
title: "Configure project boards"
excerpt: Project boards visually organize and automate a multi-step process. In this guide, we'll build a project board to explore how bot behaviors and scriptable templates can improve productivity.
layout: integration
topic: Project Boards
jumbotron:
  title: Configure project boards
  tagline: ""
  breadcrumbs:
  -
    label: Resources &raquo;
    url: /resources/
  -
    label: Guides &raquo;
    url: /resources/guides/
  -
    label: Project Boards &raquo;
    url: /resources/guides/#project-boards
---

* TOC
{:toc}

<div class="cerb-screenshot">
<img src="/assets/images/guides/project-boards/configure/cerb-and-project-boards.png" class="screenshot">
</div>

# Introduction

Cerb [8.0](/releases/8.0/#project-boards) (June 2017) introduced **project boards** as a better way to visualize and organize multi-step workflows.

<div class="cerb-screenshot">
<img src="/assets/images/guides/project-boards/configure/board.png" class="screenshot">
</div>

Project boards are based on the kanban[^kanban-dev] development process, which itself was derived from improvements to just-in-time production pioneered by Japanese manufacturer Toyota in the 1940s[^kanban].

With kanban, each project has a board, and each unit of work in that project is represented by a **card**.  Cards are organized into columns on the board based on their stage of completion. Typically, cards move from left to right through the columns of the process.

One of the core principles of kanban is limiting the amount of work in progress.  For instance, while there may be a large number of cards in a leftmost column named **"TODO"**, there is an agreed upon limit of 2-3 cards in the next **"In Progress"** column.  Cerb does not enforce these limits for you, but a useful convention is adding the limit to the end of the column name -- like **"In Progress (3)"**.

One of the most compelling advantages of the kanban process is its simplicity.  It can be implemented with a physical white board that has been divided into columns, with a stack of index cards (or Post-it&reg; notes) for the tasks.

However, Cerb's digital implementation of kanban provides several enhancements:

* The project boards are visible to the entire team from anywhere.
* An activity log provides a full history of changes to the project and its cards.
* Bot behaviors can be triggered every time a card is moved into a new column. These behaviors can automate field changes, comments, notifications, webhooks, or anything else.
* Scriptable templates can change the display of cards based on dynamic factors like record type, field values, custom fields, and the current column. Cards always show the most recent information available.

In this guide, we'll build a project board for organizing our current tasks.  We'll explore how bot behaviors and scriptable templates can make us more productive.

# Enable the project boards plugin

First, let's make sure the **Project Boards** plugin is enabled:

{% include plugins/install-instructions.md keyword="project boards" library=true %}

# Create a project board

1. Navigate to **Search >> Project Boards**.

	<div class="cerb-screenshot">
	<img src="/assets/images/guides/project-boards/configure/search-projects.png" class="screenshot">
	</div>

1. Click the **(+)** icon above the worklist.

1. Set the **Name** to `My assignments`.

1. In **Allow these record types in the project** select **Task**.

1. We only want to add open or waiting tasks to the project.  Within tasks, set **Quick search query for adding cards** to:
	<pre>
	<code class="language-text">
	status:[o,w]
	</code>
	</pre>
	
	<div class="cerb-screenshot">
	<img src="/assets/images/guides/project-boards/configure/project-config-tasks.png" class="screenshot">
	</div>

1. Click the **Save Changes** button.

## Add columns to the board

Open the profile for the new project board.  As a shortcut, you can open its card from the yellow notification above the worklist, and then click on the **Profile** button.

Use the **(+) Add** button in the first column's placeholder to add three new columns:

* TODO
* In Progress
* Completed!

<div class="cerb-screenshot">
<img src="/assets/images/guides/project-boards/configure/project-columns.png" class="screenshot">
</div>

You only need to type the **Name** for each column and then click **Save Changes**.

## Add cards to the board

Let's add some cards to the board.  Click on the **(+)** icon at the top of the **In Progress** column.

<div class="cerb-screenshot">
<img src="/assets/images/guides/project-boards/configure/project-add-task-in-progress.png" class="screenshot">
</div>

First, add a task for creating the project board:

1. Click **(+)** at the top of the worklist to create a new task.

1. Enter the following details:
	* **Name:** `Create a project board`
	* **Status:** open
	* **Owner:** (click the **me** button)
	
	<div class="cerb-screenshot">
	<img src="/assets/images/guides/project-boards/configure/task-new.png" class="screenshot">
	</div>

1. Click the **Save Changes** button on the card.

Repeat the steps above to add a few other cards with a different **name**:

* `Automatically close completed tasks with bots`
* `Add a new template for completed tasks`

Now let's add the new cards to our board by clicking the **Save Changes** button on the chooser.

We now have a project board with three _in progress_ tasks.

<div class="cerb-screenshot">
<img src="/assets/images/guides/project-boards/configure/tasks-in-progress.png" class="screenshot">
</div>

## Drag your first card

We've already created a project board, so let's drag the **Create a project board** card to the right and drop it in the **Completed!** column.

<div class="cerb-screenshot">
<img src="/assets/images/guides/project-boards/configure/task-completed-no-automation.png" class="screenshot">
</div>

You'll notice that by default nothing special happens.  The status on the task doesn't change, and it looks the same as the other cards.  This is because there's nothing special about the **Completed!** column -- it's just a label. Our underlying task is the same.

Any kind of record can be put on a project board, and we don't want to make assumptions about your workflow.

Let's close this first task by hand to demonstrate how tedious it would be:

1. Click on the blue **Create a project board** title on the card.

1. Click the **Edit** button.

1. Set the **Status** to **Closed**.

1. Click the **Save Changes** button.

1. Close the card popup.

Imagine having to do that for every completed task.

Fortunately, you don't have to.  We can use bot behaviors to do that work for us.

This is where project boards get really interesting.

# Create a bot behavior for automatically closing tasks

One of the most useful features of project boards in Cerb is the ability to run bot behaviors on cards as they are dropped into a new column.  This automates almost any kind of workflow you might need.

For instance:

* Tasks can be automatically completed when dropped into the final column.
* An email can be dispatched to a worker or team when a card enters their step of the process.
* Automated tests can run on an issue when it moves into a **Quality Assurance** column.
* A shipping label can be automatically printed when orders enter a **Fulfillment** column.
* ...and countless other workflows.

Let's create a bot behavior that changes the status of task cards to _completed_ when they enter the **Completed!** column.  This will save us a lot of time compared to doing it by hand.

We'll need a bot:

1. Navigate to **Search >> Bots**.
1. Click the **(+)** icon above the worklist to add a new bot.
1. Enter the following details:
	* **Name:** `Project Bot`
	* **Owner:** If you're an administrator, select **Cerb** to create a bot that everyone can share. Otherwise, select **Me** to create a private bot.
	* **Image:** Use an emoji like 🎯. If you aren't feeling creative today, use an orange (`#feaf03`) background.
1. Click the **Save Changes** button.

<div class="cerb-screenshot">
<img src="/assets/images/guides/project-boards/configure/bot-new.png" class="screenshot">
</div>

Then we need a new behavior on the bot:

1. Open the bot's card by clicking on **Project Bot** in the yellow notification above the worklist.
1. Click the **Behaviors** button on the bot's card.
1. Click the **(+)** icon above the worklist to add a new behavior.
1. Enter the following details:
	* **Event:** Custom >> Behavior On >> Task
	* **Name:** Close task
1. Click the **Save Changes** button.

<div class="cerb-screenshot">
<img src="/assets/images/guides/project-boards/configure/behavior-close-task-new.png" class="screenshot">
</div>

Now let's make the behavior do something:

1. Open the card for the **Create task** behavior. You can click on its name in the yellow notification above the behaviors worklist.
1. Click on **Custom behavior on task** at the bottom of the card.
1. Select **Add Actions** from the menu.
1. Set the **Title** to `Close the task`.
1. Click the **Action** button and select **Set >> Task >> Status** from the menu.
1. In the new **Set task status** action, select the **Closed** status.
1. Click the **Save Changes** button.

<div class="cerb-screenshot">
<img src="/assets/images/guides/project-boards/configure/behavior-close-task-action.png" class="screenshot">
</div>

That's all for the behavior.  You can close all of the popups by clicking on them and pressing the `<ESC>` key.

## Add the behavior to the project board

We want our new behavior to run every time we drop a card in the **Completed!** column:

1. Click the gear button (⚙️) at the top of the **Completed!** column.
1. Click the **Edit** button.
1. Click the **(+) Behaviors** button.
	<div class="cerb-screenshot">
	<img src="/assets/images/guides/project-boards/configure/column-add-behavior.png" class="screenshot">
	</div>
1. Sort the behaviors worklist by the **Updated** column in descending order (most recent first) and select the **Close task** behavior we just created.
1. Click the **Save Changes** button.
1. Click the **Save Changes** button on the project column card to finalize it.
1. Close the project column card.

## Test the new automation behavior

Drag the **Automatically close completed tasks with bots** card to the right and drop it in the **Completed!** column.

Now you'll notice that the **Status** of that card automatically changes to **closed** for us.

# Add visual cues with custom templates

By default, when cards are added to your project board, Cerb displays the most common fields based on their record type.

<div class="cerb-screenshot">
<img src="/assets/images/guides/project-boards/configure/column-card-defaults.png" class="screenshot">
</div>

However, you also have complete control to change how each card is displayed.

To demonstrate this, let's make the cards for closed tasks more obvious.  We don't need to see all those fields once something is completed.

1. Navigate to the project board's profile page from **Search >> Project Boards**.
1. Select the desired project board you wish to work on.
1. Click the gear button (⚙️ Edit) at the top of the project board's profile page.
1. Scroll down to **Task** and click into the **Card custom template** text box.
1. Paste the following template:
	<pre>
	<code class="language-javascript line-numbers">
	{% raw %}
	{% if is_completed %}

	&lt;div style="font-size:120%;"&gt;
		&lt;span class="glyphicons glyphicons-circle-ok" style="color:rgb(0,150,0);"&gt;&lt;/span&gt; Completed!
	&lt;/div&gt;

	{% endif %}
	{% endraw %}
	</code>
	</pre>
1. Click the **Save Changes** button to close the template editor popup.
1. Click the **Save Changes** button to close the project board editor.

The project board will automatically refresh.  The cards in the completed column now show a green checkmark with the word **Completed!**.

<div class="cerb-screenshot">
<img src="/assets/images/guides/project-boards/configure/column-completed-template.png" class="screenshot">
</div>

<div class="cerb-box note">
<p>You may have noticed that we didn't provide an alternate template for cards that aren't completed.  If our custom template is blank, Cerb uses its own default template.</p>
</div>

### Using conditional logic with tasks

Not every task is completed on time; what if we want to add a visual cue when a task is  past due?

1. Click the gear button (⚙️ Edit) on the same project board profile from above.
1. Scroll down to **Task** and click into the **Card custom template** text box.
1. Replace the content of the template editor with the following template:
	<pre>
	<code class="language-javascript line-numbers">
	{% raw %}
    {% if is_completed %}

	&lt;div style="font-size:120%;"&gt;
		&lt;span class="glyphicons glyphicons-circle-ok" style="color:rgb(0,150,0);"&gt;&lt;/span&gt; Completed!
	&lt;/div&gt;
    
    {% else %}
    
    {% if date(due) < date() and due is not empty%}
    
    &lt;div style="font-size:120%;"&gt;
		&lt;span class="glyphicons glyphicons-clock" style="color:rgb(150,0,0);"&gt;&lt;/span&gt; Overdue
	&lt;/div&gt;
    
    {% endif %}
    {% endif %}
	{% endraw %}
	</code>
	</pre>

{% comment%}<div class="cerb-box note">
<p>If you are modifying the same task from earlier, you will need to either completely replace what was pasted into the template editor or insert the "elseif" block between the original "if" statement and the "endif" statement.</p>
</div>{% endcomment%}

Now we have two different visual cues. Overdue will only be active if the task is not already complete **and** the task was already due. We changed the icon color to red to make the cue seem less pleasant and changed the icon to a clock due to the nature of the cue.

Let's break down how to manually modify each of the sections of code we just blindly copy and pasted into the template editor from earlier:

1. The beginning of each visual cue has some form of an "if" statement because we don't want every task to be modified. The "if" statement executes if the boolean within it calculates to `true`. 
To that end, you can insert placeholders anywhere in the editor, including inside "if" statements. In the sample code above, we only marked tasks overdue if their {due} placeholder was before the current timestamp.

1. After each "if" statement there is a body that executes the desired actions if we are in the correct state. All of these actions will override Cerb's default template. These changes can include removing the owner of a task if there is no owner, removing the reopened field when it has never been reopened to begin with, and more. We added a clock icon with red color using the `<div>` block while also increasing the font to 120% of the default font. The color is modified with traditional RGB coloring. 

<div class="cerb-box note">
<p>More of the actions available to you are <a href="https://cerb.ai/docs/building-bots/scripting/">here</a> on Twig's site.</p>
</div>

### Modifying baseline cards for tasks

It's great that we have an obvious notification for overdue tasks, but it would also be helpful to see other fields when the task is still open. Let's add that information back. You could use this same process to customize the fields displayed on each card -- even showing different fields as a card moves through each column in the project board's workflow.

Replace the content of the template editor with the following template:

<pre>
<code class="language-javascript line-numbers">
{% raw %}
{% if is_completed %}

&lt;div style="font-size:120%;"&gt;
    &lt;span class="glyphicons glyphicons-circle-ok" style="color:rgb(0,150,0);"&gt;&lt;/span&gt; Completed!
&lt;/div&gt;

{% else %}

{% if date(due) < date() and due is not empty%}

&lt;div style="font-size:120%;"&gt;
    &lt;span class="glyphicons glyphicons-clock" style="color:rgb(150,0,0);"&gt;&lt;/span&gt; Overdue
&lt;/div&gt;

{% endif %}

&lt;div style="font-size:100%;""&gt;
Status: {{status}}
&lt;/div"&gt;
&lt;div style="font-size:100%;""&gt;
    Updated: {{updated|date_pretty}}
&lt;/div"&gt;
&lt;div style="font-size:100%;""&gt;
    Importance: {{importance}}
&lt;/div"&gt;
{% if owner_id != "" %}
&lt;div style="font-size:100%;""&gt;
    Owner: {{owner__label}}
&lt;/div"&gt;
{% endif %}
{% endif %}

{% endraw %}
</code>
</pre>

Now we have all the information back from before. Using the `<div>` blocks, you can display the information needed for tasks in a specific dashboard. Using the double brackets, placeholders can be called inside of the `<div>` blocks to access information about the task.

Notice how the `updated` placeholder has a filter applied to it. The output of the placeholder is in seconds, so we needed to use a filter to convert it into a format more human readable. 

Lastly, we added a few quality of life improvements. Now all of our tasks will show all of our desired information for tasks open and waiting whether they are or are not overdue. Also, tasks without owners will not display a blank owner field like Cerb's default template.

# Conclusion

You can now create and populate a project board with customized cards and columns. 

Columns can perform behaviors on cards such as marking a task complete or displaying a warning when a task is overdue.

Cards are customizable in both the information they contain and the information they display. Everything from the font size to the color of an icon are easily edited.

You can use the project board concepts you just learned to better organize and automate any kind of multi-step workflow.

# Resources

[^kanban]: Wikipedia: Kanban - <https://en.wikipedia.org/wiki/Kanban>

[^kanban-dev]: Wikipedia: Kanban (development) - <https://en.wikipedia.org/wiki/Kanban_(development)>