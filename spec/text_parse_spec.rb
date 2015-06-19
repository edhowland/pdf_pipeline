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


  describe 'lexer "abcd [ital def] ghi"' do
    before do
      @actual = @p.lexer 'abc [ital def] ghi'
    end
    it 'should be ["abc ", "ital def", "ghi"' do
      @actual.must_equal ['abc ', 'ital def', ' ghi']
  end
  end


  describe 'chunker []' do
    before do
      @actual = @p.chuncker []
    end

    it 'should be []' do
      @actual.must_equal []
    end
  end
end

