# md_gen_spec.rb -  spec for MdGen

require '../lib/mdgen'
require 'minitest/autorun'


describe MdGen do
  before { @m = MdGen.new }

  describe '' do

    before do
      @m.process do

      end
    end
  end
end
