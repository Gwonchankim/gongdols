clear; close all; clc;

rng(1)
n = 50000;

%% rejection sampling�� ���� data�� sampling
% target distribution
target = @(x) 0.3*exp(-0.2 * x.^2) + 0.7 * exp(-0.2 * (x - 10).^2);
pseudo_dist = @(x, mu, sigma) 1/(sigma*sqrt(2*pi)) * exp(-((x-mu).^2)/(2*sigma^2));

xx = linspace(-10,20, 1000);

figure; 
plot(xx, target(xx))
hold on;
plot(xx, 20 * pseudo_dist(xx, 6.5, 4.5))

x_q = randn(1, n) * 4.5 + 6.5; 

crits = target(x_q) ./ (pseudo_dist(x_q, 6.5, 4.5) * 20);
coins = rand(1, length(crits));

x_p_normal = x_q(coins<crits);
figure; h = histogram(x_p_normal,'BinWidth',0.5, 'Normalization','probability');
hold on; plot(xx, target(xx)/max(target(xx))*max(h.Values))

%% ���� rejection sampling���� ���� ������ uniform�� �̿��ϸ� ���?
% ���ɿ� ũ�� ���̴� ������ reject�Ǵ� sample ���� ���� ���̰� ����.

pseudo_dist2 = @(x) (x>=-10 * x<20) / 30;

figure;
plot(xx, target(xx));
hold on;
plot(xx, pseudo_dist2(xx)*21); % 21�� 30 * 0.7�� �����. 30�� ��°��� 1�� x�� ����, 0.7�� target�� �ְ� ����.

x_q = (rand(1, n) - 0.5) * 30 + 5; % 10���� 20������ uniform distribution

crits = target(x_q) ./ (pseudo_dist2(x_q) * 21);
coins = rand(1, length(crits));

x_p_uniform = x_q(coins<crits);

figure; h = histogram(x_p_uniform,'BinWidth',0.5, 'Normalization','probability');
hold on; plot(xx, target(xx)/max(target(xx))*max(h.Values))
