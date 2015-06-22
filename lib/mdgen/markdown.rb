# markdown.rb - markdown method to create correct markdown  output


# the main markdown object
def markdown(r=GfmRender.new,  &blk)
  r.render MdGen.new.process(&blk)
end


