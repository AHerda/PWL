:- use_module(library(clpfd)).

plecak(Wartosci, Wielkosci, Pojemonosc, Zmienne) :-
    length(Wartosci, N),
    length(Wielkosci, N),
    length(Zmienne, N),
    Zmienne ins 0..1,
    scalar_product(Wielkosci, Zmienne, #=<, Pojemonosc),
    scalar_product(Wartosci, Zmienne, #=, Cel),
    once(labeling([max(Cel)], Zmienne)).
