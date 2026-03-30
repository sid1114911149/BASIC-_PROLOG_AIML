% Graph
edge(a, b). edge(a, c).
edge(b, d). edge(b, e).
edge(c, f). edge(c, g).
edge(d, h). edge(e, i).
edge(e, j).

% Depth-limited DFS
dfs_bounded([Goal|Path], Goal, _, FinalPath) :-
    reverse([Goal|Path], FinalPath).

dfs_bounded([Node|Path], Goal, Depth, FinalPath) :-
    Depth > 0,
    edge(Node, Next),
    \+ member(Next, [Node|Path]),
    Depth1 is Depth - 1,
    dfs_bounded([Next, Node|Path], Goal, Depth1, FinalPath).

% Iterative Deepening DFS
dfid(Start, Goal, Path) :-
    dfid(0, Start, Goal, Path).

dfid(Depth, Start, Goal, Path) :-
    dfs_bounded([Start], Goal, Depth, Path),
    !.

dfid(Depth, Start, Goal, Path) :-
    Depth1 is Depth + 1,
    dfid(Depth1, Start, Goal, Path).
