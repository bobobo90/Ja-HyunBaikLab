Tx = readtable('Figure 4f.xlsx', 'Range','A:A');  %Extracted normalized delta F/F data from pmat
Xz = Tx(:,1);                                     %Cloumn A is pseudo timeline
Xz = table2array(Xz);
Xz = Xz-Xz(1)-5;
T0 = find(Xz>0, 1);
Ts = find(Xz>-5, 1);
Te = find(Xz>5, 1);

Ty = readtable('Figure 4f.xlsx', 'Range','B:Q');  %Extracted normalized delta F/F data from pmat
Yz = table2array(Ty);

Y1=Yz(:,1);                                         % Assign each eating trial event      
Y2=Yz(:,2);
Y3=Yz(:,3);
Y4=Yz(:,4);
Y5=Yz(:,5);
Y6=Yz(:,6);
Y7=Yz(:,7);
Y8=Yz(:,8);
Y9=Yz(:,9);
Y9=Yz(:,9);
Y10=Yz(:,10);
Y11=Yz(:,11);
Y12=Yz(:,12);
Y13=Yz(:,13);
Y14=Yz(:,14);
Y15=Yz(:,15);
Y16=Yz(:,16);
Y17=Yz(:,17);
Y18=Yz(:,18);
Y19=Yz(:,19);
Y20=Yz(:,20);
Y21=Yz(:,21);
Y22=Yz(:,22);




Y1baseline = mean(Y1([Ts:T0]));                             % Designation of baseline, which is before eating from -5 seconds to 0 seconds
Y2baseline = mean(Y2([Ts:T0]));
Y3baseline = mean(Y3([Ts:T0]));
Y4baseline = mean(Y4([Ts:T0]));
Y5baseline = mean(Y5([Ts:T0]));
Y6baseline = mean(Y6([Ts:T0]));
Y7baseline = mean(Y7([Ts:T0]));
Y8baseline = mean(Y8([Ts:T0]));
Y9baseline = mean(Y9([Ts:T0]));
Y10baseline = mean(Y10([Ts:T0]));
Y11baseline = mean(Y11([Ts:T0]));
Y12baseline = mean(Y12([Ts:T0]));
Y13baseline = mean(Y13([Ts:T0]));
Y14baseline = mean(Y14([Ts:T0]));
Y15baseline = mean(Y15([Ts:T0]));
Y16baseline = mean(Y16([Ts:T0]));
Y17baseline = mean(Y17([Ts:T0]));
Y18baseline = mean(Y18([Ts:T0]));
Y19baseline = mean(Y19([Ts:T0]));
Y20baseline = mean(Y20([Ts:T0]));
Y21baseline = mean(Y21([Ts:T0]));
Y22baseline = mean(Y22([Ts:T0]));


Y1normal = (Y1 - Y1baseline)/Y1baseline;                         % Analysis of normalized z-score of each eating event with baseline
Y2normal = (Y2 - Y2baseline)/Y2baseline;
Y3normal = (Y3 - Y3baseline)/Y3baseline;
Y4normal = (Y4 - Y4baseline)/Y4baseline;
Y5normal = (Y5 - Y5baseline)/Y5baseline;
Y6normal = (Y6 - Y6baseline)/Y6baseline;
Y7normal = (Y7 - Y7baseline)/Y7baseline;
Y8normal = (Y8 - Y8baseline)/Y8baseline;
Y9normal = (Y9 - Y9baseline)/Y9baseline;
Y10normal = (Y10 - Y10baseline)/Y10baseline;
Y11normal = (Y11 - Y11baseline)/Y11baseline;
Y12normal = (Y12 - Y12baseline)/Y12baseline;
Y13normal = (Y13 - Y13baseline)/Y13baseline;
Y14normal = (Y14 - Y14baseline)/Y14baseline;
Y15normal = (Y15 - Y15baseline)/Y15baseline;
Y16normal = (Y16 - Y16baseline)/Y16baseline;
Y17normal = (Y17 - Y17baseline)/Y17baseline;
Y18normal = (Y18 - Y18baseline)/Y18baseline;
Y19normal = (Y19 - Y19baseline)/Y19baseline;
Y20normal = (Y20 - Y20baseline)/Y20baseline;
Y21normal = (Y21 - Y21baseline)/Y21baseline;
Y22normal = (Y22 - Y22baseline)/Y22baseline;


Ysum = horzcat(Y1normal,Y2normal,Y3normal,Y4normal,Y5normal,Y6normal,Y7normal,Y8normal,Y9normal,Y10normal,Y11normal,Y12normal,Y13normal,Y14normal,Y15normal,Y16normal,Y17normal,Y18normal,Y19normal,Y20normal,Y21normal,Y22normal);
Ymean = mean (Ysum, 2);
Ymean = mean (Ysum, 2);
Ystd = std(Ysum, 1 ,2);
Ystd = Ystd/sqrt(22);
f1= figure;
f2= figure;
errorbar(Xz, Ymean,zeros(size(Ystd)), Ystd, 'Color', '#FFE0B2', 'LineWidth', 0.1, 'LineStyle', '-');

             
hold on


plot (Xz, Ymean, 'Color','#E65100','LineWidth',2,...
                 'LineStyle', '-');

title('Fiber photometry')
xlabel('time(s)') 
ylabel('Z-score') 
xlim ([Xz(Ts), Xz(Te)]);
ylim ([-2, 2]);

figure(f1)

plot (Xz, Ysum, 'Color','#B4E5FF','LineWidth',1,...%#6937a1
                 'LineStyle', '-');
xline(0,'--r');
yline(0,'-');
title('Fiber photometry')
xlabel('time(s)') 
ylabel('Z-score') 
xlim ([Xz(Ts), Xz(Te)]);



