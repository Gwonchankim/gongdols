clear; close all; clc;
addpath('C:\Users\biosensor1\Google ����̺�\������_���ΰ�����������\���α׷���_�ڵ����\���̼���\my_functions\');
% ��ó: https://www.astm.org/standardization-news/images/nd15/nd15_datapoints.pdf

%% Grubb's test
% Example 1)
data = [5.3 3.1 4.9 3.9 7.8 4.7 4.3];
stem(data) % ���⼭ 5��° ������ 7.8�� outlier�� �� ���� ������?

xbar= mean(data);
xstd= std(data);

for i_data = 1:length(data)
    xtval(i_data) = abs(data(i_data)-xbar)/xstd;
end

idx_outlier = xtval>tinv(0.95,length(data)-1);

% Example 2) masking?
data = [5.3 3.1 4.9 3.9 7.8 4.7 4.3 8.0 4.5 5.1 3.5];
stem(data) % 5��, 8�� ������ 7.8�� 8.0�� outlier�� �� �� �ִ�.

xbar = mean(data)
xstd = std(data)

for i_data = 1:length(data)
    xtval(i_data) = abs(data(i_data)-xbar)/xstd;
end

idx_outlier = xtval>tinv(0.95,length(data)-1)

idx_outlier_GECd = fun_GESD(data);

