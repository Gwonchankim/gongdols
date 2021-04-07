clear; close all; clc;
% �ſ� ������ Į�� ���� ����
% ������ ��ӿ�� �ϴ� ���¸� ������.
% �� ��, ������ ��ġ�� �����ϴ� ������ �ִٰ� ����.
% �츮�� Į�� ���͸� �̿��� ������ ��ġ�� ����/���� �ϰ��� ��.

%% DEFINE
dt = 0.1;
t  = 0:dt:10;
Nsamples = length(t);

x = zeros(1, Nsamples);
xp = zeros(1, Nsamples); % Prior ��ġ �ʱⰪ
P = zeros(1, Nsamples);
Pp = zeros(1, Nsamples); % Prior ���л� �ʱⰪ
z = zeros(1, Nsamples); % measurement vector �ʱ�ȭ
z_real = zeros(1, Nsamples);
K = zeros(1, Nsamples); % Kalman gain ���� ��

A = 1; % ���� ���·��� transition�� Ư���� ��ȭ ���� �Ͼ�ٰ� ����.
H = 1; % ���� ���͸� �״�� measure�� �� �ִٰ� ����. 
Q = 3; % process noise�� ���� ���л�. 
R = 10; % ���� �� ������ ���� ���л�.

%% �ʱⰪ ����
x(1) = 0; % ������ ��ġ ������
P(1) = 10; % Posterior(�� ��� ��)�� ���л� �ʱⰪ
z(1) = 0;
K(1) = 1;

%% Į������ �۵�

for k=2:Nsamples
    % ��ӿ�� �Ѵٰ�� ������ �ӵ� ���� �ÿ� ������ ���� �� �ִ�.
    
    vel_error = randn(1, 1) * 50;
    vel = 10 + vel_error;
    
    z(k) = z_real(k-1) + vel * dt;
    z_real(k) = z_real(k-1) + (vel-vel_error) * dt;
    
    xp(k) = A * x(k-1);
    Pp(k) = A * P(k-1) * A' + Q;
    
    K(k) = Pp(k) * H' / (H*Pp(k)*H' + R);
    
    x(k) = xp(k) + K(k) * (z(k) - H * xp(k));
    P(k) = Pp(k) - K(k) * H * Pp(k);
end
%%
figure;
plot(P,'o')

%% �� ȸ Į�� ���Ͱ� �����ϴ� Prior�� Posterior�� ����?

clear h
figure;

xx = linspace(0,100,10000);
for k = 1:Nsamples
    % Measurement ���� plot
    pdf_measure = normpdf(xx, z(k), 5); % w�� 4�� ���̶�� �̸� �����ص� ��
    
    % Prior�� ���� plot
    pdf_prior = normpdf(xx, xp(k), Pp(k));
    
    % Posterior�� ���� plot
    pdf_posterior = normpdf(xx, x(k), P(k));
    
    h(1) = plot(xx, pdf_measure);
    hold on;
    h(2) = plot(xx, pdf_prior);
    h(3) = plot(xx, pdf_posterior);
    hold off;
%     legend(h, 'Measurement','Predicted State Estimate(Prior)','Optimal State Estimate(Posterior)','location','eastoutside');
    ylim([0, 1])
    if k < Nsamples
        pause; cla;
    end
end


%%
figure;
plot(z,'o');
hold on;
plot(x) % ���� �߸��Ȱ���?
plot(z_real)