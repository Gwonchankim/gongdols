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
xlabel('$$x$$','interpreter','latex');
ylabel('frequency');
title('1000���� ǥ��');
grid on;

%% metropolis_hastings �˰��� ��������

total_iteration = 50000;
initial_guess = [1, std_obs];
[accepted, rejected] = fun_metropolis_hastings(initial_guess, total_iteration, observation);

%% ó�� 50���� iteration ������ accept, reject Ȯ��

figure;
h1 = plot(rejected(1:50), 'rx','markersize',15);
hold on;
h2 = plot(accepted(1:50),'o','markerfacecolor','b','markersize',5);  
line(xlim, [10, 10],'linestyle','--','linewidth',2,'color','g')
xlabel('iteration');
ylabel('$$\mu$$','interpreter','latex');
grid on;
legend([h1, h2], 'rejected', 'accepted','location','best');
%% ��ü iteration ������ accept, reject Ȯ��

figure;
h1 = plot(rejected(1:length(accepted)), 'rx');
hold on;
h2 = plot(accepted,'b.');
xlabel('iteration');
ylabel('$$\mu$$','interpreter','latex');
grid on;
legend([h1, h2], 'rejected', 'accepted','location','best');

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
xlabel('x');
ylabel('frequency');
grid on;