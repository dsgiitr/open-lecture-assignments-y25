#!/bin/sh

input_file="$1"
input_format="${1##*.}"
output_format="$2"


output_file="${input_file%.*}.$output_format"
text_file="/tmp/tmp_conversion.txt" 


case "${input_format}-${output_format}" in 
txt-md|epub-md|docx-md|html-md|\
  md-txt|html-txt|epub-txt|docx-txt|\
  md-html|txt-html|epub-html|docx-html|\
  md-pdf|html-pdf|txt-pdf|epub-pdf|\
  md-docx|html-docx|docx-pdf|txt-docx|\
  md-epub|txt-epub|html-epub)
    pandoc "$input_file" -o "$output_file"
    echo "Converted $input_file to $output_format"
    ;;

pdf-txt|pdf-html|pdf-md|pdf-docx|pdf-epub)

    pdftotext "$input_file" "$text_file"
    pandoc "$text_file" -o "$output_file"
    echo "Converted $input_file to $output_format"
    ;;

*)

    echo "Conversion from $input_format to $output_format not supported yet."
    ;;

esac    










