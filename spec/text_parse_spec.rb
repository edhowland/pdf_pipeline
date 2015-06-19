# text_parse_spec.rb - specs for TextParse


require '../lib/mdgen/text_parse'
require 'minitest/autorun'

describe TextParse do
  before do
    @p = TextParse.new
  end

  describe 'lexer' do
    before do
      @actual = @p.lexer ''
    end

    it 'should be []' do

      @actual.must_equal []
    end
  end
end
