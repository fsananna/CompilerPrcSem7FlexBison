all: hdCalc

hdCalc: hdCalc.y hdCalc.l
	bison -d hdCalc.y    # Generate hdCalc.tab.c and hdCalc.tab.h
	flex hdCalc.l        # Generate lex.yy.c (scanner)
	gcc -o hdCalc hdCalc.tab.c lex.yy.c -lfl  # Compile everything

clean:
	rm -f hdCalc hdCalc.tab.c hdCalc.tab.h lex.yy.c
