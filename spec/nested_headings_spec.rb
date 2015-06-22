# nested_headings_spec.rb - spec for markdownnested blocks

require '../lib/mdgen'
require 'minitest/autorun'

describe 'Nested Heading' do
  let(:gen) { MdGen.new }

  describe 'no nested' do
    subject { gen.process { h 1,  'head' } }

  specify { subject.must_equal [[:h1, 'head']] }
  end

  describe 'two nests' do
    subject do 
      gen.process { h(1, 'head1') {|l|  h(l, 'head2')} }
    end

    specify {  subject.must_equal [[:h1, 'head1'], [:h2, 'head2']] }
end

  describe '6 nested headings' do
    subject do
      gen.process do
        h 1, 'h1' do |l|
            h l, 'h2' do |l|
             h(l, 'h3') {|l|  h(l, 'h4') {|l| h(l, 'h5') }}
              end
        end
      end
    end

  end
end
