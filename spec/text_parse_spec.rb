# text_parse_spec.rb - specs for TextParse


require '../lib/mdgen/text_parse'
require 'minitest/autorun'

describe TextParse do
  before do
    @p = TextParse.new
  end

  describe 'lexer empty string' do
    before do
      @actual = @p.lexer ''
    end

    it 'should be []' do

      @actual.must_equal []
    end
  end

  describe 'lexer 4 character string' do
    before do
      @actual = @p.lexer '1234'
    end

    it "should be ['1234']" do
      @actual.must_equal ['1234']
    end
  end
end
