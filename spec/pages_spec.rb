# pages_spec.rb - spec for adding pages

require '../lib/mdgen'
require 'minitest/autorun'


describe PageCounter do
  let(:counter) { PageCounter.new }

  describe 'should have 0 pages' do
    subject { counter.process {} }

    specify { subject.must_equal 0 }
  end

describe 'block with 2 page blocks' do
    subject { counter.process {page { } ; page { } } }

    specify { subject.must_equal 2  }
  end

  describe 'with head and no pages' do
    subject { counter.process {  h1 '' } }

    specify { subject.must_equal 0}
  end
  describe 'block with h1, 2 pages block with inner primatives' do
    subject { counter.process { h2 ''; page {  para '' }; page { code '' } } }

    specify { subject.must_equal 2 }
  end 

end
describe 'MdGen Pagination' do
  let(:gen) { MdGen.new }

  describe 'should have page method taking a block' do
    subject { gen.process { page { h1 'text' } } }

    specify { subject.must_equal [[:h1, 'text'], [:page]] }
  end
end
