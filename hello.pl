% PoPL 8 Queens Assignment.
% Does brute force on reduced number of permutations.
% Create a list of pairs (8), store row number of queen in each case.
% I vary the Row number of queens to find permutations, col number is fixed!
fp:-read(InX),
	read(InY),
	listIn({InX, InY}, [{X1,1},{X2,2}, {X3,3}, {X4, 4}, {X5, 5}, {X6, 6}, {X7, 7}, {X8, 8}]),
	valid([{X1,1},{X2,2}, {X3,3}, {X4, 4}, {X5, 5}, {X6, 6}, {X7, 7}, {X8, 8}]),
	write(X1),
	write(X2),
	write(X3),
	write(X4),
	write(X5),
	write(X6),
	write(X7),
	write(X8).
% [{X1,1},{X2,2}, {X3,3}, {X4, 4}, {X5, 5}, {X6, 6}, {X7, 7}, {X8, 8}]

% Is the Queen at XX, YY safe from other queens?
% Relation b/w a set of pairs and a pair.
safe(_, []). % Base Case
% Note that Yy is fixed here to reduce permutations, only vary Xx , Yy is already different for each queen.
safe({Xx, Yy}, [{X, Y}| Remaining]):- Xx =\= X, ((Yy-Y) =\= (Xx-X)), ((Yy-Y) =\= (X - Xx)), safe({Xx, Yy}, Remaining).

% Actually solve? Again, Y is supplieed with the list.
valid([]). % Base Case
% X>=1 and X <9 not working: not instantiated error
valid([{X,Y} | Tail]):- valid(Tail), isIn(X, [1,2,3,4,5,6,7,8]), safe({X,Y}, Tail). 

isIn(A, [A|Tail]).
isIn(A, [X|Tail]):- isIn(A, Tail).

listIn({Ix, Iy}, [{Ix,Iy}|Tail]).
listIn({Ix, Iy}, [{Rx, Ry}|Tail]):- listIn({Ix, Iy}, Tail).