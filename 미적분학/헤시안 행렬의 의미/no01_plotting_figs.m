%{
2020�� 5�� 27�� �ۼ� ����

%%%%%%%%%%%%%%%%%%%%%% ��þ� ����� �������� �ǹ� %%%%%%%%%%%%%%%%%%%%%%%%

- Hessian Matrix�� ������, ���������� �ǹ�
1) Hessian�� �� �������ʹ� ���� �������� curvature ������ �ǹ���
2) Hessian�� �� �������� �� ���������� �������� �󸶳� curved �Ǿ������� �ǹ���.

- ������ ��
1) Hessian Matrix�� symmetric matrix��.


- �����ϰ��� �ϴ� ����
Quadratic form����, �� f(x) = x^TAx-b^Tx+c�� ���� �Լ� f����,
1) ���⼭ A�� Hessian�̸�, Hessian�� �Լ��� curvature�� ��Ÿ��.
 
A�� identity matrix���� �����ؼ� ���ϴ� Hessian ��� A�� ������ ����Ǿ� ���� ���� �Լ��� ����� ��� �ٲ���� Ȯ��
�̸� ���� Hessian Matrix�� ������ȯ�� �����ϴ� �ٰ� �������� ������������ ����

%}
clear; close all; clc;
addpath('..\..\�������\gauss_jordan_visualization\');
addpath('..\����Ż������_���������ǹ�\')
%% Fig 1. 1�� �̺� ����� �ǹ�

clear v
v = VideoWriter('fig1.mp4','MPEG-4');
v.FrameRate = 30;
v.Quality = 100;
open(v);

clear F

plotXY(-2.5,2.5,-2.5,2.5,true,20)
x = linspace(-2.5,2.5, 100);
y = x+0.5+1/3*sin(2*pi*1/3*x);

hold on;
plot(x,y,'k','linewidth',2)
i=1;
for xx = linspace(-3,3,100)
    
    h(1) = plot(xx, xx+0.5+1/3*sin(2*pi*1/3*xx),'o','markerfacecolor','r','markeredgecolor','none','markersize',8);
    %     t = text(0.6307, 1.2953, '$$ (x,y) = (g(t), f(t)) $$','Interpreter','latex');
    %     t.FontSize = 20;
    
    dydx = 1+1/3*2*pi*1/3*cos(2*pi*1/3*xx);
    x = linspace(xx-1,xx+1,10);
    h(2) = plot(x, dydx*(x-xx) + xx+0.5+1/3*sin(2*pi*1/3*xx),'color','b','linewidth',2);
    
    slope = (xx+0.5+1/3*sin(2*pi*1/3*xx))/xx;
%     if xx ==0
%         h(3) = line([0,0],[0,2],'color','r','linewidth',2);
%     elseif xx > 0
%         x = linspace(0,xx+0.5,10);
%         h(3) = plot(x, slope*x,'color','r','linewidth',2);
%     elseif xx<0
%         x = linspace(xx-0.5,0,10);
%         h(3)= plot(x, slope*x,'color','r','linewidth',2);
%     end
    drawnow;
    
    F(i)=getframe(gcf);
    if xx<3
        delete(h)
    end
    i=i+1;
end


for i=1:length(F)
    % convert the image to a frame
    frame = F(i) ;
    writeVideo(v, frame);
end

close(v)
%% Fig. 2 Quadratic form���� �Լ� ǥ���ϱ� (Bowl Shape)


clear v
v = VideoWriter('fig2.mp4','MPEG-4');
v.FrameRate = 30;
v.Quality = 100;
open(v);

clear F

n_step = 100;

A_final = [2,1; 1,2]; % Bowl ������ Hessian
% A_final = [2,0; 0,-2]; % Saddle ������ Hessian

b = [0, 0]';
c = 0;
figure('position',[2028, 495, 1153, 387]);

[X,Y] = meshgrid(-10:0.8:10);
i=1;
for i_step = 1:n_step
    A = (A_final - eye(2)) * i_step / n_step + eye(2);
    
    fcn = @(x,y) (1/2 * A(1,1)*x.^2 + 1/2 * (A(1,2)+A(2,1))*x.*y + 1/2 * A(2,2)*y.^2 - b(1)*x - b(2)*y + c);
    
    % 3���� ��� �׸���
    subplot(1,2,1);
    surf(X, Y, fcn(X,Y))
    xlim([-10, 10])
    ylim([-10, 10])
    zlim([-300, 300])
    % contour plot
    
    subplot(1,2,2);
    contour(X,Y,fcn(X,Y),50)
    
    % eigen vector & eigen value
    [V,D] = eig(A);
    mArrow2(0, 0, V(1,1)*D(1,1),V(2,1)*D(1,1),{'color','r','linewidth',2});
    mArrow2(0, 0, V(1,2)*D(2,2),V(2,2)*D(2,2),{'color','r','linewidth',2});
    str = [ 'Matrix \it{A} = ', '$$ \left[ {\matrix{ ',num2str(A(1,1)),' & ', num2str(A(1,2)),... 
        ' \cr ', num2str(A(2,1)) , ' & ', num2str(A(2,2)),' } } \right] $$' ];
    t = text(0.6, 0.2, str, 'unit','normalized' ,'Interpreter','latex', ...
        'BackgroundColor','w','Fontsize',12);
    drawnow
    
    
    F(i)=getframe(gcf);
    if xx<3
        delete(h)
    end
    i=i+1;
end

for i=1:length(F)
    % convert the image to a frame
    frame = F(i) ;
    writeVideo(v, frame);
end

close(v)

%% Fig. 3 Quadratic form���� �Լ� ǥ���ϱ� (Saddle Shape)

clear v
v = VideoWriter('fig3.mp4','MPEG-4');
v.FrameRate = 30;
v.Quality = 100;
open(v);

clear F

n_step = 100;

% A_final = [2,1; 1,2]; % Bowl ������ Hessian
A_final = [2,0; 0,-2]; % Saddle ������ Hessian

b = [0, 0]';
c = 0;
figure('position',[2028, 495, 1153, 387]);

[X,Y] = meshgrid(-10:0.8:10);
i=1;
for i_step = 1:n_step
    A = (A_final - eye(2)) * i_step / n_step + eye(2);
    
    fcn = @(x,y) (1/2 * A(1,1)*x.^2 + 1/2 * (A(1,2)+A(2,1))*x.*y + 1/2 * A(2,2)*y.^2 - b(1)*x - b(2)*y + c);
    
    % 3���� ��� �׸���
    subplot(1,2,1);
    surf(X, Y, fcn(X,Y))
    xlim([-10, 10])
    ylim([-10, 10])
    zlim([-300, 300])
    % contour plot
    
    subplot(1,2,2);
    contour(X,Y,fcn(X,Y),50)
    
    % eigen vector & eigen value
    [V,D] = eig(A);
    if D(1,1) >= 0
        mArrow2(0, 0, V(1,1)*D(1,1),V(2,1)*D(1,1),{'color','r','linewidth',2});
    else
        mArrow2(0, 0, V(1,1)*D(1,1),V(2,1)*D(1,1),{'color','b','linewidth',2});
    end
    
    mArrow2(0, 0, V(1,2)*D(2,2),V(2,2)*D(2,2),{'color','r','linewidth',2});
    str = [ 'Matrix \it{A} = ', '$$ \left[ {\matrix{ ',num2str(A(1,1)),' & ', num2str(A(1,2)),... 
        ' \cr ', num2str(A(2,1)) , ' & ', num2str(A(2,2)),' } } \right] $$' ];
    t = text(0.6, 0.2, str, 'unit','normalized' ,'Interpreter','latex', ...
        'BackgroundColor','w','Fontsize',12);
    drawnow
    
    
    F(i)=getframe(gcf);
    i=i+1;
end

for i=1:length(F)
    % convert the image to a frame
    frame = F(i) ;
    writeVideo(v, frame);
end

close(v)

%% Fig. 4 Quadratic form���� �Լ� ǥ���ϱ� (Bowl Shape, ������ ��鸸)


A_final = [2,1; 1,2]; % Bowl ������ Hessian
% A_final = [2,0; 0,-2]; % Saddle ������ Hessian

b = [0, 0]';
c = 0;
figure('position',[2028, 495, 1153, 387]);
A = A_final;

[X,Y] = meshgrid(-10:0.8:10);
fcn = @(x,y) (1/2 * A(1,1)*x.^2 + 1/2 * (A(1,2)+A(2,1))*x.*y + 1/2 * A(2,2)*y.^2 - b(1)*x - b(2)*y + c);

% 3���� ��� �׸���
subplot(1,2,1);
surf(X, Y, fcn(X,Y))
xlim([-10, 10])
ylim([-10, 10])
zlim([-300, 300])
xlabel('x');
ylabel('y');
zlabel('z');
% contour plot


subplot(1,2,2);
contour(X,Y,fcn(X,Y),50)

% eigen vector & eigen value
[V,D] = eig(A);
mArrow2(0, 0, V(1,1)*D(1,1),V(2,1)*D(1,1),{'color','r','linewidth',2});
mArrow2(0, 0, V(1,2)*D(2,2),V(2,2)*D(2,2),{'color','r','linewidth',2});
str = [ 'Matrix \it{A} = ', '$$ \left[ {\matrix{ ',num2str(A(1,1)),' & ', num2str(A(1,2)),...
    ' \cr ', num2str(A(2,1)) , ' & ', num2str(A(2,2)),' } } \right] $$' ];
t = text(0.6, 0.2, str, 'unit','normalized' ,'Interpreter','latex', ...
    'BackgroundColor','w','Fontsize',12);
xlabel('x');
ylabel('y');

saveas(gcf,'fig4.png')
%% Fig. 5 Quadratic form���� �Լ� ǥ���ϱ� (Saddle Shape, ������ ��鸸)


% A_final = [2,1; 1,2]; % Bowl ������ Hessian
A_final = [2,0; 0,-2]; % Saddle ������ Hessian
b = [0, 0]';
c = 0;
figure('position',[2028, 495, 1153, 387]);

[X,Y] = meshgrid(-10:0.8:10);
A = A_final;

fcn = @(x,y) (1/2 * A(1,1)*x.^2 + 1/2 * (A(1,2)+A(2,1))*x.*y + 1/2 * A(2,2)*y.^2 - b(1)*x - b(2)*y + c);

% 3���� ��� �׸���
subplot(1,2,1);
surf(X, Y, fcn(X,Y))
xlim([-10, 10])
ylim([-10, 10])
zlim([-300, 300])
xlabel('x');
ylabel('y');
zlabel('z');
% contour plot

subplot(1,2,2);
contour(X,Y,fcn(X,Y),50)

% eigen vector & eigen value
[V,D] = eig(A);
if D(1,1) >= 0
    mArrow2(0, 0, V(1,1)*D(1,1),V(2,1)*D(1,1),{'color','r','linewidth',2});
else
    mArrow2(0, 0, V(1,1)*D(1,1),V(2,1)*D(1,1),{'color','b','linewidth',2});
end
mArrow2(0, 0, V(1,2)*D(2,2),V(2,2)*D(2,2),{'color','r','linewidth',2});
str = [ 'Matrix \it{A} = ', '$$ \left[ {\matrix{ ',num2str(A(1,1)),' & ', num2str(A(1,2)),...
    ' \cr ', num2str(A(2,1)) , ' & ', num2str(A(2,2)),' } } \right] $$' ];
t = text(0.6, 0.2, str, 'unit','normalized' ,'Interpreter','latex', ...
    'BackgroundColor','w','Fontsize',12);
xlabel('x');
ylabel('y');

saveas(gcf,'fig5.png')

%% Quadratic form���� �Լ� ǥ���ϱ� (3������ ���Ե� �Լ�, Monkey Saddle)
% 
% clear v
% v = VideoWriter('fig3.mp4','MPEG-4');
% v.FrameRate = 30;
% v.Quality = 100;
% open(v);
% 
% clear F

n_step = 100;

figure('position',[2028, 495, 1153, 387]);

[X,Y] = meshgrid(linspace(-3, 3, 20));

fcn = @(x,y) (x.^3-3*x.*y.^2);

% 3���� ��� �׸���
subplot(1,2,1);
surf(X, Y, fcn(X,Y))
% xlim([-10, 10])
% ylim([-10, 10])
% zlim([-300, 300])
% contour plot

subplot(1,2,2);
contour(X,Y,fcn(X,Y),50)

%{
Monkey Saddle�� Hessian

[6x -6y;
-6y -6x]

%}
n_grid = 10;
[X,Y] = meshgrid(linspace(-3, 3, n_grid));

H = cell(n_grid,n_grid);
V = cell(n_grid,n_grid);
D = cell(n_grid,n_grid);

for i = 1:n_grid
    for j = 1:n_grid
        H{i,j} = [6 * X(i,j), -6 * Y(i,j);
            -6 * Y(i,j),  -6 * X(i,j)];
        [V{i,j}, D{i,j}] = eig(H{i,j});
    end
end

for i = 1:n_grid
    for j = 1:n_grid
        for k = 1:2
            mArrow2(X(i,j), Y(i,j), X(i,j) + D{i,j}(k,k)*V{i,j}(1, k)/10, Y(i,j) + D{i,j}(k,k)*V{i,j}(2, k)/10,...
                {'color','r','linewidth',1});
        end
    end
end

