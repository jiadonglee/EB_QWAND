% lcin_spot_edit
% for primary star
function []=lcin_spotedit1_2015_v3(WD)

path_file = WD.path;
col=WD.col1;
long=WD.long1;
rad=WD.rad1;
temp=WD.temp1;

id=fopen('lcin.active','r+');
for i=1:8
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
