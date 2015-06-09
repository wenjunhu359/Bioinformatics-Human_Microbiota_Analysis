function [PosScore,NegScore,PosParameterOut,NegParameterOut] = ScoringUpgradedStr(Input,PosParameter,NegParameter)
PosScore=0;
NegScore=0;
PosParameterOut=PosParameter;
NegParameterOut=NegParameter;
if (Input>=1) 
    PosScore=1.06^(-((Input-1)*20))*PosParameter ;%% Scoring function using change rate
    PosParameterOut=PosParameter*1.01;            %% Machine Learning Parameter

end

if (Input<1 && Input >=0)
    PosScore=log2(Input+1)*PosParameter;          %% Scoring function
    PosParameterOut=PosParameter*1.01;            %% Machine Learning Parameter

end

if (Input>-1 && Input <0)
    NegScore=-log2(-Input+1)*NegParameter;        %% Scoring function
    NegParameterOut=NegParameter*1.01;            %% Machine Learning Parameter

end

if (Input<=-1) 
    NegScore=-1.06^(((Input+1)*20))*NegParameter ;%% Scoring function using change rate
    NegParameterOut=NegParameter*1.01;            %% Machine Learning Parameter

end