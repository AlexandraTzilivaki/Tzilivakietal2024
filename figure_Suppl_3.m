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
title(' gamma frequency')

figure;
daviolinplot(gpower)
title('gamma power')

figure;
daviolinplot(thpower)
title('theta power')

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%Spikes%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

k=[[mean(PYR_Bimodal_meanspikes) mean(PYR_Supralinear_meanspikes) mean(PYR_Sublinear_meanspikes)]; [mean(PV_Bimodal_meanspikes) mean(PV_Supralinear_meanspikes) mean(PV_Sublinear_meanspikes)]] 
ke=[[mean(PYR_Bimodal_stdspikes') mean(PYR_Supralinear_stdspikes') mean(PYR_Sublinear_stdspikes')]; [mean(PV_Bimodal_stdspikes') mean(PV_Supralinear_stdspikes') mean(PV_Sublinear_stdspikes')]] 
figure;b=bar(k, 'grouped')
hold on

[ngroups,nbars]=size(k)
x=nan(nbars,ngroups)
for i=1:nbars
    x(i,:)=b(i).XEndPoints
end

errorbar(x',k,ke,'k','linestyle','none')
hold off 

 ps_pyrbimodalsub = ranksum(PYR_Bimodal_meanspikes,PYR_Sublinear_meanspikes)
 ps_pyrbimodalsupra = ranksum(PYR_Bimodal_meanspikes,PYR_Supralinear_meanspikes)
 ps_pyrsubsupra = ranksum(PYR_Sublinear_meanspikes,PYR_Supralinear_meanspikes)


 ps_PVbimodalsub = ranksum(PV_Bimodal_meanspikes,PV_Sublinear_meanspikes)
 ps_PVbimodalsupra = ranksum(PV_Bimodal_meanspikes,PV_Supralinear_meanspikes)
 ps_PVsubsupra = ranksum(PV_Sublinear_meanspikes,PV_Supralinear_meanspikes)
