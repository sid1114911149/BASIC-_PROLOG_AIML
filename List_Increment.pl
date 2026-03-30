increment(_, [], []).
increment(X, [X|T], [Y|T]) :-
    Y is X + 1.
increment(X, [H|T], [H|R]) :-
    increment(X, T, R).
