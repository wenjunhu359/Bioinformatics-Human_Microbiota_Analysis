function FinalScore = GetScore(NoneZeroWithNut)
Start=40;                                  %%Initiallize Start
End=110;                                   %%Initiallize End
Para=ones(1258,10);                        %%Initiallize parameter
Sum=zeros(1258,10);                        %%Initiallize total score
%%%%%%%%%%%%%%%%%%%%%%%Scoring Part%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

for i=1259:1268                %%Nutrition 1259-1268
    for j=Start:End-1                 %%First period 39 days
        %%%%%%%%Compute one of the Nutrition's changerate%%%%%%%%%%%%%%%%%%
        ChangeRateNut=(NoneZeroWithNut(i,j+1)-NoneZeroWithNut(i,j))/NoneZeroWithNut(i,j); 
        %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
        for k=1:1258
        %%%%%%%%Compute one of the OTU's changerate%%%%%%%%%%%%%%%%%%%%%%%%
        ChangeRateOTU=(NoneZeroWithNut(k,j+1)-NoneZeroWithNut(k,j))/NoneZeroWithNut(k,j);
        %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
        
        ChangeRate=ChangeRateNut/ChangeRateOTU; %% Get Change Rate
        [Score,Para(k,i-1258)]=Scoring(ChangeRate,Para(k,i-1258));  %% Get Score and Update parameter
        Sum(k,i-1258)=Sum(k,i-1258)+Score;
        
        
        end
    end
end
FinalScore=Sum/(End-Start-1);      %%Normalize total score 

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

end