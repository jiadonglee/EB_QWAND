clear;clc;
%this program is designed for calculate o-c
ex = importdata('hjdmin.txt');
hjd = ex(:,1);
hjd0 = 2450053.4277;
T = 0.49188; n = length(hjd);
% for i = 1 : n
%     hjd_tmp(i) = hjd(i) - hjd0;
%     res(i) = mod(hjd_tmp(i),T);
% end
% for j = 1:n                %primary mininum
%     if res(j) <0.2500
%         E(j) = floor((hjd(j) -hjd0)./T);
%     end
%     
%     if res(j) > 0.2500  %secondary minimum
%         E(j) = floor((hjd(j) - hjd0)./T) + 0.5;
%     end
% end
% E = E';
for i = 1:n
    r(i) = (hjd(i) - hjd0)/T;
    inte(i) = round(r(i));
    deci(i) = r(i) - inte(i);
    if deci(i) >= 0.25
        E(i) = inte(i) + 0.5; disp('s')        
    elseif abs(deci(i)) < 0.25;
        E(i) = inte(i); disp('p')
    elseif deci(i) <= -0.25;
        E(i) = inte(i) -0.5; disp('s')
    end
end

%%
E = E';
p = polyfit(E,hjd,1);
xx = 0:0.01:E(n);
yy = polyval(p,xx);
%plot(E,hjd,'^',xx,yy)
cal = polyval(p,E);
% for k = 1:n
%     c(k) = hjd0 + T*E(k);
% end
omc = hjd - cal;
plot(E,omc,'o')
