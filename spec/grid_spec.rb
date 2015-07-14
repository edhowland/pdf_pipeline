# grid_spec.rb - specs for method grid(rows, cols)

require '../lib/support/grid'
require 'minitest/autorun'


describe 'grid 4,4' do
  let(:grid4x4) { grid(4,4) }

  specify { grid4x4.must_equal  [
    [1,2,3,4],
    [5,6,7,8],
    [9,10,11,12],
    [13,14,15,16]
] }
end
