g1 --> ``.
g1 --> `a`, g1, `b`.

g2 --> counter(X, `a`), counter(X, `b`), counter(X, `c`).

counter(0, _) --> ``.
counter(s(X), Y) --> Y, counter(X, Y).

g3 --> counter(X, `a`), fibCounter(X, `b`).

fibCounter(0, _) --> ``.
fibCounter(s(0), Y) --> Y.
fibCounter(s(s(X)), Y) --> fibCounter(X, Y), fibCounter(s(X), Y).

p([]) --> [].
p([X|Xs]) --> [X], p(Xs).
