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

Ref: 1

#### Advantages

Least number of dependancies. Only one ruby program is needed. Eg. require both the sqlite and prawn gems and
iterate the records and output the to PDF. I think it also can import a boilerplate
PDF to work from.

#### Disadvantages

 This is only a programatically method. Only a Ruby programmer can maintain it. Possiblyusing the boiler template approach will help here.


### Ruport

This a complete reporting framework supplied as Ruby gem. It can oconnect a variety of data sources such .csv, SQL etc. It can generate output in a variety of media types:
PDF, HTML etc.

Ref: 5


#### Advantages

Can be used to create reports with heads, sub-heads and iterate over records from a data source. Can generate bothe pdf and html.

#### Disadvantages

Not sure how well maintained this is. Deppends PDF::Writer which not
maintained since 2005.


## HTML to PDF

There a variety of HTML to PDF converters. Many of these were written to provide 
a PDF view of some website. E.g. Download this page as a PDF.
So a few of them integrate into Rails or Rack as middleware. Might be useful if we have a Sinatra back end.
Here I am only looking at pure Ruby (or NodeJS) varients.

### pdfkit

This a pure Ruby Gem. It can take HTML source with possible CSS sourceses and convert to PDF.


It requires wkhtmltopdf package, which I suspect is needed by the NodJS library as well.

Ref: 2

#### Advatanges

Since there are plenty ofways to generate HTML from a data source, this 
path seems straightforward. Using CSS to provide the presentation layeris a 
easily understood. Plenty of Graphical tools exist to create the HTMLand CS input.
And you get both a Web view and PDF (printable) format.

#### Disadvantages

There are more artifacts in this approach. You need: Data source to HTML engine (ERb, etc.)
A CSS file and tweeked to create the correct PDF format.  A web view CSS will not always work for printable output.
It requires 'wkhtmltopdf' which also requires an X11 virtual server and complicated to setup.

### NodeJS converter

This uses some other Node tools to accomplish this method.

Ref: 3

#### Advantages

This a scalable solution that employs a number of workers to handle concurrent jobs.
If the Web framework gets very busy handling HTML to PDF streams, this might be appropos solution.

#### Disadvantages


### Shell tools

This a shell tool to generate PDF from HTML. There are Rails plugin gems to wrap around it.


Ref: 4
It requires A Node.js framework. Not sure how will this integrate into an otherwide Ruby, Sinatra platform.

## Markdown to HTML to PDF

This is essentially using 2 intermediate formats:MD and HTML.. All the points regarding the HTML to PDF also apply.

## SQLite to Markdown, HTML

There are an unlimited mehods to extract data from a data source as SQLite and format HTML. This 
is the mahor workhorse of most Web frameworks.
Some of these like ERb (Embedded Ruby) can be embedded in any text format, such as MD.

### ERb

Embedded Ruby (ERb) is simple templating engine that can be used with nearly any text format. The ruby statements are embedded via <% ... %> bits. 
See the ./erb for examples.

#### Advantages

ERb is built-in to standard Ruby.
ERb can be used in Markdown or directly in HTML.
ERb is familiar to most Rails developers. 
Graphical tools can be used to work on HTML files with ERb embedded inside.

#### Disadvantages

ERb can be inwieldy. There are many attempts to improve it and/or replace it.
Requires a Ruby developer to update.
### Jinja

Jinja is Python templating engine.

Ref: 6

#### Advantages

Jinja seems to be full featured templating engine. It has
sandboxes for security and escape moded for anti- XSS issues.

#### Disadvantages

It is for Python. It seems to not follow the indenting block style of Python.
Not sure of advantages over WEb.






## Links

1. [Prawn Homepage](http://prawnpdf.org/api-docs/2.0/)
2. {Pdfkit Homepage}(https://github.com/pdfkit/pdfkit)
3. [NodeJS Html to PDF homepage](https://www.npmjs.com/package/phantom-html-to-pdf)
4. [Shell HTML to PDF](http://wkhtmltopdf.org)
5. [Ruport](https://github.com/ruport/ruport)
6. [inja](http://jinja.pocoo.org)

