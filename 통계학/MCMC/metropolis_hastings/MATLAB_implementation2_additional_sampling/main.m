clear; close all; clc;

%% rejection sampling�� ���� data�� sampling
% target distribution�� ���� ���� 
target = @(x) 0.3*exp(-0.2 * x.^2) + 0.7 * exp(-0.2 * (x - 10).^2);
pseudo_dist = @(x, mu, sigma) 1/(sigma*sqrt(2*pi)) * exp(-((x-mu).^2)/(2*sigma^2));

xx = linspace(-10,20, 1000);

figure; 
plot(xx, target(xx))
hold on;
plot(xx, 20 * pseudo_dist(xx, 6.5, 4.5)) % ���� ������ target ������ ���� �� �־�� ��.

% rejection sampling ����
rng(1)
n = 50000;
x_q = randn(1, n) * 4.5 + 6.5; % ��������� x ���� sampling.

crits = ...
    target(x_q) ./ ...
    (pseudo_dist(x_q, 6.5, 4.5) * 20); % ���� �������� ���� ������ envelope�� �ٽ� ����ֱ�.
coins = rand(1, length(crits));

x_p = x_q(coins<crits);
figure; h = histogram(x_p,'BinWidth',0.5, 'Normalization','probability');
hold on; plot(xx, target(xx)/max(target(xx))*max(h.Values))
