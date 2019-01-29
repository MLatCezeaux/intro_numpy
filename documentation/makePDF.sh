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


# Font selection for PDF creation via LaTeX
# =========================================
#font="txfonts"
#fontoption="varg"
#addoption="-V "
#fontsize="10"

font="sourcesanspro"
fontoption="default"
addoption="-V sans-serif"
fontsize="10"

#font="cmbright"
#fontoption=""
#addoption="-V sans-serif"
#fontsize="10"

#font="gillius"
#fontoption="default"
#addoption="-V sans-serif"
#fontsize="10"

#font="lmodern"
#fontoption=""
#addoption=""
#fontsize="10"

#font="sourceserifpro"
#fontoption="default"
#addoption=""
#fontsize="10"

#font="merriweather"
#fontoption="light"
#addoption=""
#fontsize="10"

#font="CrimsonPro"
#fontoption=""
#addoption=""
#fontsize="11"

#font="ebgaramond"
#fontoption=""
#addoption=""
#fontsize="10"


# PDF via latex
pandoc -N -s ${PANDOC_TEMPLATES}/cross_references.yaml ${1} -o ${2}\
       --template ${PANDOC_TEMPLATES}/document_template.tex \
       --filter ${PANDOC_FILTERS}/pandoc-crossref\
       --filter pandoc-citeproc\
       --variable geometry="a4paper, total={6in,9in}"\
       -V linestretch="1.2" -V fontsize=${fontsize} -V documentclass="report"\
       --highlight-style tango\
       --toc --toc-depth=2 -V fancypage\
       -V fontfamily="${font}" -V fontoption="${fontoption}" ${addoption}
#       -V display-abstract\

	  
# Make HTML
pandoc -N -s ${PANDOC_TEMPLATES}/cross_references.yaml ${1} -o ${2}.html\
       --mathjax --css ${PANDOC_TEMPLATES}/webstyle_template.css\
       --filter pandoc-crossref --filter pandoc-citeproc\
       --csl ${PANDOC_TEMPLATES}/biblio_style.csl
