# latexmk configuration for this thesis
# Build with:  latexmk -pdf main.tex     (or just: latexmk)
# Clean with:  latexmk -c                (removes aux files, keeps the PDF)

$pdf_mode = 1;              # produce PDF via pdflatex
$pdflatex = 'pdflatex -interaction=nonstopmode -synctex=1 %O %S';
$bibtex_use = 2;            # run the bibliography tool as needed
$biber = 'biber %O %S';     # this project uses biblatex + biber (not bibtex)

# make latexmk detect that biber must run (biblatex writes a .bcf file)
add_cus_dep('bcf', 'bbl', 0, 'run_biber');
sub run_biber {
    return system("biber \"$_[0]\"");
}

# files latexmk should also clean up
$clean_ext = 'bbl bcf run.xml synctex.gz';

# default file to build if none is given on the command line
@default_files = ('main.tex');
