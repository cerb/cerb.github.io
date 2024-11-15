require "fileutils"

module CerbSearchIndex
    class SearchGenerator < Jekyll::Generator
        safe true
        priority :lowest

        def generate(site)
            puts "Generating search index..."
            search_index = Jekyll::Page.new(site, __dir__, '', 'includes/search_index.json')
            search_index.data['permalink'] = '/assets/search/search_index.json'
            search_index.data['layout'] = nil
            site.pages << search_index
            puts "... done"
        end
    end
end