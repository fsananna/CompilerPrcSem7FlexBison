all: hdCalc

hdCalc: hdCalc.y hdCalc.l
	bison -d hdCalc.y
	flex hdCalc.l
	gcc -o hdCalc hdCalc.tab.c lex.yy.c -lfl

clean:
	rm -f hdCalc hdCalc.tab.c hdCalc.tab.h lex.yy.c
