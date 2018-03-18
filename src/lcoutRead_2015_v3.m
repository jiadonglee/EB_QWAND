% lcout read

function [phase,mag]=lcoutRead_2015_v3(WD)
path_file = WD.path;
cd(WD.path)
%% read lcout
% id1=fopen([path_file 'lcout.active'],'r');
id1=fopen('lcout.active','r');
database=zeros(101,7);
for i=1:99
    
    temp=fgets(id1);
    n_temp=length(temp);
    if n_temp>10
    if strcmp(temp(7:8),'JD')
    break
    end
    end
end
for i=1:2000
    temp=fgets(id1);
    if length(temp)<9
        break
    end
    x=str2num(temp);
    database(i,1:9)=x(1:9);
end
phase=database(:,2);
mag=database(:,9);
fclose(id1);

%% INCL M1/M2 T1 T2
% id2=fopen('lcin.active','r');
% for i=1:4
%     [~]=fgets(id2);
% end
% 
% fseek(id2,52,0);
% incl=fscanf(id2,'%f',[1,1]);
% in=num2str(incl);
% temp=fgets(id2);
% T=fscanf(id2,'%f %f',[1,2]);
% t1=num2str(T(1));
% t2=num2str(T(2));
% fseek(id2,41,0);
% Q=fscanf(id2,'%f',[1,1]);
% q=num2str(Q);
% fclose(id2);

% end