% DC Run for WD 2015
function [result,std_test]=dc2015_run(WD,lc_tmp)
% This function is default to be used for Mac OXS, it work on 10.12
% --------- Input --------
%       The stracture variable WD, include the basic infomation described
%       in the main program.
% ---------Output --------
%       the simulated lightcurve

setband(WD.Band,WD.path);
% ------------- edit lcin parameters -------------%
disp('dcin editting')
set_dc_iteration_v3(WD);
dc_dataedit_v3(lc_tmp,WD.path);
dcedit_v2015_v3(WD);
dcin_spotedit1_v3(WD);
dcin_spotedit2_v3(WD);

% ------------- run lcin & readout the result ------------ %
disp('dc running')
% lcCommond=sprintf('!./%s',WD.dcProg);
lcCommond=sprintf('!%s',WD.dcProg);
%setenv('DYLD_LIBRARY_PATH', '/usr/local/bin')  % This line is only for Mac, and should be commented if the OS is Windows/Linux
eval(lcCommond);

disp('dcout reading')
[result,std_test]=dcoutRead_2015_v3(WD.path);


end