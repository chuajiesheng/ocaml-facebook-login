SRC=$(wildcard *.ml)
TARGETS=$(SRC:.ml=.js)
REQS=$(SRC:.ml=.js)
LIB=-package js_of_ocaml -package js_of_ocaml.syntax -package lwt -package ocaml-facebook-login
SYNTAX=-syntax camlp4o
OCAMLLFLAGS=

all: $(TARGETS) $(REQS)

%.byte: %.ml
	ocamlfind ocamlc -annot -linkpkg $(LIB) $(SYNTAX) -o $@ $^

%.js: %.byte
	js_of_ocaml $^ -pretty

clean:
	rm -f *.cm[ioax] *.cmxa *.cmxs *.o *.a *.annot *.js
	rm -f *.type_mli
