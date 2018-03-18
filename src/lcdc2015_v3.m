% lc_matlab_2015
% Version 3.0
% Lastest Edition : 2016-11-25
% This program is a suppor for the WD2015 code, you can modify some crucial
% parameters of the code. Observation data input is also availibale in the
% code.

% Note: for Kepler data, you need to use DELPH and NGA to control the
% smearing

clear;clc;
%% Environment Setting
% Path setting
disp('Environment Setting')
WD.path='C:\subLinux\WDcode2015';  % path of Wilson-Devinney code
%WD.lcProg='lc14june2015flop.exe';  % program name of lc
%WD.dcProg='dc22may2015flop.exe';  % program name of dc
 WD.lcProg='lcrun.exe';  % program name of lc
 WD.dcProg='dcrun.exe';  % program name of dc
% Basic parameters

ifomiga    = 1;
iflc       = 1;
ifdc       = 0;
ifshape    = 1;


%% obital and physic parameters setting
% --------------- general orbit parameters -----------------%
WD.RM  =0.725;   %Mass Ratio 
WD.INCL=67.60;   %Inclination
WD.T1  =5920;    %Effective Temperature of Primary Star
WD.T2  =5695;    %Effective Temperature of Secondary Star
WD.POT1=3.1999;  %STAR 1 modified surface potential
WD.POT2=WD.POT1; %STAR 2 modified surface potential
%% star spots1
WD.col1=30/180*pi;      %colatitude  
WD.long1=175/180*pi;    %longtitude  
WD.rad1=27/180*pi;     %radius
WD.temp1=0.93;          %Temperature factor
%% star spots2
WD.col2=0/180*pi;  %colatitude    
WD.long2=0/180*pi;%longtitude
WD.rad2=0/180*pi;  %radius
WD.temp2= 1.00;      %Temperature
%% observational data parameters
obsdata.path    = 'C:\subLinux\V_v1.dat';
obsdata.numTime = 1;    % colume number of Time(Phase) 
obsdata.numMag  = 2;    % colume number of Magnitude
% obsdata.phase_shift   = -0.0013 ;
% obsdata.mag_shift     = -0.00; 
obsdata.phase_shift   = 0.015;
obsdata.mag_shift     = -0.01; 
obsdata.type          = 'phase';
lc_tmp=standard_lc(obsdata);
%% other parameters
WD.Band    = 7;     % The filter of simulation data, B-6,V-7,R-8,I-10,Kepler-26
WD.nIter = 1;       % The loops of dc
WDshape = WD;
WDshape.path = 'C:\subLinux\WD2015_shapePlot\';
WDshape.phase = 0.00;

%% ------------------ Standardizing the input lightcurve and generate the simulated lightcurve  ------------- 
if iflc==1    
    [phase_simu,mag_simu]=lc2015_run(WD) ;
    % Compare the simulated lightcurve and the observational lightcurve
    yy = interp1(phase_simu,mag_simu,lc_tmp(:,1));
    dlc= lc_tmp(:,2)-yy-5;
    sigma=std(dlc);
    disp(['Sigma=' num2str(sigma)])
end
%% The infomation of omiga (Only for the contact binary)
if ifomiga==1
[~,omiga1,~,omiga2]=critical_potential_F1(WD.RM);
f = (omiga1-WD.POT1) / (omiga1-omiga2);
disp(['omiga1=' num2str(omiga1)])
disp(['omiga2=' num2str(omiga2)])
disp(['f=' num2str(f)])
end
%% Show the LC result in the figure
if iflc==1
phase_range = [-0.1 1.1];
mag_range1  = [4.4 5.1];
mag_range2  = [-0.1 0.1];
lc_result_plot(lc_tmp,dlc,phase_simu,mag_simu+5,phase_range,mag_range1,mag_range2)
% lc_result_plot_paper(lc_tmp,dlc,phase_simu,mag_simu+5,phase_range,mag_range1,mag_range2)
end
%% Show the shape of the system
%==========================================================================
%==========================================================================
switch ifshape
    case 0
    case 1
for subpl = 1:4
        YZ = shape_disp_v3(WDshape);
        
        mark0=zeros(length(YZ),1);
for i=1:length(YZ)
tmp=sqrt((YZ(:,1)-YZ(i,1)).^2+(YZ(:,2)-YZ(i,2)).^2);
a=find(tmp<0.003);
if length(a)>1
mark0(i)=1;
end
end
figure(2)
% subplot(2,2,subpl)
% scatter(YZ(:,1),YZ(:,2),[],mark0)
switch subpl
    case 1
        h=subplot('Position',[0.05 0.53 0.45 0.45]);
        scatter(YZ(:,1),YZ(:,2),[],mark0,'.')
        title_text=sprintf('Phase = %04.2f',WDshape.phase);
        title(title_text)
    case 2
        h=subplot('Position',[0.50 0.53 0.45 0.45]);
        scatter(YZ(:,1),YZ(:,2),[],mark0,'.')
        title_text=sprintf('Phase = %04.2f',WDshape.phase);
        title(title_text)
    case 3
        h=subplot('Position',[0.05 0.05 0.45 0.45]);
        scatter(YZ(:,1),YZ(:,2),[],mark0,'.')
        title_text=sprintf('Phase = %04.2f',WDshape.phase);
        title(title_text)
    case 4
        h=subplot('Position',[0.50 0.05 0.45 0.45]);
        scatter(YZ(:,1),YZ(:,2),[],mark0,'.')
        title_text=sprintf('Phase = %04.2f',WDshape.phase);
        title(title_text)
end


% xlim(yrange)
% ylim(zrange)
% set(gca,'Fontname','Times New Roman','FontSize',15)
% xlabel('Y Sky Coordinate','FontSize',15,'Fontname','Times New Roman')  
% ylabel('Z Sky Coordinate','FontSize',15,'Fontname','Times New Roman')
% title_text=sprintf('Phase = %04.3f',obs_phase);
% title(title_text)
WDshape.phase = WDshape.phase + 0.25;
 end
    case 4
    
end
%% Correct the results by DC
if ifdc==1
tic
[result,std_test]=dc2015_run(WD,lc_tmp);
disp('DC complete!')
disp(result)
disp(std_test)
toc
end
%%
% simu = [phase_simu,mag_simu];
% temp = [lc_tmp,dlc];
% save('simu_R.txt', 'simu', '-ASCII')
% save('temp_R.txt','temp','-ASCII')