function [output, index] = period_filtered(input,table)

[row,column] = size(input);
perd = zeros(row,32);
period = zeros(row,1);

for i = 1:row
    temp = abs(periodogram(input(i,:)));
    perd(i,:) = temp(1:32);
    period(i) = max(temp(3:32)); % 1 or 2 day cannot be considered as a period.
end

[sorted,sorted_index] = sort(period,'descend');

sorted_index = sorted_index(1:9);

output = perd(sorted_index,:);
index = table.col_names(sorted_index);