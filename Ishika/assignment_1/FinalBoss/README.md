# File Format Converter

This is a simple file format converter which allows you to convert your files between some common document formats such as:

- .pdf 
- .epub
- .md 
- .html
- .txt
- .docx

### Why use this?

Looking up sites and uploading files for such basic file conversions can be very time consuming, especially when one frequently needs to make these conversions. This script automates the whole process and allows us to convert a file into another format by simply putting in the file name and the format we want it in.

### How to use?

```bash
./file_format_converter.sh file.extension required_format
```

### What to make sure of? 

- The command-line tool used for most of the conversions - pandoc, requires LaTeX(.tex) whenever it needs to convert to pdf. Make sure to have it installed beforehand.
_(Source: https://pandoc.org/MANUAL.html#options)_
  
- The file must mention its original format with the file name, in the format file_name.extension.


