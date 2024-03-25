arc(a, b).
arc(b, a).
arc(b, c).
arc(c, d).

osiagalny(X, Y, Odwiedzone) :-
	(
		(arc(X, Y), \+ member(Y, Odwiedzone)) ;
		(arc(X, Z), \+ member(Z, Odwiedzone), osiagalny(Z, Y, [Z | Odwiedzone]))
	).

osiagalny(X, Y) :-
	X = Y ;
	osiagalny(X, Y, [X]).
