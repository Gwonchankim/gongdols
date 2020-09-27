clear; close all; clc;

%% ���� ���� �����

X = [ones(1, 10^6), 2 * ones(1, 10^4)];

% p = 0.01 �̹Ƿ� np>5 �̻��� �Ƿ��� n > 5/p�� �Ǿ�� �ϹǷ� n > 500�� �Ǿ�� ��.

n = 10000; % the number of samples

%%
k = 500; % �ݺ� Ƚ��

my_mean = zeros(1, k);
for i = 1:k
    idx2get = randperm(length(X), n);
    my_mean(i) = mean(X(idx2get));
end

figure;
histogram(my_mean)
