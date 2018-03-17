clear;clc;
%this program is designed for calculate o-c
%version 2
o_p = [2450053.4277
2450057.3603
2450080.4772
2450116.3858
%2453662.2684
%2454749.2991
% 2455469.9016
2455903.7220
2457673.4639
2457674.4491
2457677.3996
2456917.4619
2456983.3729
2453662.2684
];
o_s = [%2450069.4096
%2450130.4065
%2451335.9640
%2452194.2830
%2453662.5172
2454800.7044
2455478.5025
2457673.2188
2457674.2034
2457677.1553
2457678.1392
2455478.5025
2453662.5172
2456619.1433
2456620.1272
2456621.1130
2456916.2283
];
hjd0 = 2450053.4277;
% T = 0.49188;
% hjd0 = 2456619.14326;
T = 0.49188;
for i = 1:length(o_p)
    r(i) = (o_p(i) - hjd0)/T;
    inte(i) = round(r(i));
    deci(i) = r(i) - inte(i);
    Ep(i) = inte(i);
end
for j = 1:length(o_s)
    r(j) = (o_s(j) - hjd0)/T;
    inte(j) = round(r(j));
    deci(j) = r(j) - inte(j);
    Es(j) = inte(j) + 0.5;
end
E = [Ep,Es]';  
N =length(E); n =length(Ep);
o = [o_p;o_s];
p = polyfit(E,o,1);
xx = 0:0.01:E(n);
yy = polyval(p,xx);
%plot(E,hjd,'^',xx,yy)
cal = polyval(p,E);
for k = 1:N
    c(k) = hjd0 + T*E(k);
end
omc = o - cal;
plot(Ep,omc(1:n),'o')
hold on;
plot(Es,omc(n + 1:N),'^')
% hold on
% x2 = -1000:1:17000;
% y2 = zeros(1,length(x2));
% plot(x2,y2,'--r');
xlim([-1000,17000]);
ylim([-0.015,0.015]);
legend('primary eclipse','secondary eclipse');
xlabel('Epoch') ; ylabel('O-C');
hold on;
%%
p2 = polyfit(E,omc,2);
xx2  = -1000:0.1:17000;
yy2 = polyval(p2,xx2);
plot(xx2,yy2,'-');










