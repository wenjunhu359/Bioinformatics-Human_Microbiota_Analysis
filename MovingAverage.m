%% Load Data
load('dataset.mat');

%% Cleaning Data
META_SALIVA_A = normalize(META_SALIVA_A_Array);
[msa_row,msa_col] = size(META_SALIVA_A);

%% Extracting Meaningful Data
msa_avail = [];
msa_avail_index = [];
for i = 1:msa_row
    if sum(META_SALIVA_A(i,:)) ~= 0
        msa_avail = [msa_avail; META_SALIVA_A(i,:)]; % non-zero rows
        msa_avail_index = [msa_avail_index; META_SALIVA_A_Table.col_names(i)]; % OTU name of non-zero rows
    end
end

%% Displaying Moving Average Plot
diff = detect_diff_A(msa_avail, 0.2);
diff_index = find(diff);

ext_data = msa_avail(diff_index,:);
ext_index = msa_avail_index(diff_index);

display_ext_data(ext_data,ext_index)