zapalki(K, D, S, M) :-
	licz_male(M, Lista1),
	licz_srednie(Lista1, S, Lista2),
	licz_duze(Lista2, D, Lista),
	length(Lista, Len),
	K = 24 - Len,
	write("Rozwiązanie:\n"),
	draw_matches(Lista).

licz_male(M, End) :-
	(
		(Lista1 = [1, 4, 5, 8], M1 = 1)
	;	(Lista1 = [], M1 = 0)
	),
	(
		(union(Lista1, [2, 5, 6, 9], Lista2), M2 = M1 + 1)
	;	(Lista2 = Lista1, M2 = M1)
	),
	(
		(union(Lista2, [3, 6, 7, 10], Lista3), M3 = M2 + 1)
	;	(Lista3 = Lista2, M3 = M2)
	),
	(
		(union(Lista3, [8, 11, 12, 15], Lista4), M4 = M3 + 1)
	;	(Lista4 = Lista3, M4 = M3)
	),
	(
		(union(Lista4, [9, 12, 13, 16], Lista5), M5 = M4 + 1)
	;	(Lista5 = Lista4, M5 = M4)
	),
	(
		(union(Lista5, [10, 13, 14, 17], Lista6), M6 = M5 + 1)
	;	(Lista6 = Lista5, M6 = M5)
	),
	(
		(union(Lista6, [15, 18, 19, 22], Lista7), M7 = M6 + 1)
	;	(Lista7 = Lista6, M7 = M6)
	),
	(
		(union(Lista7, [16, 19, 20, 23], Lista8), M8 = M7 + 1)
	;	(Lista8 = Lista7, M8 = M7)
	),
	(
		(union(Lista8, [17, 20, 21, 24], End), M = M8 + 1)
	;	(End = Lista8, M = M8)
	).

licz_srednie(Start, S, End) :-
	(
		(union(Start, [1, 2, 4, 6, 11, 13, 15, 16], Lista1), S1 = 1)
	;	(Lista1 = Start, S1 = 0)
	),
	(
		(union(Lista1, [2, 3, 5, 7, 12, 14, 16, 17], Lista2), S2 = S1 + 1)
	;	(Lista2 = Lista1, S2 = S1)
	),
	(
		(union(Lista2, [8, 9, 11, 13, 18, 20, 22, 23], Lista3), S3 = S2 + 1)
	;	(Lista3 = Lista2, S3 = S2)
	),
	(
		(union(Lista3, [9, 10, 12, 14, 19, 21, 23, 24], End), S = S3 + 1)
	;	(End = Lista3, S = S3)
	).

licz_duze(Start, D, End) :-
	(
		(union(Start, [1, 2, 3, 4, 7, 11, 14, 18, 21, 22, 23, 24], End), D = 1)
	;	(End = Start, D = 0)
	).


draw_matches(K) :-
    (member(1, K) -> write("+---+") ; write("+   +")),
    (member(2, K) -> write("---+") ; write("   +")),
    (member(3, K) -> write("---+\n") ; write("   +\n")),
    (member(4, K) -> write("|   ") ; write("    ")),
    (member(5, K) -> write("|   ") ; write("    ")),
    (member(6, K) -> write("|   ") ; write("    ")),
    (member(7, K) -> write("|\n") ; write(" \n")),
    (member(8, K) -> write("+---+") ; write("+   +")),
    (member(9, K) -> write("---+") ; write("   +")),
    (member(10, K) -> write("---+\n") ; write("   +\n")),
    (member(11, K) -> write("|   ") ; write("    ")),
    (member(12, K) -> write("|   ") ; write("    ")),
    (member(13, K) -> write("|   ") ; write("    ")),
    (member(14, K) -> write("|\n") ; write(" \n")),
    (member(15, K) -> write("+---+") ; write("+   +")),
    (member(16, K) -> write("---+") ; write("   +")),
    (member(17, K) -> write("---+\n") ; write("   +\n")),
    (member(18, K) -> write("|   ") ; write("    ")),
    (member(19, K) -> write("|   ") ; write("    ")),
    (member(20, K) -> write("|   ") ; write("    ")),
    (member(21, K) -> write("|\n") ; write(" \n")),
    (member(22, K) -> write("+---+") ; write("+   +")),
    (member(23, K) -> write("---+") ; write("   +")),
    (member(24, K) -> write("---+\n") ; write("   +\n")).
