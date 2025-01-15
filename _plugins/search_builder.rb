require 'json'
require 'reverse_markdown'

ReverseMarkdown.config do |config|
  config.unknown_tags = :bypass # Skip processing unknown tags
  config.github_flavored  = true
  config.tag_border  = ''
end

def to_permalink(string)
  string.downcase
    .gsub(/[[:space:]]+/, '-')        # Replace spaces with a single dash
    .gsub(/[[:cntrl:]]+/, '-')        # Replace control (non-printable) characters with a dash
    .gsub(%r{[\/\-.]+}, '-')          # Replace slashes, dots, and dashes with a single dash
    .gsub(/[^a-z0-9\-]/, '')          # Remove remaining non-alphanumeric characters except dashes
    .gsub(/-+/, '-')                  # Replace multiple dashes with a single dash
    .gsub(/^-|-$/, '')                # Remove leading/trailing dashes
end

def clean_markdown(string)
    string = string.gsub(/!\[.*?\]\(.*?\)/, '')
    return string.gsub(/\[([^\]]+)\]\(([^)]+)\)/, '\1')
end

def write_pages_to_json(pages, file)
    pages.each do |page|
        permalink = to_permalink(page.url)

        # Skip pages with no title
        next if not page.data['title'] or page.data['search_index']

        # Skip extraneous docs
        next if permalink.index("blog-") == 0
        next if permalink.index("docs-plugins-extensions-") == 0
        next if permalink.index("docs-automations-triggers-interaction-worker-callers-") == 0

        row = {
            id: permalink,
            title: page.data['title'],
            url: page.url,
            summary: page.data['summary'] || '',
            content: clean_markdown(ReverseMarkdown.convert(page.content))
        }
        file.write(JSON.generate(row) + "\n")
    end
end

Jekyll::Hooks.register :site, :post_write do |site|
    # Only create the search index on a full build
    if(!defined?@render_count)
        @render_count = 1
    end

    if(@render_count == 1)
        puts "Wrote the JSONL content index."
        @render_count = @render_count - 1

        path = File.expand_path('_site/search.jsonl', site.source)

        File.open(path, 'w') do |file|
            write_pages_to_json site.pages, file
            write_pages_to_json site.collections['posts'].docs, file
            write_pages_to_json site.collections['releases'].docs, file
            write_pages_to_json site.collections['guides'].docs, file
            write_pages_to_json site.collections['docs'].docs, file
            write_pages_to_json site.collections['workflows'].docs, file
            write_pages_to_json site.collections['automation_cookbook'].docs, file
            write_pages_to_json site.collections['tips'].docs, file
        end
    end
end