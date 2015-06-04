function display_ext_data(data,index)

[d_r,d_c] = size(data);

for i = 1:d_r
    MA3 = conv(data(i,:),[1/3,1/3,1/3]);
    MA5 = conv(data(i,:),[1/5,1/5,1/5,1/5,1/5]);
    MA7 = conv(data(i,:),[1/7,1/7,1/7,1/7,1/7,1/7,1/7]);
    
    figure
    plot(data(i,:));
    hold on
    plot(MA3,'r','LineWidth',2)
    plot(MA5,'g','LineWidth',2)
    plot(MA7,'k','LineWidth',2)
    legend('Origianl','MA3','MA5','MA7')
    title(index{i})
    xlabel('Days')
    hold off
end