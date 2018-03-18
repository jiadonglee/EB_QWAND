% dcout read for qsearch
function std_result=dcoutRead_qsearch(path_WDcode)
% clear;clc;
% path_WDcode='/Users/Solomon/Documents/WDs/WD2015_Roise';
% cd(path_WDcode)
id1=fopen('dcout.active','r');

kround=1;
while ~feof(id1)
        current_line=fgets(id1);
if length(current_line)>16
        if strcmp(current_line(1:16),'   Mean residual')
            current_line=fgets(id1);
            std_test=str2num(current_line);
            std_result(kround,1)=std_test(1);
            kround=kround+1;
        end
end  
end

% I(1)=0.0885;
% for n=2:10,
%     I(n)=1/n-5*I(n-1);
% end
