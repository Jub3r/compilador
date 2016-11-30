SOURCE=lenguaje.lex
all: a.out
lex.yy.c: $(SOURCE) parser.tab.h parser.tab.c
	    flex $(SOURCE)
# bison
parser.tab.c: parser.y
	bison -v -d parser.y
lex.yy.o: lex.yy.c
	gcc -c lex.yy.c
a.out: parser.tab.c lex.yy.o
	gcc parser.tab.c lex.yy.o -lfl -lm
run: a.out
	./a.out
clean:
	rm a.out lex.yy.c parser.tab.* parser.output
# genera nombre.tab.h que habra que hacer include
# mirar nombre.output
# 
# gcc -c lex.yy.c
# nombre.tab.c lex.yy.o -lfl -lm