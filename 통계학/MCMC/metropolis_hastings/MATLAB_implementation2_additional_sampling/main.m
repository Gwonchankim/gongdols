clear; close all; clc;
% ������: https://www.cs.ubc.ca/~arnaud/andrieu_defreitas_doucet_jordan_intromontecarlomachinelearning.pdf
%
%

rng(1)
n_iter = 5000;
target = @(x) 0.3*exp(-0.2 * x.^2) + 0.7 * exp(-0.2 * (x - 10).^2);
xx = linspace(-10,20, 1000);

%%  Metropolis Hastings

% initialize x_0
x = [];
x = [x, (rand(1, 1) - 0.5) * 30 + 5]; % -10���� 20������ �������� random uniform

proposal = @(x, mu, s) 1/(s*sqrt(2*pi))*exp(-(x-mu)^2/(2*s^2)); % ���Ժ���

my_std = 10;

for i = 1 : n_iter
    u = rand(1); % sample u
    x_old = x(i);
    
    % ���� ���� q(x_new | x_old) = N(x_old, sigma)�κ��� ���� ����
    x_new = randn(1) * my_std + x_old;
    
    % A(x_old, x_new) ���
    A = min(1, ...
        (target(x_new) * proposal(x_old, x_new, my_std)) / ...
        (target(x_old) * proposal(x_new, x_old, my_std))...
        );
    
    if u < A
        x = [x x_new];
        
    else
        x = [x x_old];
    end
end

%% ��� plot
figure; h = histogram(x);
hold on; plot(xx, target(xx)/max(target(xx))*max(h.Values))