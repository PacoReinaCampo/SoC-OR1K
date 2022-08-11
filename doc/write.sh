rm -f *.tex
rm -f *.pdf

pandoc BOOK.md -s -o SoC-OR1K.tex
pandoc BOOK.md -s -o SoC-OR1K.pdf
