# gfm_render.rb - class GfmRender

class GfmRender
  def initialize
    @formatter = TextFormat.new
  end

  def para arr
    @formatter.format arr
  end

  def code string
    string
  end
  def render codes
    codes.map {|e| self.send e[0], e[1] }.reduce('') {|i, j| i << "#{j}\n" }
  end
end
