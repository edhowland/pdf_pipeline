# markdown.rb - markdown method to create correct markdown  output


# the main markdown object
def markdown &blk
  mgen = MdGen.new
  mkit = MdKit.new

  mgen.process &blk
  mgen.render mkit
end


