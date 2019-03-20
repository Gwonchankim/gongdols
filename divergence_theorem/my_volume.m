clear; close all; clc;

%% 1) ������ sphere
N = 100;
thetavec = linspace(0,pi,N);
phivec = linspace(0,2*pi,2*N);
[th, ph] = meshgrid(thetavec,phivec);
R = ones(size(th));

x = R.*sin(th).*cos(ph);
y = R.*sin(th).*sin(ph);
z = R.*cos(th);

figure;
surf(x,y,z,'facealpha',1,'edgecolor','none');
% colormap('jet')
xlabel('x'); ylabel('y'); zlabel('z')

xlim([-1.2 1.2])
ylim([-1.2 1.2])
zlim([-1.2 1.2])
axis vis3d
camlight

%% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% %%
%% 2) ���� ������ �߶���.

hold on;
surf(1.1*x,zeros(size(x)),1.1*z,'facecolor','r','facealpha',1,'edgecolor','none')

%% 2)-1������ �߸� ���� y>0�� ��Ʈ

thetavec = linspace(0,pi,N);
phivec = linspace(0,pi,N);
[th, ph] = meshgrid(thetavec,phivec);
R = ones(size(th));

x = R.*sin(th).*cos(ph);
y = R.*sin(th).*sin(ph);
z = R.*cos(th);

figure;
surf(x,y,z,'facealpha',1,'edgecolor','none');
% colormap('jet')
xlabel('x'); ylabel('y'); zlabel('z')

xlim([-1.2 1.2])
ylim([-1.2 1.2])
zlim([-1.2 1.2])
axis vis3d
camlight

hold on;
surf(x,zeros(size(x)),z,'facecolor','g','facealpha',1,'edgecolor','none')

%% 2)-2������ �߸� ���� y<0�� ��Ʈ

thetavec = linspace(0,pi,N);
phivec = linspace(pi,2*pi,N);
[th, ph] = meshgrid(thetavec,phivec);
R = ones(size(th));

x = R.*sin(th).*cos(ph);
y = R.*sin(th).*sin(ph);
z = R.*cos(th);

figure;
surf(x,y,z,'facealpha',1,'edgecolor','none');
% colormap('jet')
xlabel('x'); ylabel('y'); zlabel('z')

xlim([-1.2 1.2])
ylim([-1.2 1.2])
zlim([-1.2 1.2])
axis vis3d
camlight

hold on;
surf(x,zeros(size(x)),z,'facecolor','g','facealpha',1,'edgecolor','none')

%% 2)-3������ �ڸ��� �� ��

figure;
surf(x,zeros(size(x)),z,'facecolor','g','facealpha',1,'edgecolor','none')
camlight

%% 3) �ٽ� ������ ��

thetavec = linspace(0,pi,N);
phivec = linspace(0,2*pi,2*N);
[th, ph] = meshgrid(thetavec,phivec);
R = ones(size(th));

x = R.*sin(th).*cos(ph);
y = R.*sin(th).*sin(ph);
z = R.*cos(th);

figure;
surf(x,y,z,'facealpha',1,'edgecolor','none');
% colormap('jet')
xlabel('x'); ylabel('y'); zlabel('z')

xlim([-1.2 1.2])
ylim([-1.2 1.2])
zlim([-1.2 1.2])
axis vis3d
camlight

%% 4) ���� 4��� �غ���.

hold on;
surf(1.1*x,zeros(size(x)),1.1*z,'facecolor','r','facealpha',1,'edgecolor','none')
surf(zeros(size(x)),1.1*y,1.1*z,'facecolor','r','facealpha',1,'edgecolor','none')

%% 4)-1 4��� �� ���� �� ����


thetavec = linspace(0,pi/2,N);
phivec = linspace(pi,pi+pi/2,N);
[th, ph] = meshgrid(thetavec,phivec);
R = ones(size(th));

x = R.*sin(th).*cos(ph);
y = R.*sin(th).*sin(ph);
z = R.*cos(th);

figure;
surf(x,y,z,'facealpha',1,'edgecolor','none');
% colormap('jet')
xlabel('x'); ylabel('y'); zlabel('z')

xlim([-1.2 1.2])
ylim([-1.2 1.2])
zlim([-1.2 1.2])
axis vis3d
camlight

hold on;
surf(x,zeros(size(x)),z,'facecolor','g','facealpha',1,'edgecolor','none')
surf(zeros(size(x)),y,z,'facecolor','g','facealpha',1,'edgecolor','none')
surf(x,y,zeros(size(x)),'facecolor','g','facealpha',1,'edgecolor','none')

