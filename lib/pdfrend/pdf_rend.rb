# pdf_rend.rb - class PdfRend use with MdGen to render pdfs w/Prawn

class PdfRend
  def initialize pathname
@pathname = pathname
  puts "init: #{@pathname}"
  end

  # render bytecodes via codes to PrawnDocument
  def render codes
  puts "Pathname: #{@pathname}"
Prawn::Document.generate(@pathname) do
  text 'smoke'
  end
    
  end
end
