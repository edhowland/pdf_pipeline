# redcarpet_table.rb - redcarpet that renders tavle

require 'redcarpet'
markdown = Redcarpet::Markdown.new(Redcarpet::Render::HTML, :tables => true)

text = <<END
| header 1 | header 2 |
| -------- | -------- |
| cell 1   | cell 2   |
| cell 3   | cell 4   |
END

puts markdown.render(text)
