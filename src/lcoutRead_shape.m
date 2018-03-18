% lc shape data read out
function YZ=lcoutRead_shape(WDshape)
% clear;clc;
% path_file='/Users/Solomon/Documents/WDs/WD2015_shapePlot';
path_file = WDshape.path;
cd(path_file)

%% read lcout
id1=fopen('lcout.active','r');
%  database=zeros(101,9);
for i=1:99
    
    temp=fgets(id1);
    n_temp=length(temp);
    if n_temp>10
    if strcmp(temp(4:8),'Y Sky')
    break
    end
    end
end
database=zeros(20000,2);
for i=1:200000
    temp=fgets(id1);
    if length(temp)<9
        break
    end
    x=str2num(temp);
    database(i,1:2)=x(1:2);
end
fclose(id1);
YZ=database(1:i-1,:);

end