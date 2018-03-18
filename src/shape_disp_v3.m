% Shape plot for given parameters
function YZ = shape_disp_v3(WDshape)
%% Environment Setting

path_WDshape= WDshape.path;
obs_phase   = WDshape.phase;

%% LC

    % ------------- edit lcin parameters -------------%
    cd(path_WDshape)
%     disp('lcin editting')
    lcedit_obs_phase_v3(WDshape)
    lcedit_v2015_v3(WDshape);
    lcin_spotedit1_2015_v3(WDshape);
    lcin_spotedit2_2015_v3(WDshape);
    
    % ------------- run lcin & readout the result ------------ %
%         disp('lc running') 
        lcCommond=sprintf('!%s',WDshape.lcProg);
        %setenv('DYLD_LIBRARY_PATH', '/usr/local/bin')

   
    eval(lcCommond);
    
%     disp('lcout reading')
    YZ=lcoutRead_shape(WDshape);
%%
% YZ=sortrows(YZ);

% mark0=zeros(length(YZ),1);
% for i=1:length(YZ)
% tmp=sqrt((YZ(:,1)-YZ(i,1)).^2+(YZ(:,2)-YZ(i,2)).^2);
% a=find(tmp<0.003);
% if length(a)>1
% mark0(i)=1;
% end
% end
% figure(2)
% % subplot(2,2,subpl)
% % scatter(YZ(:,1),YZ(:,2),[],mark0)
% scatter(YZ(:,1),YZ(:,2),[],mark0,'.')
% 
% % xlim(yrange)
% % ylim(zrange)
% set(gca,'Fontname','Times New Roman','FontSize',15)
% xlabel('Y Sky Coordinate','FontSize',15,'Fontname','Times New Roman')  
% ylabel('Z Sky Coordinate','FontSize',15,'Fontname','Times New Roman')
% title_text=sprintf('Phase = %04.3f',obs_phase);
% title(title_text)
    