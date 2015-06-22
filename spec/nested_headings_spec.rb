# nested_headings_spec.rb - spec for markdownnested blocks

require '../lib/mdgen'
require 'minitest/autorun'

describe 'Nested Heading' do
  let(:gen) { MdGen.new }

  describe 'no nested' do
    subject { gen.process { h 'head' } }

  specify { subject.must_equal [[:h1, 'head']] }
  end

  describe 'two nests' do
    subject do 
      gen.process { h('head1') { h('head2')} }
    end

    specify { subject.must_equal [[:h1, 'head1'], [:h2, 'head2']] }

end
end
