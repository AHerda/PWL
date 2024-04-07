max_sum(L, S) :-
	max_sum(L, 0, 0, S).

max_sum([], _, Max, Max).
max_sum([H|T], CurrentSum, Max, S) :-
	NewSum = max(H, CurrentSum + H),
	NewMax = max(Max, NewSum),
	max_sum(T, NewSum, NewMax, S).
