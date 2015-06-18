# mdgen.rb - MdGen class DSL to generate Markdown

class MdGen
  def initialize
    @codes = []
  end

  attr_reader :codes
  def h1 string
    @codes << [:h1, string]
  end

  def h2 string
    @codes << [:h2, string]
  end

  def code string
    @codes << [:code, string]
  end

def text string
    @codes << [:text, string]
  end

  def ordered_list(*list)
    @codes << [:ol, list]
  end

  def bullets *list
      @codes << [:ul, list]
  end

def process(&blk)
    self.instance_exec &blk
  end  

  # render the output as proper markdown
  # pass a renderer
  def render kit
    kit.render @codes
  end
end
