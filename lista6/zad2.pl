:- consult("zad1.pl").
:- consult("interpreter.pl").

wykonaj(NazwaPliku) :-
    grammarize_file(NazwaPliku, Program),
    interpreter(Program).
