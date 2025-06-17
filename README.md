# README
We used 'MATLAB R2020a' and'MATLAB R2024b' software for data analysis.

Video installation instruction of 'MATLAB R2020a' software is linked to:
https://kr.mathworks.com/videos/how-to-install-matlab-1525083586145.html

Typical install time on a "normal" desktop is an hour.


We used 'pmat' for analysis of our fiber photometry data.
Bruno, C. A., O'Brien, C., Bryant, S., Mejaes, J. I., Estrin, D. J., Pizzano, C., & Barker, D. J. (2021). 
pMAT: An open-source software suite for the analysis of fiber photometry data. Pharmacology, 
biochemistry, and behavior, 201, 173093. https://doi.org/10.1016/j.pbb.2020.173093


Normalized delta F/F.csv files of each mouse are exported  by using pMAT.
For installation of pMAT in MATLAB, pMAT should be downloaded from https://github.com/djamesbarker/pMAT and saved to a Windows PC. 
The pMAT is executed by putting 'pMAT' in the MATLAB command window and pressing enter.
The normalized z-score were calculated by dividing the raw normalized delta F/F signals by the mean signals from –5 s before the food eating events.
For the peri-event time histograms (PETHs), the onsets of each event (biting) were aligned to the time zero and the signals were normalized as [(Zscore – Zscorebaseline)/Zscorebaseline )]. 
Zscore baseline was the mean of 'normalized delta F/F' for the window before the time zero. 
Eating time point is calculated manually by using video recording.
Excel file containing z-score of all trials for eating point from -5 seconds to +5 seconds was loaded in customized matlab code.
Expected run time for demo on a 'normal' desktop is 15 seconds.
Expected graph is attatched by 'Expected output_NCOMMS-23-28262.fig' and 'Expected output_NCOMMS-23-28262.jpg'.

