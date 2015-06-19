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

    specify { subject.must_equal [[:text, 'this is regular text']]}
  end
end
