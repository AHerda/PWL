lista(0, []).
lista(N, X):-
    lista(N, X, 1, numlist(1, min(N, 2))).

lista(N, X, Teraz, []) :-
    X1 = X
    append(X1, [Teraz], X).
lista(N, X, Teraz, Następny) :-
    X1 = X
    append(X1, [Teraz], X),
