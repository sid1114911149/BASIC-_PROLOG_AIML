h(s,5).
h(a,3).
h(b,4).
h(c,2).
h(d,6).
h(g,0).

edge(s,a,1).
edge(s,g,10).
edge(a,b,2).
edge(a,c,1).
edge(b,d,5).
edge(c,d,3).
edge(c,g,4).
edge(d,g,2).
a_star(Start, Goal, Path, Cost) :-
    astar([[Start, 0, [Start]]], Goal, RevPath, Cost),
    reverse(RevPath, Path).

astar([[Goal, Cost, Path] | _], Goal, Path, Cost).

astar(Open, Goal, Path, Cost) :-
    Open = [[Node, G, P] | Rest],
    findall(
        [Next, G1, [Next | P]],
        (
            edge(Node, Next, C),
            \+ member(Next, P),
            G1 is G + C
        ),
        Children
    ),
    append(Rest, Children, NewOpen),
    sort_open(NewOpen, SortedOpen),
    astar(SortedOpen, Goal, Path, Cost).


sort_open(Open, Sorted) :-
    map_list_to_pairs(f_value, Open, Pairs),
    keysort(Pairs, SortedPairs),
    pairs_values(SortedPairs, Sorted).

f_value([Node, G, _], F) :-
    h(Node, H),
    F is G + H.
