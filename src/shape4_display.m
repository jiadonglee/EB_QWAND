% shape4_display
% shape plot for lc program
% clear;clc;
%% Environment Setting
% disp('Environment Setting')
path_WDshape='C:\subLinux\WDcode2015';
%lcProg='lcRun';
%% basic parameters setting
% % --------------- general orbit parameters -----------------%
% %Observe Phase
for index=1:4
obs_phase=(index-1)*0.25;  
yrange=[-1.2 1.2];
zrange=[-1 1];

%% LC

    % ------------- edit lcin parameters -------------%
    cd(path_WDshape)
%     disp('lcin editting')
    lcedit_obs_phase_v3(WDshape)
    lcedit_v2015_v3(WD);
    lcin_spotedit1_2015_v3(WD);
    lcin_spotedit2_2015_v3(WD);
    
    % ------------- run lcin & readout the result ------------ %
%         disp('lc running') 
        lcCommond=sprintf('!%s',WD.lcProg);
        %setenv('DYLD_LIBRARY_PATH', '/usr/local/bin')

   
    eval(lcCommond);
    
%     disp('lcout reading')
    YZ=lcoutRead_shape(WD);

mark0=zeros(length(YZ),1);
for i=1:length(YZ)
tmp=sqrt((YZ(:,1)-YZ(i,1)).^2+(YZ(:,2)-YZ(i,2)).^2);
a=find(tmp<0.003);
if length(a)>3
mark0(i)=1;
end
end
figure(2)

switch index
    case 1
        h=subplot('Position',[0.05 0.53 0.45 0.45]);
  
    case 2
        h=subplot('Position',[0.50 0.53 0.45 0.45]);
    case 3
        h=subplot('Position',[0.05 0.05 0.45 0.45]);
    case 4
        h=subplot('Position',[0.50 0.05 0.45 0.45]);
end
mspot = find(mark0 == 1);
mnorm = find(mark0 == 0);
plot(YZ(mnorm,1),YZ(mnorm,2),'.k','MarkerSize',1)
hold on
% plot(YZ(mspot,1),YZ(mspot,2),'*k','Color',[0.5 0.5 0.5])
plot(YZ(mspot,1),YZ(mspot,2),'*k')
hold off
xlim(yrange)
ylim(zrange)
title_str=sprintf('Phase = %3.2f',obs_phase);
title(h,title_str,'position',[0.1,0.8])    

end