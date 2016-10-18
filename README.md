# FeynMPMF
Bash script takes a LaTeX file as input and generates a cropped pdf file of the Feynman diagram given by the feynMF/feynMP code within.

This script relies on the package [pdfcrop](http://pdfcrop.sourceforge.net/). If
```
$ which pdfcrop
```
returns nothing, then use your package manager of choice to install the package
[texlive-extra-utils](http://packages.ubuntu.com/precise/texlive-extra-utils).

To test that everything is setup correctly run
```
$ bash FeynMPMF.sh test-example.tex
```
and then look at the output pdf file.
