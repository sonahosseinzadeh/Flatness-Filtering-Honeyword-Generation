Thesis build instructions
=========================

Requirements: a TeX distribution (MiKTeX or TeX Live) that includes
pdflatex, biber, and latexmk, plus the packages pgfplots, biblatex,
algorithm/algpseudocode, booktabs, cleveref (MiKTeX installs missing
ones automatically on first build).

To build (one command, from this folder):
    latexmk -pdf main.tex
  or simply:
    latexmk

To clean auxiliary files (keeps main.pdf):
    latexmk -c

Notes:
- This project uses biblatex + biber (NOT bibtex). The .latexmkrc in
  this folder wires biber in automatically.
- Class: main.tex uses \documentclass{masterthesis} (Computer Science).
  For Computer Engineering, change it to \documentclass{masterthesis_ceng}.
- bib.bib currently holds placeholder reference entries; replace them
  with your own bibliography.
- Chapters: introduction, background, related, method, results, conclusion.
  Result tables are in tables/, figures in results_figures.tex.
