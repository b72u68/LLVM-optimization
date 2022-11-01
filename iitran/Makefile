iit_lexer.ml: parser iit_lexer.mll
	ocamllex iit_lexer.mll


parser: iit_parser.mly
	menhir iit_parser.mly


clean:
	rm -f *~
	rm -f *.cmo
	rm -f *.cmi
	rm -f *.cmx
	rm -f *.o
	rm -f $(BINS)
	rm -f parser.ml
