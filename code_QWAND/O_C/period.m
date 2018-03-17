%calculate new period
clc;clear;
%%
Data = importdata('R_hjd_mag.dat');
hjd = Data(:,1);
mag = Data(:,2);

[pxx,f] = plomb(mag,hjd);

[maxx,i] = max(pxx);
 f0 = f(i);
T = 2./f0; vpa(T)
%%
plot(f,pxx)