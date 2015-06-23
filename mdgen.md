# MdGen Notes

## Abstract

Notes on usage of mdgen: a Markdown Generator

Mdgen can be used as templating engine to generate Github Flavored Markdown. Since it just takes a Ruby block, any amount of computation can be done.

MdGen supports the following elements:

- Headings: h1 .. h6
- Paragraphs: para (with embedded styles)
- Code Blocks: code
- Lists: numbers, bullets
- pages: page
- Links: link

## Basic Usage

Let's look at simple example:

```
markdown { h1 "Heading" } 
```

Here we generate a string of a single markdown element:

```
# Heding
```

markdown() takes a block and returns a string containing the markdown. A more useful example:

```
# a more useful example

require ../lib/mdgen'

output = markdown do
  h l,  'Second level heading'
  para 'A paragraph.'
  code '$ sudo gem install mdgen'
end

puts output

```

Here we capture the string from markdown() in 'output'.
Then we just write it out. Note: We are using some more MDSL primatives. E.g.
h2, para and code. Mdgen takes headings from h1 to h6. A para is just a paragraph.
'code' is a code block.


## Ruby within MDSL

```
markdown do
  h1 "Report for: #{Time.now.ctime()}"
  links.each do |l|
    link l[0], l[1]
  end
end

```

Since this just Ruby, we can do anything allowed inside most Ruby blocks. Note we can string
interpolation in the h1 element. And we see another primative: 'link'. The link
element expects a title and url parameters. Out example expects the links collection
to have 2 elements arrays.


## Lists

Mdgen supports two list types: Bullets and numbers. Or unordered and ordered lists.
Eeach type just takes an array of strings or things that can be converted to strings.


```
markdown { bullets 'item A', 'Item B' }

  markdown { numbers 'Item 1', "Item 2' }

```

