check_equal :-
    write('Enter first number: '),
    read(A),
    write('Enter second number: '),
    read(B),
    ( A =:= B ->
        write('Numbers are equal')
    ;
        write('Numbers are not equal')
    ).
