#!/bin/bash
# Author: Matthew Feickert
# Date: 2015-09-15
# Description: This script takes a LaTeX file as input
# and generates a cropped pdf file of the feynman diagram
# that was in the LaTeX file.
# Make sure you have used your favorite Linux package
# manager to install the texlive-extra-utils package for
# use of pdfcrop

# Check to make sure a file was passed
if [ $# -eq 0 ]
then
  echo "A LaTeX file (.tex) is needed as input."
  exit 1
fi
# Check to make sure a LaTeX file was passed
if [ "${1:(-4)}" != ".tex" ]
then
  echo "A LaTeX file (.tex) is needed as input."
  exit 1
fi

if [ "$2" != "verbose" ]        # If verbose option then output to stdout
then
  pdflatex $1 >/dev/null
  for f in *.mp; do mpost $f; done
  pdflatex $1 >/dev/null
  pdfname=${1%.tex}.pdf
  pdfcrop --clip $pdfname $pdfname >/dev/null
else
  pdflatex $1
  for f in *.mp; do mpost $f; done
  pdflatex $1
  pdfname=${1%.tex}.pdf
  pdfcrop --clip $pdfname $pdfname
fi

#cleanup
rm -f *.aux *.out *.dvi *.log *-pics.* *.ps *.mp *.t1 *.1 *~
