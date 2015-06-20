# gfm_render.rb - class GfmRender

class GfmRender
  def render codes
    codes.map {|e| e[1] }.reduce('') {|i, j| i << "#{j}\n" }
  end
end
