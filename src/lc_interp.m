% yi = spline(lc_tmp(:,1),lc_tmp(:,2),phase_simu);
function lc_tmpo = lc_interp(lc_tmp) 

xx = [lc_tmp(:,1)-1;lc_tmp(:,1);lc_tmp(:,1)+1];
yy = [lc_tmp(:,2);lc_tmp(:,2);lc_tmp(:,2)];
span = 40/length(xx);
yi = smooth(xx,yy,span,'rloess');
xintp = 0:0.005:1;
yintp = interp1(xx,yi,xintp);
lc_tmpo(:,1) = xintp;
lc_tmpo(:,2) = yintp;
end
% plot(xx,yy,'oy',xx,yi,xintp,yintp,'or')


