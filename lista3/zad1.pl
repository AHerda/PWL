wariancja(L, D) :-
	length(L, N),
	sum_list(L, Sum),
	Avg = Sum / N,
	maplist(difference(Avg), L, DiffList),
	maplist(square, DiffList, SquaredList),
	sum_list(SquaredList, SumSquared),
	D = SumSquared / N.

difference(A, B, Diff) :-
	Diff = B - A.

square(X, XSquared) :-
	XSquared = X * X.
