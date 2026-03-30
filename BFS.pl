bfs(Start, Goal, Path) :-
    bfs_queue([[Start]], Goal, RevPath),
    reverse(RevPath, Path).

bfs_queue([[Goal|Rest]|_], Goal, [Goal|Rest]).

bfs_queue([[Current|Rest]|Others], Goal, Path) :-
    findall([Next,Current|Rest],
            edge(Current, Next),
            NewPaths),
    append(Others, NewPaths, Queue),
    bfs_queue(Queue, Goal, Path).
 
% Graph
edge(a,b).
edge(a,c).
edge(b,d).
edge(c,e).
