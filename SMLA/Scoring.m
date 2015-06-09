function [Score,ParameterOut] = Scoring(Input,Parameter)
Score=0;
ParameterOut=Parameter;
if (Input>=1) 
    Score=1.06^(-((Input-1)*20))*Parameter ;%% Scoring function using change rate
    if ( Score > (Parameter/2) )            %% Compare the score to the parameer
    ParameterOut=Parameter*1.01;           %% If score is high, then higher the parameter
    else ParameterOut=Parameter/1.01;      %% If score is low, then lower the parameter
    end
end
if (Input<1 && Input >=0)
    Score=log2(Input+1)*Parameter;    %% Scoring function
    if ( Score > (Parameter/2) )            %% Compare the score to the parameer
    ParameterOut=Parameter*1.01;           %% If score is high, then higher the parameter
    else ParameterOut=Parameter/1.01;      %% If score is low, then lower the parameter
    end
end
if (Input>-1 && Input <0)
    Score=-log2(-Input+1)*Parameter;    %% Scoring function
    if ( Score > (Parameter/2) )            %% Compare the score to the parameer
    ParameterOut=Parameter*1.01;           %% If score is high, then higher the parameter
    else ParameterOut=Parameter/1.01;      %% If score is low, then lower the parameter
    end
end
if (Input<=-1) 
    Score=-1.06^(((Input+1)*20))*Parameter ;%% Scoring function using change rate
    if ( Score > (Parameter/2) )            %% Compare the score to the parameer
    ParameterOut=Parameter*1.01;           %% If score is high, then higher the parameter
    else ParameterOut=Parameter/1.01;      %% If score is low, then lower the parameter
    end
end