######################################################################
#
#   Makefile for writing projects
#   =============================
#
#   This file controls how the different document types
#   are rendered by pandoc, as well as some other things.
#
#
#   Project configuration (edit this)
#   ---------------------------------
#
#   Put your desired output file name (part before the dot)
  FILENAME = index
#
#   List the markdown files in order or use `*.md` to read them
#   in the order of file name
  INPUT_FILES = *.md
#
#   List the types of output you want, e.g pdf docx odt epub html5 ...
  FILETYPES = html
#
#   Formats for slides, enable one to generate a slideshow
  REVEALJS = 1
#
#   Slides theme
  SLIDETHEME = league
#
#   List the filters you need from the `lib` folder
  FILTERS = includes
#
#   Put in the name of the file where you want your references
#   stored. Leave empty or comment out if you don't need references.
  #REF_FILE = ref.bib
#
#   Title to use for the reference section title. Has no effect unless
#   you also have a reference file
  #REF_HDR = References
#
#   Citation style to use, this should be a csl file.
#   Have a look at https://zotero.org/styles for thousands of options.
#   Chicago style will be used by default if you leave it empty.
  CSL_FILE =
#
#   URL of your reference collection.
#   Right click on a collection in zotero (e.g. My Library)
#   and choose `BibLatex url`, then paste here.
  REF_URL = http://localhost:23119/better-bibtex/library?library.biblatex
#
#
#   Output formatting
#   -----------------
#
#   Nesting depth in the table of contents, comment out to disable
  #TOC_DEPTH = 2
#
#   Convert `--` to en-dash, `---` to em-dash and `...` to ellipsis
  SMART_TYPOGRAPHY = 1
#
#   Section numbering, if this is enabled, you can disable for
#   individual headers by appending `{-}`
# SECTION_NUMBERS = 1
#
#
#   The nitty gritty
#   ----------------
#
#   Don't mess with the stuff below unless you know what you
#   are doing and are prepared to mess stuff up.
#
#######################################################################


SRC_DIR = src
BIN_DIR = bin

PANDOC_OPTS_IN =
PANDOC_OPTS_OUT = -s --css=rendering/style.css

COPY_LIBS =

ifdef SMART_TYPOGRAPHY
  PANDOC_OPTS_IN += -S
endif

ifdef TOC_DEPTH
  PANDOC_OPTS_OUT += --toc --toc-depth=$(TOC_DEPTH)
endif

ifdef SECTION_NUMBERS
  PANDOC_OPTS_OUT += --number-sections
endif

ifdef REF_FILE
  PANDOC_OPTS_OUT += --bibliography=../$(REF_FILE)
  ifdef REF_HDR
    REF_HDR_FILE = $(BIN_DIR)/ref_hdr
    REF_HDR_REL = ../$(REF_HDR_FILE)
  endif
endif

ifdef CSL_FILE
  PANDOC_OPTS_OUT += --csl=../$(CSL_FILE)
endif

ifdef REVEALJS
  PANDOC_OPTS_OUT += -t revealjs
  COPY_LIBS += reveal.js d3 rendering
  ifdef SLIDETHEME
	PANDOC_OPTS_OUT += --css=reveal.js/css/theme/$(SLIDETHEME).css
  endif
endif

PANDOC_FILTERS = $(foreach f,$(FILTERS),| ../lib/$(f) )

.PHONY: all references $(REF_HDR_FILE) $(COPY_LIBS) clean-ref clean

all: $(FILETYPES)

$(FILETYPES): $(REF_FILE) $(REF_HDR_FILE) $(COPY_LIBS)
	mkdir -p $(BIN_DIR)
	cd $(SRC_DIR); \
	pandoc $(PANDOC_OPTS_IN) $(INPUT_FILES) $(REF_HDR_REL) ../doc.yaml -t json\
		$(PANDOC_FILTERS)\
		| pandoc $(PANDOC_OPTS_OUT) -f json -o ../$(BIN_DIR)/$(FILENAME).$@

$(REF_FILE):
	curl $(REF_URL) > $(REF_FILE)

$(REF_HDR_FILE):
	mkdir -p $(BIN_DIR)
	echo "# $(REF_HDR)" > $(REF_HDR_FILE)

$(COPY_LIBS):
	mkdir -p $(BIN_DIR)
	cp -r lib/$@ bin/

references: clean-ref $(REF_FILE)

clean-ref:
ifdef REF_FILE
	rm -f $(REF_FILE)
endif

clean:
	rm -rf $(BIN_DIR)

