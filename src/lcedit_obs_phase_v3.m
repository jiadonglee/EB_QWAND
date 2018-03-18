% Observe phase edit
function []=lcedit_obs_phase_v3(WDshape)
obs_phase=WDshape.phase;
path_WDcode=WDshape.path;
% path_wd='/Users/Solomon/Documents/WDs/WD2015_shapePlot';
cd(path_WDcode)
id=fopen('lcin.active','r+');

for i=1:2
[~]=fgets(id);
end
fseek(id,46,0);
obs=sprintf('%04.3f',obs_phase);
fprintf(id,obs);

fclose(id);
% !open lcin.active
end

