% q-search strategy
clear;clc

path_WDcode='C:\subLinux\WDcode2015';
path_obs='C:\subLinux\V_v1.dat';
path_dcResult='C:\subLinux\WDcode2015';

WD.path='C:\subLinux\WDcode2015';  % path of Wilson-Devinney code
WD.lcProg='lcrun.exe';  % program name of lc
WD.dcProg='dcrun.exe';  % program name of dc
% set the parameters of spots
%     dcin_spotedit1(path_WDcode,0,0,0,1);
%     dcin_spotedit2(path_WDcode,0,0,0,1);
% -----------
lcProg='lcrun.exe';
dcProg='dcrun.exe';
% set the basic parameters
WD.T1  =7000;
WD.T2  =6770;
WD.INCL=67.70;
% q=0.70:0.0025:0.75;
q = 0.6:0.005:0.7;
q=q';
nIter=2;
niter_str=sprintf('Iteration = %d',nIter);

set_dc_iteration(path_WDcode,nIter);
[~,omiga1,~,omiga2]=critical_potential_F1(q);
omiga0=(omiga1+omiga2)/2;

nq=length(q);
std_search=zeros(nq,1);

for i=1:nq
    tic;
    disp(i)
    disp(niter_str)
    RM=q(i);
    WD.RM = q(i);
    rm_str=sprintf('RM = %4.3f',RM);
    disp(rm_str)
%     [~,omiga1,~,omiga2]=critical_potential_F1(RM);
    POT1=omiga0(i);
    POT2=POT1;
    WD.POT1 = omiga0(i);
    WD.POT2 = WD.POT1;
    disp('EDITING')
%     dcedit_v2015(path_WDcode,INCL,T1,T2,RM,POT1,POT2);
dcedit_v2015_v3(WD);
    dcCommond=sprintf('!%s',dcProg);
    %setenv('DYLD_LIBRARY_PATH', '/usr/local/bin')
    disp('RUNING')
    eval(dcCommond);
    
    disp('READING')
    std_result=dcoutRead_qsearch(path_WDcode);
    std_search(i,1)=min(std_result);
    disp(std_search(i))
    toc;
end

plot(q,std_search)