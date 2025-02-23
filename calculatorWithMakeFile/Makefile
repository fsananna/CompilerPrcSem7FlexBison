fb: fb.l fb.y
	bison -d fb.y
	flex fb.l
	gcc -o fb fb.tab.c lex.yy.c -lfl

clean:
	rm -f fb fb.tab.c fb.tab.h lex.yy.c
