function output = normalize(input)
%Normalize rows of a given table.

[row,column] = size(input);

output = zeros(row,column);

for i = 1 : row
    for j = 1: column
        if (max(input(i,:)) - min(input(i,:)) == 0)
            output(i,j) = 0;
        else
            output(i,j) = (input(i,j)-min(input(i,:)))/(max(input(i,:))-min(input(i,:)));
        end
    end
end

