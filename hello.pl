:-initialization(find_pos).
position(ram, dir).
position(sham, cam).
find_pos:- read(Input), position(Input, Out), write(Out).