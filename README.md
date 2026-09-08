# Flatness Filtering for Honeyword Generation

Master's thesis, Computer Engineering, DIBRIS, University of Genoa.

- **Author:** Sona Hosseinzadeh Mahdavi
- **Advisor:** Alessandro Armando
- **Examiner:** Matteo Dell'Amico

## What this is

Honeyword schemes protect password databases by storing decoy passwords next to the real one, so a stolen hash file can't be used without risking detection. That only works if the decoys are flat — if the real password can't be picked out of the set. PassFilter (Dani et al., 2024) showed that a CNN classifier can pick it out anyway, breaking flatness for most existing generators.

This thesis turns that same classifier around and uses it as a filter: score every candidate sweetword set, reject the ones where the real password stands out, regenerate until one passes or a retry cap is hit. Ten generators are benchmarked this way — rule-based chaffing, HoneyGen variants, and a self-trained GAN — at training sizes of 2000, 5000, and 10000, against three attackers (a HoneyGen-tuned CNN, a mixed-corpus CNN, and a frequency ranker).

The headline result: unfiltered generators get broken easily (ASR@5 around 0.68–0.76), ratio-based filtering brings that down to 0.29–0.34 while staying deployable, and the GAN is a cautionary tale — it looks flat under a naive attacker, but the real password sits at the bottom of the ranking, so a rational attacker inverts and recovers it almost every time.

## Repository layout
main.tex — master document (title, author, includes chapters)
preamble.tex — packages and formatting
introduction.tex — motivation, contributions, roadmap
background.tex — honeywords, HoneyChecker, CNN/FastText background
related.tex — prior generators, PassFilter, PassGAN
method.tex — flatness formalism, CNN, generators, filtering algorithm
results.tex — experiments, tables, figures, discussion
conclusion.tex — contributions, limitations, open questions
tables/ — result tables (params, ASR, accept rate, GAN, cross-attacker, mixed)
results_figures.tex — mixed/frequency attacker figures
results_comparison.tex — CNN ASR curves at N_train=10000
figures/ — the plot images
bib.bib — bibliography
masterthesis_ceng.cls — DIBRIS Computer Engineering thesis class


## Building it

Requires a TeX distribution (MiKTeX or TeX Live) with pdflatex and biber — this project uses biblatex, not the older bibtex.

pdflatex -interaction=nonstopmode main.tex
biber main
pdflatex -interaction=nonstopmode main.tex
pdflatex -interaction=nonstopmode main.tex


If `latexmk` and Perl are installed, `latexmk -pdf main.tex` runs all four steps in one command. The first build will pause a few times while MiKTeX fetches missing packages (`pgfplots`, `biblatex`, `algorithm`) — approve the installs when prompted.

## What's not in here

The RockYou corpus, the trained oracle/attacker CNN weights, and any raw password files are excluded on purpose. They contain leaked-credential data and don't belong in a public repository.

## Note on AI assistance

Parts of this thesis were drafted and revised with the help of Claude (Anthropic), including LaTeX formatting, table and figure generation from experimental data, and wording passes made in response to advisor feedback. All technical content, experimental design, and conclusions were reviewed by the author, who takes full responsibility for them.