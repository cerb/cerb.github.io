require 'rouge'

module Rouge
  module Lexers
    class CerbKataLexer < RegexLexer
      title "CerbKataLexer"
      desc "Lexer for Cerb KATA"
      tag 'cerb'
      filenames '*.kata'

      identifier = /[\w\-_.@&,\/]+/

      state :basic do
        rule %r/\s*#.*?\n/, Comment
      end

      state :root do
        mixin :basic

        rule %r/(\s*)(#{identifier}:)( *)([^\n]*?)(\n|$)/ do |m|
            groups Text::Whitespace, Keyword, Text

            value = m[4]

            if value.include?('{{') && value.include?('}}')
                while value.match(/(.*?)({{.*?}})(.*)/)
                    pre, twig, post = $1, $2, $3
                    token Str, pre unless pre.empty?
                    token Punctuation, '{{'

                    inner_content = twig[2...-2]

                    token Str, inner_content
                    token Punctuation, '}}'
                    value = post
                end
            else
                token Str, value
            end

            token Text, m[5]

            if @dedent
                @dedent = false
            else
                @parent_indent = m[1].length
            end
            push :value if m[2].include? '@' and 0 == m[4].length
        end
      end

      state :value do
        rule %r/\n/ do
            token Text
        end

        rule %r/( +)/ do |m|
            if m[1].length <= @parent_indent
                token Text::Whitespace
                @dedent = true
                pop!
                push :root
            else
                token Text::Whitespace
            end
        end

        rule %r/([^\n]*?)(\n|$)/ do |m|
            value = m[1]

            if value.include?('{{') && value.include?('}}')
                while value.match(/(.*?)({{.*?}})(.*)/)
                    pre, twig, post = $1, $2, $3
                    token Str, pre unless pre.empty?
                    token Punctuation, '{{'

                    inner_content = twig[2...-2]

                    token Str, inner_content
                    token Punctuation, '}}'
                    value = post
                end
            else
                token Str, value
            end

            token Text, m[2]
        end
      end
    end
  end
end