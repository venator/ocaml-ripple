CC=ocamlbuild
OPTS=-use-ocamlfind
TARGETS=test_ripple.ml

.PHONY: all native byte debug profiling clean

all: native

native:    $(TARGETS:.ml=.native)
byte:      $(TARGETS:.ml=.byte)
debug:     $(TARGETS:.ml=.d.byte)
profiling: $(TARGETS:.ml=.p.native)

%.native %.byte %.d.byte %.p.native: %.ml
	$(CC) $(OPTS) $@

clean:
	$(CC) -clean
