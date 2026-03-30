insert(X, L, [X|L]).
insert(X, [H|T], [H|R]) :-
insert(X, T, R).
