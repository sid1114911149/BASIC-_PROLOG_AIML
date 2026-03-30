h(s,5).
h(a,3).
h(b,4).
h(c,2).
h(d,6).
h(g,0).

edge(s,a).
edge(a,b).
edge(a,c).
edge(b,d).
edge(c,d).
edge(c,g).
edge(d,g).
hill_climb(Start, Goal, Path) :-
    climb(Start, Goal, [Start], RevPath),
    reverse(RevPath, Path).


climb(Goal, Goal, Path, Path).

climb(Current, Goal, Visited, Path) :-
    findall(
        [H, Next],
        (
            edge(Current, Next),
            \+ member(Next, Visited),
            h(Next, H)
        ),
        Neighbors
    ),
    Neighbors \= [],
    sort(Neighbors, Sorted),   
    Sorted = [[BestH, BestNode] | _],
    h(Current, CurrH),
    BestH < CurrH,             
    climb(BestNode, Goal, [BestNode | Visited], Path).
