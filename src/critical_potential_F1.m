% critical potential energy caculator at F=1
% mass ratio take from 0.02 to 1 
% clear;clc;
function [x1,o1,x2,o2]=critical_potential_F1(q)
path_database='C:\subLinux\v3_329\F1Om.dat';
base=importdata(path_database);
% q=0.05:0.05:0.95;
mr=base(:,1);
X1=base(:,2);
O1=base(:,3);
X2=base(:,4);
O2=base(:,5);

% plot(mr,X1,mr,X2)
x1=spline(mr,X1,q);
o1=spline(mr,O1,q);
x2=spline(mr,X2,q);
o2=spline(mr,O2,q);

% end