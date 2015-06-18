# myfile.rb - generate markdown from dsl

require './markdown'

# test code
markdown do
  h1 'Heading 1'
  text 'Lines of text... end of text'
  h2 'Heading 2 : more text'

  ordered_list 'item 1', 'item 2', 'item 3'
  bullets 'Item A', 'Item B', 'Item C'

  link 'Google Homepage', 'https://www.google.com'
  code 'Some code here'
end
