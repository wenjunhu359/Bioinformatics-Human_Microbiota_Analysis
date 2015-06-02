load('dataset.m')
Row_17 = Saliva_A(:,17);

MA3 = conv(Row_17,[1/3,1/3,1/3]);
MA5 = conv(Row_17,[1/5,1/5,1/5,1/5,1/5]);
MA7 = conv(Row_17,[1/7,1/7,1/7,1/7,1/7,1/7,1/7]);

figure
plot(Row_17)
hold on
plot(MA3,'r','LineWidth',2)
plot(MA5,'g','LineWidth',2)
plot(MA7,'k','LineWidth',2)
legend('Origianl','MA3','MA5','MA7')
title('OTU 2222')
xlabel('Days')
hold off

