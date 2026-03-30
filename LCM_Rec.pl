 lcm(X, Y, L) :-
 gcd(X, Y, G),
 L is (X * Y) // G.
