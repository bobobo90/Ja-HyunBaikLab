Tx = readtable('Figure 4p.xlsx', 'Range','A:A');  %Extracted normalized delta F/F data from pmat
Xz = Tx(:,1);                                     %Cloumn A is pseudo timeline
Xz = table2array(Xz);
Xz = Xz-Xz(1)-5;
T0 = find(Xz>0, 1);
Ts = find(Xz>-5, 1);
Te = find(Xz>5, 1);

Ty = readtable('Figure 4p.xlsx', 'Range','B:BW');  %Extracted normalized delta F/F data from pmat
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
Y23=Yz(:,23);
Y24=Yz(:,24);
Y25=Yz(:,25);
Y26=Yz(:,26);
Y27=Yz(:,27);
Y28=Yz(:,28);
Y29=Yz(:,29);
Y30=Yz(:,30);
Y31=Yz(:,31);
Y32=Yz(:,32);
Y33=Yz(:,33);
Y34=Yz(:,34);
Y35=Yz(:,35);
Y36=Yz(:,36);
Y37=Yz(:,37);
Y38=Yz(:,38);
Y39=Yz(:,39);
Y40=Yz(:,40);
Y41=Yz(:,41);
Y42=Yz(:,42);
Y43=Yz(:,43);
Y44=Yz(:,44);
Y45=Yz(:,45);
Y46=Yz(:,46);
Y47=Yz(:,47);
Y48=Yz(:,48);
Y49=Yz(:,49);
Y50=Yz(:,50);
Y51=Yz(:,51);
Y52=Yz(:,52);
Y53=Yz(:,53);
Y54=Yz(:,54);
Y55=Yz(:,55);
Y56=Yz(:,56);
Y57=Yz(:,57);
Y58=Yz(:,58);
Y59=Yz(:,59);
Y60=Yz(:,60);
Y61=Yz(:,61);
Y62=Yz(:,62);
Y63=Yz(:,63);
Y64=Yz(:,64);
Y65=Yz(:,65);
Y66=Yz(:,66);
Y67=Yz(:,67);
Y68=Yz(:,68);
Y69=Yz(:,69);
Y70=Yz(:,70);
Y71=Yz(:,71);
Y72=Yz(:,72);
Y73=Yz(:,73);
Y74=Yz(:,74);




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
Y23baseline = mean(Y23([Ts:T0]));
Y24baseline = mean(Y24([Ts:T0]));
Y25baseline = mean(Y25([Ts:T0]));
Y26baseline = mean(Y26([Ts:T0]));
Y27baseline = mean(Y27([Ts:T0]));
Y28baseline = mean(Y28([Ts:T0]));
Y29baseline = mean(Y29([Ts:T0]));
Y30baseline = mean(Y30([Ts:T0]));
Y31baseline = mean(Y31([Ts:T0]));
Y32baseline = mean(Y32([Ts:T0]));
Y33baseline = mean(Y33([Ts:T0]));
Y34baseline = mean(Y34([Ts:T0]));
Y35baseline = mean(Y35([Ts:T0]));
Y36baseline = mean(Y36([Ts:T0]));
Y37baseline = mean(Y37([Ts:T0]));
Y38baseline = mean(Y38([Ts:T0]));
Y39baseline = mean(Y39([Ts:T0]));
Y40baseline = mean(Y40([Ts:T0]));
Y41baseline = mean(Y41([Ts:T0]));
Y42baseline = mean(Y42([Ts:T0]));
Y43baseline = mean(Y43([Ts:T0]));
Y44baseline = mean(Y44([Ts:T0]));
Y45baseline = mean(Y45([Ts:T0]));
Y46baseline = mean(Y46([Ts:T0]));
Y47baseline = mean(Y47([Ts:T0]));
Y48baseline = mean(Y48([Ts:T0]));
Y49baseline = mean(Y49([Ts:T0]));
Y50baseline = mean(Y50([Ts:T0]));
Y51baseline = mean(Y51([Ts:T0]));
Y52baseline = mean(Y52([Ts:T0]));
Y53baseline = mean(Y53([Ts:T0]));
Y54baseline = mean(Y54([Ts:T0]));
Y55baseline = mean(Y55([Ts:T0]));
Y56baseline = mean(Y56([Ts:T0]));
Y57baseline = mean(Y57([Ts:T0]));
Y58baseline = mean(Y58([Ts:T0]));
Y59baseline = mean(Y59([Ts:T0]));
Y60baseline = mean(Y60([Ts:T0]));
Y61baseline = mean(Y61([Ts:T0]));
Y62baseline = mean(Y62([Ts:T0]));
Y63baseline = mean(Y63([Ts:T0]));
Y64baseline = mean(Y64([Ts:T0]));
Y65baseline = mean(Y65([Ts:T0]));
Y66baseline = mean(Y66([Ts:T0]));
Y67baseline = mean(Y67([Ts:T0]));
Y68baseline = mean(Y68([Ts:T0]));
Y69baseline = mean(Y69([Ts:T0]));
Y70baseline = mean(Y70([Ts:T0]));
Y71baseline = mean(Y71([Ts:T0]));
Y72baseline = mean(Y72([Ts:T0]));
Y73baseline = mean(Y73([Ts:T0]));
Y74baseline = mean(Y74([Ts:T0]));



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
Y23normal = (Y23 - Y23baseline)/Y23baseline;
Y24normal = (Y24 - Y24baseline)/Y24baseline;
Y25normal = (Y25 - Y25baseline)/Y25baseline;
Y26normal = (Y26 - Y26baseline)/Y26baseline;
Y27normal = (Y27 - Y27baseline)/Y27baseline;
Y28normal = (Y28 - Y28baseline)/Y28baseline;
Y29normal = (Y29 - Y29baseline)/Y29baseline;
Y30normal = (Y30 - Y30baseline)/Y30baseline;
Y31normal = (Y31 - Y31baseline)/Y31baseline;
Y32normal = (Y32 - Y32baseline)/Y32baseline;
Y33normal = (Y33 - Y33baseline)/Y33baseline;
Y34normal = (Y34 - Y34baseline)/Y34baseline;
Y35normal = (Y35 - Y35baseline)/Y35baseline;
Y36normal = (Y36 - Y36baseline)/Y36baseline;
Y37normal = (Y37 - Y37baseline)/Y37baseline;
Y38normal = (Y38 - Y38baseline)/Y38baseline;
Y39normal = (Y39 - Y39baseline)/Y39baseline;
Y40normal = (Y40 - Y40baseline)/Y40baseline;
Y41normal = (Y41 - Y41baseline)/Y41baseline;
Y42normal = (Y42 - Y42baseline)/Y42baseline;
Y43normal = (Y43 - Y43baseline)/Y43baseline;
Y44normal = (Y44 - Y44baseline)/Y44baseline;
Y45normal = (Y45 - Y45baseline)/Y45baseline;
Y46normal = (Y46 - Y46baseline)/Y46baseline;
Y47normal = (Y47 - Y47baseline)/Y47baseline;
Y48normal = (Y48 - Y48baseline)/Y48baseline;
Y49normal = (Y49 - Y49baseline)/Y49baseline;
Y50normal = (Y50 - Y50baseline)/Y50baseline;
Y51normal = (Y51 - Y51baseline)/Y51baseline;
Y52normal = (Y52 - Y52baseline)/Y52baseline;
Y53normal = (Y53 - Y53baseline)/Y53baseline;
Y54normal = (Y54 - Y54baseline)/Y54baseline;
Y55normal = (Y55 - Y55baseline)/Y55baseline;
Y56normal = (Y56 - Y56baseline)/Y56baseline;
Y57normal = (Y57 - Y57baseline)/Y57baseline;
Y58normal = (Y58 - Y58baseline)/Y58baseline;
Y59normal = (Y59 - Y59baseline)/Y59baseline;
Y60normal = (Y60 - Y60baseline)/Y60baseline;
Y61normal = (Y61 - Y61baseline)/Y61baseline;
Y62normal = (Y62 - Y62baseline)/Y62baseline;
Y63normal = (Y63 - Y63baseline)/Y63baseline;
Y64normal = (Y64 - Y64baseline)/Y64baseline;
Y65normal = (Y65 - Y65baseline)/Y65baseline;
Y66normal = (Y66 - Y66baseline)/Y66baseline;
Y67normal = (Y67 - Y67baseline)/Y67baseline;
Y68normal = (Y68 - Y68baseline)/Y68baseline;
Y69normal = (Y69 - Y69baseline)/Y69baseline;
Y70normal = (Y70 - Y70baseline)/Y70baseline;
Y71normal = (Y71 - Y71baseline)/Y71baseline;
Y72normal = (Y72 - Y72baseline)/Y72baseline;
Y73normal = (Y73 - Y73baseline)/Y73baseline;
Y74normal = (Y74 - Y74baseline)/Y74baseline;


Ysum = horzcat(Y1normal,Y2normal,Y3normal,Y4normal,Y5normal,Y6normal,Y7normal,Y8normal,Y9normal,Y10normal,Y11normal,Y12normal,Y13normal,Y14normal,Y15normal,Y16normal,Y17normal,Y18normal,Y19normal,Y20normal,Y21normal,Y22normal,Y23normal,Y24normal,Y25normal,Y26normal,Y27normal,Y28normal,Y29normal,Y30normal,Y31normal,Y32normal,Y33normal,Y34normal,Y35normal,Y36normal,Y37normal,Y38normal,Y39normal,Y40normal,Y41normal,Y42normal,Y43normal,Y44normal,Y45normal,Y46normal,Y47normal,Y48normal,Y49normal,Y50normal,Y51normal,Y52normal,Y53normal,Y54normal,Y55normal,Y56normal,Y57normal,Y58normal,Y59normal,Y60normal,Y61normal,Y62normal,Y63normal,Y64normal,Y65normal,Y66normal,Y67normal,Y68normal,Y69normal,Y70normal,Y71normal,Y72normal,Y73normal,Y74normal);
Ymean = mean (Ysum, 2);
Ymean = mean (Ysum, 2);
Ystd = std(Ysum, 1 ,2);
Ystd = Ystd/sqrt(74);
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



