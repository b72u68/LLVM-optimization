ml_lexer.ml: parser ml_lexer.mll
	ocamllex ml_lexer.mll

parser: ml_parser.mly
	menhir ml_parser.mly

clean:
	rm -f *~
	rm -f *.cmo *.cmi *.cmx *.o
	rm -f $(BINS)
