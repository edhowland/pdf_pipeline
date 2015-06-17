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
2.HTML to PDF
3. Markdown to HTML to PDF
4. Sqlite to Markdown, HTML
5. Sample code snippets
6. Links to projects
 
