# mdgen.rb - MdGen class DSL to generate Markdown

class MdGen
  def iniialize

  end

  def hello
    puts 'hello'
  end

  def world
  puts 'world'
  end

def process(&blk)
    self.instance_exec &blk
  end  
end
