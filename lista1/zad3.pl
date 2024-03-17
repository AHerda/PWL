has_factor(N, F) :-
	(F > 1, F < N, N mod F =:= 0) ;
	(F * F < N, F1 = F + 1, has_factor(N, F1)).

is_prime(X) :- X > 1, \+ has_factor(X, 2).

prime(LO, HI, N) :-
	between(LO, HI, N),
	is_prime(N).
