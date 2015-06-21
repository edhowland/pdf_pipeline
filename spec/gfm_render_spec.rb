# gfm_render_spec.rb - spec for GfmRender

require '../lib/mdgen'
require 'minitest/autorun'

describe GfmRender do
  before { @r = GfmRender.new }

  describe 'render empty codes' do
    subject { @r.render [] }

    specify { subject.must_equal '' }
  end

describe 'heading 1' do
    subject { @r.render [[:h1, 'head']] }

    specify { subject.must_equal "# head\n\n" }
  end

  describe 'heading 2' do
   subject { @r.render [[:h2, 'head' ]] }

  specify { subject.must_equal "## head\n\n" }
  end

  describe 'heading 3' do
    subject { @r.render [[:h3, 'head']] }

    specify { subject.must_equal "### head\n\n" }
  end


  describe 'heading 4' do
    subject { @r.render [[:h4, 'head']] }

  specify { subject.must_equal "#### head\n\n" }
  end

  describe 'single code code' do
    subject { @r.render [[:code, '']] }

    specify { subject.must_equal "\`\`\`\n\n\`\`\`\n\n" }
  end

  describe 'code with text' do
    subject { @r.render [[:code, 'text']] }

    specify { subject.must_equal "\`\`\`\ntext\n\`\`\`\n\n" }
  end

  describe 'paragraph must be separated by blank line' do
    subject { @r.render [[:para, [[:t, 'text']]]] }

    specify { subject.must_equal "text\n\n" }

  end
  describe 'two elements : code, text' do
    subject { @r.render [[:code, 'code'], [:para, [[:t, 'text']]]] }

    specify { subject.must_equal "\`\`\`\ncode\n\`\`\`\n\ntext\n\n" }

  end


  describe 'one complicated paragraph' do
    subject { @r.render [[:para, 
      [[:t, 'the '],
       [:bold, 'quick'], 
        [:t, ' brown fox']
      ]]] }

    specify {subject.must_equal "the **quick** brown fox\n\n" }
  end
end
