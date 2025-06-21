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

def create_search_row(site, id, title, relative_url, summary, tags, content)
    base_url = "https://cerb.ai"
    absolute_url = "#{base_url}#{relative_url}"
    
    return {
        id: id,
        title: title,
        url: absolute_url,
        summary: summary,
        tags: tags,
        content: content
    }
end

def get_page_tags(permalink)
    page_tags = []
    
    prefix_tags = {
        'docs-' => 'docs',
        'docs-automations-' => 'docs-automations',
        'docs-records-types-' => 'docs-records-types',
        'docs-scripting' => 'docs-scripting',
        'guides-' => 'guides',
        'releases-' => 'releases',
        'solutions-' => 'solutions',
        'solutions-automations-' => 'solutions-automations',
        'tips-' => 'tips',
        'workflows-' => 'workflows'
    }
    
    prefix_tags.each do |prefix, tag|
        if permalink.start_with?(prefix)
            page_tags << tag
        end
    end
    
    return page_tags
end

def extract_section_content(markdown_content, start_heading)
    lines = markdown_content.split("\n")
    start_idx = -1
    end_idx = lines.length
    
    # ReverseMarkdown escapes underscores, so we need to handle both forms
    escaped_heading = start_heading.gsub('_', '\_')
    
    # Find the start of the section - be more flexible with matching
    lines.each_with_index do |line, idx|
        line_stripped = line.strip
        
        # Check for exact Markdown heading match
        if line_stripped == "## #{start_heading}"
            start_idx = idx
            break
        end
        
        # Check for escaped underscores version
        if line_stripped == "## #{escaped_heading}"
            start_idx = idx
            break
        end
        
        # Check for heading with extra characters/formatting
        if line_stripped =~ /^##\s+#{Regexp.escape(start_heading)}\s*$/
            start_idx = idx
            break
        end
        
        # Check for escaped version with regex
        if line_stripped =~ /^##\s+#{Regexp.escape(escaped_heading)}\s*$/
            start_idx = idx
            break
        end
        
        # Check for heading that might have been converted with different formatting
        if line_stripped.downcase == "## #{start_heading.downcase}"
            start_idx = idx
            break
        end
    end
    
    return "" if start_idx == -1
    
    # Find the end of the section (next ## heading)
    (start_idx + 1...lines.length).each do |idx|
        line = lines[idx].strip
        
        # Check for next Markdown ## heading
        if line =~ /^##\s+/
            end_idx = idx
            break
        end
    end
    
    # Extract the section content
    section_lines = lines[start_idx...end_idx]
    section_content = section_lines.join("\n")
    
    return section_content
end

def write_synthetic_sections(site, page, file)
    return unless page.data['search_index'] && page.data['search_index']['sections']
    
    base_permalink = to_permalink(page.url)
    if page.url == '/' && base_permalink.length == 0
        base_permalink = 'index'
    end
    
    # Get page tags
    page_tags = get_page_tags(base_permalink)
    
    # Convert the processed HTML content back to clean Markdown once
    page_markdown = clean_markdown(ReverseMarkdown.convert(page.content))
    
    page.data['search_index']['sections'].each do |section|
        next unless section['heading'] && section['title']
        
        section_permalink = "#{base_permalink}--#{to_permalink(section['heading'])}"
        section_content = extract_section_content(page_markdown, section['heading'])
        
        # Debug: print some info about the content extraction
        if section_content.empty?
            puts "Warning: No content found for section '#{section['heading']}' in #{page.url}"
            
            # Debug: show what headings are actually available
            markdown_headings = page_markdown.scan(/^## (.+)$/)
            puts "Available headings: #{markdown_headings.flatten.first(10).join(', ')}"
            
            # Debug: check if heading exists with different case/spacing
            matching_headings = markdown_headings.flatten.select { |h| h.downcase.include?(section['heading'].downcase) }
            if matching_headings.any?
                puts "Similar headings found: #{matching_headings.join(', ')}"
            end
            
            # Debug: Show a sample of the converted markdown around where we expect the heading
            lines = page_markdown.split("\n")
            target_lines = lines.select.with_index { |line, idx| 
                line.include?(section['heading']) && idx > 0 && idx < lines.length - 1
            }
            if target_lines.any?
                puts "Lines containing '#{section['heading']}': #{target_lines.first(3).join(' | ')}"
            end
        end
        
        section_url = "#{page.url}##{to_permalink(section['heading'])}"
        section_summary = section['summary'] || "#{section['title']} - #{page.data['title']}"
        
        row = create_search_row(site, section_permalink, section['title'], section_url, section_summary, page_tags, section_content)
        file.write(JSON.generate(row) + "\n")
    end
end

def write_pages_to_json(site, pages, file)
    pages.each do |page|
        permalink = to_permalink(page.url)

        # Handle the root page
        if(page.url == '/' and permalink.length == 0)
            permalink = 'index'
        end

        # Skip pages with no title
        next if not page.data['title']
        
        # Handle search_index configuration
        search_index = page.data['search_index']
        if search_index
            # Skip if explicitly excluded
            if search_index == true || (search_index.is_a?(Hash) && search_index['exclude'])
                next
            end
            
            # Generate synthetic sections if configured
            if search_index.is_a?(Hash) && search_index['sections']
                write_synthetic_sections(site, page, file)
                
                # Skip the main page if only_sections is true
                if search_index['only_sections']
                    next
                end
            end
        end

        # Skip extraneous docs
        next if permalink.index("blog-") == 0
        next if permalink.index("docs-plugins-extensions-") == 0
        next if permalink.index("docs-automations-triggers-interaction-worker-callers-") == 0

        page_tags = get_page_tags(permalink)
        page_summary = page.data['summary'] || ''
        page_content = clean_markdown(ReverseMarkdown.convert(page.content))

        row = create_search_row(site, permalink, page.data['title'], page.url, page_summary, page_tags, page_content)
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
            write_pages_to_json site, site.pages, file
            write_pages_to_json site, site.collections['docs'].docs, file
            write_pages_to_json site, site.collections['solutions'].docs, file
            write_pages_to_json site, site.collections['workflows'].docs, file
            write_pages_to_json site, site.collections['guides'].docs, file
            write_pages_to_json site, site.collections['releases'].docs, file
            write_pages_to_json site, site.collections['tips'].docs, file
            write_pages_to_json site, site.collections['posts'].docs, file
        end
    end
end