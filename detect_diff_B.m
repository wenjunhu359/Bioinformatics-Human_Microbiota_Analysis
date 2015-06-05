function output = detect_diff_B(input, threshold)
%%Finding OTU which shows large difference during infection period

[row, col] = size(input);

output = zeros(row,1);

for i = 1:row
    travel = input(i,126:132); % column 126 ~ 132 is the time subject B was infected to Salmonella
    travel_mean = mean(travel); % mean value during infected from Salmonella
    n_travel_mean = mean([input(i,1:125) input(i,133:end)]); % mean value except the period of infection of Salmonella
    
    % if difference between two period is greater than thresh hold, it
    % insert 1 to output array.
    if (abs(n_travel_mean - travel_mean) > threshold)
        output(i) = 1;
    end
end