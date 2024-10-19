% Example PYRspike_timing_Sublinear structure
% Assuming PYRspike_timing_Sublinear is a 20x15 cell array with spike times in each cell

% Initialize figure
figure;
hold on;

% Loop through each cell and trial
for cell_id = 1:size(PYRspike_timing_Sublinear, 1)
    for trial = 12:12%size(PYRspike_timing_Sublinear, 2)
        spike_times = PYRspike_timing_Sublinear{cell_id, trial}; % Extract spike times for the current cell and trial
        if ~isempty(spike_times)
            % Plot each spike as a point
            for spike = 1:length(spike_times)
                plot(spike_times(spike), cell_id + (trial - 1) * size(PYRspike_timing_Sublinear, 1), 'k.', 'MarkerSize', 10);
            end
        end
    end
end

% Labeling
xlabel('Time (s)');
ylabel('Cell and Trial ID');
title('Raster Plot of Spike Times');

% Customize y-axis
yticks(1:(size(PYRspike_timing_Sublinear, 1) * size(PYRspike_timing_Sublinear, 2)));
yticklabels(arrayfun(@(x) sprintf('Cell %d, Trial %d', mod(x-1, size(PYRspike_timing_Sublinear, 1))+1, floor((x-1) / size(PYRspike_timing_Sublinear, 1))+1), 1:(size(PYRspike_timing_Sublinear, 1) * size(PYRspike_timing_Sublinear, 2)), 'UniformOutput', false));

hold off;
