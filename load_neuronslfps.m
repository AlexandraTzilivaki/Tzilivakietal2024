
% Script 1. Load neurons oltage data and calclulate number of spikes, mean
% and sts. Load and bandpass (at theta and gamma) LFP data



% SamplingRate=10000
% SR=0.4; % desired spectral resolution (Hz)
% nfft = 0.1*SamplingRate/SR; % length of fft (samples)
% nfft = 2^nextpow2(nfft); % round to nearest power of 2
% bw = SamplingRate / nfft; % actual resolution = bandwidth
% 


experiment='bimodal';


%load pv voltage data and calculate number of spikes
pvn=0:1;
for interneuron=1:2
for runs=1:15
    Bimodal_PV{interneuron,runs}=load(sprintf('../Robustness/Synapses/%s/pvsoma_%d_trial_%d.dat',experiment, pvn(interneuron),runs));
   [PVnumber_of_spikes_Bimodal(interneuron,runs),PVspike_timing_Bimodal{interneuron,runs}]=spike_count(Bimodal_PV{interneuron,runs});

    
end
end
PV_Bimodal_meanspikes=mean(PVnumber_of_spikes_Bimodal',2)
PV_Bimodal_stdspikes=std(PVnumber_of_spikes_Bimodal)




%load pyr voltage data and calculate number of spikes
pyr=0:19;
for pyramid=1:20
for runs=1:15
    Bimodal_PYR{pyramid,runs}=load(sprintf('../Robustness/Synapses/%s/pyrsoma_%d_trial_%d.dat',experiment, pyr(pyramid),runs));
   [PYRnumber_of_spikes_Bimodal(pyramid,runs),PYRspike_timing_Bimodal{pyramid,runs}]=spike_count(Bimodal_PYR{pyramid,runs});

    
end
end

PYR_Bimodal_meanspikes=mean(PYRnumber_of_spikes_Bimodal',2)
PYR_Bimodal_stdspikes=std(PYRnumber_of_spikes_Bimodal)


%load and bandpass LFP
for runs=1:15
  
       
Bimodal_lfp(:,runs)=load(sprintf('../Robustness/Synapses/%s/lfp_trial_%d.dat',experiment, runs));
  
Bimodal_lfptheta(:,runs)=bandpass(Bimodal_lfp(:,runs),[3 10],10000);
Bimodal_lfpgamma(:,runs)=bandpass(Bimodal_lfp(:,runs),[30 200],10000);

end