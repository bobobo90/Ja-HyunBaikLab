
We used 'MATLAB R2020a' and 'MATLAB R2024b' software for data analysis.

Video installation instruction of 'MATLAB R2020a' software is linked to:
https://kr.mathworks.com/videos/how-to-install-matlab-1525083586145.html

Typical install time on a "normal" desktop is an hour.


We used 'pmat' for analysis of our fiber photometry data.
Bruno, C. A., O'Brien, C., Bryant, S., Mejaes, J. I., Estrin, D. J., Pizzano, C., & Barker, D. J. (2021). 
pMAT: An open-source software suite for the analysis of fiber photometry data. Pharmacology, 
biochemistry, and behavior, 201, 173093. https://doi.org/10.1016/j.pbb.2020.173093


Normalized delta F/F.csv files of each mouse are exported  by using pMAT.
For installation of pMAT in MATLAB, pMAT should be downloaded from https://github.com/djamesbarker/pMAT and saved to a Windows PC. 
The pmat is executed by putting 'pmat' in the MATLAB command window and pressing enter.
The normalized z-score were calculated by dividing the raw normalized delta F/F signals by the mean signals from –5 s before the food eating events.
For the peri-event time histograms (PETHs), the onsets of each event (biting) were aligned to the time zero and the signals were normalized as [(Zscore – Zscorebaseline)/Zscorebaseline )]. 
Zscorebaseline was the mean of 'normalized delta F/F' for the window before the time zero. 
Eating time point is calculated manually by using video recording.
Excel file containing z-score of all trials for eating point from -5 seconds to +5 seconds was loaded in customized matlab code.
Expected run time for demo on a 'normal' desktop is 15 seconds.

Below is the code used for analyzing 'Peri Event Time Histogram'.

------------------------------------------------------------------------------------------------------------------------------------------------------

filename= 'File_pathway' % input 폴더 (TDT Raw data)
Output= 'Mouse_label' %출력 파일 이름
TTL = []; %eating time point


data = TDTbin2mat(filename);
Pre = -2; 
Post = 10; 
Data468 = data.streams.Dv2B.data;
Data405 = data.streams.Dv1B.data;
Sampleing_rate_inverse = 1/1017.3;
Time = Pre:Sampleing_rate_inverse:Post;

TimeStamp = (1:length(Data468))*Sampleing_rate_inverse;

% Polynomial fitting
reg = polyfit(Data405, Data468, 1);
a = reg(1);
b = reg(2);
ControlFit = a .* Data405 + b;

% Calculate df/f
normDat = (Data468 - ControlFit) ./ ControlFit;
normDatper = normDat * 100;
normDatperdf = table(normDatper, 'VariableNames', {'dff'});
normDatperdf.Time = TimeStamp;


% Initialize results table for TTL-aligned ΔF/F
numTrials = length(TTL); 
maxRows = ceil((Post - Pre) / Sampleing_rate_inverse); % Calculate maximum rows needed
TTL1_on_dff = nan(maxRows, numTrials); % Preallocate for efficiency

for i = 1:numTrials
    % Extract current TTL time
    TTL1_on = TTL(i);
    
    % Logical indexing to extract ΔF/F around the TTL event
    timeMask = (normDatperdf.Time >= (TTL1_on + Pre)) & (normDatperdf.Time <= (TTL1_on + Post));
    df4 = normDatperdf.dff(timeMask);
    
    % Calculate baseline for normalization or z-scoring
    baselineMask = (normDatperdf.Time >= (TTL1_on + Pre)) & (normDatperdf.Time <= TTL1_on);
    dffMeanBaseline = mean(normDatperdf.dff(baselineMask));
    dffStdBaseline = std(normDatperdf.dff(baselineMask));
    
    % Normalize data (Z-scoring)
    df4 = (df4 - dffMeanBaseline) / dffStdBaseline;
    
    % Fill preallocated matrix
    TTL1_on_dff(1:length(df4), i) = df4; % Handle different lengths
end

% Convert TTL-aligned ΔF/F to a table for easier handling
TTL1_on_dff = array2table(TTL1_on_dff, 'VariableNames', ...
    arrayfun(@(x) sprintf('Trial%d', x), 1:numTrials, 'UniformOutput', false));

% Time vector for ΔF/F plots
alignedTime = linspace(Pre, Post, size(TTL1_on_dff, 1));

bindf = TTL1_on_dff;

% Write bindf to CSV
Folders = split(filename,"\");
Folder = Folders(end);
Folder = char(Folder);
writetable(bindf, [Output '.csv']);

% Calculate mean and SEM
mean_dff = mean(bindf{:, 2:end}, 2);
SEM = std(bindf{:, 2:end}, 0, 2) / sqrt(size(bindf, 2) - 1);

bindf2=rows2vars(bindf);

% Define x-axis ticks and labels based on specific Time values
numXTicks = 5; % Number of ticks on the x-axis
xTicksValues = linspace(min(Time), max(Time), numXTicks); % Time values for ticks
xTicks = linspace(min(Time), max(Time), numXTicks);  % Choose time points for ticks
xTickLabels = arrayfun(@(x) sprintf('%.2f', x), xTicks, 'UniformOutput', false);  % Convert to string labels

% Create figure
figure;
colormap redblue;

% Heatmap with transposed bindf
subplot(2, 1, 1);
imagesc(bindf{:, 1:end}');
colormap redblue; % Use a colormap for better visualization
colorbar;
xlabel('Time (s)');
ylabel('Trials');
title('Heatmap of ΔF/F aligned to TTL Events');

% Set x-axis ticks based on the time vector
set(gca, 'XTick', linspace(1, size(TTL1_on_dff, 1), numXTicks), 'XTickLabel', xTickLabels);
% Calculate upper and lower bounds for shaded area
upper_bound = mean_dff + SEM;
lower_bound = mean_dff - SEM;

% Shaded Error Bar Plot
subplot(2, 1, 2);

% Create the shaded area

% Ensure Time matches the data length
Time = linspace(Pre, Post, size(mean_dff, 1))'; % Adjust Time to match data length


% Plot using shadedErrorBar
shadedErrorBar(Time, mean_dff, SEM, 'lineprops', '-r', 'patchSaturation', 0.3);

% Add labels and title
xlabel('Time (s)');
ylabel('Mean Z-score');
title('Mean Z-score with SEM');

% Add grid and adjust limits
grid on;
xlim([min(Time), max(Time)]);
ylim([min(mean_dff - SEM), max(mean_dff + SEM)]);
