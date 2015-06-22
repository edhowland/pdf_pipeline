# pages_spec.rb - spec for adding pages

require '../lib/mdgen'
require 'minitest/autorun'

describe 'MdGen Pagination' do
  let(:gen) { MdGen.new }

  describe 'should have page method taking a block' do
    subject { gen.process { page { h1 'text' } } }

    specify { subject.must_equal [[:h1, 'text'], [:page]] }
  end
end
