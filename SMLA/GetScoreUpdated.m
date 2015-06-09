function [PosFinalScore,NegFinalScore,PosPara,NegPara] = GetScoreUpdated(NoneZeroWithNut)
Start=40;                                  %%Initiallize Start
End=110;                                   %%Initiallize End
PosPara=ones(1258,10);                        %%Initiallize positive parameter
NegPara=ones(1258,10);                        %%Initiallize negative parameter
PosSum=zeros(1258,10);                        %%Initiallize positive score
NegSum=zeros(1258,10);                        %%Initiallize negative score
%%%%%%%%%%%%%%%%%%%%%%%Scoring Part%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

for i=1259:1268                %%Nutrition 1259-1268
    for j=Start:End-1                 %%The period
        %%%%%%%%Compute one of the Nutrition's changerate%%%%%%%%%%%%%%%%%%
        ChangeRateNut=(NoneZeroWithNut(i,j+1)-NoneZeroWithNut(i,j))/NoneZeroWithNut(i,j); 
        %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
        for k=1:1258
        %%%%%%%%Compute one of the OTU's changerate%%%%%%%%%%%%%%%%%%%%%%%%
        ChangeRateOTU=(NoneZeroWithNut(k,j+1)-NoneZeroWithNut(k,j))/NoneZeroWithNut(k,j);
        %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
        
        ChangeRate=ChangeRateNut/ChangeRateOTU; %% Get Change Rate
        [PosScore,NegScore,PosPara(k,i-1258),NegPara(k,i-1258)]=ScoringUpgraded(ChangeRate,PosPara(k,i-1258),NegPara(k,i-1258));  %% Get Score and Update parameter
        PosSum(k,i-1258)=PosSum(k,i-1258)+PosScore;      %% Score Matrix
        NegSum(k,i-1258)=NegSum(k,i-1258)+NegScore;      %% Score Matrix
        
        
        end
    end
end
PosFinalScore=PosSum/(End-Start-1);      %%Normalize total score 
NegFinalScore=NegSum/(End-Start-1);      %%Normalize total score 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

end