# Building the PDF

The print edition is typeset from `README.md` with [pandoc](https://pandoc.org)
and XeLaTeX (US Letter, TeX Gyre Pagella). Two helpers are used: `latex-header.tex`
(URL breaking, Unicode glyphs, figure sizing) and `center-figures.lua` (a small
pandoc filter that centers figure images and their captions in the PDF only — the
Markdown is untouched, so the GitHub README is unaffected).

First generate the LaTeX source, then run XeLaTeX **three times** so the
`longtable` column widths settle (otherwise the table headers don't line up with
their columns):

```sh
ABSTRACT="We survey three German educational microcomputers of the early 1980s ... (see the PDF)."

pandoc README.md --standalone --from gfm \
  --lua-filter=center-figures.lua \
  -V documentclass=article -V papersize=letter \
  -V geometry:margin=1in -V fontsize=11pt \
  -V mainfont="TeX Gyre Pagella" -V colorlinks=true \
  -V linkcolor=blue -V urlcolor=blue \
  -V title="Educational Computers in Germany in the 1980s" \
  -V subtitle="The Busch Microtronic, the Kosmos CP1, and the Philips MasterLab" \
  -V author="Michael Wessel — translated and edited by Claude (Opus 4.8)" \
  -V date="2026" -V abstract="$ABSTRACT" \
  -H latex-header.tex \
  -o educational-computers-in-germany-in-the-1980s.tex

for n in 1 2 3; do
  xelatex -interaction=nonstopmode educational-computers-in-germany-in-the-1980s.tex
done
```

Notes:
- No table of contents (the article opens with the abstract instead).
- The three XeLaTeX passes are required for correct `longtable` alignment.
- Requires a TeX Live installation with XeLaTeX and the TeX Gyre fonts.
