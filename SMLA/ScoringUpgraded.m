function [PosScore,NegScore,PosParameterOut,NegParameterOut] = ScoringUpgraded(Input,PosParameter,NegParameter)
PosScore=0;
NegScore=0;
PosParameterOut=PosParameter;
NegParameterOut=NegParameter;
if (Input>=1) 
    PosScore=1.06^(-((Input-1)*20))*PosParameter ;%% Scoring function using change rate
    if ( PosScore > (PosParameter/2) )            %% Compare the score to the parameer
    PosParameterOut=PosParameter*1.01;           %% If score is high, then higher the parameter
    else PosParameterOut=PosParameter/1.01;      %% If score is low, then lower the parameter
    end
end
if (Input<1 && Input >=0)
    PosScore=log2(Input+1)*PosParameter;    %% Scoring function
    if ( PosScore > (PosParameter/2) )            %% Compare the score to the parameer
    PosParameterOut=PosParameter*1.01;           %% If score is high, then higher the parameter
    else PosParameterOut=PosParameter/1.01;      %% If score is low, then lower the parameter
    end
end
if (Input>-1 && Input <0)
    NegScore=-log2(-Input+1)*NegParameter;    %% Scoring function
    if ( abs(NegScore) > (NegParameter/2) )            %% Compare the score to the parameer
    NegParameterOut=NegParameter*1.01;           %% If score is high, then higher the parameter
    else NegParameterOut=NegParameter/1.01;      %% If score is low, then lower the parameter
    end
end
if (Input<=-1) 
    NegScore=-1.06^(((Input+1)*20))*NegParameter ;%% Scoring function using change rate
    if ( abs(NegScore) > (NegParameter/2) )            %% Compare the score to the parameer
    NegParameterOut=NegParameter*1.01;           %% If score is high, then higher the parameter
    else NegParameterOut=NegParameter/1.01;      %% If score is low, then lower the parameter
    end
end