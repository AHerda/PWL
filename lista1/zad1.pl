ojciec(X, Y). 		/* X jest ojcem Y */
matka(X, Y). 		/* X jest matką Y */
mezczyzna(X). 		/* X jest mężczyzną */
kobieta(X). 			/* X jest kobietą */
rodzic(X, Y). 		/* X jest rodzicem Y */
diff(X, Y). 			/* X i Y są różne */

jest_matka(X) :- matka(X, _).
jest_ojcem(X) :- ojciec(X, _).
jest_synem(X) :- mezczyzna(X), rodzic(_, X).
siostra(X, Y) :- kobieta(X), rodzic(Z, X), rodzic(Z, Y), X \= Y.
dziadek(X, Y) :- ojciec(X, Z), rodzic(Z, Y).
rodzenstwo(X, Y) :- rodzic(Z, X), rodzic(Z, Y), X \= Y.
