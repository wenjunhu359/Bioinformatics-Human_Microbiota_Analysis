function output = detect_diff_A(input, threshold)
%%Finding OTU which shows large difference during traveling period

[row, col] = size(input);

output = zeros(row,1);

for i = 1:row
    travel = input(i,40:72); % column 40 ~ 72 is the time subject A traveled
    travel_mean = mean(travel); % mean value during the travel
    n_travel_mean = mean([input(i,1:39) input(i,73:end)]); % mean value except the period of traveling
    
    % if difference between two period is greater than thresh hold, it
    % insert 1 to output array.
    if (abs(n_travel_mean - travel_mean) > threshold)
        output(i) = 1;
    end
end