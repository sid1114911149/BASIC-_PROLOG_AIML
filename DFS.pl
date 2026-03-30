% Graph
edge(a, b).
edge(a, c).
edge(b, d).
edge(b, e).
edge(c, f).
edge(c, g).
edge(d, h).
edge(e, i).
edge(e, j).

% The core DFS uses recursion with a path list to avoid cycles:
dfs(Start, Goal, Path) :-
    dfs_path([Start], Goal, RevPath),
    reverse(RevPath, Path).

dfs_path([Goal|Path], Goal, [Goal|Path]).
dfs_path([Node|Path], Goal, FullPath) :-
    edge(Node, Next),
    \+ member(Next, [Node|Path]),
    dfs_path([Next, Node|Path], Goal, FullPath).

