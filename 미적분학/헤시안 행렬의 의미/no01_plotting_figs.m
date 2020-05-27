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

%% Quadratic form���� �Լ� ǥ���ϱ�
n_step = 100;

A_final = [2,1; 1,2]; % Bowl ������ Hessian
% A_final = [2,0; 0,-2]; % Saddle ������ Hessian

b = [0, 0]';
c = 0;
figure('position',[2028, 495, 1153, 387]);

[X,Y] = meshgrid(-10:0.8:10);

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
    drawnow
end