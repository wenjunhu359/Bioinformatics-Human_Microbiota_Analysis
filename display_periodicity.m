function display_periodicity(input,index,category)
%%Display Periodicity of Data (3 X 3)

figure('Name',category)
for i = 1:9
    subplot(3,3,i)
    stem(input(i,:))
    title(index{i})
    xlabel('Days')    
end
