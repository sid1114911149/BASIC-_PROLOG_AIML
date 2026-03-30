max_min :-
    write('Enter A: '), read(A),
    write('Enter B: '), read(B),
    write('Enter C: '), read(C),
    Max is max(A, max(B, C)),
    Min is min(A, min(B, C)),
    write('Maximum: '), write(Max), nl,
    write('Minimum: '), write(Min).
