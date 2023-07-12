Tx = readtable('Figure 4e-f.xlsx', 'Range','A:A');  %pmat으로 추출한 data csv 파일 이름 입력
Xz = Tx(:,1);
Xz = table2array(Xz);
Xz = Xz-Xz(1)-5;
T0 = find(Xz>0, 1);
Ts = find(Xz>-5, 1);
Te = find(Xz>5, 1);

Ty = readtable('Figure 4e-f.xlsx', 'Range','B:E');  %pmat으로 추출한 data csv 파일 이름 입력
Yz = table2array(Ty);

Y1=Yz(:,1);
Y2=Yz(:,2);
Y3=Yz(:,3);
Y4=Yz(:,4);





Y1baseline = mean(Y1([Ts:T0]));
Y2baseline = mean(Y2([Ts:T0]));
Y3baseline = mean(Y3([Ts:T0]));
Y4baseline = mean(Y4([Ts:T0]));




Y1normal = (Y1 - Y1baseline)/Y1baseline;
Y2normal = (Y2 - Y2baseline)/Y2baseline;
Y3normal = (Y3 - Y3baseline)/Y3baseline;
Y4normal = (Y4 - Y4baseline)/Y4baseline;



Ysum = horzcat(Y1normal,Y2normal,Y3normal,Y4normal);
Ymean = mean (Ysum, 2);
Ystd = std(Ysum, 1 ,2);
Ystd = Ystd/sqrt(4); 
f1= figure;

errorbar(Xz,Ymean,Ystd, 'Color','#82B3ED','LineWidth',1.5,... %#DEC1DE
                 'LineStyle', '-');

             
hold on


plot (Xz, Ymean, 'Color','#0078FF','LineWidth',2,...
                 'LineStyle', '-');

title('fiber photometry')
xlabel('time(s)') 
ylabel('Z-score') 
xlim ([Xz(Ts), Xz(Te)]);
ylim ([-6, 6]);



