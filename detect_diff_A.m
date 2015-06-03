function output = detect_diff_A(input, threshold)
%%Detecting OTU shows large difference during travel

[row, col] = size(input);

output = zeros(row,1);

for i = 1:row
    travel = input(i,40:72);
    travel_mean = mean(travel);
    overall_mean = mean(input(i,:));
    if (abs(overall_mean - travel_mean) > threshold)
        output(i) = 1;
    end
end