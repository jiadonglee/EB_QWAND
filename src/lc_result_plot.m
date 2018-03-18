% LC result plot
function []=lc_result_plot(lc_tmp,dlc,phase_simu,mag_simu,phase_range,mag_range1,mag_range2)
%% plot the result
disp('ploting')
figure(1)
% -------------------  plot data  --------------- %
subplot(2,1,1)
plot(lc_tmp(:,1),lc_tmp(:,2),'b.')
xlim(phase_range)
ylim(mag_range1)
set(gca,'Ydir','reverse','Fontname','Courier','FontSize',15)
ylabel('Mag','FontSize',15,'Fontname','Courier')
xlabel('Phase','FontSize',15,'Fontname','Courier')
grid
hold on
plot(lc_tmp(:,1)-1,lc_tmp(:,2),'b.')
plot(lc_tmp(:,1)+1,lc_tmp(:,2),'b.')
plot(phase_simu+1,mag_simu,'r')
plot(phase_simu  ,mag_simu,'r')
plot(phase_simu-1,mag_simu,'r')
hold off


%------------------ plot residuals  ----------------- %
subplot(4,1,3)
plot(lc_tmp(:,1),dlc,'^r')
set(gca,'Ydir','reverse','Fontname','Courier','FontSize',15)
ylabel('Mag','FontSize',15,'Fontname','Courier')
% xlabel('Phase','FontSize',15,'Fontname','Times New Roman')
hold on
plot(lc_tmp(:,1)+1,dlc,'^r')
plot(lc_tmp(:,1)-1,dlc,'^r')
line(phase_range,[0 0]);
hold off
xlim(phase_range)
ylim(mag_range2)
grid


% --------------- plot the statistic analysis of residuals ----------- %
subplot(4,1,4)
histfit(dlc)
set(gca,'Fontname','Courier','FontSize',15)
ylabel('N','FontSize',15,'Fontname','Courier')
xlabel('\Delta Mag','FontSize',15,'Fontname','Courier')

%     xlim(phase_range)
%     ylim([-0.1,0.1])
end
