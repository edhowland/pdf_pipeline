# hello_pdf.rb - Prawn hello world to PDF

require 'prawn'
Prawn::Document.generate("hello.pdf") do
  text "Hello World!"
end


