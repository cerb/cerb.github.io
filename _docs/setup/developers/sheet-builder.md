---
title: Sheet Builder
excerpt: This page shows how to access and use the Sheet Builder in the developer menu.
summary: "This page documents the Sheet Builder in Cerb's developer menu. It's a visual builder for sheet KATA that works against a live sample dataset, so every column's value source is picked from real keys rather than typed from memory. The page covers the three-column layout and why the live preview is not the canvas, the four dataset modes, which of the fourteen column types get a guided inspector and which fall back to raw KATA, the fact that the standalone tool copies to the clipboard rather than saving a record, how the Form Builder entry point differs by importing and writing back, and the two things that surprise people most: the emitted data block is a three-row synthesized sample rather than your query, and colors are palette references rather than hex values."
permalink: /docs/setup/developers/sheet-builder/
toc:
  expand: Admin Guide
jumbotron:
  title: Sheet Builder
  breadcrumbs:
    - label: Docs &raquo;
      url: /docs/home/
    - label: Setup &raquo;
      url: /docs/setup/
    - label: Developers &raquo;
      url: /docs/setup/#developers
---

The Sheet Builder is a visual builder for [sheet](/docs/sheets/) [KATA](/docs/kata/). You assemble columns against a **live sample dataset**, so each column's value source is picked from the keys your data actually has rather than typed from memory, and the sheet renders as you go.

<div class="cerb-screenshot">
<img src="/assets/images/docs/setup/sheet-builder.png" class="screenshot">
</div>

* TOC
{:toc}

# Access

Click **Setup &raquo; Configure &raquo; Developers &raquo; Sheet Builder**. This tool is limited to administrators.

# What it produces

The standalone builder doesn't save anything. There's no record and no export file -- the **Copy** button puts the finished KATA on your clipboard, and you paste it wherever sheet KATA is accepted.

What it emits is a `sheet:` node, and **what's inside depends on where the rows come from**.

Build against a records query or a data query and the rows live outside the sheet -- they're the adopting widget's job -- so you get the schema alone, with a comment saying so:

{% highlight cerb %}
{% raw %}
# Data source: a data query (set the data_query on the adopting widget)
sheet:
  schema:
    layout:
      # ...
    columns:
      # ...
{% endraw %}
{% endhighlight %}

Paste that into a [sheet widget](/docs/sheets/) and point the widget at your real query.

The other two modes do carry their rows with them, which is what a [sheet form element](/docs/automations/triggers/interaction.worker/elements/sheet/) in an interaction needs, since nothing else supplies them:

| Dataset | What lands in the KATA
|-|-
| Records, data query | No `data:` -- a comment telling you to set the query on the widget
| Manual | A `data:` block holding exactly the rows you typed
| Automation | A `data:` block pointing at the automation, with its inputs

# Layout

Three columns: a palette on the left, the document in the middle, and an inspector on the right.

The middle column holds a **column strip**, the live **preview**, and a read-only KATA pane you can expand to see the current output.

<div class="cerb-box note">
	<p>
		<b>The preview isn't the canvas.</b> Unlike the
		<a href="/docs/automations/triggers/interaction.worker/#awaitform">Form Builder</a>, where you
		drag components onto the thing you're looking at, a sheet renders as a table -- so there's
		nothing meaningful to select or drop into. The canvas is the <b>column strip</b>: one chip per
		column, showing its identifier and type, which is what you select, reorder, and drag. The preview
		updates live but is read-only.
	</p>
</div>

# Dataset

The sample dataset drives the preview *and* supplies the key names every column picker offers. It opens seeded to a records query so the pickers are populated before you start.

There are four modes -- records, data query, automation, and manual. Each keeps its own configuration, so switching between them to compare doesn't discard what you set up in the others.

# Columns

Every [column type](/docs/sheets/) the runtime supports can be built here. Ten of them have a guided inspector with real fields:

`card`, `text`, `date`, `link`, `icon`, `markdown`, `selection`, `slider`, `time_elapsed`, `code`

The remaining four -- `interaction`, `search`, `search_button`, and `toolbar` -- are offered, but their inspector is a raw KATA box rather than a form.

Those four sit in the palette's **Actions** group, which also holds `selection` and `slider`. Those two are guided like the rest, so the group isn't a clean split between the two kinds.

The types on offer also depend on where the builder was opened. The standalone tool shows all fourteen; opened from a portal-facing form, it's narrowed to the types that are safe to expose publicly.

# Editing an existing sheet

The standalone builder always starts fresh. There's no way to load an existing sheet into it.

Opened from the Form Builder's sheet element, it does import: it's seeded from that element's current `data:` and `schema:`, and writes the result back when you apply it.

<div class="cerb-box note">
	<p>
		<b>That import is a round-trip through the builder's model, not a text edit.</b> The document is
		parsed, rebuilt, and re-emitted, so comments and formatting are not preserved. If you've
		hand-tuned KATA you care about, use the Form Builder's raw <b>Data</b> and <b>Schema</b> fields,
		which remain available alongside the design button.
	</p>
</div>

# Where you can use it

There are two entry points: this Setup tool, and the **Design sheet** button in the Form Builder's sheet element inspector.

The sheet widgets -- profile, card, and workspace -- don't offer it yet.

# Things worth knowing

### Applying to a form element writes sample rows
{: .no_toc}

This one applies to the Form Builder route rather than the Copy button. When you apply a sheet built against a records or data query dataset back to a form element, the `data:` written there is **synthesized** -- capped at three rows and trimmed to the keys your columns reference.

That's deliberate: a form element has to carry its own rows, so it's given placeholder scaffolding to be replaced with a real `data@key:` or automation. The `schema:` half is exactly what you designed; the `data:` half is a stand-in, and nothing says so at the time.

### Colors are palette references
{: .no_toc}

Color fields don't take hex values. You define palettes first, under **Sheet settings &raquo; Color palettes**, and columns then reference them by name and index. A palette can carry a parallel dark set, which the runtime swaps in automatically for viewers in dark mode.

### Check the KATA pane, not just the preview
{: .no_toc}

The preview renders from the dataset configuration rather than from the emitted KATA, so it's possible for the preview to look correct while the generated KATA isn't what you expect. If something behaves unexpectedly after pasting, read the KATA pane.

### Columns are added by dragging
{: .no_toc}

Drag a type from the palette onto the column strip. Clicking a palette tile does nothing at all -- no column, no feedback.

Naming is also manual: pointing a column at a value key doesn't name the column, so a strip left alone reads `text/…`, `date/…`, `icon/…`. Fill in each column key to get a strip you can actually read.

### A card column brings friends
{: .no_toc}

A `card` column needs a record's context, ID, and label to render at all, so adding one pulls that trio of keys into the sample data together. This is why a single card column appears to drag three keys along with it.

### Code columns are highlighted in the browser
{: .no_toc}

Syntax highlighting for `code` columns is applied client-side by [Cerb UI](/docs/developers/cerb-ui/). Rendered through the API, or in a portal that isn't running Cerb UI, the same column comes back as plain unhighlighted text.
