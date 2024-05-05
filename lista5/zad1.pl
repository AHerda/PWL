% Tokens
tokens(['read', 'write', 'if', 'then', 'else', 'fi', 'while', 'do', 'od', 'and', 'or', 'mod']).
separators([';', '+', '-', '*', '/', '(', ')', '<', '>', '=<', '>=', ':=', '=', '/=']).

% Shortcut for scanning file from path and writing tokens to stdout
scan_file(Path) :- open(Path, read, X), scanner(X, Y), close(X), write(Y).

% Main predicate
scanner(Stream, Tokens) :-
	get_char(Stream, Char),
	scanner(Stream, Char, Tokens).

% Base case: end of stream
scanner(_, end_of_file, []) :- !.

% Case: whitespace
scanner(Stream, Char, Tokens) :-
	char_type(Char, space), !,
	get_char(Stream, NextChar),
	scanner(Stream, NextChar, Tokens).

% Case: letter
scanner(Stream, Char, [Token|Tokens]) :-
	char_type(Char, alpha), !,
	read_word(Stream, Char, Word),
	(
		tokens(Keywords), member(Word, Keywords)
	->  Token = key(Word)
	;   (
		check_uppercase(Word)
		->  Token = id(Word)
		;	Token = error_letter(Word)
		)
	),
	get_char(Stream, NextChar),
	scanner(Stream, NextChar, Tokens).

% Case: digit
scanner(Stream, Char, [Token|Tokens]) :-
	char_type(Char, digit), !,
	read_number(Stream, Char, Number),
	Token = int(Number),
	get_char(Stream, NextChar),
	scanner(Stream, NextChar, Tokens).

% Case: special character
scanner(Stream, Char, [Token|Tokens]) :-
	read_separator(Stream, Char, Separator),
	(	separators(Separators), member(Separator, Separators)
	->  Token = sep(Separator)
	;   Token = error_sep(Separator)
	),
	get_char(Stream, NextChar),
	scanner(Stream, NextChar, Tokens).

% Helper predicate to read a word
read_word(Stream, Char, Word) :-
	peek_char(Stream, NextCharTemp),
	(NextCharTemp \= ';' -> get_char(Stream, NextChar) ; NextChar = NextCharTemp),
	(
		char_type(NextChar, alpha)
	->  read_word(Stream, NextChar, RestWord),
		atom_concat(Char, RestWord, Word)
	;	Word = Char
	).

% Helper predicate to read a number
read_number(Stream, Char, Number) :-
	peek_char(Stream, NextCharTemp),
	(NextCharTemp \= ';' -> get_char(Stream, NextChar) ; NextChar = NextCharTemp),
	(
		char_type(NextChar, digit)
	->  read_number(Stream, NextChar, RestNumber),
		atom_concat(Char, RestNumber, Number)
	;	Number = Char
	).

% Helper predicate to read a separator
read_separator(Stream, Char, Separator) :-
    peek_char(Stream, NextCharTemp),
	(NextCharTemp \= ';' -> get_char(Stream, NextChar) ; NextChar = NextCharTemp),
    (   separators(Separators), atom_concat(Char, NextChar, PossibleSeparator), member(PossibleSeparator, Separators)
    ->  Separator = PossibleSeparator
    ;   (
			NextChar \= end_of_file
		->	Separator = Char
		;	Separator = Char
		)
    ).

check_uppercase(Word) :- upcase_atom(Word, Word).
