llvm_lexer.ml: parser llvm_lexer.mll
	ocamllex llvm_lexer.mll


parser: llvm_parser.mly
	menhir llvm_parser.mly


clean:
	rm -f *~
	rm -f *.cmo
	rm -f *.cmi
	rm -f *.cmx
	rm -f *.o
