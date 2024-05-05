% Główny predykat
board(L) :-
	length(L, N),
	draw(L, 1, N).

% Rysowanie planszy - Koniec planszy
draw(_, X, N) :-
	X > N,
	draw_dashed(N),
	nl,
	!.

% Rysowanie planszy - Główna pętla rysująca wiersze
draw(L, X, N) :-
	draw_dashed(N),
	Y is N - X + 1,
	draw_line(1, Y, L, N),
	draw_line(1, Y, L, N),
	X1 is X + 1,
	draw(L, X1, N),
	!.

% Rysowanie wiersz planszy

% Środkowa część wiersza
% Koniec wiersza
draw_line(X, _, _, N) :-
	N + 1 =:= X,
	write('|'),
	nl,
	!.

% Środkowa część wiersza - Hetman
draw_line(X, K, L, N) :-
	nth1(X, L, K),
	(
		(
			(X mod 2 =:= 0, K mod 2 =:= 1)
		;	(X mod 2 =:= 1, K mod 2 =:= 0)
		)->
		write('|:###:')
	;	write('| ### ')
	),
	X1 is X + 1,
	draw_line(X1, K, L, N),
	!.

% Środkowa część wiersza - Puste pole
draw_line(X, K, L, N) :-
	(
		(
			(X mod 2 =:= 0, K mod 2 =:= 1)
		;	(X mod 2 =:= 1, K mod 2 =:= 0)
		)->
		write('|:::::')
	;	write('|     ')
	),
	X1 is X + 1,
	draw_line(X1, K, L, N),
	!.

% Górne/Dolne ograniczenie wiersz planszy
% Koniec wiersza
draw_dashed(0) :-
	write('+'),
	nl,
	!.
% Środkowa część wiersza
draw_dashed(N) :-
	write('+-----'),
	R is N - 1,
	draw_dashed(R).

main(X) :-
	queens(X, P),
	board(P).


% kod na hetmany z listy 4
dobra(X) :-
    \+ zla(X).
% z≥a(X) zachodzi, gdy wsród hetmanów ustawionych
% zgodnie z permutacjπ X sπ dwa które siÍ bijπ
zla(X) :-
    append(_, [Wi | L1], X),
    append(L2, [Wj | _], L1),
    length(L2, K),
    abs(Wi - Wj) =:= K + 1.
% abs(Wi - Wj) = odleg≥oúÊ hetmanów w pionie
% K + 1 = odleg≥oúÊ hetmanów w poziomie

queens(N, P) :-
	between(1, 100, N),
    numlist(1, N, L), % stworzenie listy liczb 1 .. N
    permutation(L, P),
    dobra(P).
