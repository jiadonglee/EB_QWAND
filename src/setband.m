% set band for dcin.active and lcin.active

function []=setband(Band,path_WDcode)
% clear;clc;
% path_WDcode='/Users/Solomon/Downloads';
% Band =1;
cd(path_WDcode)
%% LC
id=fopen('lcin.active','r+');

for i=1:7
    [~]=fgets(id);
end

fseek(id,1,0);
Bandstr=sprintf('%02d',Band);
fprintf(id,Bandstr);

fclose(id);
%% DC
id=fopen('dcin.active','r+');
for i=1:12
    [~]=fgets(id);
end

fseek(id,1,0);
Bandstr=sprintf('%02d',Band);
fprintf(id,Bandstr);

fclose(id);

end
