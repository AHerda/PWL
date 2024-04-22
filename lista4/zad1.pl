wyrazenie([X], X, X).
wyrazenie(L, W, E) :-
	append(L1, L2, L),
	L1 \= [],
	L2 \= [],
	wyrazenie(L1, W1, E1),
	wyrazenie(L2, W2, E2),
	(E = E1 + E2, W is W1 + W2;
	E = E1 - E2, W is W1 - W2;
	E = E1 * E2, W is W1 * W2;
	E2 =\= 0, E = E1 / E2, W is W1 / W2).
