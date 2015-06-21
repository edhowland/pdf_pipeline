# gfm_render.rb - class GfmRender

class GfmRender
  def initialize
    @formatter = TextFormat.new
  end

  def heading count, string
    "#{'#' * count} #{string}\n"
  end

  def h1 string
    heading 1, string
  end

  def h2 string
    heading 2, string
  end

  def h3 string
    heading 3, string
  end

def h4 string
    heading 4, string
  end

  def h5 string
    heading 5, string
  end

  def h6 string
    heading 6, string
  end

  def para arr
    @formatter.format(arr) + "\n"
  end

  def code string
    "\`\`\`\n#{string}\n\`\`\`\n"
  end

  def ul list
    list.reduce('') {|i, j| i << "- #{j}\n" }
  end

  def render codes
    codes.map {|e| self.send e[0], e[1] }.reduce('') {|i, j| i << "#{j}\n" }
  end
end
