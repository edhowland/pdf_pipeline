# pdf_pipeline
Convert from data source to PDF possibly using intermediate formats (md, html, etc.)

## Abstract

Assume we have a data source like sqlite containing tables with rows and columns that we want to extract and format into a nice PDF report.
We want to extract them and format them in pretty PDF report.
There are several ways to accomplish this. Here I will attempt enumerate processesi
 in order of least complex to more complex.
I am only examining these based on Ruby or NodeJS to reduce 
dependancies.

1. DStraight to PDF
2. HTML to PDF
3. Markdown to HTML to PDF
4. Sqlite to Markdown, HTML
5. Sample code snippets
6. Links to projects
 

## Straight to PDF

### Using the prawn Ruby Gem

This is most straightforward path to goal. This gem allows you write the actual
PDF in a high level method. It allows for headers, footers and repeating elements.

### Advantages

Least number of dependancies. Only one ruby program is needed. Eg. require both the sqlite and prawn gems and
iterate the records and output the to PDF. I think it also can import a boilerplate
PDF to work from.

### Disadvantages

This is only a programatically method. Only a Ruby programmer can maintain it. Possiblyusing the boiler template approach will help here.
