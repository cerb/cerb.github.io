# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Project Overview

This is the official documentation website for Cerb (cerb.ai), a helpdesk and workflow automation platform. It's built with Jekyll 4.4 and hosted on Amazon CloudFront.

## Development Commands

```bash
# Run the development server (Docker)
docker compose up
```

The site will be available at http://127.0.0.1:4000. Changes trigger automatic incremental rebuilds.

Without Docker:
```bash
bundle install
bundle exec jekyll serve --incremental
```

## Architecture

### Content Collections

Content is organized into Jekyll collections in `_config.yml`:

| Collection | Path | URL Pattern | Purpose |
|------------|------|-------------|---------|
| `docs` | `_docs/` | `/docs/:path/` | Reference documentation |
| `guides` | `_guides/` | `/guides/:path/` | Integration and how-to guides |
| `packages` | `_packages/` | `/packages/:path/` | Installable package docs |
| `releases` | `_releases/` | `/releases/:path/` | Version release notes |
| `solutions` | `_solutions/` | `/solutions/:path/` | Solution examples |
| `tips` | `_tips/` | `/tips/:path/` | Quick tips |
| `workflows` | `_workflows/` | `/workflows/:path/` | Workflow examples |

### Layout Hierarchy

- `default.html` - Base layout with header, footer, jumbotron support
- `docs.html` - Documentation pages with sidebar navigation (extends default)
- `integration.html` - Used for guides, packages, tips, workflows
- `releases.html` - Release note formatting
- `solution.html` - Solution pages

### Data Files (`_data/`)

- `docs.yaml` - Documentation sidebar structure and navigation hierarchy
- `testimonials.yaml` - Customer testimonials
- `tour.yaml` - Product tour content

### Custom Plugins (`_plugins/`)

- `cerb_kata_lexer.rb` - Rouge syntax highlighter for Cerb's KATA format (use `cerb` as the code fence language)
- `search_builder.rb` - Generates `_site/search.jsonl` for site search on full builds

### Styling

SCSS files in `_sass/`:
- `_base.scss` - Base styles
- `_layout.scss` - Layout styles
- `_cerb.scss` - Cerb-specific styles
- `_gridism.scss` - Grid system
- `_rouge.scss` - Syntax highlighting

## Key Conventions

### Front Matter

Documentation pages can include:
```yaml
---
title: "Page Title"
summary: "Brief description for search"
toc:
  expand: "Section Title"  # Forces sidebar section expansion
jumbotron:
  title: "Override Title"
  tagline: "Subtitle"
  breadcrumbs:
    - label: "Parent"
      url: /parent/
search_index:
  exclude: true  # Exclude from search
  sections:      # Index specific sections separately
    - heading: "Section Name"
      title: "Search Title"
---
```

### KATA Code Blocks

Cerb uses a custom configuration language called KATA. Use the `cerb` language identifier with Jekyll's highlight syntax:

~~~markdown
{% highlight cerb %}
{% raw %}
automation/name:
  start:
    outcome:
      message: Hello, {{name}}!
{% endraw %}
{% endhighlight %}
~~~

### Icons

Always use inline SVG icons (preferably from [Lucide](https://lucide.dev/)). Never use emoji.

### Workflows vs Packages

Prefer **workflows** over packages for distributing Cerb functionality. Workflows (introduced in 11.0) are text-based KATA templates that:

- Define records (automations, toolbars, custom fields, etc.) and configuration values
- Automatically synchronize changes when the template is updated
- Support versioned history with easy rollback
- Can be shared between environments (dev, staging, production)

Workflow documentation lives in `_workflows/`. Use a workflow name prefix based on a domain you own (e.g., `com.example.feature`).

### Liquid Expressions in Tables

To include Liquid template expressions (e.g. `{{record.aliases|join(', ')}}`) inside markdown table cells without triggering a Liquid parse error, wrap them in `{% raw %}...{% endraw %}`:

```markdown
| `aliases` | array | Use {% raw %}`{{record.aliases|join(', ')}}`{% endraw %} in scripting |
```

### Code Blocks

Always use Jekyll's `{% raw %}{% highlight LANG %}{% endraw %}` syntax instead of markdown code fences:

~~~markdown
{% highlight cerb %}
{% raw %}
start:
  return:
    output: Hello!
{% endraw %}
{% endhighlight %}
~~~

Use `cerb` for KATA, or `bash`, `python`, `json`, `text`, etc. as appropriate.
