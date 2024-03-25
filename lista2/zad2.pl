jednokrotnie(X, L) :-
	member(X, L),
	select(X, L, L1),
	\+ member(X, L1).

dwukrotnie_not_unique(X, L) :-
	member(X, L),
	select(X, L, L1),
	jednokrotnie(X, L1).

dwukrotnie(X, L) :-
	setof(X, dwukrotnie_not_unique(X, L), Solutions),
	member(X, Solutions).
