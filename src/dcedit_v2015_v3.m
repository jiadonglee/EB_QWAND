% dcin edit
function dcedit_v2015_v3(WD)
path_WDcode = WD.path;
INCL        = WD.INCL;
T1          = WD.T1;
T2          = WD.T2;
RM          = WD.RM;
POT1        = WD.POT1;
POT2        = WD.POT2;
%%
cd(path_WDcode)
%%
id=fopen('dcin.active','r+');
for i=1:9
[~]=fgets(id);
end
fseek(id,52,0);
incl=sprintf('%05.3f',INCL);
fprintf(id,incl);

%T
[~]=fgets(id);
fseek(id,1,0);
Tchr=sprintf('%05.4f 0%05.4f',T1/10000,T2/10000);
fprintf(id,Tchr);

%POT1
fseek(id,15,0);
pot1=sprintf('%04.3f',POT1);
fprintf(id,pot1);


%POT2
fseek(id,8,0);
pot2=sprintf('%04.3f',POT2);
fprintf(id,pot2);
%RM
fseek(id,8,0);
% temp=fgets(id);
rm=sprintf('%06.5f',RM);
fprintf(id,rm);
fclose(id);

end