function FinalScore = FindMonoScore(PosScore,NegScore)
A=PosScore>0;
B=NegScore<0;
ScoreMat=A+B;
ScoreMat=ScoreMat>1;
PosScore(ScoreMat)=0;
NegScore(ScoreMat)=0;
FinalScore=PosScore+NegScore;
end
