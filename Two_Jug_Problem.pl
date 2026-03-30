% capacities
capacity(a,4).
capacity(b,3).

% initial and goal states
initial(state(0,0)).
goal(state(2,_)).

% fill jug A
move(state(_,B), state(MaxA,B)) :-
    capacity(a,MaxA).

% fill jug B
move(state(A,_), state(A,MaxB)) :-
    capacity(b,MaxB).

% empty jug A
move(state(_,B), state(0,B)).

% empty jug B
move(state(A,_), state(A,0)).

% pour A -> B
move(state(A,B), state(A2,B2)) :-
    capacity(b,MaxB),
    Transfer is min(A, MaxB-B),
    A2 is A-Transfer,
    B2 is B+Transfer.

% pour B -> A
move(state(A,B), state(A2,B2)) :-
    capacity(a,MaxA),
    Transfer is min(B, MaxA-A),
    A2 is A+Transfer,
    B2 is B-Transfer.

% DFS solver
solve(State, _, []) :-
    goal(State).

solve(State, Visited, [Next|Path]) :-
    move(State, Next),
    \+ member(Next, Visited),
    solve(Next, [Next|Visited], Path).

water_jug(Path) :-
    initial(S),
    solve(S, [S], Path).
