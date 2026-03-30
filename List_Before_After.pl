before_after(X, [B,X,A|_], B, A).
before_after(X, [_|T], B, A) :-
before_after(X, T, B, A).
