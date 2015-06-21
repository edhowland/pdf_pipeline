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
    let(:rend) {GfmRender.new}
    let(:gen) {MdGen.new}
      let(:expected) { "the quick **brown** fox *junped* over.\n\n\`\`\`\n$ sudo apt-get install mdgen\n\`\`\`\n\nthe lazy dog's back\n\n" }

    subject do
      rend.render(gen.process do
      para 'the quick [bold brown] fox [ital jumped] over.'
      code '$ sudo apt-get install mdgen'
      para 'the lazy dog\'s back'
    end)
    end

    specify {skip('bad code'); actual=subject; puts "#{expected}"; puts "#{actual}";   actual.must_equal expected }

  end
    end
