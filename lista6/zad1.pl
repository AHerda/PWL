:- consult("../lista5/zad1.pl").

% Skrót do szybkiego wypisywanbia wyniku

grammarize_file(Path, Program) :-
    tokenize_file(Path, Tokenized), phrase(program(Program), Tokenized).

% Gramtyka

program([Instrukcja | Program]) -->
    instrukcja(Instrukcja),
    [sep(;)],
    !,
    program(Program).
program([]) --> [].

instrukcja(assign(Id, Wyrazenie)) -->
    [id(Id)],
    [sep(:=)],
    wyrazenie(Wyrazenie).
instrukcja(read(Id)) -->
    [key(read)],
    [id(Id)].
instrukcja(write(Wyrazenie)) -->
    [key(write)],
    wyrazenie(Wyrazenie).
instrukcja(if(Warunek, Program)) -->
    [key(if)],
    warunek(Warunek),
    [key(then)],
    program(Program),
    [key(fi)].
instrukcja(if(Warunek, Program1, Program2)) -->
    [key(if)],
    warunek(Warunek),
    [key(then)],
    program(Program1),
    [key(else)],
    program(Program2),
    [key(fi)].
instrukcja(while(Warunek, Program)) -->
    [key(while)],
    warunek(Warunek),
    [key(do)],
    program(Program),
    [key(od)].

wyrazenie(Skladnik + Wyrazenie) -->
    skladnik(Skladnik),
    [sep(+)],
    wyrazenie(Wyrazenie).
wyrazenie(Skladnik - Wyrazenie) -->
    skladnik(Skladnik),
    [sep(-)],
    wyrazenie(Wyrazenie).
wyrazenie(Skladnik) -->
    skladnik(Skladnik).

skladnik(Czynnik * Skladnik) -->
    czynnik(Czynnik),
    [sep(*)],
    skladnik(Skladnik).
skladnik(Czynnik / Skladnik) -->
    czynnik(Czynnik),
    [sep(/)],
    skladnik(Skladnik).
skladnik(Czynnik mod Skladnik) -->
    czynnik(Czynnik),
    [key(mod)],
    skladnik(Skladnik).
skladnik(Czynnik) -->
    czynnik(Czynnik).

czynnik(id(Id)) -->
    [id(Id)].
czynnik(int(Int)) -->
    [int(Int)].
czynnik((Wyrazenie)) -->
    [sep('(')],
    wyrazenie(Wyrazenie),
    [sep(')')].

warunek((Koniunkcja ; Warunek)) -->
    koniunkcja(Koniunkcja),
    [key(or)],
    warunek(Warunek).
warunek(Koniunkcja) -->
    koniunkcja(Koniunkcja).

koniunkcja((Prosty , Koniunkcja)) -->
    prosty(Prosty),
    [key(and)],
    koniunkcja(Koniunkcja).
koniunkcja(Prosty) -->
    prosty(Prosty).

prosty(Wyrazenie1 =:= Wyrazenie2) -->
    wyrazenie(Wyrazenie1),
    [sep(=)],
    wyrazenie(Wyrazenie2).
prosty(Wyrazenie1 =\= Wyrazenie2) -->
    wyrazenie(Wyrazenie1),
    [sep(/=)],
    wyrazenie(Wyrazenie2).
prosty(Wyrazenie1 < Wyrazenie2) -->
    wyrazenie(Wyrazenie1),
    [sep(<)],
    wyrazenie(Wyrazenie2).
prosty(Wyrazenie1 > Wyrazenie2) -->
    wyrazenie(Wyrazenie1),
    [sep(>)],
    wyrazenie(Wyrazenie2).
prosty(Wyrazenie1 =< Wyrazenie2) -->
    wyrazenie(Wyrazenie1),
    [sep(=<)],
    wyrazenie(Wyrazenie2).
prosty(Wyrazenie1 >= Wyrazenie2) -->
    wyrazenie(Wyrazenie1),
    [sep(>=)],
    wyrazenie(Wyrazenie2).
prosty((Warunek)) -->
    [sep('(')],
    warunek(Warunek),
    [sep(')')].
