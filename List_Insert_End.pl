insert_last(X, [], [X]).
insert_last(X, [H|T], [H|R]) :-
insert_last(X, T, R).
