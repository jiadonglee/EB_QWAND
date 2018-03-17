clear;clc;
%this program is designed for ploting spectrum
%version 1
ex0= importdata('QWspect_v2.txt'); 
Data0 = ex0.data();        
f0 = Data0(:,1);   
flux0 = Data0(:,2);
[f00,a]  =sort(f0);
% height = 0.4199;
height = 1;
for j =1:length(f0)
    flux00(j) = flux0(a(j)) * height ;
end
%plot(f00,flux00)
%%
Data1 = importdata('ukf2v.txt');
%A = importdata('ukf2ii.txt') loads data into array A
f1 = Data1(:,1);   flux1 = Data1(:,2);


%%
% adj = (max(flux1) - min(flux1))/(max(flux0) - min(flux0));
% for i = 1:length(f00)
%     flux = flux00(i) * adj; 
% end
plot(f00,flux00,'LineWidth',1.4,'Color','k')
% hold on
% plot(f1,flux1)
xlim([3000,7000]);   ylim([0,6]);
xlabel('wavelength(Å)');  ylabel('flux');


