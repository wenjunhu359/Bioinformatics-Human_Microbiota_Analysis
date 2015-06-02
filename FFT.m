load('Saliva_A');
Saliva_A = david14otusmetadatasalivaA;

Row_17 = Saliva_A(17,:);
Row_2873 = Saliva_A(2873,:);
Row_3040 = Saliva_A(3040,:);

Frequency_17 = abs(periodogram(Row_17));
Frequency_2873 = abs(periodogram(Row_2873));
Frequency_3040 = abs(periodogram(Row_3040));

figure
subplot(2,2,1)
stem(Frequency_17);
title('OTU 2222')

subplot(2,2,2)
stem(Frequency_2873);
title('OTU 248474')


subplot(2,2,4)
stem(Frequency_3040);
title('OTU 263650')