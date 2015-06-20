# text_format_spec.rb  - spec for class TextFormat

require '../lib/mdgen'
require 'minitest/autorun'

describe TextFormat do
  before { @f = TextFormat.new }

  describe 'format []' do
    subject { @f.format [] }

    specify { subject.must_equal '' }

  end
end
