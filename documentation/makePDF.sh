#!/bin/bash

# The templates used in this script are available at
#  --> https://github.com/rmadar/pandoc-utils

if [ $# -ne 2 ]; then
    echo ""
    echo "Script usage: "
    echo "   ./makeBook.sh <\"title.md chap1.md chap2.md chap3.md\"> <book.pdf>"
    echo ""
    exit 1
fi

# PDF via latex
pandoc -N -s ${PANDOC_TEMPLATES}/cross_references.yaml ${1} -o ${2}\
       --template ${PANDOC_TEMPLATES}/document_template.tex \
       --filter ${PANDOC_FILTERS}/pandoc-crossref\
       --filter pandoc-citeproc\
       --variable geometry="a4paper, total={6in,9in}"\
       -V linestretch="1.2" -V fontsize="11pt" -V documentclass="article"\
       --highlight-style tango\
       --toc --toc-depth=2 -V fancypage\
       -V display-abstract
#       -V fontfamily="gillius" -V fontoption="default"
#       -V fontfamily="lmodern"
#       -V fontfamily="sansmathfonts"
#       -V fontfamily="sourceserifpro" -V fontoption="default"  
#       -V fontfamily="merriweather" -V fontoption="light"  
#       -V fontfamily="CrimsonPro"
#       -V fontfamily="ebgaramond"

