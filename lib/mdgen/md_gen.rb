# mdgen.rb - MdGen class DSL to generate Markdown

class MdGen
  class NestingTooDeep < RuntimeError
    def initialize
      super('Nesting Level Too Deep')
    end
  end
  def initialize
    @codes = []
  end

  attr_reader :codes

  def h l,  string, &blk
     raise MdGen::NestingTooDeep if l > 6

    headm = "h#{l}".to_sym
    @codes << [headm, string]
  yield l + 1 if block_given?
  end
  def h1 string
    @codes << [:h1, string]
  end

  def h2 string
    @codes << [:h2, string]
  end

  def code string
    @codes << [:code, string]
  end

def para string
  parser = TextParse.new
  
    @codes << [:para, parser.parse(string)]
  end

  alias_method :text, :para

  def ordered_list(*list)
  list = list[0] if list[0].instance_of? Array
    @codes << [:ol, list]
  end

alias_method :numbers, :ordered_list

  def bullets *list
      @codes << [:ul, list]
  end

  def link title, url
    @codes << [:a, title, url]
  end

def process(&blk)
    self.instance_exec &blk
    @codes
  end  

  # render the output as proper markdown
  # pass a renderer
  def render kit
    kit.render @codes
  end
end
