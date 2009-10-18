#!/usr/bin/env ruby
#
# Grep the code base for all the lines
# that should be changed when creating
# a new gem based on this template.
#
# Tip: In emacs use M-x compile
#        Compile command: ./changeme.rb
#
# Based on: http://kennethhunt.com/archives/001331.html
GLOBS = ['./lib/**/*',
         './spec/**/*',
         './MIT-LICENSE',
         './CHANGELOG',
         './gtemplate.gemspec',
         './Rakefile']
PATTERNS = [/Eric D\. White/,
            /eric@ericwhite\.ca/,
            /Gtemplate/,
            /gtemplate/,
            /s\.summary/,
            /s\.description/,
            /s\.add_dependency/]

GLOBS.each do |glob|
  Dir[glob].each do |path|
    next if File.directory? path
    PATTERNS.each do |pattern|
      row = 0
      File.open(path) do |stream|
        stream.each_line do |line|
          row = row+1
          if line =~ pattern
            puts "#{path}:#{row}:#{line.strip()} -- #{pattern}"
          end
        end
      end
    end
  end
end
