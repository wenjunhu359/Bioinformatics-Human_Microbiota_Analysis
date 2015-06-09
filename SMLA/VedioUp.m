function [PosFinalScore,NegFinalScore,FinalScore,PosPara,NegPara,PosDays,NegDays] = VedioUp(NoneZeroWithNut)
Start=1;                                 %%Initiallize Start SalivaA  1-39 
% Start=40                                %%Initiallize Start SalivaA  40-110
% Start=68                                %%Initiallize Start StoolA   68-140
% End=39;                                 %%Initiallize End SalivaA   1-39
% End=110;                                %%Initiallize End SalivaA   40-110
End=67;                                  %%Initiallize End StoolA    1-67
% End=140;                                %%Initiallize End StoolA    68-140
%len=1258;                                %%SalivaA len
len=3290;                                %%StoolA len



%PosPara=ones(len,10);                        %%Initiallize positive parameter for salivaA
%NegPara=ones(len,10);                        %%Initiallize negative parameter for salivaA
%PosSum=zeros(len,10);                        %%Initiallize positive score for salivaA
%NegSum=zeros(len,10);                        %%Initiallize negative score for salivaA

PosPara=ones(len,10);                        %%Initiallize positive parameter for StoolA
NegPara=ones(len,10);                        %%Initiallize negative parameter for StoolA
PosSum=zeros(len,10);                        %%Initiallize positive score for StoolA
NegSum=zeros(len,10);                        %%Initiallize negative score for StoolA
PosDays=zeros(len,10);
NegDays=zeros(len,10);


%writerObj = VideoWriter('A_Saliva.mp4');
%writerObj.Quality=100;
%writerObj.FrameRate=20;
%open(writerObj);

%%%%%%%%%%%%%%%%%%%%%%%Scoring Part%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

for i=len+1:len+10                    %%Nutrition 
    
   
 
    for j=Start:End-1                 %%The continues period
        
        %%%%%%%%Compute one of the Nutrition's changerate%%%%%%%%%%%%%%%%%%
        ChangeRateNut=(NoneZeroWithNut(i,j+1)-NoneZeroWithNut(i,j))/NoneZeroWithNut(i,j); 
        %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
        
        for k=1:len
            
        %%%%%%%%Compute one of the OTU's changerate%%%%%%%%%%%%%%%%%%%%%%%%
        ChangeRateOTU=(NoneZeroWithNut(k,j+1)-NoneZeroWithNut(k,j))/NoneZeroWithNut(k,j);
        %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
        
        ChangeRate=ChangeRateNut/ChangeRateOTU; %% Compare Change Rate
        
        %%%%%%%%Get Score and Update parameter%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
        [PosScore,NegScore,PosPara(k,i-len),NegPara(k,i-len),PosDays(k,i-len),NegDays(k,i-len)]=ScoringUpgradedStrtestt(ChangeRate,PosPara(k,i-len),NegPara(k,i-len),PosDays(k,i-len),NegDays(k,i-len));  
        %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
        PosSum(k,i-len)=PosSum(k,i-len)+PosScore;      %% Score Matrix
        NegSum(k,i-len)=NegSum(k,i-len)+NegScore;      %% Score Matrix
                
        end
        
   %     PosRate=PosDays/Days;
     %   NegRate=NegDays/Days;
   %     subplot(2,1,1),plot(PosPara);text(3500,1,num2str(PosRate));
   %     subplot(2,1,2),plot(NegPara);text(3500,1,num2str(NegRate));
   %     frame = getframe(gcf); 
     %   writeVideo(writerObj,frame);
    %    close figure 1
      
        
    end
    
end
PosFinalScore=PosSum/(End-Start-1);      %%Normalize total positive score 
NegFinalScore=NegSum/(End-Start-1);      %%Normalize total negative score 
FinalScore=PosFinalScore-NegFinalScore; %%Normalize Mono score 
%close(writerObj);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

end