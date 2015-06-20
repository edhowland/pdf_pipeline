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
end
