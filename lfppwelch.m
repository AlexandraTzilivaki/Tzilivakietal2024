SamplingRate=10000

SR=0.4; % desired spectral resolution (Hz)
nfft = 0.1*SamplingRate/SR; % length of fft (samples)
nfft = 2^nextpow2(nfft); % round to nearest power of 2
bw = SamplingRate / nfft; % actual resolution = bandwidth


for t=1:30
    %Bimodal
[ThPower_Bimodal(:,t), ThFrequency_Bimodal(:,t)] = pwelch(Bimodal_lfptheta(:,t), hann(nfft), nfft/2, nfft, SamplingRate);
[GaPower_Bimodal(:,t), GaFrequency_Bimodal(:,t)] = pwelch(Bimodal_lfpgamma(:,t), hann(nfft), nfft/2, nfft, SamplingRate);

% 
%Supralinear
[ThPower_Supralinear(:,t), ThFrequency_Supralinear(:,t)] = pwelch(Supralinear_lfptheta(:,t), hann(nfft), nfft/2, nfft, SamplingRate);
[GaPower_Supralinear(:,t), GaFrequency_Supralinear(:,t)] = pwelch(Supralinear_lfpgamma(:,t), hann(nfft), nfft/2, nfft, SamplingRate);


%Sublinear
[ThPower_Sublinear(:,t), ThFrequency_Sublinear(:,t)] = pwelch(Sublinear_lfptheta(:,t), hann(nfft), nfft/2, nfft, SamplingRate);
[GaPower_Sublinear(:,t), GaFrequency_Sublinear(:,t)] = pwelch(Sublinear_lfpgamma(:,t), hann(nfft), nfft/2, nfft, SamplingRate);


end

%gamma

%Bimodal
[GammapeakPower_Bimodal, gamma_idx_Bimodal] = max(GaPower_Bimodal, [], 1);
 GammapeakFreq_Bimodal = GaFrequency_Bimodal(gamma_idx_Bimodal,1);

meanGammaPeakFreq_Bimodal = mean(GammapeakFreq_Bimodal)
meanGammaPeakPower_Bimodal = mean(GammapeakPower_Bimodal)
stdGammaPeakFreq_Bimodal = std(GammapeakFreq_Bimodal)
stdGammaPeakPower_Bimodal = std(GammapeakPower_Bimodal)




%Supralinear
%Supralinear
[GammapeakPower_Supralinear, gamma_idx_Supralinear] = max(GaPower_Supralinear, [], 1);
 GammapeakFreq_Supralinear = GaFrequency_Supralinear(gamma_idx_Supralinear,1);

meanGammaPeakFreq_Supralinear = mean(GammapeakFreq_Supralinear)
meanGammaPeakPower_Supralinear = mean(GammapeakPower_Supralinear)
stdGammaPeakFreq_Supralinear = std(GammapeakFreq_Supralinear)
stdGammaPeakPower_Supralinear = std(GammapeakPower_Supralinear)


%Sublinear

% %Sublinear
[GammapeakPower_Sublinear, gamma_idx_Sublinear] = max(GaPower_Sublinear, [], 1);
 GammapeakFreq_Sublinear = GaFrequency_Sublinear(gamma_idx_Sublinear,1);

meanGammaPeakFreq_Sublinear = mean(GammapeakFreq_Sublinear)
meanGammaPeakPower_Sublinear = mean(GammapeakPower_Sublinear)
stdGammaPeakFreq_Sublinear = std(GammapeakFreq_Sublinear)
stdGammaPeakPower_Sublinear = std(GammapeakPower_Sublinear)




%-----------THETA---------------------------------------------------------------------------------------------

%theta

%Bimodal
[thetapeakPower_Bimodal, theta_idx_Bimodal] = max(ThPower_Bimodal, [], 1);
%  thetapeakFreq_Bimodal = ThFrequency_Bimodal(theta_idx_Bimodal,1);

% meanthetaPeakFreq_Bimodal = mean(thetapeakFreq_Bimodal)
meanthetaPeakPower_Bimodal = mean(thetapeakPower_Bimodal)
% stdthetaPeakFreq_Bimodal = std(thetapeakFreq_Bimodal)
stdthetaPeakPower_Bimodal = std(thetapeakPower_Bimodal)

%Supralinear
[thetapeakPower_Supralinear, theta_idx_Supralinear] = max(ThPower_Supralinear, [], 1);
%  thetapeakFreq_Supralinear = ThFrequency_Supralinear(theta_idx_Supralinear,1);

% meanthetaPeakFreq_Supralinear = mean(thetapeakFreq_Supralinear)
meanthetaPeakPower_Supralinear = mean(thetapeakPower_Supralinear)
% stdthetaPeakFreq_Supralinear = std(thetapeakFreq_Supralinear)
stdthetaPeakPower_Supralinear = std(thetapeakPower_Supralinear)

%Sublinear
[thetapeakPower_Sublinear, theta_idx_Sublinear] = max(ThPower_Sublinear, [], 1);
%  thetapeakFreq_Sublinear = ThFrequency_Sublinear(theta_idx_Sublinear,1);

% meanthetaPeakFreq_Sublinear = mean(thetapeakFreq_Sublinear)
meanthetaPeakPower_Sublinear = mean(thetapeakPower_Sublinear)
% stdthetaPeakFreq_Sublinear = std(thetapeakFreq_Sublinear)
stdthetaPeakPower_Sublinear = std(thetapeakPower_Sublinear)
