flex Parser.l
g++ -g -c lex.yy.c -o lex.yy.o
g++ -g lex.yy.o -o exe -ll