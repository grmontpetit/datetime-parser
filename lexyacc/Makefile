datetime.tab.c datetime.tab.h: datetime.y
	bison -d datetime.y

lex.yy.c: datetime.l datetime.tab.h
	flex datetime.l

datetime: lex.yy.c datetime.tab.c datetime.tab.h
	g++ datetime.tab.c lex.yy.c -lfl -o datetime.out
