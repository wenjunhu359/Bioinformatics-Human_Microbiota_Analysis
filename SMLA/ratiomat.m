function ratio=ratiomat(ori)
New=cell2mat(ori(1:5431,2:278));
[wid,len]=size(New);
ratio=zeros(wid,len);
for i=1:276
    for j=1:5431
        ratio(j,i)=(New(j,i+1)-New(j,i))/New(j,i);        
    end
end
end