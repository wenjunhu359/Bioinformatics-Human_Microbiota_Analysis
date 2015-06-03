%% Load Data
load('dataset.mat');

META_SALIVA_A = normalize(META_SALIVA_A_Array);
[msa_row,msa_col] = size(META_SALIVA_A);
msa_avail = [];
msa_avail_index = [];
for i = 1:msa_row
    if sum(META_SALIVA_A(i,:)) ~= 0
        msa_avail = [msa_avail; META_SALIVA_A(i,:)];
        msa_avail_index = [msa_avail_index; META_SALIVA_A_Table.col_names(i)];
    end
end

diff = detect_diff_A(msa_avail);
% 
% MA3 = conv(Row_17,[1/3,1/3,1/3]);
% MA5 = conv(Row_17,[1/5,1/5,1/5,1/5,1/5]);
% MA7 = conv(Row_17,[1/7,1/7,1/7,1/7,1/7,1/7,1/7]);
% 
% figure
% plot(Row_17)
% hold on
% plot(MA3,'r','LineWidth',2)
% plot(MA5,'g','LineWidth',2)
% plot(MA7,'k','LineWidth',2)
% legend('Origianl','MA3','MA5','MA7')
% title('OTU 2222')
% xlabel('Days')
% hold off
% 
