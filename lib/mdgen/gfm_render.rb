# gfm_render.rb - class GfmRender

class GfmRender
  def initialize
    @formatter = TextFormat.new
  end

  def para arr
    @formatter.format(arr) + "\n"
  end

  def code string
    "\`\`\`\n#{string}\n\`\`\`\n"
  end
  def render codes
    codes.map {|e| self.send e[0], e[1] }.reduce('') {|i, j| i << "#{j}\n" }
  end
end
