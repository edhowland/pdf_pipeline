# gfm_render_spec.rb - spec for GfmRender

require '../lib/mdgen'
require 'minitest/autorun'

describe GfmRender do
  before { @r = GfmRender.new }

  describe 'render empty codes' do
    subject { @r.render [] }

    specify { subject.must_equal '' }
  end

  describe 'single code code' do
    subject { @r.render [[:code, '']] }

    specify { subject.must_equal "\n" }
  end

  describe 'code with text' do
    subject { @r.render [[:code, 'text']] }

    specify { subject.must_equal "text\n" }
  end


  describe 'two elements : code, text' do
    subject { @r.render [[:code, 'code'], [:para, [[:t, 'text']]]] }

    specify { subject.must_equal "code\ntext\n" }
  end
end
