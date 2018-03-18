% q search result plot
clear;clc;
q_std=importdata('/Users/Solomon/Documents/Projects/GSC_BinaryStars/gsc1397/Code_1397/qs.txt');
q_std=sortrows(q_std);
figure
plot(q_std(:,1),q_std(:,2),'k^-');
xlim([0,1]);
set(gca,'Fontname','Courier','FontSize',20)
xlabel('\it q','FontSize',20,'Fontname','Courier')
ylabel('\sigma','FontSize',20,'Fontname','Courier')
grid on

axes('position',[0.19,0.60,0.4,0.25]);
plot(q_std(:,1),q_std(:,2),'k^-');
set(gca,'Fontname','Courier','FontSize',20)
xlim([0.27,0.42]);
grid on


