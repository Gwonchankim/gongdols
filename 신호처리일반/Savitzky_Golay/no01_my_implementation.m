clear; close all; clc;

M = 10; % ������ ���̴� 2M+1 = 21
N = 9; % ���׽��� ������ 9

% �׽�Ʈ�� ��ȣ

load mtlb
t = (0:length(mtlb)-1)/Fs;


%% MATLAB���� ����� ���� ��
b = sgolay(N, 2*M+1);

sgolay_filter = b((size(b,1)+1)/2,:);

smtlb = conv(mtlb, sgolay_filter,'same');

%% MATLAB���� ���� convolution���� �� ��
smtlb_MATLAB = sgolayfilt(mtlb, N, 2*M+1);

%% ���� S-G filter�� ��������� ���
A = zeros(2*M+1, N+1);

n_range = -M:M; % ���� ������ n
i_range = 0:N; % ���� ������ i
for i = 1:size(A,1)
    for j = 1:size(A,2)
        A(i,j)= n_range(i)^i_range(j);
    end
end

% matrix H = (A^TA)^{-1}*A^T

H = (A'*A)\A';

sgolay_filter_calculated = H(1,:);

my_smtlb_calculated = conv(mtlb, sgolay_filter_calculated,'same');

figure;
plot(t, mtlb);
axis([0.2 0.22 -3 2])
hold on;
plot(t, smtlb);
plot(t, my_smtlb_calculated);
plot(t, smtlb_MATLAB);
