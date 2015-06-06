%% Load Data
load('dataset.mat');

%% Setting Maximum Returning Data 
MAX_Return = 10;

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

%% Calculating Periodicity
[Period_SALIVA_A, p_ind_sa] = period_filtered(msa_avail,META_SALIVA_A_Table);
[Period_STOOL_A, p_ind_sta] = period_filtered(msta_avail,META_STOOL_A_Table);
[Period_STOOL_B, p_ind_stb] = period_filtered(mstb_avail,META_STOOL_B_Table);

%% Displaying Periodic Data
display_periodicity(Period_SALIVA_A,p_ind_sa,'SALIVA: A');
display_periodicity(Period_STOOL_A,p_ind_sta,'STOOL: A');
display_periodicity(Period_STOOL_B,p_ind_stb,'STOOL: B');
