:- use_module(library(clpfd)).

% Assign domains based on square sizes and rectangle dimensions
assign_domains(Sizes, Xs, Ys, Width, Height) :-
    length(Sizes, N),
    length(Xs, N),
    length(Ys, N),
    Xs ins 0..Width,
    Ys ins 0..Height,
    (foreach(S, Sizes), foreach(X, Xs), foreach(Y, Ys) do
        X + S #=< Width,
        Y + S #=< Height).

% Define the predicate no_overlap/3
no_overlap(_, [], []).
no_overlap(Sizes, [X|Xs], [Y|Ys]) :-
    no_overlap(Sizes, Xs, Ys, X, Y).

no_overlap(_, [], []).
no_overlap(Sizes, [X|Xs], [Y|Ys], X1, Y1) :-
    (foreach(S, Sizes), foreach(X2, Xs), foreach(Y2, Ys) do
        (X1 + S #=< X2 #\/ X2 + S #=< X1 #\/
         Y1 + S #=< Y2 #\/ Y2 + S #=< Y1)),
    no_overlap(Sizes, Xs, Ys, X1, Y1).

% Check for overlaps between all pairs of squares
no_overlap(Sizes, Xs, Ys) :-
    length(Sizes, N),
    (   for(I, 0, N-1), param(Sizes, Xs, Ys)
    do  (   for(J, I+1, N-1), param(I, Sizes, Xs, Ys)
        do  nth0(I, Sizes, SizeI),
            nth0(J, Sizes, SizeJ),
            nth0(I, Xs, XI),
            nth0(I, Ys, YI),
            nth0(J, Xs, XJ),
            nth0(J, Ys, YJ),
            (XI + SizeI #=< XJ #\/ XJ + SizeJ #=< XI #\/
             YI + SizeI #=< YJ #\/ YJ + SizeJ #=< YI))).

% Find a solution
kwadraty(Sizes, Width, Height, Coordinates) :-
    length(Sizes, N),
    length(Xs, N), % X coordinates
    length(Ys, N), % Y coordinates
    assign_domains(Sizes, Xs, Ys, Width, Height),
    no_overlap(Sizes, Xs, Ys),
    flatten([Xs, Ys], Vars),
    Vars ins 0..max(Width, Height),
    label(Vars),
    prepare_coordinates(Xs, Ys, Coordinates).

% Merge X and Y coordinates into a single list
prepare_coordinates([], [], []).
prepare_coordinates([X|Xs], [Y|Ys], [X, Y|Coords]) :-
    prepare_coordinates(Xs, Ys, Coords).
