po_lewej(L1, L2, [L1, L2|_]).
po_lewej(L1, L2, [_|T]) :- po_lewej(L1, L2, T).

obok(L1, L2, L) :-
	po_lewej(L1, L2, L);
	po_lewej(L2, L1, L).

rybki(Kto) :-
	Domy = [[1, _, norweg, _, _, _], [2, niebieski, _, _, _, _], [3, _, _, _, mleko, _], [4, _, _, _, _, _], [5, _, _, _, _, _]],
	member([_, czerwony, anglik, _, _, _], Domy),
	po_lewej([_, zielony, _, _, _, _], [_, bialy, _, _, _, _], Domy),
	member([_, _, dunczyk, _, herbata, _], Domy),
	obok([_, _, _, _, _, light], [_, _, _, koty, _, _], Domy),
	member([_, zolty, _, _, _, cygaro], Domy),
	member([_, _, niemiec, _, _, fajka], Domy),
	obok([_, _, _, _, _, light], [_, _, _, _, woda, _], Domy),
	member([_, _, _, ptaki, _, bez_filtra], Domy),
	member([_, _, szwed, psy, _, _], Domy),
	obok([_, _, _, konie, _, _], [_, zolty, _, _, _, _], Domy),
	member([_, _, _, _, piwo, mentolowe], Domy),
	member([_, zielony, _, _, kawa, _], Domy),
	member([_, _, Kto, rybki, _, _], Domy).
