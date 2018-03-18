function [result,std_test]=dcoutRead_2015_v3(path_WDcode)
% path_WDcode='/Users/Solomon/Documents/WD2015_Roise';
cd(path_WDcode)
id1=fopen('dcout.active','r');
mark=1;
mark1=0;
result=[];
while mark==1
    current_line=fgets(id1);
    if length(current_line)>46
        if strcmp(current_line(1:46),'                      Input-Output in D Format')
            mark1=1;
            current_line=fgets(id1);current_line=fgets(id1);
        end
    end
    while mark1==1;
        current_line=fgets(id1);
        if length(current_line)>5
            tmp_result=str2num(current_line);
            result=[result;tmp_result(1:6)];
        else
        mark1=0;
        current_line=fgets(id1);
        end
        
    end
    
    if length(current_line)>16
        if strcmp(current_line(1:16),'   Mean residual')
            mark=0;
            current_line=fgets(id1);
            std_test=str2num(current_line);
        end
    end
end


end