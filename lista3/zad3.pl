count_inversions([], 0).
count_inversions([H|T], Count) :-
    findall(X, (member(X, T), X < H), L),
    length(L, C),
    count_inversions(T, C1),
    Count = C + C1.

even_permutation(Xs, Ys) :-
	permutation(Xs, Ys),
	count_inversions(Ys, C),
	C mod 2 =:= 0.


odd_permutation(Xs, Ys) :-
	permutation(Xs, Ys),
	count_inversions(Ys, C),
	C mod 2 =:= 1.
