% dcin data input
% band VRI
% clear;clc;
% path_data='/Users/Solomon/Documents/Projects/EBcode_latest_version/R.dat';
% path_WDcode='/Users/Solomon/Documents/WDs/WD2015_GSC0301R';
% file_v='R.dat';
% path_dcin='/Users/Solomon/Documents/lcdc2007';
function []=dc_dataedit_v3(lc_tmp,path_WDcode)

nV=length(lc_tmp);
lc_tmp=sortrows(lc_tmp);
cd(path_WDcode);
id0=fopen('dcin.active_tmp','w');
id1=fopen('dcin.active','r');

mark=0;
while ~feof(id1)
    cline = fgets(id1);
    
    if length(cline)>=4
        if strcmp(cline(1:4),'300.')==1
        mark=mark+1;
        end
    end
    
  fprintf(id0,'%s',cline);
    if mark == 2
    cline = fgets(id1);
    fprintf(id0,'%s',cline);    
%%  Write the data
        for i=1:nV
    a=sprintf('       %06.5f  ',lc_tmp(i,1));
    if lc_tmp(i,2)>=0
        b=sprintf(' %07.6f',lc_tmp(i,2));
    else
        b=sprintf('%-07.6f',lc_tmp(i,2));
    end
    if lc_tmp(i,1)>0 && lc_tmp(i,1)<0.5
    cline=sprintf('%s%s   %04.3f\n',a,b,1.000);
    else
        cline=sprintf('%s%s   %04.3f\n',a,b,1.000);
    end
    fprintf(id0,cline);
         end
fprintf(id0,'  -10001.00000\n');
fprintf(id0,' 2');
break
%%
     end
       
end

fclose all;

%%
% id1=fopen('dcin.active_tmp','r+');
% while ~feof(id1)
%     cline = fgets(id1);
%     if length(cline)>13
%         if strcmp(cline(1:14),'  -10001.00000')==1
%             fprintf(id1,'       0.50000     2      0.50107                     \n');
%             fprintf(id1,'     -10001.                                                                                                                                           \n');
%             fprintf(id1,' 2');
%         end
%     end
% 
% end
fclose all;
copyfile('dcin.active_tmp','dcin.active')
