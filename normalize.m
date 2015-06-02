function output = normalize(input)
%Normalize rows of a given table.

[row,column] = size(input);

output = zeros([row,1]);

for i = 1 : row
    for j = 1: column
        output(i,j) = (input(i,j)-min(input(i,:)))/(max(input(i,:))-min(input(i,:)));
    end
end

