Tx = readtable('2023.7.4 PF saline PETH sum.xlsx', 'Range','A:A');  %Extracted normalized delta F/F data from pmat
Xz = Tx(:,1);                                             %Cloumn A is pseudo timeline
Xz = table2array(Xz);  
Xz = Xz-Xz(1)-5;
T0 = find(Xz>0, 1);
Ts = find(Xz>-5, 1);
Te = find(Xz>5, 1);

Ty = readtable('2023.7.4 PF saline PETH sum.xlsx', 'Range','B:L');  % Each column containing raw data of 'eating trials'
Yz = table2array(Ty);                                 

Y1=Yz(:,1);                                        % Assign each eating trial event             
Y2=Yz(:,2);
Y3=Yz(:,3);
Y4=Yz(:,4);
Y5=Yz(:,5);
Y6=Yz(:,6);
Y7=Yz(:,7);
Y8=Yz(:,8);
Y9=Yz(:,9);
Y10=Yz(:,10);
Y11=Yz(:,11);








Y1baseline = mean(Y1([Ts:T0]));                            % Designation of baseline, which is before eating from -5 seconds to 0 seconds
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



Y1normal = (Y1 - Y1baseline)/Y1baseline;                  % Analysis of normalized z-score of each eating event with baseline
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


Ysum = horzcat(Y1normal,Y2normal,Y3normal,Y4normal,Y5normal,Y6normal,Y7normal,Y8normal,Y9normal,Y10normal,Y11normal);
Ymean = mean (Ysum, 2);
Ystd = std(Ysum, 1 ,2);
Ystd = Ystd/sqrt(11); 
f1= figure;
errorbar(Xz,Ymean,Ystd, 'Color','#82B3ED','LineWidth',1.5,... 
                 'LineStyle', '-');

             
hold on


plot (Xz, Ymean, 'Color','#0078FF','LineWidth',2,...
                 'LineStyle', '-');

title('fiber photometry')
xlabel('time(s)') 
ylabel('Z-score') 
xlim ([Xz(Ts), Xz(Te)]);
ylim ([-2, 2]);

