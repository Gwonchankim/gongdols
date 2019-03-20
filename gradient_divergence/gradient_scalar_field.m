
%%%%%%%%Scalar ����� Gradient %%%%%%%%%%%%%%
%% ���� : pcolor3 �Լ��� MATLAB 2014�̻󿡼��� �� �۵����� ����. %%
clear; close all; clc;
 
%%
 
% f(x,y)= x^2+xy+y^2 �׸���
x=-1:0.2:1;
y=-1:0.2:1;
 
for i_x=1:length(x)
    for i_y=1:length(y)
        f(i_x,i_y)=x(i_x)^2+x(i_x)*y(i_y)+y(i_y)^2;
    end
end
 
surf(x,y,f)
xlabel('x'); ylabel('y'); zlabel('f(x,y)')
hold on;
 
%% Gradient
 
% x���� ���� quiver �׸���
 
u_x=zeros(length(x),length(y));
v_x=zeros(length(x),length(y));
w_x=zeros(length(x),length(y));
 
for i_x=1:length(x)
    for i_y=1:length(y)
        u_x(i_x,i_y)=2*x(i_x)+y(i_y);
    end
end
 
quiver3(x,y,f,u_x,v_x,w_x)
 
% y���� ���� quiver �׸���
 
u_y=zeros(length(x),length(y));
v_y=zeros(length(x),length(y));
w_y=zeros(length(x),length(y));
 
for i_x=1:length(x)
    for i_y=1:length(y)
        v_y(i_x,i_y)=x(i_x)+2*y(i_y);
    end
end
 
quiver3(x,y,f,u_y,v_y,w_y)
 
% xy���� ���� quiver �׸���
 
u_xy=zeros(length(x),length(y));
v_xy=zeros(length(x),length(y));
w_xy=zeros(length(x),length(y));
 
for i_x=1:length(x)
    for i_y=1:length(y)
        u_xy(i_x,i_y)=2*x(i_x)+y(i_y);
        v_xy(i_x,i_y)=x(i_x)+2*y(i_y);
    end
end
 
quiver3(x,y,f,u_xy,v_xy,w_xy)
 
%%%%%%%%%%%%%%%%% ��Į�� �ʵ��� gradient %%%%%%%%%%%%

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
colormap(jet);
%% Gradient
[fx,fy,fz]=gradient(T);
hold on;
quiver3(lon,lat,z,fx,fy,fz)
