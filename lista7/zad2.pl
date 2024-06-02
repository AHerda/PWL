:- consult(zad1).

split(In, Out1, Out2) :-
    freeze(In,
    (   In = [H1, H2 | R]
        ->  (
            Out1 = [H1 | R1],
            Out2 = [H2 | R2],
            split(R, R1, R2)
        )
        ;   (In = [H1]
        ->  (
            Out1 = [H1],
            Out2 = []
        )
        ;   (
            Out1 = [],
            Out2 = []
        ))
    )).


merge_sort2(In, Out) :-
    freeze(In,
    (   In = [_, _ | _]
        ->  (
            split(In, L1, L2),
            merge_sort(L1, S1),
            merge_sort(L2, S2),
            merge(S1, S2, Out)
        )
        ;   (In = [H1]
        ->  Out = [H1]
        ;   Out = [])
    )).

merge_sort(In, Out) :-
    freeze(In,
    (   In = [_ | R]
        ->  freeze(R,
            (   R = [_ | _]
                ->  (
                    split(In, L1, L2),
                    merge_sort(L1, S1),
                    merge_sort(L2, S2),
                    merge(S1, S2, Out)
                )
                ;   In = Out
            )
        ;   Out = []
        )
    )).
