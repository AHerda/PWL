% ==== utils ====
len([], 0).
len([_ | L], N) :-
	len(L, N1),
	N = N1 + 1.

% ==== main ====
srodkowy(L, X) :-
	member(X, L),
	append(L1, [X | L2], L),
	len(L1, N),
	len(L2, N).
