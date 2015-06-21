# md_gen_spec.rb -  spec for MdGen

require '../lib/mdgen'
require 'minitest/autorun'


describe MdGen do
  before { @m = MdGen.new }

  describe 'simple paragraph element' do
    before do
      @m.process { para 'this is regular text' }
    end

    subject { @m.codes }

    specify { subject.must_equal [[:para, [[:t, 'this is regular text']]]]}
  end

  describe "paragraph with bold element" do
    before { @m.process { para 'This is [bold bold] text' }}

    subject { @m.codes }

    specify { subject.must_equal [[:para, [
        [:t, 'This is '], 
        [:bold, 'bold'], 
        [:t, ' text']
        ]]] }

  end
end

describe 'MdGen: complicated examples' do
  let(:gen) { MdGen.new }
  describe '3 types: h1, para, code' do
    subject { gen.process { h1 'head'; para 'text'; code 'code' }  }

  specify { subject.must_equal [[:h1, 'head'], [:para, [[:t, 'text']]], [:code, 'code']] }
  end
end
