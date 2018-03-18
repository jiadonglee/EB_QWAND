% Observational data preparation
% This program analyzes the input observational lightcurve and generates a
% standard light curve for the subsequences programs

function lc_tmp=standard_lc(obsdata)
obs_lc  =    importdata(obsdata.path); % input the database
% 
% obs_lc = obs_lc((obs_lc(:,3)<mean(obs_lc(:,3))),:);
% obs_lc = obs_lc((obs_lc(:,3)<mean(obs_lc(:,3))),:);
% obs_lc = obs_lc((obs_lc(:,3)<mean(obs_lc(:,3))),:);

lc_tmp = zeros(length(obs_lc),2);
lc_tmp(:,1)  = obs_lc(:,obsdata.numTime);
lc_tmp(:,2)  = obs_lc(:,obsdata.numMag);
switch obsdata.type
    case 'phase'
        %% Adjustment of the light curve
        % shift the phase
        lc_tmp(:,1)  = lc_tmp(:,1) + obsdata.phase_shift;
        % adjust the phase
        lc_tmp(:,1) = mod(lc_tmp(:,1),1);
        lc_tmp      = sortrows(lc_tmp);
        % adjust the magnitude
        lc_tmp(:,2) = lc_tmp(:,2)-mean(lc_tmp(lc_tmp(:,1)<0.01,2));        
        % shift the light curve        
        lc_tmp(:,2)  = lc_tmp(:,2)  + obsdata.mag_shift +5;
        %% combination of the points
%         if length(lc_tmp)>400
%             lc_tmp = lc_interp(lc_tmp);
%         end

    case 'time'
        error('The program cannot be used for real time now, please convert the time to phase.')        
end


end