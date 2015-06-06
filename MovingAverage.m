%% Load Data
load('dataset.mat');

%% Setting Threshold for Displaying Data
threshold_SALIVA_A = 0.22;
threshold_GUT_A = 0.20;
threshold_GUT_B = 0.40;

%% Load Subject Data
META_SALIVA_A = normalize(META_SALIVA_A_Array);
[msa_row,msa_col] = size(META_SALIVA_A);
META_STOOL_A = normalize(META_STOOL_A_Array);
[msta_row,msta_col] = size(META_STOOL_A);
META_STOOL_B = normalize(META_STOOL_B_Array);
[mstb_row,mstb_col] = size(META_STOOL_B);

%% Extracting Meaningful Data
[msa_avail,msa_avail_index] = extract(META_SALIVA_A,META_SALIVA_A_Table);
[msta_avail,msta_avail_index] = extract(META_STOOL_A,META_STOOL_A_Table);
[mstb_avail,mstb_avail_index] = extract(META_STOOL_B,META_STOOL_B_Table);

%% Displaying Moving Average Plot
diffs = detect_diff_A(msa_avail, threshold_SALIVA_A);
diffs_index = find(diffs);
diffs_data = msa_avail(diffs_index,:);
diffs_index = msa_avail_index(diffs_index);
display_MA(diffs_data,diffs_index,'SALIVA: A')

diffsta = detect_diff_A(msta_avail, threshold_GUT_A);
diffsta_index = find(diffsta);
diffsta_data = msta_avail(diffsta_index,:);
diffsta_index = msta_avail_index(diffsta_index);
display_MA(diffsta_data,diffsta_index,'GUT: A')

diffstb = detect_diff_B(mstb_avail, threshold_GUT_B);
diffstb_index = find(diffstb);
diffstb_data = mstb_avail(diffstb_index,:);
diffstb_index = mstb_avail_index(diffstb_index);
display_MA(diffstb_data,diffstb_index,'GUT: B')