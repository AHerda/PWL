% ==== utils ====
% Długość Listy
len([], 0).
len([_ | L], N) :-
	len(L, N1),
	N = N1 + 1.

% Zliczba ilość elementów między dwoma wystąpieniami elementu X
liczba_elementow_miedzy(X, L, N) :-
	append(_, [X | L1], L),
	append(L2, [X | _], L1),
	len(L2, N).

% Sprawdza czy liczba elementów między dwoma wystąpieniami elementu X jest parzysta
parzysta_liczba_miedzy(_, []).
parzysta_liczba_miedzy(X, L) :-
    liczba_elementow_miedzy(X, L, N),
    N mod 2 =:= 0.

% Dla każdej liczby parzystej od 1 do N sprawdza czy występuje parzysta liczba elementów między dwoma wystąpieniami
dla_kazdego_parzysta_liczba_pomiedzy(0, _).
dla_kazdego_parzysta_liczba_pomiedzy(N, X) :-
	N > 0,
	parzysta_liczba_miedzy(N, X),
	N1 = N - 1,
	dla_kazdego_parzysta_liczba_pomiedzy(N1, X).

% ==== main ====
lista(N, X) :-
	len(X, 2 * N),
	dla_kazdego_parzysta_liczba_pomiedzy(N, X).
