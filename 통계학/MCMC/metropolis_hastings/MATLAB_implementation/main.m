clear; close all; clc;
%{
�� MATLAB ��ũ��Ʈ������ Markov Chain Monte Carlo�� �����ϰ��� �Ѵ�.
������ ������ �Ʒ��� ����.

https://github.com/Joseph94m/MCMC/blob/master/MCMC.ipynb

���� ���� �ڵ忡���� ǥ�������� ���� �����Ͽ�����, �̹� MATLAB implementation������ ��հ��� �����ϵ��� �����ϰ��� �Ѵ�.
%}

%% �����ܰ� ǥ���� ����.
rng(1); % for reproduction

% ������ ����. ��ü 3������ �������� �ִٰ� ����.
population = randn(30000, 1) * 3 + 10;
observation = population(randperm(length(population), 1000)); % ��ü ������ �� ���� 1000�� ǥ������ ���� �����ߴٰ� ����.

figure;
histogram(observation);

std_obs = std(observation); % �츮�� ǥ�� ������ ���ؼ� Ȯ���� ǥ������

%% metropolis_hastings �˰��� ��������

total_iteration = 50000;
initial_guess = [1, std_obs];
[accepted, rejected] = fun_metropolis_hastings(initial_guess, total_iteration, observation);

%% ó�� 50���� iteration ������ accept, reject Ȯ��

figure;
plot(rejected(1:50), 'rx');
hold on;
plot(accepted(1:50),'b.');

%% ��ü iteration ������ accept, reject Ȯ��

figure;
plot(rejected, 'rx');
hold on;
plot(accepted,'b.');

%% rejected �� ��츸 plot
figure;
plot(rejected,'.');

%% 
% burn-in period�� ó���� 25%��� �����ϰ�, ���� 75%�� ���� ����� ��հ��� ������ ���� ���� ��հ��� �������.

mu_estimated = mean(accepted(round(length(accepted) * 0.25):end));

population_est = randn(30000, 1) * std_obs + mu_estimated;

figure;
h1 = histogram(population);
hold on;
h2 = histogram(population_est);

legend([h1, h2], '������ ������', '������ ������')