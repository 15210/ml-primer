# - The -I flag introduces sub-directories
# - -use-ocamlfind is required to find packages (from Opam)
# - _tags file introduces packages, bin_annot flag for tool chain

OCB_FLAGS = -use-ocamlfind -package core
OCB = ocamlbuild $(OCB_FLAGS)

DEPEND = \
  Sequence.ml seq.ml

all: $(DEPEND) 
	$(OCB) Sequence.native

seq: $(DEPEND) all
	$(OCB) seq.native
