%figures
 
%1 fast frequency 
gfreq= [GammapeakFreq_Bimodal, GammapeakFreq_Supralinear, GammapeakFreq_Sublinear]
  
[p,tbl,statsgfreqkruska] =kruskalwallis(gfreq,[],'off')
pvaluekruskagfreq=multcompare(statsgfreqkruska)

 %2 fast power  
gpower= [GammapeakPower_Bimodal', GammapeakPower_Supralinear', GammapeakPower_Sublinear']
[p,tbl,statsgpowerkruska] =kruskalwallis(gpower,[],'off')
pvaluekruskagpower=multcompare(statsgpowerkruska)


% 3  theta power
thpower= [thetapeakPower_Bimodal', thetapeakPower_Supralinear', thetapeakPower_Sublinear']
[p,tbl,statsthpowerkruska] =kruskalwallis(thpower,[],'off')
pvaluekruskathpower=multcompare(statsthpowerkruska)


figure;
daviolinplot(gfreq)
title(' gamma frequency ')

figure;
daviolinplot(gpower)
title('gamma power ')

figure;
daviolinplot(thpower)
title('theta power')

