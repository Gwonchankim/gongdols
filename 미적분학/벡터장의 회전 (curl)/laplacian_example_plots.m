clear; close all; clc;

% Ư���� scalar �Լ�

[x,y]=meshgrid(-3:0.2:3,-3:0.2:3);


z=peaks(x,y);
f1=figure; 
h_surf=surf(x,y,z);
xlabel('x'); ylabel('y'); zlabel('z');


%%% laplacian�� div(grad(f))��.

% gradient
[grad_x,grad_y]=gradient(z);

[zlims]=get(gca,'zlim');
z_quiv3=zlims(1)*ones(size(x));
grad_z=zeros(size(grad_x));
hold on;
h_quiver=quiver3(x,y,z_quiv3,grad_x,grad_y,grad_z);


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% surf ���� �Լ�
set(h_surf,'visible','off');

% surf �Ѵ� �Լ�
set(h_surf,'visible','on');

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% divergence

div=divergence(x,y,grad_x,grad_y);
figure;
quiver(x,y,grad_x,grad_y)
hold on;
imagesc(-3:0.2:3,-3:0.2:3,-div) % divergence�� �ݴ� ��ȣ�� ���̸� ��Ÿ���� �빮�� (-)�� div �տ� ����.
alpha(0.3)
xlabel('x');ylabel('y'); colorbar;

