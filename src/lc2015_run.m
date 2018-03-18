% LC Run for WD 2015
function [phase,mag]=lc2015_run(WD)
% This function is default to be used for Mac OXS, it work on 10.12
% --------- Input --------
%       The stracture variable WD, include the basic infomation described
%       in the main program.
% ---------Output --------
%       the simulated lightcurve 

setband(WD.Band,WD.path);
    % ------------- edit lcin parameters -------------%
    disp('lcin editting')
    lcedit_v2015_v3(WD);
    lcin_spotedit1_2015_v3(WD);
    lcin_spotedit2_2015_v3(WD);
    
    % ------------- run lcin & readout the result ------------ %
    disp('lc running')
    cd('C:\subLinux\WDcode2015')
        lcCommond=sprintf('!%s',WD.lcProg);
        %setenv('DYLD_LIBRARY_PATH', '/usr/local/bin')  % This line is only for Mac, and should be commented if the OS is Windows/Linux
        eval(lcCommond);
    
    disp('lcout reading')
    [phase,mag]=lcoutRead_2015_v3(WD);
    mag=mag-mag(1);


end