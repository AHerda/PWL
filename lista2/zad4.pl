lista(N, X) :-
    M is N * 2,
    length(X, M),
    pom(N, X).

pom(1, X) :-
    sprawdz(1, X).
pom(N, X) :-
    sprawdz(N, X),
    M is N - 1,
    pom(M, X).

sprawdz(N, L) :-
    nth0(I1, L, N),
    nth0(I2, L, N),
    I1 < I2,
    (I2 - I1) mod 2 =:= 1,
    Min is N - 1,
    Max is 2 * Min,
    between(Min, Max, I1).
