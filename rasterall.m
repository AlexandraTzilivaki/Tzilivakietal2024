% Example data structure
% PVspike_timing_Sublinear: 20x15 cell array for first cell type
% PYRspike_timing_Sublinear: 2x15 cell array for second cell type

% Initialize figure
figure;
hold on;

% Plot data for the first cell type
for cell_id = 1:size(PVspike_timing_Sublinear, 1)
    for trial = 16:16%size(PVspike_timing_Sublinear, 2)
        spike_times = PVspike_timing_Sublinear{cell_id, trial}; % Extract spike times for the current cell and trial
        if ~isempty(spike_times)
            % Plot each spike as a point
            for spike = 1:length(spike_times)
                plot(spike_times(spike), cell_id + (trial - 1) * size(PVspike_timing_Sublinear, 1), 'k.', 'MarkerSize', 10);
            end
        end
    end
end

% Offset for the second cell type
offset = size(PVspike_timing_Sublinear, 1) * size(PVspike_timing_Sublinear, 2);

% Plot data for the second cell type
for cell_id = 1:size(PYRspike_timing_Sublinear, 1)
    for trial = 12:12%size(PYRspike_timing_Sublinear, 2)
        spike_times = PYRspike_timing_Sublinear{cell_id, trial}; % Extract spike times for the current cell and trial
        if ~isempty(spike_times)
            % Plot each spike as a point
            for spike = 1:length(spike_times)
                plot(spike_times(spike), offset + cell_id + (trial - 1) * size(PYRspike_timing_Sublinear, 1), 'r.', 'MarkerSize', 10);
            end
        end
    end
end

% Labeling
% xlabel('Time (s)');
% ylabel('Cell and Trial ID');
% title('Raster Plot of Spike Times for Both Cell Types');
% 
% % Customize y-axis
% yticks(1:(offset + size(PYRspike_timing_Sublinear, 1) * size(PYRspike_timing_Sublinear, 2)));
% yticklabels(arrayfun(@(x) sprintf('Cell %d, Trial %d', mod(x-1, size(PVspike_timing_Sublinear, 1)+size(PYRspike_timing_Sublinear, 1))+1, floor((x-1) / (size(PVspike_timing_Sublinear, 1)+size(PYRspike_timing_Sublinear, 1)))+1), 1:(offset + size(PYRspike_timing_Sublinear, 1) * size(PYRspike_timing_Sublinear, 2)), 'UniformOutput', false));
% 
xlim([1000 8000])
hold off;
