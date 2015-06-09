
%% Reading a specify roll
function [row] =rowreader(r,data) 
a=data(r,2:278);
row=cell2mat(a);
end

%% This function is for