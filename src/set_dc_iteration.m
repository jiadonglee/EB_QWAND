% set DC iteration
% 0< nIter <100
function set_dc_iteration(path_WDcode,nIter)

% path_WDcode='/Users/Solomon/Documents/WDs/WD2015_Roise';
% nIter=2;

cd(path_WDcode)

id=fopen('dcin.active','r+');
for i=1:3
[~]=fgets(id);
end

fseek(id,73,0);
incl=sprintf('%02d',nIter);
fprintf(id,incl);