# integrate_md_gen_render_spec.rb - spec to combine MdGen, GfmRender

require '../lib/mdgen'
require 'minitest/autorun'

describe 'Integration test: MdGen, GfmRender' do
  let(:gen) { MdGen.new }
  let(:rend) { GfmRender.new }

  describe 'simple code element' do
    subject { rend.render(gen.process { code 'code' }) }

specify { subject.must_equal <<-EOC
\`\`\`
code
\`\`\`

EOC
}
  end

  describe 'text with 2 styles, code and plain text' do
    subject do
      rend.render(gen.process do
      para 'the quick [bold brown] fox [ital jumped] over.'
      code '$ sudo apt-get install mdgen'
      para 'lazy dog\'s back'
    end)
    end
  end
    end
