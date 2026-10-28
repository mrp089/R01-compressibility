# R01 — Myocardial Volume Dynamics (Pfaller / Stendahl)

LaTeX sources for a regular NIH R01 (parent R01, 5-year project period, multiple-PI).
Set up the same way as `R01-aneurysm-grafts`: one standalone document per
NIH attachment, one shared preamble, one Makefile.

## Layout

| File | NIH attachment | Limit |
| --- | --- | --- |
| `R01_Compressibility_Research.tex` | Specific Aims (1 page) followed by the Research Strategy (Significance / Innovation / Approach) | 1 + 12 pages |
| `R01_Compressibility_Summary.tex` | Project Summary / Abstract | 30 lines |
| `R01_Compressibility_Narrative.tex` | Project Narrative | 3 sentences |
| `R01_Compressibility_Leadership.tex` | Multiple PD/PI Leadership Plan (Pfaller, Stendahl) | none |
| `R01_Compressibility_Facilities.tex` | Facilities & Other Resources | none |
| `R01_Compressibility_Equipment.tex` | Equipment | none |
| `R01_Compressibility_Budget.tex` | Budget Justification (personnel, consortium, additional) | none |
| `R01_Compressibility_Data.tex` | Data Management & Sharing Plan | 2 pages |
| `R01_Compressibility_Vertebrate.tex` | Vertebrate Animals (dogs) | none |
| `R01_Compressibility_Human.tex` | Protection of Human Subjects (patients; donor hearts) | none |
| `R01_Compressibility_Authentication.tex` | Authentication of Key Biological/Chemical Resources | 1 page |

The Bibliography & References Cited attachment is printed at the end of
`R01_Compressibility_Research.pdf`; extract those trailing pages at submission time.
Only the Specific Aims page exists so far; the Research Strategy follows after the
`\clearpage`. Every other attachment is a stub with `[bracketed placeholders]`.

Shared files: `definitions.sty` (fonts, geometry, section styling, reviewer tags
`\john{}` and `\martin{}`), `abbreviations.tex` (acronyms, used as `\gls*{aaa}`),
`martin_highlighted.bib` (copy of the Zotero export `My Library.bib`, PI bolded via
`\boldname`), `new_references.bib` (entries not yet in the library; import the DOIs
into Zotero and drop them here once the export carries them), `mrp.bst` (citation style).

Working notes: `R01_compressibility_brainstorm.md` (framing, 2026-10-27),
`aims_literature_fact_sheet.md` (verified numbers behind the aims page),
`specific_aims_gene_log.md` (Gene review rounds of the aims page).

## Building

```
make              # build every attachment
make Research     # build one, by section name
make dated        # build all, then copy each to <name>_YYYYMMDD.pdf
make clean        # remove LaTeX aux files
make distclean    # also remove built PDFs
```

The `CONFIG` block at the top of the `Makefile` is the only part to edit when
reusing this setup: `GRANT`, `PI`, and the `BIB_DOCS` / `PLAIN_DOCS` lists.

## Conventions

- Filenames are `<GRANT>_<PI>_<Section>.tex`; the Makefile derives targets
  from that pattern.
- Acronyms are declared in `abbreviations.tex` and used as `\gls*{aaa}`.
- Shorthands: `\invivo`, `\invitro`, `\exvivo`, `\insilico`, `\fsi`, `\sv`,
  `\od`, `\su`; emphasis helpers `\bfit`, `\ulit`, `\bfulit`; `\note{XX}` marks a
  number still to be supplied.
- Every stub carries `[bracketed placeholders]`. Grep for `[` before
  submitting to confirm none survive.
