

% close all
data_length = length(Supralinear_lfp);
srate = 10000;
dt = 1/srate;
t = (1:data_length)*dt;


% Define the amplitude- and phase-frequencies

PhaseFreqVector=1:1:15;
AmpFreqVector=30:5:180; %300!!!!

PhaseFreq_BandWidth=4;
AmpFreq_BandWidth=20;


% Define phase bins

nbin = 18; % number of phase bins
position=zeros(1,nbin); % this variable will get the beginning (not the center) of each phase bin (in rads)
winsize = 2*pi/nbin;
for j=1:nbin 
    position(j) = -pi+(j-1)*winsize; 
end

for kla=1:15
lfp = Supralinear_lfp(:,kla)'

% Filtering and Hilbert transform

'CPU filtering'
tic
ComodulogramSupralinear=single(zeros(length(PhaseFreqVector),length(AmpFreqVector)));
AmpFreqTransformed = zeros(length(AmpFreqVector), data_length);
PhaseFreqTransformed = zeros(length(PhaseFreqVector), data_length);

for ii=1:length(AmpFreqVector)
    Af1 = AmpFreqVector(ii);
    Af2=Af1+AmpFreq_BandWidth;
    AmpFreq=bandpass(lfp,[Af1 Af2],srate); % filtering
    AmpFreqTransformed(ii, :) = abs(hilbert(AmpFreq)); % getting the amplitude envelope
end

for jj=1:length(PhaseFreqVector)
    Pf1 = PhaseFreqVector(jj);
    Pf2 = Pf1 + PhaseFreq_BandWidth;
    PhaseFreq=bandpass(lfp,[Pf1 Pf2],srate); % filtering 
    PhaseFreqTransformed(jj, :) = angle(hilbert(PhaseFreq)); % getting the phase time series
end
toc

% Compute MISupralinear and ComodulogramSupralinear

'Comodulation loop'

counter1=0;
for ii=1:length(PhaseFreqVector)
counter1=counter1+1;

    Pf1 = PhaseFreqVector(ii);
    Pf2 = Pf1+PhaseFreq_BandWidth;
    
    counter2=0;
    for jj=1:length(AmpFreqVector)
    counter2=counter2+1;
    
        Af1 = AmpFreqVector(jj);
        Af2 = Af1+AmpFreq_BandWidth;
        [MISupralinear(kla),MeanAmpSupralinear]=ModIndex_v2(PhaseFreqTransformed(ii, :), AmpFreqTransformed(jj, :), position);
      ComodulogramSupralinear(counter1,counter2)=MISupralinear(kla);
    end
end
toc
end

% Plot ComodulogramSupralinear

clf
figure
contourf(PhaseFreqVector+PhaseFreq_BandWidth,AmpFreqVector+AmpFreq_BandWidth,ComodulogramSupralinear',30,'lines','none')
set(gca,'fontsize',14)
ylabel('Amplitude Frequency (Hz)')
xlabel('Phase Frequency (Hz)')
colorbar

figure;bar(10:20:720,[MeanAmpSupralinear,MeanAmpSupralinear]/sum(MeanAmpSupralinear),'k')
xlim([0 720])
set(gca,'xtick',0:360:720)
xlabel('Phase (Deg)')
ylabel('Amplitude')
title(['MISupralinear = ' num2str(MISupralinear)])

