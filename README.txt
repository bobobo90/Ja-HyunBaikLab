
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
filename='TDT Raw data'; % input Folder pathway (TDT Raw data)
Output= 'Output_name'; %Output name 
TTL = [332.1479
]; %eating time point

data = TDTbin2mat(filename);
Pre = -2; %Time from TTL signal Pre (pre~0s:baseline)
Post = 10; %Time from TTLsignal Post
Data468 = data.streams.Dv2B.data;
Data405 = data.streams.Dv1B.data;
Sampleing_rate_inverse = 1/1017.3;
Time = Pre:Sampleing_rate_inverse:Post;

TimeStamp = (1:length(Data468)) * Sampleing_rate_inverse;

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
preMeanZScores = nan(1, numTrials); % Preallocate for Pre-period mean Z-scores

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
    
    % Store Pre-period mean Z-score
    preMeanZScores(i) = mean((normDatperdf.dff(baselineMask) - dffMeanBaseline) / dffStdBaseline, 'omitnan');
    
    % Fill preallocated matrix
    TTL1_on_dff(1:length(df4), i) = df4; % Handle different lengths
end

% Convert TTL-aligned ΔF/F to a table for easier handling
TTL1_on_dff = array2table(TTL1_on_dff, 'VariableNames', ...
    arrayfun(@(x) sprintf('Trial%d', x), 1:numTrials, 'UniformOutput', false));

% Time vector for ΔF/F plots
alignedTime = linspace(Pre, Post, size(TTL1_on_dff, 1));

% Calculate Post-period mean Z-scores for each trial
postMeanZScores = nan(1, numTrials); % Preallocate
for i = 1:numTrials
    % Identify Post-period time indices
    postMask = (alignedTime >= 0 & alignedTime <= Post); % 0s to Post
    postData = TTL1_on_dff{postMask, i}; % Extract Post-period data
    postMeanZScores(i) = mean(postData, 'omitnan'); % Calculate mean Z-score for Post-period
end

% Save Pre and Post-period mean Z-scores as a table
prePostMeanZScoresTable = table((1:numTrials)', preMeanZScores', postMeanZScores', ...
    'VariableNames', {'Trial', 'Pre_Mean_ZScore', 'Post_Mean_ZScore'});

% Write Pre and Post-period mean Z-scores to CSV
writetable(prePostMeanZScoresTable, [Output '_PrePostMeanZScores.csv']);

% Write full TTL-aligned ΔF/F data to CSV
writetable(TTL1_on_dff, [Output '.csv']);

% Calculate mean and SEM
mean_dff = mean(TTL1_on_dff{:, :}, 2, 'omitnan');
SEM = std(TTL1_on_dff{:, :}, 0, 2, 'omitnan') / sqrt(size(TTL1_on_dff, 2));

% Create heatmap and plot
figure;
colormap redblue;

% Heatmap
subplot(2, 1, 1);
imagesc(TTL1_on_dff{:, :}');
colormap redblue; % Use a colormap for better visualization
colorbar;
xlabel('Time (s)');
ylabel('Trials');
title('Heatmap of ΔF/F aligned to TTL Events');

% Set x-axis ticks based on the time vector
set(gca, 'XTick', linspace(1, size(TTL1_on_dff, 1), 5), 'XTickLabel', linspace(Pre, Post, 5));

% Shaded Error Bar Plot
subplot(2, 1, 2);

% Calculate upper and lower bounds for shaded area
upper_bound = mean_dff + SEM;
lower_bound = mean_dff - SEM;

% Plot shaded error bar
shadedErrorBar(alignedTime, mean_dff, SEM, 'lineprops', '-r', 'patchSaturation', 0.3);

% Add labels and title
xlabel('Time (s)');
ylabel('Mean Z-score');
title('Mean Z-score with SEM');
grid on;

% Save final results
writetable(prePostMeanZScoresTable, [Output '_PrePostMeanZScores.csv']);
writetable(TTL1_on_dff, [Output '.csv']);





