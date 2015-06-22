# pdf_rend_spec.rb -  spec for PdfRend

require '../lib/pdfrend'
require 'minitest/autorun'

describe PdfRend do
  let(:rend) { PdfRend.new('./test.pdf') }

  describe 'smoke test' do
      subject { rend.render [] }

  specify { subject }end

end
