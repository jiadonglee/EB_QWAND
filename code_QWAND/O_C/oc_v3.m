clear;clc;
%this program is designed for calculate o-c
%version 3
Data = importdata('min_v2.txt');
minhjd = Data(:,1);
inde = Data(:,2);
err = Data(:,3);
%%
%check primary or secondary
n  = length(minhjd); min1  =[]; min2 = [];
err1 = []; err2 = [];
for i = 1:n
    if inde(i)  == 1
        min1 = [min1,minhjd(i)];
        err1 = [err1,err(i)];
    end
    if inde(i)  == 2
        min2 = [min2,minhjd(i)];
        err2 = [err2,err(i)];
    end
end
min1 = min1'; min2 = min2';
err1 = err1' ; err2  = err2';
min2(21) = []; err2(21) = [];
%%
%calculate o-c
hjd0 = 2450053.4277;
% T = 0.49188;
% hjd0 = 2456619.14326;
T = 0.49188;
for i = 1:length(min1)
    r(i) = (min1(i) - hjd0)/T;
    inte(i) = round(r(i));
    deci(i) = r(i) - inte(i);
    Ep(i) = inte(i);
end
for j = 1:length(min2)
    r(j) = (min2(j) - hjd0)/T;
    inte(j) = round(r(j));
    deci(j) = r(j) - inte(j);
    Es(j) = inte(j) + 0.5;
end
%%
%plot the figure
E = [Ep,Es]';  
N =length(E); n =length(Ep);

o = [min1;min2];
o_err = [err1;err2];
p = polyfit(E,o,1);
xx = 0:0.01:E(n);
yy = polyval(p,xx);
%plot(E,hjd,'^',xx,yy)
cal = polyval(p,E);
for k = 1:N
    c(k) = hjd0 + T*E(k);
end
omc = o - cal;
%plot(Ep,omc(1:n),'o')



%===========plot the figure=========================
f1 = subplot(2,1,1);
g1 = get(f1,'position');
g1(4) = g1(4)*1.70;
g1(2) = g1(2)*0.8;
set(f1, 'position', g1);
errorbar(Ep,omc(1:n),err1,'o')
hold on;
errorbar(Es,omc(n + 1:N),err2,'^')
% hold on
% x2 = -1000:1:17000;
% y2 = zeros(1,length(x2));
% plot(x2,y2,'--r');
xlim([-1000,17000]);
ylim([-0.010,0.010]);
legend('primary eclipse','secondary eclipse');
ylabel('O - C (days)');
hold on;
p2 = polyfit(E,omc,2);
yy3 = polyval(p2,E);
res  = omc  - yy3;
xx2  = -1000:0.1:17000;
yy2 = polyval(p2,xx2);
plot(xx2,yy2,'-');


f2 = subplot(2,1,2);
g2 = get(f2,'position');
g2(4) = g2(4)*0.30; % Add 20 percent to height
set(f2, 'position', g2);
plot(E,res,'.')
xlabel('Epoch');








%%
P_avr = (2016-1996)/max(E);  %years/cycle
P_var1 = 2*p2(1);  %dP/dE
P_var2 = P_var1/P_avr;  %dP/dt

% %%
% [E0,a]  = sort(E);
% for i =1:N
%     o0(i) = o(a(i)) - 2400000 ;
%     o_err0(i) = o_err(a(i));
%     omc0(i)  =omc(a(i));
% end
% RR  = [o0',o_err0', E0, omc0' ];
% fid=fopen('min_paper.txt','w');
% fprintf(fid, '%5.4f  %1.4f  %f   %1.4f  \r\n',RR);
% fclose(fid);