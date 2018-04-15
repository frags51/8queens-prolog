% PoPL 8 Queens Assignment.
% Does brute force on reduced number of permutations.
% Create a list of pairs (8), store row number of queen in each case.
:-initialization(fp).
% I vary the Row number of queens to find permutations, col number is fixed!
fp:-read_integer(InY),
	read_integer(InX),
	listIn({InX, InY}, [{X1,1},{X2,2}, {X3,3}, {X4, 4}, {X5, 5}, {X6, 6}, {X7, 7}, {X8, 8}]),
	valid([{X1,1},{X2,2}, {X3,3}, {X4, 4}, {X5, 5}, {X6, 6}, {X7, 7}, {X8, 8}]) -> % In case valud is found
	oLoop(1,[X1|[X2|[X3|[X4|[X5|[X6|[X7|[X8]]]]]]]]), write('\b'); 
	write('IMPOSSIBLE'). % In case valid is not found

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

% Validate list according to input.
listIn({Ix, Iy}, [{Ix,Iy}|Tail]).
listIn({Ix, Iy}, [{Rx, Ry}|Tail]):- listIn({Ix, Iy}, Tail).

% Loops while Ctr < 9
iLoop(_,_,[]).
iLoop(_,9,_).
iLoop(OCtr, Ctr, [X|Tail]):- Ctr<9, 
	OCtr is X -> write('1'), write(' '), Y is Ctr+1, iLoop(OCtr, Y, Tail); 
	write('0'), write(' '), Y is Ctr+1, iLoop(OCtr, Y, Tail).

% Outer loop
oLoop(_, []).
oLoop(9, _).
oLoop(OCtr, [H|Tail]):- OCtr<9, iLoop(OCtr, 1, [H|Tail]), write('\b'), write('\n'),X is OCtr+1, oLoop(X, [H|Tail]).

