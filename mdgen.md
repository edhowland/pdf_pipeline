# MdGen Notes

## Abstract

Notes on usage of mdgen: a Markdown Generator

Mdgen can be used as templating engine to generate Github Flavored Markdown, or PDF directly. Since it just takes a Ruby block, any amount of computation can be done.

MdGen supports the following elements:

- Headings: h1 .. h6
- Paragraphs: para (with embedded styles)
- Code Blocks: code
- Lists: numbers, bullets
- pages: page
- Links: link
- Tables: table, html_table
- importing MDSL content

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


## Paragraphs with inline styles: para

Paragraphs are just unstructred text and represented with a 'para' command
To use inline styles, just surround with a 'style text' form.
The  current supported styles are 'bold' and 'ital' for {bold Bold and *Italics*.
Here is a simple example:


```
markdown do
  para <<-EOP
This a [bold BOLD] word.
Here is an [ital Italic] word.
  EOP
end

```

## Code blocks: code

Code fences are represented by '```' surrounding it in GFM markdown.
In MdGen, you just use the 'code' command passing it simple string.
Note: Be sure to not allow any uninted string interpolation where you do not wantit


## Lists

Mdgen supports two list types: Bullets and numbers. Or unordered and ordered lists.
Eeach type just takes an array of strings or things that can be converted to strings.


```
markdown { bullets 'item A', 'Item B' }

  markdown { numbers 'Item 1', "Item 2' }

```

## Pages

Pages can be usedto subdivide the reuslting output into pages.
Pages are det as Ruby block with ccurrent page number and total page count passed.
You can then use string interpolation to place the output in the output, if desired. Let's look at an example


```
page do |pageno, total|
  para 'some content'
  h6 "Page #{pageno} of #{total}"
end

```

InGFM markdown, the actual page blocks are ignored,
 except for any string interolations.
In PDF generation, they create normal page breaks


## Tables: table, html_table

MdGen supports 2 table methods:

- GFM Tables: table
- HTML Tables: html_table

### table

Tables in Markdown can be tricky.
You **must** have a row of '---' matching the column count of the first raow.
The first row will ve converted to the header of the table. Rows after
the row of dashes, the following rows will be the body of the table.
The table command in MdGen takes an array of arrays where the first
inner array is converted to the header row.
The subsequent arrays will be converted to the body separated with row of '----'.
Here is a simple example:


```
markdown { table [['head1', 'head2'], ['cell1', 'cell2']] }

```

And here is the output:

head1|head2
----|----
cell1|cell2

### html_table

HTML tables get rendered as just straight HTML table tags.
Markdown just pass any HTML through to resulting output without any changes.
This fixes the problem with GFM needing to render the first row as the thead element.
You just can call the 'html_table' command with the same args the 'table' command


## Importing MDSL content

Other files containing MDSL content can be imported with the 'import' command.
This content is interpreted in the context of the current block and
inserted into the opcode stream at the place where it occurs. This can be useful
for inserting static content without resorting copy and pasting.
Here is an example that imports a header and footer at th top of every page:


```
# pages_imports.mdsl:


# pages_imports.mdsl - MdGen file with 2 pages and header and footer

require '../lib/mdgen'

m = markdown do
  page do |current, total|
    import 'header.mdsl'

    para "Content for Page : #{current}"

    import 'footer.mdsl'
  end

  page do |current, total|
    import 'header.mdsl'

    para "Content for Page : #{current}"

    import 'footer.mdsl'
  end
end

puts m

# header.mdsl:

->{ h1 "Report for: #{Time.now.ctime}" }
# footer.mdsl:

->{ h6 '(c) Example.com' }

```

Here the output from the above example:

```
# Report for: Wed Jun 24 17:52:05 2015

Content for Page : 1

###### (c) Example.com

# Report for: Wed Jun 24 17:52:05 2015

Content for Page : 2

###### (c) Example.com


```

