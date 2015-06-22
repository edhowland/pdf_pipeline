# pdf_rend.rb - class PdfRend use with MdGen to render pdfs w/Prawn

class PdfRend
  def initialize
    @prawn = PrawnDocument.new
  end
end
