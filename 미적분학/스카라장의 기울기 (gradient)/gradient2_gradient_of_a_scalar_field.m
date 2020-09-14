clear; close all; clc;

% Some data: 
[lon,lat,z] = meshgrid(-0.5:0.1:0.5,-0.5:0.1:0.5,-0.5:0.1:0.5); 
T=20*exp(-lon.^2-lat.^2-z.^2);

% Plot dataset: 
pcolor3(lon,lat,z,T); 
% Add labels: 
xlabel('longitude')
ylabel('latitude')
zlabel('elevation (m)') 
title('temperature or something') 
axis tight
colorbar
%% Gradient
[fx,fy,fz]=gradient(T);

% ���� ��ġ�� gradient�ʹ� ���� �ٸ�.
% ���� ��ġ�� gradient������ ��ġ �� ������ �̼ұ��̺��ٴ� ũ�� ������ ���̰� ����� ������ ������.
% clear fx fy fz
% for i=1:size(T,1)
%     for j=1:size(T,2)
%         for k=1:size(T,3)
%             fx(i,j,k)=(-2)*lon(i,j,k)*exp(-lon(i,j,k)^2-lat(i,j,k)^2-z(i,j,k)^2);
%             fy(i,j,k)=(-2)*lat(i,j,k)*exp(-lon(i,j,k)^2-lat(i,j,k)^2-z(i,j,k)^2);
%             fz(i,j,k)=(-2)*z(i,j,k)*exp(-lon(i,j,k)^2-lat(i,j,k)^2-z(i,j,k)^2);
%         end
%     end
% end


hold on;
quiver3(lon,lat,z,fx,fy,fz);