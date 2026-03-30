male(jack).
 male(harry).
 male(simon).
 male(david).
 male(peter).
 male(tom).
 male(john).
female(jess).
 female(helen).
 female(mary).
 female(lisa).
 female(susan).
 female(anna).
 female(emma).
 female(nancy).
parent(jack, harry).
 parent(jack, simon).
 parent(jess, harry).
 parent(jess, simon).
parent(harry, david).
 parent(harry, emma).
 parent(helen, david).
 parent(helen, emma).
parent(peter, jack).
 parent(mary, jack).
 father(X, Y) :- male(X), parent(X, Y).
 mother(X, Y) :- female(X), parent(X, Y).
sibling(X, Y) :-
 parent(P, X),
 parent(P, Y),
 X = Y.
grandfather(X, Y) :-
 father(X, Z),
 parent(Z, Y).
uncle(X, Y) :-
 male(X),
 sibling(X, Z),
 parent(Z, Y).
