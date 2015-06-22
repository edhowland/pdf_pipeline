# pdf_rend_spec.rb -  spec for PdfRend

require '../lib/pdfrend'
require 'minitest/autorun'

describe PdfRend do
  let(:rend) { PdfRend.new('./test.pdf') }

  describe 'smoke test' do
      subject { rend.render [] }

  specify { subject }
end

  describe 'creates a test.pdf' do
    subject { rend.render [] }

  specify { subject; File.exist?('./test.pdf').must_equal true }
  end

  describe 'renders some text' do
    subject {  rend.render [[:para, 'bandit']] }

    specify { subject }
  end
end
