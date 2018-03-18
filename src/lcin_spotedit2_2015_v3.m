% lcin_spot_edit
% for primary star
function []=lcin_spotedit2_2015_v3(WD)
path_file = WD.path;
cd(WD.path);
col=WD.col2;
long=WD.long2;
rad=WD.rad2;
temp=WD.temp2;

% id=fopen([path_file 'lcin.active'],'r+');
id=fopen('lcin.active','r+');
for i=1:9
    [~]=fgets(id);
%     if strcmp(tmp(1:3),'300')==1;
%         break
%     end
end
fseek(id,2,0);
spot_str=sprintf('%06.5f  %06.5f  %06.5f  %06.5f',col,long,rad,temp);
fprintf(id,spot_str);
fclose(id);
end
