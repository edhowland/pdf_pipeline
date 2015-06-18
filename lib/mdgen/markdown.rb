# markdown.rb - markdown method to create correct markdown  output

require './md_gen'
require './md_kit'

# the main markdown object
def markdown &blk
  mgen = MdGen.new
  mkit = MdKit.new

  mgen.process &blk
  mgen.render mkit
end


# test code
markdown do
  h1 'Heading 1'
  text 'Lines of text... end of text'
  h2 'Heading 2 : Code'
  code 'Some code here'
end
