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
[fx1,fy1,fz1]=gradient(T, 0.1); % spacing ���� �߰���. 2020�� 9�� 14��.

% ���� ��ġ�� gradient�ʹ� ���� �ణ ���̸� ����.
% �Ƹ��� x, y, z�� ������ ���� ���� �� ������ ��������� ũ�ٺ��� ����� ������ �ƴұ� ������.
% clear fx2 fy2 fz2
% for i=1:size(T,1)
%     for j=1:size(T,2)
%         for k=1:size(T,3)
%             fx2(i,j,k)=20*(-2)*lon(i,j,k)*exp(-lon(i,j,k)^2-lat(i,j,k)^2-z(i,j,k)^2);
%             fy2(i,j,k)=20*(-2)*lat(i,j,k)*exp(-lon(i,j,k)^2-lat(i,j,k)^2-z(i,j,k)^2);
%             fz2(i,j,k)=20*(-2)*z(i,j,k)*exp(-lon(i,j,k)^2-lat(i,j,k)^2-z(i,j,k)^2);
%         end
%     end
% end


hold on;
quiver3(lon,lat,z,fx1,fy1,fz1);