clear;clc;
%this program is designed for plotting light curve
Data_B = importdata('B_v1.dat');
Data_V = importdata('V_v1.dat');
Data_R = importdata('R_v1.dat');
%hjd = Data(:,1);
phase_shift = 0.018;

phase_B = Data_B(:,1) + phase_shift;  
phase_V = Data_V(:,1) + phase_shift ; 
phase_R = Data_R(:,1) + phase_shift ;
mag_B = Data_B(:,2); mag_V = Data_V(:,2) ; mag_R = Data_R(:,2);
merr_B = Data_B(:,3); merr_V = Data_V(:,3) ; merr_R = Data_R(:,3);
nb = length(phase_B) ; nv = length(phase_V) ; nr = length(phase_R); 
for i = 1:nb
    if phase_B(i) > 1
        phase_B(i) = phase_B(i) - 1;
    end
    merr_B(i) = merr_B(i) + 0.1; 
end

for i = 1:nv
    if phase_V(i) > 1
        phase_V(i) = phase_V(i) - 1;
    end
end

for i = 1:nr
    if phase_R(i) > 1
        phase_R(i) = phase_R(i) - 1;
    end
    merr_R(i) = merr_R(i) - 0.1;
end
% B = mag_B(:)+ 13.853;
% V = mag_V(:) + 12.738;
% R = mag_R(:) + 12.383;
B  = mag_B(:);
V  = mag_V(:);
R  = mag_R(:);
%%
%plot the figure of light curve
rcolor = [0.8 0.0 0.0];
gcolor = [0.0 0.7 0.0];
bcolor = [0.0 0.0 0.6];


figure(1)
f1 = subplot(2,1,1);
p1 = get(f1,'position');
p1(4) = p1(4)*1.80;
p1(2) = p1(2)*0.8;
set(f1, 'position', p1);
plot(phase_B,B,'^','color',bcolor);
hold on ; plot(phase_V,V,'o','color',rcolor)
hold on ; plot(phase_R,R,'*','color',gcolor) 
% xlabel('phase') ; 
ylabel('\Delta mag');
xlim([0.0,1.0]) ; ylim([-1.0,1.0]);
legend('B','V','R');
set(gca,'ydir','reverse')


f2 = subplot(2,1,2);
p2 = get(f2,'position');
p2(4) = p2(4)*0.50; % Add 20 percent to height
set(f2, 'position', p2);
plot(phase_B,merr_B,'^','color',bcolor);
hold on; plot(phase_V,merr_V,'o','color',rcolor);
hold on ; plot(phase_R,merr_R,'*','color',gcolor);
xlabel('phase') ; ylabel('\Delta mag of C-Ck')
ylim([0.5,1]);xlim([0,1]) ; 


