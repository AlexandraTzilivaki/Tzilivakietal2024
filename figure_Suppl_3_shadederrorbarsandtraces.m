
SamplingRate=10000

SR=0.4; % desired spectral resolution (Hz)
nfft = 0.1*SamplingRate/SR; % length of fft (samples)
nfft = 2^nextpow2(nfft); % round to nearest power of 2
bw = SamplingRate / nfft; % actual resolution = bandwidth
for i=1:30
% Estimate the power spectral density with the Welch’s method
[aPyybimodaltheta(:,i), af_fftbimodaltheta(:,i)] = pwelch(Bimodal_lfptheta(:,i), hann(nfft), nfft/2, nfft, SamplingRate);%500  msec rec minimum!
[aPyysubtheta(:,i), af_fftsubtheta(:,i)] = pwelch(Sublinear_lfptheta(:,i), hann(nfft), nfft/2, nfft, SamplingRate);%500  msec rec minimum!
[aPyysupratheta(:,i), af_fftsupratheta(:,i)] = pwelch(Supralinear_lfptheta(:,i), hann(nfft), nfft/2, nfft, SamplingRate);%500  msec rec minimum!


[aPyybimodalgamma(:,i), af_fftbimodalgamma(:,i)] = pwelch(Bimodal_lfpgamma(:,i), hann(nfft), nfft/2, nfft, SamplingRate);%500  msec rec minimum!
[aPyysubgamma(:,i), af_fftsubgamma(:,i)] = pwelch(Sublinear_lfpgamma(:,i), hann(nfft), nfft/2, nfft, SamplingRate);%500  msec rec minimum!
[aPyysupragamma(:,i), af_fftsupragamma(:,i)] = pwelch(Supralinear_lfpgamma(:,i), hann(nfft), nfft/2, nfft, SamplingRate);%500  msec rec minimum!

end


meanpower_bimodal_theta=mean(aPyybimodaltheta')
stdpower_bimodal_theta=std(aPyybimodaltheta')


meanpower_sub_theta=mean(aPyysubtheta')
stdpower_sub_theta=std(aPyysubtheta')


meanpower_supra_theta=mean(aPyysupratheta')
stdpower_supra_theta=std(aPyysupratheta')


meanpower_bimodal_gamma=mean(aPyybimodalgamma')
stdpower_bimodal_gamma=std(aPyybimodalgamma')


meanpower_sub_gamma=mean(aPyysubgamma')
stdpower_sub_gamma=std(aPyysubgamma')


meanpower_supra_gamma=mean(aPyysupragamma')
stdpower_supra_gamma=std(aPyysupragamma')
%...................................................................................................................
figure;
shadedErrorBar(af_fftbimodaltheta(:,2),meanpower_bimodal_theta,abs(stdpower_bimodal_theta), 'lineprops','b')
xlim([0 15])

title(' PSD slow oscillation bimodal')
figure;shadedErrorBar(af_fftsupratheta(:,2),meanpower_supra_theta,abs(stdpower_supra_theta), 'lineprops','m')
xlim([0 15])

title(' PSD slow oscillation supralinear')

figure;shadedErrorBar(af_fftsubtheta(:,2),meanpower_sub_theta,stdpower_sub_theta, 'lineprops','y')
xlim([0 15])
title(' PSD slow oscillation Sublinear')
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

figure;shadedErrorBar(af_fftbimodalgamma(:,10),meanpower_bimodal_gamma,abs(stdpower_bimodal_gamma), 'lineprops','b')
xlim([30 230])

title(' PSD fast oscillation bimodal')

figure;shadedErrorBar(af_fftsupragamma(:,2),meanpower_supra_gamma,abs(stdpower_supra_gamma), 'lineprops','m')

xlim([30 230])

title(' PSD fast oscillation supralinear')

figure;shadedErrorBar(af_fftsubgamma(:,2),meanpower_sub_gamma,stdpower_sub_gamma, 'lineprops','y')
xlim([30 230])
title(' PSD fast oscillation sublinear')





figure;
plot(Sublinear_lfptheta(:,20),'y')
hold on;
plot(Supralinear_lfptheta(:,20),'r')
hold on;
 plot(Bimodal_lfptheta(:,20),'b')
xlim([3000 8000])

title(' theta trace')



figure;
plot(Sublinear_lfpgamma(:,14),'y')
hold on;
plot(Supralinear_lfpgamma(:,14),'r')
hold on;
 plot(Bimodal_lfpgamma(:,14),'b')
xlim([4000 4800])

title(' gamma trace')


