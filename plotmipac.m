
%at
tcl = tiledlayout(8,1);
comoA = ComodulogramBimodaldisperse'; 
comoB =ComodulogramSupralinearinput'; 
comoC = ComodulogramSublinearinput';
comoD=ComodulogramSupralinearall'; 
comoE = ComodulogramSublinearall';

comoF = ComodulogramSublinearinput';
comoG=ComodulogramSupralinearall'; 
comoH = ComodulogramSublinearall';
X=PhaseFreqVector+PhaseFreq_BandWidth
Y=AmpFreqVector+AmpFreq_BandWidth
% Plot for comoA
nexttile();
contourf(X, Y, comoA);
zlim([-7, 6]);
title('Bimodal control');
% 
% Plot for comoB
nexttile();
contourf(X, Y, comoB);
zlim([-7, 6]);
title('Activation of supralinear branches');

% Plot for comoC
nexttile();
contourf(X, Y, comoC);
zlim([-7, 6]);
title('Activation of sublinear branches');

% 
% Plot for comoD
nexttile();
contourf(X, Y, comoD);
zlim([-7, 6]);
title('Activation of supralinear trees');

% Plot for comoE
nexttile();
contourf(X, Y, comoE);
zlim([-7, 6]);
title('Activation of sublinear trees');


% Plot for comoF
nexttile();
contourf(X, Y, comoF);
zlim([-7, 6]);
title('Activation of bimodal cluster');

% 
% Plot for comoG
nexttile();
contourf(X, Y, comoG);
zlim([-7, 6]);
title('Activation of supralinear trees Cluster');

% Plot for comoH
nexttile();
contourf(X, Y, comoH);
zlim([-7, 6]);
title('Activation of sublinear trees cluster');

% Create a common colorbar for all subplots
cb = colorbar();
cb.Layout.Tile = 'east'; % Assign colorbar location



%mi plots and statistics

a=([MIBimodaldisperse', MIBimodalcluster'   MISupralinearinput', MISupralinearall', MISupralinearcluster', MISublinearinput', MISublinearall', MISublinearcluster'])

b=([a(:,1) a(:,3) a(:,4) a(:,6) a(:,7) ] ) %bimodal supra sub sub cases for disperse activation

[p,tbl,statsakruska] =kruskalwallis(b,[],'off')
pvaluekruskaga=multcompare(statsakruska)

boxchart(b)

[p,tbl,statsakruska] =kruskalwallis(b,[],'off')
pvaluekruskaga=multcompare(statsakruska)


c=([a(:,2) a(:,5) a(:,8)] ) %bimodal supra sub sub cases for cluster activation

[pcluster,tblcluster,statsakruskacluster] =kruskalwallis(c,[],'off')
pvaluekruskagacluster=multcompare(statsakruskacluster)

boxchart(c)
