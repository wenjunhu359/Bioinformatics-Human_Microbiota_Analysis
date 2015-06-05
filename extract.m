function [avail,index] = extract(input,table)
%%Extracting non-zero rows

avail = [];
index = [];
[row,column] = size(input);
for i = 1:row
    if sum(input(i,:)) ~= 0
        avail = [avail; input(i,:)];
        index = [index; table.col_names(i)];
    end
end        