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

        rule %r/(\s*)(#{identifier}:)( *)(.*?)(\n|$)/ do |m|
            groups Text, Keyword, Text, Str, Text
            @parent_indent = m[1].length
            push :value if m[2].include? '@' and 0 == m[4].length
        end
      end

      state :value do
        rule %r/\n/ do
            token Text
        end

        rule %r/( +)/ do |m|
            token Text
            if m[1].length <= @parent_indent
                pop!; reset_stack; push :root
            end
        end

        rule %r/(.*?)(\n|$)/ do |m|
            groups Str, Text
        end
      end
    end
  end
end