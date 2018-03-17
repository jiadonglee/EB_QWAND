clear;clc;
%this program is designed for plotting light curve
Data_B = importdata('temp_B.txt');
simu_B = importdata('simu_B.txt');
Data_V = importdata('temp_V.txt');
simu_V = importdata('simu_V.txt');
Data_R = importdata('temp_R.txt');
simu_R = importdata('simu_R.txt');

phase_shift = 0.00;

phase_B = Data_B(:,1) + phase_shift;  
phase_V = Data_V(:,1) + phase_shift ; 
phase_R = Data_R(:,1) + phase_shift ;
mag_B = Data_B(:,2); 
res_B = Data_B(:,3); 
mag_V = Data_V(:,2) ; 
res_V = Data_V(:,3) ; 
mag_R = Data_R(:,2);
res_R = Data_R(:,3);
% nb = length(phase_B) ; nv = length(phase_V) ; nr = length(phase_R); 
% for i = 1:nb
%     if phase_B(i) > 1
%         phase_B(i) = phase_B(i) - 1;
%     end
%     res_B(i) = res_B(i) + 0.1; 
% end
% for i = 1:nv
%     if phase_V(i) > 1
%         phase_V(i) = phase_V(i) - 1;
%     end
% end
% for i = 1:nr
%     if phase_R(i) > 1
%         phase_R(i) = phase_R(i) - 1;
%     end
%     merr_R(i) = merr_R(i) - 0.1;
% end
%=======================================
rcolor = [0.8 0.0 0.0];
gcolor = [0.0 0.7 0.0];
bcolor = [0.0 0.0 0.8];
%normalized \delta mag
B = mag_B(:) - 0.5630 - mag_B(1);
simu_B(:,2) =  simu_B(:,2) - 0.5630 - mag_B(1);
res_B(:) = res_B(:) + 0.1;
V = mag_V(:) - 0.0550 - mag_V(1);
simu_V(:,2) =  simu_V(:,2) - 0.0550 - mag_V(1);
R = mag_R(:) + 0.3680 -mag_R(1);
simu_R(:,2) = simu_R(:,2) + 0.3680 - mag_R(1);
res_R(:)= res_R(:)  -0.1;
%%
%plot the figure of light curve
figure(1)
f1 = subplot(2,1,1);
p1 = get(f1,'position');
p1(4) = p1(4)*1.60;
p1(2) = p1(2)*0.8;
set(f1, 'position', p1);
u1 = plot(phase_B,B,'.','color',bcolor);
hold on; plot(phase_B + 1,B,'.','color',bcolor);
hold on; plot(phase_B - 1,B,'.','color',bcolor);
hold on; plot(simu_B(:,1),simu_B(:,2) + 5 ,'-k' ,'LineWidth',1.2)
hold on; plot(simu_B(:,1) + 1,simu_B(:,2) + 5 ,'-k' ,'LineWidth',1.2)
hold on; plot(simu_B(:,1) - 1,simu_B(:,2) + 5 ,'-k' ,'LineWidth',1.2)

hold on ;u2 =  plot(phase_V,V,'.','color',rcolor);
hold on ; plot(phase_V -1,V,'.','color',rcolor)
hold on ; plot(phase_V +1,V,'.','color',rcolor)
hold on; plot(simu_V(:,1),simu_V(:,2) + 5,'-k' ,'LineWidth',1.2)
hold on; plot(simu_V(:,1) - 1,simu_V(:,2) + 5,'-k' ,'LineWidth',1.2)
hold on; plot(simu_V(:,1) +1,simu_V(:,2) + 5,'-k' ,'LineWidth',1.2)

hold on;u3 = plot(phase_R,R,'.','color',gcolor);
hold on;plot(phase_R - 1,R,'.','color',gcolor)
hold on;plot(phase_R + 1,R,'.','color',gcolor)
hold on;plot(simu_R(:,1),simu_R(:,2) + 5,'-k' ,'LineWidth',1.2)
hold on;plot(simu_R(:,1) - 1,simu_R(:,2) + 5,'-k' ,'LineWidth',1.2)
hold on;plot(simu_R(:,1) + 1,simu_R(:,2) + 5,'-k' ,'LineWidth',1.2)
% xlabel('phase') ; 
ylabel('\Delta mag');
xlim([-0.1,1.1]) ; ylim([-1.1,0.5]);
set(gca,'ydir','reverse')
legend([u1,u2,u3],'B','V','R');


f2 = subplot(2,1,2);
p2 = get(f2,'position');
p2(4) = p2(4)*0.30; % Add 20 percent to height
set(f2, 'position', p2);
plot(phase_B,res_B,'.','color',bcolor);
hold on;plot(phase_B -1,res_B,'.','color',bcolor);  
hold on;plot(phase_B +1,res_B,'.','color',bcolor);
hold on; plot(phase_V,res_V,'.','color',rcolor);
hold on; plot(phase_V-1,res_V,'.','color',rcolor);   
hold on; plot(phase_V+1,res_V,'.','color',rcolor);
hold on ; plot(phase_R,res_R,'.','color',gcolor)
hold on ; plot(phase_R -1,res_R,'.','color',gcolor) ; 
hold on ; plot(phase_R +1,res_R,'.','color',gcolor);
xlabel('phase') ; ylabel('residuals')
ylim([-0.2,0.2]);xlim([-0.1,1.1]) ; 


