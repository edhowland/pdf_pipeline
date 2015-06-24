#!/usr/bin/env ruby
# redcarpet_table.rb - redcarpet that renders tavle

require 'redcarpet'

text = File.read ARGV.first
markdown = Redcarpet::Markdown.new(Redcarpet::Render::HTML, :tables => true)


puts markdown.render(text)
