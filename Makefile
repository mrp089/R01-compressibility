# Makefile for grant components. Compiles individual sections or the whole grant.
#
# To reuse for the next grant, edit only the CONFIG block below:
#   - set GRANT and NAME (filenames are <GRANT>_<NAME>_<Section>.tex)
#   - list documents that cite the bibliography in BIB_DOCS
#   - list documents without citations in PLAIN_DOCS
#   - point COMMON_DEPS / BIB_DEPS at the shared files
# Then `make Aims` builds R01_Compressibility_Aims.pdf, and `make` builds everything.

# ---------------------------------------------------------------- CONFIG ----

# Filename prefix: grant mechanism and project name (e.g. R01 + Compressibility -> R01_Compressibility_Aims.tex)
GRANT = R01
NAME  = Compressibility

# Sections that cite the bibliography (get a bibtex pass)
BIB_DOCS   = Research

# Sections without citations
PLAIN_DOCS = Summary Narrative Leadership Facilities Equipment Budget Data Vertebrate Human Authentication

# Files shared by every document (rebuild when these change)
COMMON_DEPS = definitions.sty abbreviations.tex

# Extra files the bibliography needs
BIB_DEPS    = martin_highlighted.bib new_references.bib mrp.bst

# ------------------------------------------------------------- MACHINERY ----

PDFLATEX = pdflatex -interaction=nonstopmode -halt-on-error
BIBTEX   = bibtex

# Filename prefix built from the grant mechanism and project name
PREFIX = $(GRANT)_$(NAME)

ALL_DOCS = $(BIB_DOCS) $(PLAIN_DOCS)
ALL_PDFS = $(addprefix $(PREFIX)_,$(addsuffix .pdf,$(ALL_DOCS)))

# Date suffix for the `dated` target (format: YYYYMMDD)
DATE = $(shell date +%Y%m%d)

.PHONY: all dated clean distclean $(ALL_DOCS)

all: $(ALL_PDFS)

# Convenience aliases: `make Aims` -> $(PREFIX)_Aims.pdf
$(ALL_DOCS): %: $(PREFIX)_%.pdf

# Sections with bibliography: pdflatex -> bibtex -> pdflatex -> pdflatex
$(addprefix $(PREFIX)_,$(addsuffix .pdf,$(BIB_DOCS))): $(PREFIX)_%.pdf: $(PREFIX)_%.tex $(COMMON_DEPS) $(BIB_DEPS)
	$(PDFLATEX) $<
	$(BIBTEX) $(PREFIX)_$*
	$(PDFLATEX) $<
	$(PDFLATEX) $<

# Sections without bibliography: pdflatex -> pdflatex (resolve cross-references)
$(addprefix $(PREFIX)_,$(addsuffix .pdf,$(PLAIN_DOCS))): $(PREFIX)_%.pdf: $(PREFIX)_%.tex $(COMMON_DEPS)
	$(PDFLATEX) $<
	$(PDFLATEX) $<

# Build everything and copy each PDF to <name>_YYYYMMDD.pdf
dated: $(ALL_PDFS)
	@for pdf in $(ALL_PDFS); do \
		cp $$pdf $${pdf%.pdf}_$(DATE).pdf; \
		echo "wrote $${pdf%.pdf}_$(DATE).pdf"; \
	done

clean:
	rm -f *.aux *.log *.out *.bbl *.blg *.bcf *.run.xml *.toc *.fls *.fdb_latexmk *.synctex.gz *.dvi

distclean: clean
	rm -f $(ALL_PDFS) *_[0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9].pdf
