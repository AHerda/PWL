lista(N, X) :-
    M is N * 2,
    length(X, M),
    iter(N, X).

iter(1, X) :-
    check(1, X).
iter(N, X) :-
    M is N - 1,
    check(N, X),
    iter(M, X).

check(N, L) :-
    nth0(Ind1, L, N),
    nth0(Ind2, L, N),
    Ind1 < Ind2,
    Min is N - 1,
    Max is 2 * Min,
    between(Min, Max, Ind1),
    (Ind2 - Ind1) mod 2 =:= 1.
