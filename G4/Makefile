G4: G4.l G4.y
	bison -d G4.y
	flex G4.l
	cc -o G4 G4.tab.c lex.yy.c -lfl
