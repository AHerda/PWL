:- use_module(library(clpfd)).

odcinek(Lista) :-
    length(Lista, 16),
    Lista ins 0..1,
    Wewnetrzna = [1, 1, 1, 1, 1, 1, 1, 1],
    append(Wewnetrzna, _, T),
    append(_, T, Lista),
    sum(Lista, #=, 8).              % tylko 8 jedynek w liscie
                                    % po usunięciu będzie ciąg conajmniej 8 jedynek z innymi jedynkami


to_number([X15,X14,X13,X12,X11,X10,X9,X8,X7,X6,X5,X4,X3,X2,X1,X0], Value):-
    Value #= 32768 * X15 + 16384 * X14 + 8192 * X13 + 4096 * X12 + 2048 * X11 + 1024 * X10 + 512 * X9 + 256 * X8 + 128 * X7 + 64 * X6 + 32 * X5 + 16 * X4 + 8 * X3 + 4 * X2 + 2 * X1 + X0.

to_number2(Lista, Value):-
    length(Lista, 16),
    to_number_temp(Lista, 0, 1, 0, Value).

to_number_temp(_, 16, _, Acc, Acc).
to_number_temp(Lista, Ind, Pow, Acc, Value) :-
    nth0(Ind, Lista, Elem),
    Ind1 #= Ind + 1,
    Pow1 #= Pow * 2,
    Acc1 #= Acc + Elem * Pow,
    to_number_temp(Lista, Ind1, Pow1, Acc1, Value).

odcinek2(Lista) :-
    length(Lista, 16),
    Lista ins 0..1,
    sum(Lista, #=, 8),
    to_number2(Lista, Value),
    popcount(Value) #= 8,
    msb(Value) - lsb(Value) #= 7.

odcinek3(X):-
    length(X,16),
    length(X1,8),
    X ins 0..1,
    sum(X, #=, 8),
    append(X1,X2,X),
    chain(X1, #=<),
    chain(X2, #>=).
